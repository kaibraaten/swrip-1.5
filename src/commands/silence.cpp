#include "character.hpp"
#include "mud.hpp"

void do_silence(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Silence whom?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if(GetTrustLevel(victim) >= GetTrustLevel(ch))
    {
        ch->Echo("You failed.\r\n");
        return;
    }

    if(victim->Flags.test(Flag::Plr::Silence))
    {
        ch->Echo("Player already silenced, use unsilence to remove.\r\n");
    }
    else
    {
        victim->Flags.set(Flag::Plr::Silence);
        victim->Echo("You can't use channels!\r\n");
        ch->Echo("SILENCE set.\r\n");
    }
}
