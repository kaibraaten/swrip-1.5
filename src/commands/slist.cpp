#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_slist(std::shared_ptr<Character> ch, std::string argument)
{
    constexpr int lowlev = 1, hilev = MAX_ABILITY_LEVEL;
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
        const auto ability = AbilityClass(a);
        
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

        std::string skn;
        
        if(ability != AbilityClass::None)
        {
            skn = "\r\n\t\t\t  ** " + Capitalize(AbilityName[(int)ability]) + " **\r\n";
        }
        else
        {
            skn = "\r\n\t\t\t** General Skills **\r\n";
        }

        SetCharacterColor(AT_CYAN, ch);
        ch->Echo(skn);
        int col = 0;
        
        for(int i = lowlev; i <= hilev; ++i)
        {
            for(int sn = 0; sn < TopSN; ++sn)
            {
                const std::shared_ptr<Skill> skill = SkillTable[sn];

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

                    if((++col % 3) == 0)
                    {
                        ch->Echo("\r\n");
                    }
                }
            }
        }

        if(col % 3 != 0)
        {
            ch->Echo("\r\n");
        }
    }
}
