#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_unfocusalias(Character *ch, char *argument)
{
  if ( IsNpc(ch) )
    {
      ch->Echo("Only players can have alias focuses!\r\n");
      return;
    }

  if ( IsNullOrEmpty( ch->PCData->Target ) )
    {
      ch->Echo("Your alias focus is not defined at the moment.\r\n");
      return;
    }

  ch->Echo("You remove your current alias focus.\r\n");
  ch->PCData->Target = CopyString("");
}

