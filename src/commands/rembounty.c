#include "mud.h"

void do_rembounty(  Character *ch, char *argument )
{
  Bounty *bounty = GetBounty( argument );

  if ( bounty != NULL )
    RemoveBounty(bounty);
}
