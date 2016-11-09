#include "mud.hpp"

void do_wizlock( Character *ch, char *argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    SendToCharacter( "Game wizlocked.\r\n", ch );
  else
    SendToCharacter( "Game un-wizlocked.\r\n", ch );
}
