#include "mud.h"
#include "character.h"

void do_east( Character *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_EAST), 0 );
}
