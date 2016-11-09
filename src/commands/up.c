#include "character.hpp"
#include "mud.h"

void do_up( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_UP), 0 );
}
