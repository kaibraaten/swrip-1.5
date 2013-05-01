#include "mud.h"

static char *help_fix( char *text );

void do_hset( CHAR_DATA *ch, char *argument )
{
  HELP_DATA *pHelp;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: hset <field> [value] [help page]\r\n",     ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  level keyword remove save\r\n",          ch );
      return;
    }

  if ( !str_cmp( arg1, "save" ) )
    {
      FILE *fpout;

      log_string_plus( "Saving help.are...", LOG_NORMAL, LEVEL_GREATER );

      rename( "help.are", "help.are.bak" );

      if ( ( fpout = fopen( "help.are", "w" ) ) == NULL )
        {
          bug( "hset save: fopen", 0 );
          perror( "help.are" );
          return;
        }

      fprintf( fpout, "#HELPS\n\n" );
      for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
        fprintf( fpout, "%d %s~\n%s~\n\n",
                 pHelp->level, pHelp->keyword, help_fix(pHelp->text) );

      fprintf( fpout, "0 $~\n\n\n#$\n" );
      fclose( fpout );
      send_to_char( "Saved.\r\n", ch );
      return;
    }
  if ( str_cmp( arg1, "remove" ) )
    argument = one_argument( argument, arg2 );

  if ( (pHelp = get_help( ch, argument )) == NULL )
    {
      send_to_char( "Cannot find help on that subject.\r\n", ch );
      return;
    }
  if ( !str_cmp( arg1, "remove" ) )
    {
      UNLINK( pHelp, first_help, last_help, next, prev );
      STRFREE( pHelp->text );
      STRFREE( pHelp->keyword );
      DISPOSE( pHelp );
      send_to_char( "Removed.\r\n", ch );
      return;
    }
  if ( !str_cmp( arg1, "level" ) )
    {
      pHelp->level = atoi( arg2 );
      send_to_char( "Done.\r\n", ch );
      return;
    }
  if ( !str_cmp( arg1, "keyword" ) )
    {
      STRFREE( pHelp->keyword );
      pHelp->keyword = STRALLOC( strupper(arg2) );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  do_hset( ch, "" );
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
