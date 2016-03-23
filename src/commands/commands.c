#include "command.h"
#include "character.h"
#include "mud.h"

void do_commands( Character *ch, char *argument )
{
  const int NumColumns = 6;

  SetPagerColor( AT_PLAIN, ch );

  if ( argument[0] == '\0' )
    {
      int hash = 0;
      int col = 0;

      for ( hash = 0; hash < 126; hash++ )
	{
	  const Command *command = NULL;

	  for ( command = CommandTable[hash]; command; command = command->next )
	    {
	      if ( command->Level <  LEVEL_AVATAR
		   && command->Level <= GetTrustLevel( ch )
		   && (command->Name[0] != 'm'
		       && command->Name[1] != 'p') )
		{
		  PagerPrintf( ch, "%-12s", command->Name );

		  if ( ++col % NumColumns == 0 )
		    SendToPager( "\r\n", ch );
		}
	    }
	}

      if ( col % NumColumns != 0 )
        SendToPager( "\r\n", ch );
    }
  else
    {
      bool found = false;
      int hash = 0;
      int col = 0;

      for ( hash = 0; hash < 126; hash++ )
	{
	  const Command *command = NULL;

	  for ( command = CommandTable[hash]; command; command = command->next )
	    {
	      if ( command->Level <  LEVEL_AVATAR
		   && command->Level <= GetTrustLevel( ch )
		   && !StringPrefix(argument, command->Name)
		   && (command->Name[0] != 'm'
		       && command->Name[1] != 'p') )
		{
		  PagerPrintf( ch, "%-12s", command->Name );
		  found = true;

		  if ( ++col % NumColumns == 0 )
		    SendToPager( "\r\n", ch );
		}
	    }
	}

      if ( col % NumColumns != 0 )
        SendToPager( "\r\n", ch );

      if ( !found )
        Echo( ch, "No command found under %s.\r\n", argument);
    }
}
