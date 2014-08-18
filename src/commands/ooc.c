#include "mud.h"

void do_ooc( Character *ch, char *argument )
{
  TalkToChannel( ch, argument, CHANNEL_OOC, "ooc" );
}
