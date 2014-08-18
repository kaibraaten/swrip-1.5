#include "character.h"
#include "mud.h"

void do_down( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_DOWN), 0 );
}
