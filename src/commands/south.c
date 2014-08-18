#include "character.h"
#include "mud.h"

void do_south( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_SOUTH), 0 );
}
