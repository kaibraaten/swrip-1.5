#include "mud.hpp"
#include "character.hpp"

void do_southeast( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTHEAST), 0 );
}

