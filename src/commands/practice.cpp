#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "protomob.hpp"

void do_practice(Character* ch, std::string argument)
{
    if (IsNpc(ch))
        return;

    if (argument.empty())
    {
        int col = 0;
        SkillType lasttype = SKILL_SPELL;
        short cnt = 0;

        SetCharacterColor(AT_MAGIC, ch);

        for (int sn = 0; sn < TopSN; sn++)
        {
            std::shared_ptr<Skill> skill = SkillTable[sn];

            if (skill->Name.empty())
                break;

            if (skill->Guild < 0 || skill->Guild >= MAX_ABILITY)
                continue;

            if ((skill->Type == SKILL_UNKNOWN
                || skill->Type == SKILL_HERB
                || skill->Type == SKILL_TONGUE)
                && !IsImmortal(ch))
            {
                lasttype = skill->Type;
                continue;
            }

            if (!StrCmp(skill->Name, "reserved") && IsImmortal(ch))
            {
                if (col % 3 != 0)
                    ch->Echo("&r\r\n");

                ch->Echo("&R--------------------------------[Spells]---------------------------------\r\n&r");
                col = 0;
            }

            if (skill->Type != lasttype)
            {
                if (col % 3 != 0)
                    ch->Echo("\r\n&r");

                ch->Echo("&R--------------------------------%ss---------------------------------\r\n&r",
                    SkillTypeName[skill->Type]);
                col = cnt = 0;
            }

            lasttype = skill->Type;

            if (skill->Guild < 0 || skill->Guild >= MAX_ABILITY)
                continue;

            if (ch->PCData->Learned[sn] <= 0
                && GetAbilityLevel(ch, skill->Guild) < skill->Level)
                continue;

            if (ch->PCData->Learned[sn] == 0
                && SPELL_FLAG(skill, SF_SECRETSKILL))
                continue;

            ++cnt;

            if (ch->PCData->Learned[sn] >= 100)
            {
                ch->Echo("&R%18s %3d%%  &r",
                    Capitalize(skill->Name).c_str(),
                    ch->PCData->Learned[sn]);
            }
            else
                ch->Echo("&r%18s %3d%%  ",
                    Capitalize(skill->Name).c_str(),
                    ch->PCData->Learned[sn]);

            if (++col % 3 == 0)
                ch->Echo("\r\n&r");
        }

        if (col % 3 != 0)
            ch->Echo("\r\n&r");
    }
    else
    {
        Character* mob = nullptr;
        int adept = 0;
        bool can_prac = true;
        std::shared_ptr<Skill> skill;
        char buf[MAX_STRING_LENGTH];

        if (!IsAwake(ch))
        {
            ch->Echo("In your dreams, or what?\r\n");
            return;
        }

        for (Character* potentialTeacher : ch->InRoom->Characters())
        {
            if (IsNpc(potentialTeacher) && potentialTeacher->Flags.test(Flag::Mob::Practice))
            {
                mob = potentialTeacher;
                break;
            }
        }

        if (!mob)
        {
            ch->Echo("You can't do that here.\r\n");
            return;
        }

        int sn = LookupSkill(argument);

        if (sn == -1)
        {
            Act(AT_TELL, "$n tells you 'I've never heard of that one...'",
                mob, NULL, ch, TO_VICT);
            return;
        }
        else
        {
            skill = SkillTable[sn];
        }

        if (skill->Guild < 0 || skill->Guild >= MAX_ABILITY)
        {
            Act(AT_TELL, "$n tells you 'I cannot teach you that...'",
                mob, NULL, ch, TO_VICT);
            return;
        }

        if (can_prac && !IsNpc(ch)
            && GetAbilityLevel(ch, skill->Guild) < skill->Level)
        {
            Act(AT_TELL, "$n tells you 'You're not ready to learn that yet...'",
                mob, NULL, ch, TO_VICT);
            return;
        }

        if (IsName(SkillTypeName[skill->Type], CANT_PRAC))
        {
            Act(AT_TELL, "$n tells you 'I do not know how to teach that.'",
                mob, NULL, ch, TO_VICT);
            return;
        }

        /*
         * Skill requires a special teacher
         */
        if (!skill->Teachers.empty())
        {
            sprintf(buf, "%ld", mob->Prototype->Vnum);

            if (!IsName(buf, skill->Teachers))
            {
                Act(AT_TELL, "$n tells you, 'I do not know how to teach that.'",
                    mob, NULL, ch, TO_VICT);
                return;
            }
        }
        else
        {
            Act(AT_TELL, "$n tells you, 'I do not know how to teach that.'",
                mob, NULL, ch, TO_VICT);
            return;
        }

        adept = 20;

        if (ch->Gold < skill->Level * 10)
        {
            sprintf(buf, "$n tells you, 'I charge %d credits to teach that. You don't have enough.'", skill->Level * 10);
            Act(AT_TELL, "$n tells you 'You don't have enough credits.'",
                mob, NULL, ch, TO_VICT);
            return;
        }

        if (ch->PCData->Learned[sn] >= adept)
        {
            sprintf(buf, "$n tells you, 'I've taught you everything I can about %s.'",
                skill->Name.c_str());
            Act(AT_TELL, buf, mob, NULL, ch, TO_VICT);
            Act(AT_TELL, "$n tells you, 'You'll have to practice it on your own now...'",
                mob, NULL, ch, TO_VICT);
        }
        else
        {
            ch->Gold -= skill->Level * 10;
            ch->PCData->Learned[sn] += IntelligenceBonus[GetCurrentIntelligence(ch)].Learn;
            Act(AT_ACTION, "You practice $T.",
                ch, NULL, skill->Name.c_str(), TO_CHAR);
            Act(AT_ACTION, "$n practices $T.",
                ch, NULL, skill->Name.c_str(), TO_ROOM);

            if (ch->PCData->Learned[sn] >= adept)
            {
                ch->PCData->Learned[sn] = adept;
                Act(AT_TELL,
                    "$n tells you, 'You'll have to practice it on your own now...'",
                    mob, NULL, ch, TO_VICT);
            }
        }
    }
}
