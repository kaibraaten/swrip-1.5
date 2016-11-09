#include "mud.hpp"

void do_wizlock( Character *ch, std::string argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    SendToCharacter( "Game wizlocked.\r\n", ch );
  else
    SendToCharacter( "Game un-wizlocked.\r\n", ch );
}
