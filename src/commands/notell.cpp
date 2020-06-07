#include "mud.hpp"
#include "character.hpp"

void do_notell( Character *ch, std::string arg )
{
    Character *victim = nullptr;

    if ( arg.empty() )
    {
        ch->Echo("Notell whom?");
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

    if (victim->Flags.test(Flag::Plr::NoTell))
    {
        victim->Flags.reset(Flag::Plr::NoTell);
        victim->Echo("You can tell again.\r\n");
        ch->Echo("NO_TELL removed.\r\n");
    }
    else
    {
        victim->Flags.set(Flag::Plr::NoTell);
        victim->Echo("You can't tell!\r\n");
        ch->Echo("NO_TELL set.\r\n");
    }
}
