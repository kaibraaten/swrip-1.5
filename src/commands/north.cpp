#include "character.hpp"
#include "mud.hpp"

void do_north( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTH), 0 );
}
