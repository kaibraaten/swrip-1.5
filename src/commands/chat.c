#include "character.h"
#include "mud.h"

void do_chat( Character *ch, char *argument )
{
  if ( ch->gold < 1 )
    {
      send_to_char("&RYou don't have enough credits!\r\n",ch);
      return;
    }

  ch->gold -= 1;

  TalkChannel( ch, argument, CHANNEL_CHAT, "chat" );
}
