#include "character.hpp"
#include "mud.hpp"

void do_inventory( Character *ch, std::string argument )
{
  SetCharacterColor( AT_RED, ch );
  SendToCharacter( "You are carrying:\r\n", ch );
  ShowObjectListToCharacter( ch->FirstCarrying, ch, true, true );
}
