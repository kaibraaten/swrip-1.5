#include "character.hpp"
#include "mud.hpp"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( Character *ch, std::string argument )
{
  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }
}
