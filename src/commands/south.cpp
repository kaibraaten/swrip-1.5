#include "character.hpp"
#include "mud.h"

void do_south( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTH), 0 );
}
