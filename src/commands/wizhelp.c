#include "mud.h"
#include "character.h"

void do_wizhelp( Character *ch, char *argument )
{
  const int number_of_columns = 6;
  int col = 0;
  int hash = 0;

  SetPagerColor( AT_PLAIN, ch );

  for ( hash = 0; hash < 126; hash++ )
    {
      Command *cmd = NULL;

      for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
	{
	  if ( cmd->level >= LEVEL_AVATAR && cmd->level <= GetTrustLevel( ch ) )
	    {
	      PagerPrintf( ch, "%-12s", cmd->name );

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
