#include "character.hpp"
#include "mud.hpp"

void do_northwest( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHWEST), 0 );
}

