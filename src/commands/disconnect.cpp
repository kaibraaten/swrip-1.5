#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_disconnect(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Disconnect whom?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim->Desc == NULL)
    {
        ch->Echo("%s doesn't have a descriptor.", victim->Name.c_str());
        return;
    }

    if(GetTrustLevel(ch) <= GetTrustLevel(victim))
    {
        ch->Echo("They might not like that...\r\n");
        return;
    }

    CloseDescriptor(victim->Desc, false);
    ch->Echo("Ok.\r\n");
}

