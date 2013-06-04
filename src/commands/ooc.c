#include "mud.h"

void do_ooc( Character *ch, char *argument )
{
  talk_channel( ch, argument, CHANNEL_OOC, "ooc" );
}
