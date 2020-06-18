#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"

void do_switch(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Switch into whom?\r\n");
        return;
    }

    if(!ch->Desc)
        return;

    if(ch->Desc->Original)
    {
        ch->Echo("You are already switched.\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Ok.\r\n");
        return;
    }

    if(victim->Desc)
    {
        ch->Echo("Character in use.\r\n");
        return;
    }

    if(!IsNpc(victim) && GetTrustLevel(ch) < LEVEL_GREATER)
    {
        ch->Echo("You cannot switch into a player!\r\n");
        return;
    }

    ch->Desc->Char = victim;
    ch->Desc->Original = ch;
    victim->Desc = ch->Desc;
    ch->Desc = NULL;
    ch->Switched = victim;
    victim->Echo("Ok.\r\n");
}

