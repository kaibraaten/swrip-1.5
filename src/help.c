#include <strings.h>
#include <string.h>
#include <ctype.h>
#include "help.h"
#include "character.h"
#include "mud.h"

CerisMap *HelpFiles = NULL;
char *help_greeting = NULL;

struct HelpFile
{
  short      level;
  char      *keyword;
  char      *text;
};

static char *help_fix( char *text );
static int CompareHelpFiles( const void *one, const void *another );

HelpFile *GetHelp( const CHAR_DATA *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH];
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  int lev = 0;
  CerisMapIterator *helpIterator = NULL;
  HelpFile *result = NULL;

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
      HelpFile *pHelp = (HelpFile*) MapIterator_GetKey( helpIterator );

      if ( GetHelpLevel( pHelp ) > get_trust( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && GetHelpLevel( pHelp ) != lev )
	{
	  continue;
	}

      if ( is_name( argall, GetHelpKeyword( pHelp ) ) )
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
void AddHelp( HelpFile *pHelp )
{
  if( Map_Get( HelpFiles, pHelp ) )
    {
      bug( "add_help: duplicate: %s. Deleting.", GetHelpKeyword( pHelp ) );
      DestroyHelp( pHelp );
    }
  else
    {
      Map_Set( HelpFiles, pHelp, pHelp );
    }
}

void UnlinkHelp( HelpFile *help )
{
  Map_Remove( HelpFiles, help );
}

/*
 * Load a help section.
 */
void LoadHelps( void )
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
      HelpFile *pHelp = NULL;

      fread_string( fp, keyword, MAX_STRING_LENGTH );

      if ( keyword[0] == '$' )
	{
	  break;
	}
      else if ( keyword[0] == '\0' )
        {
          continue;
        }

      pHelp = CreateHelp( keyword, level );

      fread_string( fp, helptext, MAX_STRING_LENGTH );

      SetHelpText( pHelp, helptext );

      if ( !str_cmp( GetHelpKeyword( pHelp ), "greeting" ) )
	{
	  help_greeting = GetHelpText( pHelp );
	}

      AddHelp( pHelp );
    }
}

static void WriteHelpfile( const void *key, void *value, void *userData )
{
  FILE *filehandle = (FILE*) userData;
  const HelpFile *pHelp = (const HelpFile*) key;

  fprintf( filehandle, "%d %s~\n%s~\n\n",
	   GetHelpLevel( pHelp ),
	   GetHelpKeyword( pHelp ),
	   help_fix( GetHelpText( pHelp ) ) );
}

void SaveHelps( void )
{
  FILE *filehandle = NULL;

  rename( HELP_FILE, HELP_FILE ".bak" );

  if ( ( filehandle = fopen( HELP_FILE, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( HELP_FILE );
      return;
    }

  Map_ForEach( HelpFiles, WriteHelpfile, filehandle );

  fprintf( filehandle, "0 $~\n\n\n#$\n" );
  fclose( filehandle );
}

HelpFile *CreateHelp( char *keyword, short level )
{
  HelpFile *help = NULL;
  
  CREATE( help, HelpFile, 1 );
  SetHelpKeyword( help, keyword );
  SetHelpText( help, "" );
  SetHelpLevel( help, level );

  return help;
}

void DestroyHelp( HelpFile *help )
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
  const HelpFile *one = (const HelpFile*) oneVoid;
  const HelpFile *another = (const HelpFile*) anotherVoid;
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

short GetHelpLevel( const HelpFile *help )
{
  return help->level;
}

void SetHelpLevel( HelpFile *help, short level )
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

char *GetHelpKeyword( const HelpFile *help )
{
  return help->keyword;
}

void SetHelpKeyword( HelpFile *help, char *keyword )
{
  if( help->keyword )
    {
      STRFREE( help->keyword );
    }

  help->keyword = STRALLOC( strupper( keyword ) );
}

char *GetHelpText( const HelpFile *help )
{
  return help->text;
}

void SetHelpText( HelpFile *help, char *text )
{
  if( help->text )
    {
      STRFREE( help->text );
    }

  help->text = STRALLOC( text );
}
