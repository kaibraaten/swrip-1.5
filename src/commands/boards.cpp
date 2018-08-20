#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"

void do_boards( Character *ch, char *argument )
{
  if (Boards->Count() == 0)
    {
      ch->Echo( "There are no boards.\r\n" );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for(const Board *board : Boards->Entities())
    {
      ch->Echo( "%-16s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
                board->Name,         board->BoardObject,
                board->MinReadLevel,    board->MinPostLevel,
                board->MinRemoveLevel, board->MaxPosts, board->Notes().size(),
                board->Type);
    }
}

