#include "command.h"
#include "mud.h"
#include "character.hpp"

void do_wizhelp( Character *ch, char *argument )
{
  const int number_of_columns = 6;
  int col = 0;
  int hash = 0;

  SetPagerColor( AT_PLAIN, ch );

  for ( hash = 0; hash < 126; hash++ )
    {
      Command *cmd = NULL;

      for ( cmd = CommandTable[hash]; cmd; cmd = cmd->Next )
	{
	  if ( cmd->Level >= LEVEL_AVATAR && cmd->Level <= GetTrustLevel( ch ) )
	    {
	      PagerPrintf( ch, "%-12s", cmd->Name );

	      if ( ++col % number_of_columns == 0 )
		{
		  SendToPager( "\r\n", ch );
		}
	    }
	}
    }

  if ( col % number_of_columns != 0 )
    {
      SendToPager( "\r\n", ch );
    }
}
