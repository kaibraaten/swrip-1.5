#include "mud.h"

void do_cmdtable( Character *ch, char *argument )
{
  int hash, cnt;
  Command *cmd;

  set_pager_color( AT_PLAIN, ch );
  send_to_pager("Commands and Number of Uses This Run\r\n", ch);

  for ( cnt = hash = 0; hash < 126; hash++ )
    {
      for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
	{
	  if ((++cnt)%4)
	    pager_printf(ch,"%-6.6s %4d\t",cmd->name,cmd->userec.num_uses);
	  else
	    pager_printf(ch,"%-6.6s %4d\r\n", cmd->name,cmd->userec.num_uses );
	}
    }
}
