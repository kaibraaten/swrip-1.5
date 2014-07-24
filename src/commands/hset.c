#include "mud.h"
#include "help.h"

void do_hset( Character *ch, char *argument )
{
  HELP_DATA *pHelp = NULL;
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
      log_string_plus( "Saving help files.", LOG_NORMAL, LEVEL_GREATER );
      save_helps();
      send_to_char( "Saved.\r\n", ch );
      return;
    }

  if ( str_cmp( arg1, "remove" ) )
    {
      argument = one_argument( argument, arg2 );
    }

  pHelp = get_help( ch, argument );

  if ( !pHelp )
    {
      send_to_char( "Cannot find help on that subject.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "remove" ) )
    {
      unlink_help( pHelp );
      destroy_help( pHelp );
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
