#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "act.hpp"

void do_practice(std::shared_ptr<Character> ch, std::string argument)
{
    if(IsNpc(ch))
        return;

    if(argument.empty())
    {
        int col = 0;
        SkillType lasttype = SKILL_SPELL;
        short cnt = 0;

        SetCharacterColor(AT_MAGIC, ch);

        for(int sn = 0; sn < TopSN; sn++)
        {
            std::shared_ptr<Skill> skill = SkillTable[sn];

            if(skill->Name.empty())
                break;

            if(skill->Class == AbilityClass::None || skill->Class == AbilityClass::Max)
                continue;

            if((skill->Type == SKILL_UNKNOWN
                || skill->Type == SKILL_HERB
                || skill->Type == SKILL_TONGUE)
               && !IsImmortal(ch))
            {
                lasttype = skill->Type;
                continue;
            }

            if(!StrCmp(skill->Name, "reserved") && IsImmortal(ch))
            {
                if(col % 3 != 0)
                    ch->Echo("&r\r\n");

                ch->Echo("&R--------------------------------[Spells]---------------------------------\r\n&r");
                col = 0;
            }

            if(skill->Type != lasttype)
            {
                if(col % 3 != 0)
                    ch->Echo("\r\n&r");

                ch->Echo("&R--------------------------------%ss---------------------------------\r\n&r",
                         SkillTypeName[skill->Type]);
                col = cnt = 0;
            }

            lasttype = skill->Type;

            if(skill->Class == AbilityClass::None || skill->Class == AbilityClass::Max)
                continue;

            if(GetSkillLevel(ch, sn) <= 0
               && GetAbilityLevel(ch, skill->Class) < skill->Level)
                continue;

            if(GetSkillLevel(ch, sn) == 0
               && SPELL_FLAG(skill, SF_SECRETSKILL))
                continue;

            ++cnt;

            if(GetSkillLevel(ch, sn) >= 100)
            {
                ch->Echo("&R%18s %3d%%  &r",
                         Capitalize(skill->Name).c_str(),
                         GetSkillLevel(ch, sn));
            }
            else
                ch->Echo("&r%18s %3d%%  ",
                         Capitalize(skill->Name).c_str(),
                         GetSkillLevel(ch, sn));

            if(++col % 3 == 0)
                ch->Echo("\r\n&r");
        }

        if(col % 3 != 0)
            ch->Echo("\r\n&r");
    }
    else
    {
        std::shared_ptr<Character> mob;
        int adept = 0;
        bool can_prac = true;
        std::shared_ptr<Skill> skill;
        char buf[MAX_STRING_LENGTH];

        if(!IsAwake(ch))
        {
            ch->Echo("In your dreams, or what?\r\n");
            return;
        }

        for(auto potentialTeacher : ch->InRoom->Characters())
        {
            if(IsNpc(potentialTeacher) && potentialTeacher->Flags.test(Flag::Mob::Practice))
            {
                mob = potentialTeacher;
                break;
            }
        }

        if(!mob)
        {
            ch->Echo("You can't do that here.\r\n");
            return;
        }

        int sn = LookupSkill(argument);

        if(sn == -1)
        {
            Act(AT_TELL, "$n tells you 'I've never heard of that one...'",
                mob, NULL, ch, ActTarget::Vict);
            return;
        }
        else
        {
            skill = SkillTable[sn];
        }

        if(skill->Class == AbilityClass::None || skill->Class == AbilityClass::Max)
        {
            Act(AT_TELL, "$n tells you 'I cannot teach you that...'",
                mob, NULL, ch, ActTarget::Vict);
            return;
        }

        if(can_prac && !IsNpc(ch)
           && GetAbilityLevel(ch, skill->Class) < skill->Level)
        {
            Act(AT_TELL, "$n tells you 'You're not ready to learn that yet...'",
                mob, NULL, ch, ActTarget::Vict);
            return;
        }

        if(IsName(SkillTypeName[skill->Type], CANT_PRAC))
        {
            Act(AT_TELL, "$n tells you 'I do not know how to teach that.'",
                mob, NULL, ch, ActTarget::Vict);
            return;
        }

        /*
         * Skill requires a special teacher
         */
        if(!skill->Teachers.empty())
        {
            sprintf(buf, "%ld", mob->Prototype->Vnum);

            if(!IsName(buf, skill->Teachers))
            {
                Act(AT_TELL, "$n tells you, 'I do not know how to teach that.'",
                    mob, NULL, ch, ActTarget::Vict);
                return;
            }
        }
        else
        {
            Act(AT_TELL, "$n tells you, 'I do not know how to teach that.'",
                mob, NULL, ch, ActTarget::Vict);
            return;
        }

        adept = 20;

        if(ch->Gold < skill->Level * 10)
        {
            sprintf(buf, "$n tells you, 'I charge %d credits to teach that. You don't have enough.'", skill->Level * 10);
            Act(AT_TELL, "$n tells you 'You don't have enough credits.'",
                mob, nullptr, ch, ActTarget::Vict);
            return;
        }

        if(GetSkillLevel(ch, sn) >= adept)
        {
            sprintf(buf, "$n tells you, 'I've taught you everything I can about %s.'",
                    skill->Name.c_str());
            Act(AT_TELL, buf, mob, nullptr, ch, ActTarget::Vict);
            Act(AT_TELL, "$n tells you, 'You'll have to practice it on your own now...'",
                mob, nullptr, ch, ActTarget::Vict);
        }
        else
        {
            ch->Gold -= skill->Level * 10;
            ch->PCData->Learned[sn] += IntelligenceBonus[GetCurrentIntelligence(ch)].Learn;
            Act(AT_ACTION, "You practice $T.",
                ch, nullptr, skill->Name, ActTarget::Char);
            Act(AT_ACTION, "$n practices $T.",
                ch, nullptr, skill->Name, ActTarget::Room);

            if(GetSkillLevel(ch, sn) >= adept)
            {
                ch->PCData->Learned[sn] = adept;
                Act(AT_TELL,
                    "$n tells you, 'You'll have to practice it on your own now...'",
                    mob, nullptr, ch, ActTarget::Vict);
            }
        }
    }
}
