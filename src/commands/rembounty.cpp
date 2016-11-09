#include "mud.hpp"
#include "bounty.hpp"

void do_rembounty( Character *ch, std::string argument )
{
  Bounty *bounty = GetBounty( argument );

  if ( bounty != NULL )
    {
      RemoveBounty(bounty);
      Echo( ch, "Done.\r\n" );
    }
  else
    {
      Echo( ch, "No such bounty.\r\n" );
    }
}
