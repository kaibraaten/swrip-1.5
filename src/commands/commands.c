#include "character.h"
#include "mud.h"

void do_commands( Character *ch, char *argument )
{
  int col;
  bool found;
  int hash;
  Command *command;

  col = 0;
  SetPagerColor( AT_PLAIN, ch );
  if ( argument[0] == '\0' )
    {
      for ( hash = 0; hash < 126; hash++ )
        for ( command = command_hash[hash]; command; command = command->next )
          if ( command->level <  LEVEL_AVATAR
               &&   command->level <= GetTrustLevel( ch )
               &&  (command->name[0] != 'm'
                    &&   command->name[1] != 'p') )
            {
              PagerPrintf( ch, "%-12s", command->name );
              if ( ++col % 6 == 0 )
                SendToPager( "\r\n", ch );
            }
      if ( col % 6 != 0 )
        SendToPager( "\r\n", ch );
    }
  else
    {
      found = false;
      for ( hash = 0; hash < 126; hash++ )
        for ( command = command_hash[hash]; command; command = command->next )
          if ( command->level <  LEVEL_AVATAR
               &&   command->level <= GetTrustLevel( ch )
               &&  !StringPrefix(argument, command->name)
               &&  (command->name[0] != 'm'
                    &&   command->name[1] != 'p') )
	    {
              PagerPrintf( ch, "%-12s", command->name );
              found = true;
              if ( ++col % 6 == 0 )
                SendToPager( "\r\n", ch );
            }

      if ( col % 6 != 0 )
        SendToPager( "\r\n", ch );
      if ( !found )
        Echo( ch, "No command found under %s.\r\n", argument);
    }
}
