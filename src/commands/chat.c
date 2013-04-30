#include "mud.h"

void do_chat( CHAR_DATA *ch, char *argument )
{
  if ( ch->gold < 1 )
    {
      send_to_char("&RYou don't have enough credits!\r\n",ch);
      return;
    }

  ch->gold -= 1;

  talk_channel( ch, argument, CHANNEL_CHAT, "chat" );
}
