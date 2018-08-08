#include "mud.hpp"

void do_ooc( Character *ch, char *argument )
{
  TalkChannel( ch, argument, CHANNEL_OOC, "ooc" );
}

