#include "character.h"
#include "mud.h"

void do_north( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_NORTH), 0 );
}
