#include "character.hpp"
#include "mud.hpp"

void do_down( std::shared_ptr<Character> ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_DOWN) );
}

