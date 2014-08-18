#include "mud.h"

void do_makeboard( Character *ch, char *argument )
{
  Board *board = NULL;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeboard <filename>\r\n", ch );
      return;
    }

  SmashTilde( argument );

  AllocateMemory( board, Board, 1 );

  LINK( board, first_board, last_board, next, prev );
  board->note_file       = CopyString( StringToLowercase( argument ) );
  board->read_group      = CopyString( "" );
  board->post_group      = CopyString( "" );
  board->extra_readers   = CopyString( "" );
  board->extra_removers  = CopyString( "" );
}
