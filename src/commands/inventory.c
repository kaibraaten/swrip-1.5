#include "character.h"
#include "mud.h"

void do_inventory( Character *ch, char *argument )
{
  SetCharacterColor( AT_RED, ch );
  SendToCharacter( "You are carrying:\r\n", ch );
  ShowObjectListToCharacter( ch->FirstCarrying, ch, true, true );
}
