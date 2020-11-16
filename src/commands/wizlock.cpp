#include "mud.hpp"
#include "character.hpp"

void do_wizlock( std::shared_ptr<Character> ch, std::string argument )
{
  wizlock = !wizlock;

  if ( wizlock )
    ch->Echo("Game wizlocked.\r\n");
  else
    ch->Echo("Game un-wizlocked.\r\n");
}
