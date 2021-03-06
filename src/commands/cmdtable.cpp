#include "command.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_cmdtable( std::shared_ptr<Character> ch, std::string argument )
{
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);
  int column = 0;

  SetCharacterColor( AT_PLAIN, ch );
  ch->Echo("Commands and Number of Uses This Run\r\n");

  while(ListHasMoreElements(iterator))
    {
      const Command *command = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);
      ++column;

      ch->Echo("%-6.6s %4d",
               command->Name.c_str(), command->UseRec->NumberOfTimesUsed);

      if (column % 4 != 0)
        {
          ch->Echo("\t");
        }
      else
        {
          ch->Echo("\r\n");
        }
    }

  FreeListIterator(iterator);
}

