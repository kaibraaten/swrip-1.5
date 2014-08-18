#include "character.h"
#include "mud.h"

void do_southwest( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_SOUTHWEST), 0 );
}
