#include "character.hpp"
#include "mud.h"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( Character *ch, char *argument )
{
  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }
}
