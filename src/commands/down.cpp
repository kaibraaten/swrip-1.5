#include "character.hpp"
#include "mud.hpp"

void do_down( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_DOWN) );
}

