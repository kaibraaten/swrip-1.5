#include <string.h>
#include <ctype.h>
#include "help.h"
#include "character.h"
#include "mud.h"

HelpFile *first_help = NULL;
HelpFile *last_help = NULL;
int top_help = 0;
char *help_greeting = NULL;

static char *help_fix( char *text );

HelpFile *get_help( const Character *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH];
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  HelpFile *pHelp = NULL;
  int lev = 0;

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

  for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
    {
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
	  return pHelp;
	}
    }

  return NULL;
}

/*
 * Adds a help page to the list if it is not a duplicate of an existing page.
 * Page is insert-sorted by keyword.                    -Thoric
 * (The reason for sorting is to keep do_hlist looking nice)
 */
void add_help( HelpFile *pHelp )
{
  HelpFile *tHelp = NULL;
  int match = 0;

  for ( tHelp = first_help; tHelp; tHelp = tHelp->next )
    {
      if ( pHelp->level == tHelp->level
	   &&   str_cmp(pHelp->keyword, tHelp->keyword) == 0 )
	{
	  bug( "add_help: duplicate: %s. Deleting.", pHelp->keyword );
	  destroy_help( pHelp );
	  return;
	}
      else if ( (match=str_cmp(pHelp->keyword[0]=='\'' ? pHelp->keyword+1 : pHelp->keyword,
			       tHelp->keyword[0]=='\'' ? tHelp->keyword+1 : tHelp->keyword)) < 0
		|| (match == 0 && pHelp->level > tHelp->level) )
	{
	  if ( !tHelp->prev )
	    first_help    = pHelp;
	  else
	    tHelp->prev->next = pHelp;

	  pHelp->prev             = tHelp->prev;
	  pHelp->next             = tHelp;
	  tHelp->prev             = pHelp;
	  break;
	}
    }

  if ( !tHelp )
    {
      LINK( pHelp, first_help, last_help, next, prev );
    }

  top_help++;
}

void unlink_help( HelpFile *help )
{
  UNLINK( help, first_help, last_help, next, prev );
  top_help--;
}

/*
 * Load a help section.
 */
void load_helps( void )
{
  FILE *fp = NULL;

  if( !( fp = fopen( HELP_DATA_FILE, "r" ) ) )
    {
      log_printf( "Unable to open %s", HELP_DATA_FILE );
      return;
    }

  for ( ; ; )
    {
      short level = fread_number( fp );
      char *keyword = fread_string( fp );
      HelpFile *pHelp = create_help( keyword, level );

      if ( keyword[0] == '$' )
	{
	  destroy_help( pHelp );
	  break;
	}

      pHelp->text = fread_string( fp );

      if ( pHelp->keyword[0] == '\0' )
	{
	  destroy_help( pHelp );
          continue;
        }

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
  HelpFile *pHelp = NULL;

  rename( HELP_DATA_FILE, HELP_DATA_FILE ".bak" );

  if ( ( filehandle = fopen( HELP_DATA_FILE, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( HELP_DATA_FILE );
      return;
    }

  fprintf( filehandle, "#HELPS\n\n" );

  for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
    {
      fprintf( filehandle, "%d %s~\n%s~\n\n",
	       get_help_level( pHelp ),
	       get_help_keyword( pHelp ),
	       help_fix( get_help_text( pHelp ) ) );
    }

  fprintf( filehandle, "0 $~\n\n\n#$\n" );
  fclose( filehandle );
}

HelpFile *create_help( char *keyword, short level )
{
  HelpFile *help = NULL;
  
  CREATE( help, HelpFile, 1 );
  set_help_keyword( help, keyword );
  set_help_text( help, "" );
  set_help_level( help, level );

  return help;
}

void destroy_help( HelpFile *help )
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

short get_help_level( const HelpFile *help )
{
  return help->level;
}

void set_help_level( HelpFile *help, short level )
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

char *get_help_keyword( const HelpFile *help )
{
  return help->keyword;
}

void set_help_keyword( HelpFile *help, char *keyword )
{
  if( help->keyword )
    {
      STRFREE( help->keyword );
    }

  help->keyword = STRALLOC( strupper( keyword ) );
}

char *get_help_text( const HelpFile *help )
{
  return help->text;
}

void set_help_text( HelpFile *help, char *text )
{
  if( help->text )
    {
      STRFREE( help->text );
    }

  help->text = STRALLOC( text );
}

