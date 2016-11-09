#include "mud.hpp"
#include "character.hpp"

void do_east( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_EAST), 0 );
}
