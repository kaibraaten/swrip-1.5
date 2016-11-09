#include "character.hpp"
#include "mud.h"

void do_northwest( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHWEST), 0 );
}
