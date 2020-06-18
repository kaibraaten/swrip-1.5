#include "mud.hpp"
#include "character.hpp"
#include "systemdata.hpp"
#include "act.hpp"

void do_force(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    bool mobsonly = false;
    argument = OneArgument(argument, arg);

    if(arg.empty() || argument.empty())
    {
        ch->Echo("Force whom to do what?\r\n");
        return;
    }

    mobsonly = GetTrustLevel(ch) < SysData.LevelToForcePlayers;

    if(!StrCmp(arg, "all"))
    {
        if(mobsonly)
        {
            ch->Echo("Force whom to do what?\r\n");
            return;
        }

        for(std::shared_ptr<Character> vch = FirstCharacter, vch_next; vch; vch = vch_next)
        {
            vch_next = vch->Next;

            if(!IsNpc(vch) && GetTrustLevel(vch) < GetTrustLevel(ch))
            {
                Act(AT_IMMORT, "$n forces you to '$t'.",
                    ch, argument, vch, ActTarget::Vict);
                Interpret(vch, argument);
            }
        }
    }
    else
    {
        std::shared_ptr<Character> victim = GetCharacterAnywhere(ch, arg);

        if(victim == nullptr)
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }

        if(victim == ch)
        {
            ch->Echo("Aye aye, right away!\r\n");
            return;
        }

        if((GetTrustLevel(victim) >= GetTrustLevel(ch))
           || (mobsonly && !IsNpc(victim)))
        {
            ch->Echo("Do it yourself!\r\n");
            return;
        }

        Act(AT_IMMORT, "$n forces you to '$t'.",
            ch, argument, victim, ActTarget::Vict);
        Interpret(victim, argument);
    }

    ch->Echo("Ok.\r\n");
}

