#include "character.hpp"
#include "mud.hpp"

void do_south( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTH), 0 );
}

