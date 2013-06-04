#include "mud.h"

void do_boards( Character *ch, char *argument )
{
  BOARD_DATA *board = NULL;

  if ( !first_board )
    {
      send_to_char( "There are no boards.\r\n", ch );
      return;
    }

  set_char_color( AT_NOTE, ch );

  for ( board = first_board; board; board = board->next )
    ch_printf( ch, "%-16s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
               board->note_file,         board->board_obj,
               board->min_read_level,    board->min_post_level,
               board->min_remove_level, board->max_posts, board->num_posts,
               board->type);
}
