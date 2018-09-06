#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

static void SetTarget( Character *ch, const std::string &target );

void do_focusalias( Character *ch, std::string arg )
{
  SmashTilde(arg);

  if ( IsNpc(ch) )
    {
      ch->Echo("Alias focuses are for players!\r\n");
      return;
    }

  if ( arg.empty() )
    {

      if ( !ch->PCData->Target.empty() )
        {
          ch->Echo( "Your current alias focus is : %s\r\n",
                    ch->PCData->Target.c_str());
          return;
        }

      ch->Echo("You have no current alias focus.\r\n");
      return;
    }
  else
    {
      SetTarget( ch, arg );
      ch->Echo( "Your new alias focus is : %s\r\n",
                ch->PCData->Target.c_str());
      return;
    }
}

static void SetTarget( Character *ch, const std::string &target )
{
  ch->PCData->Target = target;
}
