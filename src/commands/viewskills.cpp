#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_viewskills(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("&zSyntax: skills <player>\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("No such person in the game.\r\n");
        return;
    }

    if(!IsNpc(victim))
    {
        int col = 0;
        SetCharacterColor(AT_MAGIC, ch);

        for(int sn = 0; sn < TopSN && SkillTable[sn] && !SkillTable[sn]->Name.empty(); sn++)
        {
            if(SkillTable[sn]->Name.empty())
                break;

            if(GetSkillLevel(victim, sn) == 0)
                continue;

            ch->Echo("%20s %3d%% ", SkillTable[sn]->Name.c_str(),
                     GetSkillLevel(victim, sn));

            if(++col % 3 == 0)
                ch->Echo("\r\n");
        }
    }
}
