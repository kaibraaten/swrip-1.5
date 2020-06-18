#include "character.hpp"
#include "mud.hpp"

void do_northwest( std::shared_ptr<Character> ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTHWEST), 0 );
}

