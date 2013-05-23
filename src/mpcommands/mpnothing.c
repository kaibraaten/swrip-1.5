#include "character.h"
#include "mud.h"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( CHAR_DATA *ch, char *argument )
{
  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) || ( ch->desc && get_trust( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
}
