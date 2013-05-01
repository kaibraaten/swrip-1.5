#include "mud.h"

void do_northeast( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_NORTHEAST), 0 );
}
