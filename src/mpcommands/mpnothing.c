#include "character.h"
#include "mud.h"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( Character *ch, char *argument )
{
  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustedLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
}
