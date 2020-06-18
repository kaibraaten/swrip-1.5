#include "character.hpp"
#include "mud.hpp"

void do_up( std::shared_ptr<Character> ch, std::string argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_UP), 0 );
}

