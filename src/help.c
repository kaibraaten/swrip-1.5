#include <string.h>
#include <ctype.h>
#include "help.h"
#include "character.h"
#include "mud.h"

HELP_DATA *first_help = NULL;
HELP_DATA *last_help = NULL;
int top_help = 0;
char *help_greeting = NULL;

static char *help_fix( char *text );

HELP_DATA *get_help( const CHAR_DATA *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH];
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  HELP_DATA *pHelp;
  int lev;

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
      if ( pHelp->level > get_trust( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && pHelp->level != lev )
	{
	  continue;
	}

      if ( is_name( argall, pHelp->keyword ) )
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
void add_help( HELP_DATA *pHelp )
{
  HELP_DATA *tHelp;
  int match;

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

void unlink_help( HELP_DATA *help )
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

  if( !( fp = fopen( HELP_FILE, "r" ) ) )
    {
      log_printf( "Unable to open %s", HELP_FILE );
      return;
    }

  for ( ; ; )
    {
      short level = fread_number( fp );
      char *keyword = fread_string( fp );
      HELP_DATA *pHelp = create_help( keyword, level );

      if ( pHelp->keyword[0] == '$' )
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

      if ( !str_cmp( pHelp->keyword, "greeting" ) )
	{
	  help_greeting = pHelp->text;
	}

      add_help( pHelp );
    }
}

void save_helps( void )
{
  FILE *filehandle = NULL;
  HELP_DATA *pHelp = NULL;

  rename( HELP_FILE, HELP_FILE ".bak" );

  if ( ( filehandle = fopen( HELP_FILE, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( HELP_FILE );
      return;
    }

  fprintf( filehandle, "#HELPS\n\n" );

  for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
    {
      fprintf( filehandle, "%d %s~\n%s~\n\n",
	       pHelp->level, pHelp->keyword, help_fix(pHelp->text) );
    }

  fprintf( filehandle, "0 $~\n\n\n#$\n" );
  fclose( filehandle );
}

HELP_DATA *create_help( char *keyword, short level )
{
  HELP_DATA *help = NULL;
  
  CREATE( help, HELP_DATA, 1 );
  help->keyword = STRALLOC( strupper( keyword ) );
  help->text = STRALLOC( "" );
  help->level = level;

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
