#include "mud.hpp"
#include "bounty.hpp"
#include "character.hpp"

void do_rembounty( Character *ch, std::string argument )
{
  Bounty *bounty = GetBounty( argument );

  if ( bounty != NULL )
    {
      RemoveBounty(bounty);
      ch->Echo("Done.\r\n" );
    }
  else
    {
      ch->Echo("No such bounty.\r\n" );
    }
}

