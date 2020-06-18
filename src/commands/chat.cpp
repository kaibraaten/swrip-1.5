#include "character.hpp"
#include "mud.hpp"

void do_chat( std::shared_ptr<Character> ch, std::string argument )
{
  if ( ch->Gold < 1 )
    {
      ch->Echo("&RYou don't have enough credits!\r\n");
      return;
    }

  ch->Gold -= 1;

  TalkChannel( ch, argument, CHANNEL_CHAT, "chat" );
}
