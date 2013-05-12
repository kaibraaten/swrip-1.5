#include "mud.h"

void do_restrict( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  short level, hash;
  CMDTYPE *cmd;
  bool found = FALSE;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Restrict which command?\r\n", ch );
      return;
    }

  argument = one_argument ( argument, arg2 );

  if ( arg2[0] == '\0' )
    level = get_trust( ch );
  else
    level = atoi( arg2 );

  level = UMAX( UMIN( get_trust( ch ), level ), 0 );

  hash = arg[0] % 126;

  for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
    {
      if ( !str_prefix( arg, cmd->name )
           &&    cmd->level <= get_trust( ch ) )
        {
          found = TRUE;
          break;
        }
    }

  if ( found )
    {
      if ( !str_prefix( arg2, "show" ) )
        {
          sprintf(buf, "%s show", cmd->name);
          do_cedit(ch, buf);
          return;
        }

      cmd->level = level;
      ch_printf( ch, "You restrict %s to level %d\r\n",
                 cmd->name, level );
      sprintf( buf, "%s restricting %s to level %d",
               ch->name, cmd->name, level );
      log_string( buf );
    }
  else
    {
      send_to_char( "You may not restrict that command.\r\n", ch );
    }
}