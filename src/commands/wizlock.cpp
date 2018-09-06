#include "mud.hpp"
#include "character.hpp"

void do_wizlock( Character *ch, std::string argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    ch->Echo("Game wizlocked.\r\n");
  else
    ch->Echo("Game un-wizlocked.\r\n");
}
