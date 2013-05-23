#include "character.h"
#include "mud.h"

void do_northwest( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_NORTHWEST), 0 );
}
