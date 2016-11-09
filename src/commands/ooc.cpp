#include "mud.h"

void do_ooc( Character *ch, char *argument )
{
  TalkChannel( ch, argument, CHANNEL_OOC, "ooc" );
}
