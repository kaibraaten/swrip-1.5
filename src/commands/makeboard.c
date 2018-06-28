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

  AllocateMemory( board, Board, 1 );

  AddBoard(board);
  board->Name           = CopyString( StringToLowercase( argument ) );
  board->ReadGroup      = CopyString( "" );
  board->PostGroup      = CopyString( "" );
  board->ExtraReaders   = CopyString( "" );
  board->ExtraRemovers  = CopyString( "" );
}
