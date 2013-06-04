#include "mud.h"

void do_rembounty(  Character *ch, char *argument )
{
  BOUNTY_DATA *bounty = get_disintegration( argument );

  if ( bounty != NULL )
    remove_disintegration(bounty);
}
