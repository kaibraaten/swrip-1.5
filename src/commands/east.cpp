#include "mud.hpp"
#include "character.hpp"

void do_east( std::shared_ptr<Character> ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_EAST), 0 );
}

