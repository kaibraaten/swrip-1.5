#include "character.h"
#include "mud.h"

void do_commands( CHAR_DATA *ch, char *argument )
{
  int col;
  bool found;
  int hash;
  CMDTYPE *command;

  col = 0;
  set_pager_color( AT_PLAIN, ch );
  if ( argument[0] == '\0' )
    {
      for ( hash = 0; hash < 126; hash++ )
        for ( command = command_hash[hash]; command; command = command->next )
          if ( command->level <  LEVEL_HERO
               &&   command->level <= get_trust( ch )
               &&  (command->name[0] != 'm'
                    &&   command->name[1] != 'p') )
            {
              pager_printf( ch, "%-12s", command->name );
              if ( ++col % 6 == 0 )
                send_to_pager( "\r\n", ch );
            }
      if ( col % 6 != 0 )
        send_to_pager( "\r\n", ch );
    }
  else
    {
      found = FALSE;
      for ( hash = 0; hash < 126; hash++ )
        for ( command = command_hash[hash]; command; command = command->next )
          if ( command->level <  LEVEL_HERO
               &&   command->level <= get_trust( ch )
               &&  !str_prefix(argument, command->name)
               &&  (command->name[0] != 'm'
                    &&   command->name[1] != 'p') )
	    {
              pager_printf( ch, "%-12s", command->name );
              found = TRUE;
              if ( ++col % 6 == 0 )
                send_to_pager( "\r\n", ch );
            }

      if ( col % 6 != 0 )
        send_to_pager( "\r\n", ch );
      if ( !found )
        ch_printf( ch, "No command found under %s.\r\n", argument);
    }
}
