#include "mud.h"

void do_boards( Character *ch, char *argument )
{
  Board *board = NULL;

  if ( !first_board )
    {
      SendToCharacter( "There are no boards.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for ( board = first_board; board; board = board->Next )
    Echo( ch, "%-16s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
               board->NoteFile,         board->BoardObject,
               board->MinReadLevel,    board->MinPostLevel,
               board->MinRemoveLevel, board->MaxPosts, board->NumberOfPosts,
               board->Type);
}
