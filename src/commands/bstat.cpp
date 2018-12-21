#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"
#include "log.hpp"

void do_bstat( Character *ch, std::string arg )
{
  std::shared_ptr<Board> board;

  if ( arg.empty() )
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

  const char *boardType = nullptr;

      if(board->Type == BOARD_NOTE)
        {
          boardType = "Note";
        }
      else if(board->Type == BOARD_MAIL)
        {
          boardType = "Mail";
        }
      else
        {
          Log->Bug("%s: Board %s/%ld has invalid type %d",
                   __FUNCTION__, board->Name.c_str(), board->BoardObject, board->Type);
          boardType = "*** Invalid ***";
        }
  
  ch->Echo( "%-12s Vnum: %5ld Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %lu Type: %s\r\n",
            board->Name.c_str(),   board->BoardObject,
            board->MinReadLevel,      board->MinPostLevel,
            board->MinRemoveLevel, board->MaxPosts,
            board->Notes().size(), boardType );

  ch->Echo( "Read_group: %-15s Post_group: %-15s \r\nExtra_readers: %-10s\r\n",
            board->ReadGroup.c_str(), board->PostGroup.c_str(), board->ExtraReaders.c_str() );
}
