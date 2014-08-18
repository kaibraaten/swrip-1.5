#include "character.h"
#include "mud.h"

void do_up( Character *ch, char *argument )
{
  MoveCharacter( ch, GetExit(ch->in_room, DIR_UP), 0 );
}
