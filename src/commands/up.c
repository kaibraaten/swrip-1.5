#include "mud.h"

void do_up( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_UP), 0 );
}
