#include "character.hpp"
#include "mud.hpp"

void do_log( Character *ch, std::string arg )
{
    Character *victim = nullptr;

    if ( arg.empty() )
    {
        ch->Echo("Log whom?\r\n");
        return;
    }

    if ( !StrCmp( arg, "all" ) )
    {
        if ( fLogAll )
        {
            fLogAll = false;
            ch->Echo("Log ALL off.\r\n");
        }
        else
        {
            fLogAll = true;
            ch->Echo("Log ALL on.\r\n");
        }
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

    /*
     * No level check, gods can log anyone.
     */
    if (victim->Flags.test(Flag::Plr::Log))
    {
        victim->Flags.reset(Flag::Plr::Log);
        ch->Echo("LOG removed.\r\n");
    }
    else
    {
        victim->Flags.set(Flag::Plr::Log);
        ch->Echo("LOG set.\r\n");
    }
}
