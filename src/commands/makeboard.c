#include "mud.h"
#include "board.h"

void do_makeboard( Character *ch, char *argument )
{
  Board *board = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeboard <name>\r\n", ch );
      return;
    }

  if( GetBoard( argument ) )
    {
      Echo( ch, "&RThere is already another board with that name.&d\r\n" );
      return;
    }
  
  SmashTilde( argument );
  board = AllocateBoard(argument);
  AddBoard(board);
}
