#include "character.hpp"
#include "mud.hpp"

void do_down( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_DOWN), 0 );
}
