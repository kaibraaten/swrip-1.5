#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bestow(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Character> victim;

    argument = OneArgument(argument, arg);

    if(arg.empty())
    {
        ch->Echo("Bestow whom with what?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("You can't give special abilities to a mob!\r\n");
        return;
    }

    if(GetTrustLevel(victim) > GetTrustLevel(ch))
    {
        ch->Echo("You aren't powerful enough...\r\n");
        return;
    }

    if(argument.empty() || !StrCmp(argument, "list"))
    {
        ch->Echo("Current bestowed commands on %s: %s.\r\n",
                 victim->Name.c_str(), victim->PCData->Bestowments.c_str());
        return;
    }

    if(!StrCmp(argument, "none"))
    {
        victim->PCData->Bestowments.erase();
        ch->Echo("Bestowments removed from %s.\r\n", victim->Name.c_str());
        victim->Echo("%s has removed your bestowed commands.\r\n", ch->Name.c_str());
        return;
    }

    victim->PCData->Bestowments += " " + argument;
    victim->Echo("%s has bestowed on you the command(s): %s\r\n",
                 ch->Name.c_str(), argument.c_str());
    ch->Echo("Done.\r\n");
}

