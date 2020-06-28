#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "race.hpp"
#include "act.hpp"

void do_languages(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    int lang = 0;
    int sn = 0;

    argument = OneArgument(argument, arg);

    if(!arg.empty() && !StringPrefix(arg, "learn")
       && !IsImmortal(ch) && !IsNpc(ch))
    {
        std::string arg2;
        int prct = 0;

        argument = OneArgument(argument, arg2);

        if(arg2.empty())
        {
            ch->Echo("Learn which language?\r\n");
            return;
        }

        for(lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++)
        {
            if(LanguageArray[lang] == LANG_CLAN)
                continue;

            if(!StringPrefix(arg2, LanguageNames[lang]))
                break;
        }

        if(LanguageArray[lang] == LANG_UNKNOWN)
        {
            ch->Echo("That is not a language.\r\n");
            return;
        }

        if(!IsValidLanguage(LanguageArray[lang]))
        {
            ch->Echo("You may not learn that language.\r\n");
            return;
        }

        if((sn = LookupSkill(LanguageNames[lang])) < 0)
        {
            ch->Echo("That is not a language.\r\n");
            return;
        }

        if(RaceTable[ch->Race].Language & LanguageArray[lang]
           || GetSkillLevel(ch, sn) >= 99)
        {
            Act(AT_PLAIN, "You are already fluent in $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
            return;
        }

        bool teacherIsPresent = false;

        for(const auto &sch : ch->InRoom->Characters())
        {
            if(IsNpc(sch)
               && sch->Flags.test(Flag::Mob::Scholar)
               && CharacterKnowsLanguage(sch, ch->Speaking, ch)
               && CharacterKnowsLanguage(sch, LanguageArray[lang], sch)
               && (!sch->Speaking || CharacterKnowsLanguage(ch, sch->Speaking, sch)))
            {
                teacherIsPresent = true;
                break;
            }
        }

        if(!teacherIsPresent)
        {
            ch->Echo("There is no one who can teach that language here.\r\n");
            return;
        }

        if(ch->Gold < 25)
        {
            ch->Echo("Language lessons cost 25 credits... you don't have enough.\r\n");
            return;
        }

        ch->Gold -= 25;
        /* Max 12% (5 + 4 + 3) at 24+ int and 21+ wis. -- Altrag */
        prct = 5 + (GetCurrentIntelligence(ch) / 6) + (GetCurrentWisdom(ch) / 7);
        ch->PCData->Learned[sn] += prct;
        ch->PCData->Learned[sn] = umin(GetSkillLevel(ch, sn), 99);
        SetBit(ch->Speaks, LanguageArray[lang]);

        if(GetSkillLevel(ch, sn) == prct)
            Act(AT_PLAIN, "You begin lessons in $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
        else if(GetSkillLevel(ch, sn) < 60)
            Act(AT_PLAIN, "You continue lessons in $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
        else if(GetSkillLevel(ch, sn) < 60 + prct)
            Act(AT_PLAIN, "You feel you can start communicating in $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
        else if(GetSkillLevel(ch, sn) < 99)
            Act(AT_PLAIN, "You become more fluent in $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
        else
            Act(AT_PLAIN, "You now speak perfect $t.", ch,
                ActArg(LanguageNames[lang]), nullptr, ActTarget::Char);
        return;
    }

    for(lang = 0; LanguageArray[lang] != LANG_UNKNOWN; lang++)
    {
        if(!IsValidLanguage(LanguageArray[lang]))
            continue;

        if(ch->Speaking & LanguageArray[lang] || (IsNpc(ch) && !ch->Speaking))
            SetCharacterColor(AT_RED, ch);
        else
            SetCharacterColor(AT_SAY, ch);

        if((sn = LookupSkill(LanguageNames[lang])) < 0)
            ch->Echo("(  0) ");
        else
            ch->Echo("(%3d) ", GetSkillLevel(ch, sn));

        ch->Echo("%s\r\n", LanguageNames[lang]);
    }

    ch->Echo("\r\n");
}
