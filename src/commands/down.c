#include "character.h"
#include "mud.h"

void do_down( Character *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_DOWN), 0 );
}
