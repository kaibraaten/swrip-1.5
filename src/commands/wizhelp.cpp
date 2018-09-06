#include "command.hpp"
#include "mud.hpp"
#include "character.hpp"

void do_wizhelp( Character *ch, std::string argument )
{
  const int NUM_COLUMNS = 6;
  int column = 0;
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);

  SetCharacterColor( AT_PLAIN, ch );

  while(ListHasMoreElements(iterator))
    {
      const Command *cmd = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( cmd->Level >= LEVEL_AVATAR && cmd->Level <= GetTrustLevel( ch ) )
        {
          ch->Echo("%-12s", cmd->Name.c_str() );

          if ( ++column % NUM_COLUMNS == 0 )
            {
              ch->Echo("\r\n");
            }
	}
    }

  FreeListIterator(iterator);

  if ( column % NUM_COLUMNS != 0 )
    {
      ch->Echo("\r\n");
    }
}

