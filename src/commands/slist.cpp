#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_slist(std::shared_ptr<Character> ch, std::string argument)
{
    char skn[MAX_INPUT_LENGTH];
    char skn2[MAX_INPUT_LENGTH / 2];
    int lowlev = 1, hilev = MAX_ABILITY_LEVEL;
    int col = 0;
    auto filter_ability = GetAbility(argument);

    if(IsNpc(ch))
    {
        return;
    }

    SetCharacterColor(AT_CYAN, ch);
    ch->Echo("SKILL LIST\r\n");
    ch->Echo("------------------\r\n");

    for(int a = (int)AbilityClass::None; a < (int)AbilityClass::Max; ++a)
    {
        auto ability = AbilityClass(a);
        
        if(ability == AbilityClass::Force && !IsImmortal(ch))
        {
            continue;
        }

        if(ability == AbilityClass::Commando)
        {
            continue;
        }

        if(filter_ability != AbilityClass::None && filter_ability != ability)
        {
            continue;
        }

        if(ability != AbilityClass::None)
        {
            sprintf(skn2, "** %s **", Capitalize(AbilityName[(int)ability]).c_str());
            sprintf(skn, "\r\n\t\t\t  %s \r\n", skn2);
        }
        else
        {
            sprintf(skn, "\r\n\t\t\t** General Skills **\r\n");
        }

        SetCharacterColor(AT_CYAN, ch);
        ch->Echo("%s", skn);

        for(int i = lowlev; i <= hilev; i++)
        {
            for(int sn = 0; sn < TopSN; sn++)
            {
                std::shared_ptr<Skill> skill = SkillTable[sn];

                if(skill->Name.empty())
                {
                    break;
                }

                if(skill->Class != ability)
                {
                    continue;
                }

                if(GetSkillLevel(ch, sn) == 0
                   && SPELL_FLAG(skill, SF_SECRETSKILL))
                {
                    continue;
                }

                if(i == skill->Level)
                {
                    SetCharacterColor(AT_LBLUE, ch);
                    ch->Echo("(%3d) %-18.18s  ",
                             i, Capitalize(skill->Name).c_str());

                    if(++col == 3)
                    {
                        ch->Echo("\r\n");
                        col = 0;
                    }
                }
            }
        }

        if(col != 0)
        {
            ch->Echo("\r\n");
            col = 0;
        }
    }
}
