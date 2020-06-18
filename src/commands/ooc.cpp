#include "mud.hpp"

void do_ooc( std::shared_ptr<Character> ch, std::string argument )
{
  TalkChannel( ch, argument, CHANNEL_OOC, "ooc" );
}

