#include "command.hpp"
#include "mud.hpp"

void do_cmdtable( Character *ch, std::string argument )
{
  int hash, cnt;

  SetPagerColor( AT_PLAIN, ch );
  SendToPager("Commands and Number of Uses This Run\r\n", ch);

  for ( cnt = hash = 0; hash < 126; hash++ )
    {
      Command *cmd;

      for ( cmd = CommandTable[hash]; cmd; cmd = cmd->Next )
	{
	  if ((++cnt)%4)
	    PagerPrintf(ch,"%-6.6s %4d\t",cmd->Name, cmd->UseRec->NumberOfTimesUsed);
	  else
	    PagerPrintf(ch,"%-6.6s %4d\r\n", cmd->Name, cmd->UseRec->NumberOfTimesUsed );
	}
    }
}
