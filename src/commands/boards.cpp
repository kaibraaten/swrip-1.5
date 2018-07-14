#include "mud.hpp"
#include "board.hpp"

static void ShowBoardToCharacter(void *element, void *ud)
{
  const Board *board = (const Board*)element;
  const Character *ch = (const Character*)ud;

  Echo( ch, "%-16s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
        board->Name,         board->BoardObject,
        board->MinReadLevel,    board->MinPostLevel,
        board->MinRemoveLevel, board->MaxPosts, ListSize(board->Notes),
        board->Type);
}

void do_boards( Character *ch, char *argument )
{
  const List *boards = GetEntities(BoardRepository);
  size_t listSize = ListSize(boards);

  if (listSize == 0)
    {
      SendToCharacter( "There are no boards.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );
  ForEachInList(boards, ShowBoardToCharacter, ch);
}
