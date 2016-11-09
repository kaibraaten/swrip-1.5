#include "character.hpp"
#include "mud.h"

void do_west( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_WEST), 0 );
}
