#include "mud.h"
#include "character.h"

void do_southeast( CHAR_DATA *ch, char *argument )
{
  move_char( ch, get_exit(ch->in_room, DIR_SOUTHEAST), 0 );
}
