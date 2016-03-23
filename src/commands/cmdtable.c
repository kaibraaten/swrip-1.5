#include "command.h"
#include "mud.h"

void do_cmdtable( Character *ch, char *argument )
{
  int hash, cnt;

  SetPagerColor( AT_PLAIN, ch );
  SendToPager("Commands and Number of Uses This Run\r\n", ch);

  for ( cnt = hash = 0; hash < 126; hash++ )
    {
      Command *cmd;

      for ( cmd = CommandTable[hash]; cmd; cmd = cmd->next )
	{
	  if ((++cnt)%4)
	    PagerPrintf(ch,"%-6.6s %4d\t",cmd->Name, cmd->UseRec->num_uses);
	  else
	    PagerPrintf(ch,"%-6.6s %4d\r\n", cmd->Name, cmd->UseRec->num_uses );
	}
    }
}
