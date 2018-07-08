#include "command.h"
#include "mud.h"
#include "character.h"

void do_wizhelp( Character *ch, char *argument )
{
  const int NUM_COLUMNS = 6;
  int column = 0;
  const List *commands = GetEntities(CommandRepository);
  ListIterator *iterator = AllocateListIterator(commands);

  SetPagerColor( AT_PLAIN, ch );

  while(ListHasMoreElements(iterator))
    {
      const Command *cmd = (const Command*) GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( cmd->Level >= LEVEL_AVATAR && cmd->Level <= GetTrustLevel( ch ) )
        {
          PagerPrintf( ch, "%-12s", cmd->Name );

          if ( ++column % NUM_COLUMNS == 0 )
            {
              SendToPager( "\r\n", ch );
            }
	}
    }

  FreeListIterator(iterator);

  if ( column % NUM_COLUMNS != 0 )
    {
      SendToPager( "\r\n", ch );
    }
}
