#include "mud.h"

void do_bstat( CHAR_DATA *ch, char *argument )
{
  BOARD_DATA *board = NULL;
  bool found = FALSE;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: bstat <board filename>\r\n", ch );
      return;
    }

  for ( board = first_board; board; board = board->next )
    {
      if ( !str_cmp( arg, board->note_file ) )
	{
	  found = TRUE;
	  break;
	}
    }

  if ( !found )
    {
      send_to_char( "Board not found.\r\n", ch );
      return;
    }

  ch_printf( ch, "%-12s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
             board->note_file,   board->board_obj,
             board->min_read_level,      board->min_post_level,
             board->min_remove_level, board->max_posts,
             board->num_posts, board->type );

  ch_printf( ch, "Read_group: %-15s Post_group: %-15s \r\nExtra_readers: %-10s\r\n",
             board->read_group, board->post_group, board->extra_readers );
}
