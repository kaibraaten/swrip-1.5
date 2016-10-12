#include "character.h"
#include "mud.h"

void do_chat( Character *ch, char *argument )
{
  if ( ch->Gold < 1 )
    {
      SendToCharacter("&RYou don't have enough credits!\r\n",ch);
      return;
    }

  ch->Gold -= 1;

  TalkChannel( ch, argument, CHANNEL_CHAT, "chat" );
}
