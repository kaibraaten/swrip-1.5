#include "character.h"
#include "mud.h"

void do_west( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_WEST), 0 );
}
