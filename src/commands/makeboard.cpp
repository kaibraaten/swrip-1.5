#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"

void do_makeboard( Character *ch, char *argument )
{
  Board *board = NULL;

  if ( IsNullOrEmpty( argument ) )
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

