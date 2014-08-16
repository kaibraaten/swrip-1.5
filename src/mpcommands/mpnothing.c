#include "character.h"
#include "mud.h"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( Character *ch, char *argument )
{
  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
}
