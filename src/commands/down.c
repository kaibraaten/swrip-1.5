#include "mud.h"

void do_down( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_DOWN), 0 );
}