#include "mud.h"

void do_makeboard( Character *ch, char *argument )
{
  Board *board = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeboard <filename>\r\n", ch );
      return;
    }

  SmashTilde( argument );

  AllocateMemory( board, Board, 1 );

  LINK( board, first_board, last_board, Next, Previous );
  board->NoteFile       = CopyString( StringToLowercase( argument ) );
  board->ReadGroup      = CopyString( "" );
  board->PostGroup      = CopyString( "" );
  board->ExtraReaders   = CopyString( "" );
  board->ExtraRemovers  = CopyString( "" );
}
