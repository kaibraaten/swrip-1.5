#include "character.hpp"
#include "mud.hpp"

void do_inventory( std::shared_ptr<Character> ch, std::string argument )
{
  SetCharacterColor( AT_RED, ch );
  ch->Echo("You are carrying:\r\n");
  ShowObjectListToCharacter( ch->Objects(), ch, true, true );
}
