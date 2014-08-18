#include "character.h"
#include "mud.h"

void do_inventory( Character *ch, char *argument )
{
  set_char_color( AT_RED, ch );
  send_to_char( "You are carrying:\r\n", ch );
  ShowObjectListToCharacter( ch->first_carrying, ch, true, true );
}
