#include "character.h"
#include "mud.h"

void do_northeast( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_NORTHEAST), 0 );
}
