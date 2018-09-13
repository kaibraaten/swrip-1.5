#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"
#include "repos/boardrepository.hpp"

void do_makeboard( Character *ch, std::string argument )
{
  Board *board = NULL;

  if ( argument.empty() )
    {
      ch->Echo("Usage: makeboard <name>\r\n");
      return;
    }

  if( GetBoard( argument ) )
    {
      ch->Echo("&RThere is already another board with that name.&d\r\n" );
      return;
    }
  
  SmashTilde( argument );
  board = AllocateBoard(argument);
  Boards->Add(board);
}


