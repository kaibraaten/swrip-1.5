#include "character.hpp"
#include "mud.hpp"

void do_south( Character *ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_SOUTH), 0 );
}
