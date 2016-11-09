#include "character.hpp"
#include "mud.hpp"

void do_newbiechat( Character *ch, std::string argument )
{
  if ( ch->TopLevel > 5 )
    {
      SendToCharacter( "Aren't you a little old for the newbie channel?\r\n", ch );
      return;
    }

  TalkChannel( ch, argument, CHANNEL_NEWBIE, "newbiechat" );
}
