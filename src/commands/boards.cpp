#include "mud.hpp"
#include "board.hpp"

void do_boards( Character *ch, std::string argument )
{
  Board *board = NULL;

  if ( !FirstBoard )
    {
      SendToCharacter( "There are no boards.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for ( board = FirstBoard; board; board = board->Next )
    Echo( ch, "%-16s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
               board->Name,         board->BoardObject,
               board->MinReadLevel,    board->MinPostLevel,
               board->MinRemoveLevel, board->MaxPosts, board->NumberOfPosts,
               board->Type);
}
