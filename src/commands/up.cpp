#include "character.hpp"
#include "mud.hpp"

void do_up( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_UP), 0 );
}

