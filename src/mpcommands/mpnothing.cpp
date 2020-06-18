#include "character.hpp"
#include "mud.hpp"

/*
 * Does nothing.  Used for scripts.
 */
void do_mpnothing( std::shared_ptr<Character> ch, std::string argument )
{
    if ( IsAffectedBy( ch, Flag::Affect::Charm))
        return;

    if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
        ch->Echo("Huh?\r\n");
        return;
    }
}
