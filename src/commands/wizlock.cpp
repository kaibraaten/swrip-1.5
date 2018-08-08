#include "mud.hpp"
#include "character.hpp"

void do_wizlock( Character *ch, char *argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    ch->Echo("Game wizlocked.\r\n");
  else
    ch->Echo("Game un-wizlocked.\r\n");
}

