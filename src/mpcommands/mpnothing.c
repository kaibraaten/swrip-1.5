#include "mud.h"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( CHAR_DATA *ch, char *argument )
{
  if ( IS_AFFECTED( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) || ( ch->desc && get_trust( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
}
