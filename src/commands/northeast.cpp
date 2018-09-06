#include "character.hpp"
#include "mud.hpp"

void do_northeast( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHEAST), 0 );
}

