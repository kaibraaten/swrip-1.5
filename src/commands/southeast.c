#include "mud.h"
#include "character.h"

void do_southeast( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTHEAST), 0 );
}
