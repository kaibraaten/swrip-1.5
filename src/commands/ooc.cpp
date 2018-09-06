#include "mud.hpp"

void do_ooc( Character *ch, std::string argument )
{
  TalkChannel( ch, argument, CHANNEL_OOC, "ooc" );
}

