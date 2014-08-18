#include "mud.h"
#include "character.h"

void do_wizhelp( Character *ch, char *argument )
{
  const int number_of_columns = 6;
  int col = 0;
  int hash = 0;

  set_pager_color( AT_PLAIN, ch );

  for ( hash = 0; hash < 126; hash++ )
    {
      Command *cmd = NULL;

      for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
	{
	  if ( cmd->level >= LEVEL_AVATAR && cmd->level <= GetTrustLevel( ch ) )
	    {
	      pager_printf( ch, "%-12s", cmd->name );

	      if ( ++col % number_of_columns == 0 )
		{
		  send_to_pager( "\r\n", ch );
		}
	    }
	}
    }

  if ( col % number_of_columns != 0 )
    {
      send_to_pager( "\r\n", ch );
    }
}
