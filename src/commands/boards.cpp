#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"
#include "log.hpp"
#include "repos/boardrepository.hpp"

void do_boards( Character *ch, std::string argument )
{
  if (Boards->Count() == 0)
    {
      ch->Echo( "There are no boards.\r\n" );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for(const Board *board : Boards->Entities())
    {
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
          Log->Bug("%s: Board %s/%d has invalid type %d",
                   __FUNCTION__, board->Name.c_str(), board->BoardObject, board->Type);
          boardType = "*** Invalid ***";
        }
      
      ch->Echo( "%-16s Vnum: %5ld Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %lu Type: %s\r\n",
                board->Name.c_str(), board->BoardObject,
                board->MinReadLevel,    board->MinPostLevel,
                board->MinRemoveLevel, board->MaxPosts, board->Notes().size(),
                boardType);
    }
}

