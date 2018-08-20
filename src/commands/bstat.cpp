#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"

void do_bstat( Character *ch, char *argument )
{
  Board *board = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Usage: bstat <board filename>\r\n" );
      return;
    }

  board = GetBoard( arg );

  if( !board )
    {
      ch->Echo( "Board not found.\r\n" );
      return;
    }

  ch->Echo( "%-12s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
            board->Name,   board->BoardObject,
            board->MinReadLevel,      board->MinPostLevel,
            board->MinRemoveLevel, board->MaxPosts,
            board->Notes().size(), board->Type );

  ch->Echo( "Read_group: %-15s Post_group: %-15s \r\nExtra_readers: %-10s\r\n",
            board->ReadGroup, board->PostGroup, board->ExtraReaders );
}

