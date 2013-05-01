#include "mud.h"

void do_south( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_SOUTH), 0 );
}
