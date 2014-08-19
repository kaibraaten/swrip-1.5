#include "mud.h"

void do_cmdtable( Character *ch, char *argument )
{
  int hash, cnt;
  Command *cmd;

  SetPagerColor( AT_PLAIN, ch );
  SendToPager("Commands and Number of Uses This Run\r\n", ch);

  for ( cnt = hash = 0; hash < 126; hash++ )
    {
      for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
	{
	  if ((++cnt)%4)
	    PagerPrintf(ch,"%-6.6s %4d\t",cmd->name,cmd->userec.num_uses);
	  else
	    PagerPrintf(ch,"%-6.6s %4d\r\n", cmd->name,cmd->userec.num_uses );
	}
    }
}
