#include "mud.h"
#include "character.h"

void do_east( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_EAST), 0 );
}
