#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_teach(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    int sn = 0;
    std::string arg;

    if(IsNpc(ch))
        return;

    argument = OneArgument(argument, arg);

    if(argument.empty())
    {
        ch->Echo("Teach who, what?\r\n");
        return;
    }
    else
    {
        std::shared_ptr<Character> victim;
        int adept = 0;

        if(!IsAwake(ch))
        {
            ch->Echo("In your dreams, or what?\r\n");
            return;
        }

        if((victim = GetCharacterInRoom(ch, arg)) == NULL)
        {
            ch->Echo("They don't seem to be here.\r\n");
            return;
        }

        if(IsNpc(victim))
        {
            ch->Echo("You can't teach that to them!\r\n");
            return;
        }

        sn = LookupSkill(argument);

        if(sn == -1)
        {
            Act(AT_TELL, "You have no idea what that is.",
                victim, NULL, ch, ActTarget::Vict);
            return;
        }

        if(SkillTable[sn]->Class == AbilityClass::None
           || SkillTable[sn]->Class == AbilityClass::Max)
        {
            Act(AT_TELL, "Thats just not going to happen.",
                victim, NULL, ch, ActTarget::Vict);
            return;
        }

        if(GetAbilityLevel(victim, SkillTable[sn]->Class) < SkillTable[sn]->Level)
        {
            Act(AT_TELL, "$n isn't ready to learn that yet.",
                victim, NULL, ch, ActTarget::Vict);
            return;
        }

        if(IsName(SkillTypeName[SkillTable[sn]->Type], CANT_PRAC))
        {
            Act(AT_TELL, "You are unable to teach that skill.",
                victim, NULL, ch, ActTarget::Vict);
            return;
        }

        adept = 20;

        if(GetSkillLevel(victim, sn) >= adept)
        {
            Act(AT_TELL, "$n must practice that on their own.", victim, NULL, ch, ActTarget::Vict);
            return;
        }

        if(GetSkillLevel(ch, sn) < 100)
        {
            Act(AT_TELL, "You must perfect that yourself before teaching others.",
                victim, NULL, ch, ActTarget::Vict);
            return;
        }
        else
        {
            victim->PCData->Learned[sn] += IntelligenceBonus[GetCurrentIntelligence(ch)].Learn;
            sprintf(buf, "You teach %s $T.", victim->Name.c_str());
            Act(AT_ACTION, buf,
                ch, nullptr, SkillTable[sn]->Name, ActTarget::Char);
            sprintf(buf, "%s teaches you $T.", ch->Name.c_str());
            Act(AT_ACTION, buf,
                victim, nullptr, SkillTable[sn]->Name, ActTarget::Char);
        }
    }
}
