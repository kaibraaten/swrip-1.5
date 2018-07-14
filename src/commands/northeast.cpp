#include "character.hpp"
#include "mud.hpp"

void do_northeast( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHEAST), 0 );
}
