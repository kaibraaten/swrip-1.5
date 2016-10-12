#include "character.h"
#include "mud.h"

void do_north( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->InRoom, DIR_NORTH), 0 );
}
