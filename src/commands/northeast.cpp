#include "character.hpp"
#include "mud.h"

void do_northeast( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHEAST), 0 );
}
