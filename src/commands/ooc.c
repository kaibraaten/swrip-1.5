#include "mud.h"

void do_ooc( CHAR_DATA *ch, char *argument )
{
  talk_channel( ch, argument, CHANNEL_OOC, "ooc" );
}
