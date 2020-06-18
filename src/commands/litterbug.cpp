#include "character.hpp"
#include "mud.hpp"

void do_litterbug( std::shared_ptr<Character> ch, std::string arg )
{
    Character *victim = nullptr;

    if ( arg.empty() )
    {
        ch->Echo("Set litterbug flag on whom?\r\n");
        return;
    }

    if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if ( IsNpc(victim) )
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
        ch->Echo("You failed.\r\n");
        return;
    }

    if (victim->Flags.test(Flag::Plr::Litterbug))
    {
        victim->Flags.reset(Flag::Plr::Litterbug);
        victim->Echo("You can drop items again.\r\n");
        ch->Echo("LITTERBUG removed.\r\n");
    }
    else
    {
        victim->Flags.set(Flag::Plr::Litterbug);
        victim->Echo("You a strange force prevents you from dropping any more items!\r\n");
        ch->Echo("LITTERBUG set.\r\n");
    }
}
