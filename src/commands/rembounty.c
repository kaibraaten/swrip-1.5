#include "mud.h"

void do_rembounty(  CHAR_DATA *ch, char *argument )
{
  BOUNTY_DATA *bounty = get_disintegration( argument );

  if ( bounty != NULL )
    remove_disintegration(bounty);
}
