#include "mud.h"

void do_makeboard( Character *ch, char *argument )
{
  BOARD_DATA *board = NULL;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeboard <filename>\r\n", ch );
      return;
    }

  smash_tilde( argument );

  CREATE( board, BOARD_DATA, 1 );

  LINK( board, first_board, last_board, next, prev );
  board->note_file       = str_dup( strlower( argument ) );
  board->read_group      = str_dup( "" );
  board->post_group      = str_dup( "" );
  board->extra_readers   = str_dup( "" );
  board->extra_removers  = str_dup( "" );
}
