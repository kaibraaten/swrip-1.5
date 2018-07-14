#include "character.hpp"
#include "mud.hpp"

void do_west( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_WEST), 0 );
}
