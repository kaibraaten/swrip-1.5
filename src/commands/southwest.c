#include "mud.h"

void do_southwest( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_SOUTHWEST), 0 );
}
