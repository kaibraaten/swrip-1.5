#include "mud.h"
#include "bounty.h"

void do_rembounty( Character *ch, char *argument )
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
