#include "character.hpp"
#include "mud.hpp"

void do_southwest( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTHWEST), 0 );
}

