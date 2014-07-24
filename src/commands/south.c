#include "character.h"
#include "mud.h"

void do_south( Character *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_SOUTH), 0 );
}
