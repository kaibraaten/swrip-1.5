#include "character.h"
#include "mud.h"

void do_southwest( Character *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_SOUTHWEST), 0 );
}
