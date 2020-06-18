#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_unfocusalias(std::shared_ptr<Character> ch, std::string argument)
{
  if ( IsNpc(ch) )
    {
      ch->Echo("Only players can have alias focuses!\r\n");
      return;
    }

  if ( ch->PCData->AliasFocus.empty() )
    {
      ch->Echo("Your alias focus is not defined at the moment.\r\n");
      return;
    }

  ch->Echo("You remove your current alias focus.\r\n");
  ch->PCData->AliasFocus.erase();
}
