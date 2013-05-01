#include "mud.h"

void do_west( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_WEST), 0 );
}
