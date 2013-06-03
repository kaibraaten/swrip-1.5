#include <strings.h>
#include <string.h>
#include <ctype.h>
#include "help.h"
#include "character.h"
#include "mud.h"

CerisMap *HelpFiles = NULL;
char *help_greeting = NULL;

struct help_data
{
  short      level;
  char      *keyword;
  char      *text;
};

static char *help_fix( char *text );
static int CompareHelpFiles( const void *one, const void *another );

HELP_DATA *get_help( const CHAR_DATA *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH];
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  int lev = 0;
  CerisMapIterator *helpIterator = NULL;
  HELP_DATA *result = NULL;

  if ( argument[0] == '\0' )
    {
      argument = "summary";
    }

  if ( isdigit(argument[0]) )
    {
      lev = number_argument( argument, argnew );
      argument = argnew;
    }
  else
    {
      lev = -2;
    }

  /*
   * Tricky argument handling so 'help a b' doesn't match a.
   */
  argall[0] = '\0';

  while ( argument[0] != '\0' )
    {
      argument = one_argument( argument, argone );

      if ( argall[0] != '\0' )
	{
	  strcat( argall, " " );
	}

      strcat( argall, argone );
    }

  helpIterator = CreateMapIterator( HelpFiles );

  for ( ; !MapIterator_IsDone( helpIterator ); MapIterator_Next( helpIterator ) )
    {
      HELP_DATA *pHelp = (HELP_DATA*) MapIterator_GetKey( helpIterator );

      if ( get_help_level( pHelp ) > get_trust( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && get_help_level( pHelp ) != lev )
	{
	  continue;
	}

      if ( is_name( argall, get_help_keyword( pHelp ) ) )
	{
	  result = pHelp;
	  break;
	}
    }

  DestroyMapIterator( helpIterator );

  return result;
}

/*
 * Adds a help page to the list if it is not a duplicate of an existing page.
 * Page is insert-sorted by keyword.                    -Thoric
 * (The reason for sorting is to keep do_hlist looking nice)
 */
void add_help( HELP_DATA *pHelp )
{
  if( Map_Get( HelpFiles, pHelp ) )
    {
      bug( "add_help: duplicate: %s. Deleting.", get_help_keyword( pHelp ) );
      destroy_help( pHelp );
    }
  else
    {
      Map_Set( HelpFiles, pHelp, pHelp );
    }
}

void unlink_help( HELP_DATA *help )
{
  Map_Remove( HelpFiles, help );
}

/*
 * Load a help section.
 */
void load_helps( void )
{
  FILE *fp = NULL;

  HelpFiles = CreateMap( CompareHelpFiles );

  if( !( fp = fopen( HELP_FILE, "r" ) ) )
    {
      log_printf( "Unable to open %s", HELP_FILE );
      return;
    }

  for ( ; ; )
    {
      char keyword[MAX_STRING_LENGTH];
      char helptext[MAX_STRING_LENGTH];
      short level = fread_number( fp );
      HELP_DATA *pHelp = NULL;

      fread_string( fp, keyword, MAX_STRING_LENGTH );

      if ( keyword[0] == '$' )
	{
	  break;
	}
      else if ( keyword[0] == '\0' )
        {
          continue;
        }

      pHelp = create_help( keyword, level );

      fread_string( fp, helptext, MAX_STRING_LENGTH );

      set_help_text( pHelp, helptext );

      if ( !str_cmp( get_help_keyword( pHelp ), "greeting" ) )
	{
	  help_greeting = get_help_text( pHelp );
	}

      add_help( pHelp );
    }
}

void save_helps( void )
{
  FILE *filehandle = NULL;
  CerisMapIterator *iter = NULL;

  rename( HELP_FILE, HELP_FILE ".bak" );

  if ( ( filehandle = fopen( HELP_FILE, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( HELP_FILE );
      return;
    }

  fprintf( filehandle, "#HELPS\n\n" );

  iter = CreateMapIterator( HelpFiles );

  for( ; !MapIterator_IsDone( iter ); MapIterator_Next( iter ) )
    {
      HELP_DATA *pHelp = (HELP_DATA*) MapIterator_GetKey( iter );

      fprintf( filehandle, "%d %s~\n%s~\n\n",
	       get_help_level( pHelp ),
	       get_help_keyword( pHelp ),
	       help_fix( get_help_text( pHelp ) ) );
    }

  DestroyMapIterator( iter );
  fprintf( filehandle, "0 $~\n\n\n#$\n" );
  fclose( filehandle );
}

HELP_DATA *create_help( char *keyword, short level )
{
  HELP_DATA *help = NULL;
  
  CREATE( help, HELP_DATA, 1 );
  set_help_keyword( help, keyword );
  set_help_text( help, "" );
  set_help_level( help, level );

  return help;
}

void destroy_help( HELP_DATA *help )
{
  STRFREE( help->keyword );
  STRFREE( help->text );
  DISPOSE( help );
}

/*
 * Stupid leading space muncher fix                             -Thoric
 */
static char *help_fix( char *text )
{
  char *fixed;

  if ( !text )
    return "";

  fixed = strip_cr(text);

  if ( fixed[0] == ' ' )
    fixed[0] = '.';

  return fixed;
}

static int CompareHelpFiles( const void *oneVoid, const void *anotherVoid )
{
  const HELP_DATA *one = (const HELP_DATA*) oneVoid;
  const HELP_DATA *another = (const HELP_DATA*) anotherVoid;
  const char *oneKeyword = one->keyword;
  const char *anotherKeyword = another->keyword;

  if( oneKeyword[0] == '\'' || oneKeyword[0] == '\"' )
    {
      ++oneKeyword;
    }

  if( anotherKeyword[0] == '\'' || anotherKeyword[0] == '\"' )
    {
      ++anotherKeyword;
    }

  if( str_cmp( oneKeyword, anotherKeyword ) == 0 )
    {
      if( one->level == another->level )
	{
	  return 0;
	}
      else if( one->level < another->level )
	{
	  return -1;
	}
      else
	{
	  return 1;
	}
    }  
  else
    {
      return str_cmp( oneKeyword, anotherKeyword );
    }
}

short get_help_level( const HELP_DATA *help )
{
  return help->level;
}

void set_help_level( HELP_DATA *help, short level )
{
  if( level >= -1 && level <= MAX_LEVEL )
    {
      help->level = level;
    }
  else
    {
      bug( "%s:%s:%d: Argument level = %d is out of range.",
	   __FUNCTION__, __FILE__, __LINE__, level );
    }
}

char *get_help_keyword( const HELP_DATA *help )
{
  return help->keyword;
}

void set_help_keyword( HELP_DATA *help, char *keyword )
{
  if( help->keyword )
    {
      STRFREE( help->keyword );
    }

  help->keyword = STRALLOC( strupper( keyword ) );
}

char *get_help_text( const HELP_DATA *help )
{
  return help->text;
}

void set_help_text( HELP_DATA *help, char *text )
{
  if( help->text )
    {
      STRFREE( help->text );
    }

  help->text = STRALLOC( text );
}
