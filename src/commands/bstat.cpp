#include "mud.hpp"
#include "board.hpp"

void do_bstat( Character *ch, char *argument )
{
  Board *board = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: bstat <board filename>\r\n", ch );
      return;
    }

  board = GetBoard( arg );

  if( !board )
    {
      SendToCharacter( "Board not found.\r\n", ch );
      return;
    }

  Echo( ch, "%-12s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
             board->Name,   board->BoardObject,
             board->MinReadLevel,      board->MinPostLevel,
             board->MinRemoveLevel, board->MaxPosts,
             board->NumberOfPosts, board->Type );

  Echo( ch, "Read_group: %-15s Post_group: %-15s \r\nExtra_readers: %-10s\r\n",
             board->ReadGroup, board->PostGroup, board->ExtraReaders );
}
