#include "character.hpp"
#include "mud.hpp"

void do_west( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_WEST), 0 );
}
