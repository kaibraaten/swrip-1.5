#include "command.hpp"
#include "mud.hpp"

void do_cmdtable( Character *ch, char *argument )
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);
  int column = 0;

  SetPagerColor( AT_PLAIN, ch );
  SendToPager("Commands and Number of Uses This Run\r\n", ch);

  while(ListHasMoreElements(iterator))
    {
      const Command *command = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);
      ++column;

      PagerPrintf(ch, "%-6.6s %4d", command->Name, command->UseRec->NumberOfTimesUsed);

      if (column % 4 != 0)
        {
          PagerPrintf(ch, "\t");
        }
      else
        {
          PagerPrintf(ch, "\r\n");
        }
    }

  FreeListIterator(iterator);
}
