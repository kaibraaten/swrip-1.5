#include "character.hpp"
#include "mud.hpp"

void do_level( std::shared_ptr<Character> ch, std::string argument )
{
    for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
    {
        if(AbilityClass(ability) == AbilityClass::Commando)
        {
            continue;
        }
        else if(AbilityClass(ability) != AbilityClass::Force || IsJedi(ch))
        {
            char maxbuf[MAX_STRING_LENGTH] = {'\0'};

            if(AbilityClass(ability) == AbilityClass::Force)
            {
                sprintf(maxbuf, "%s", "???");
            }
            else
            {
                sprintf(maxbuf, "%d", GetMaxAbilityLevel(ch, AbilityClass(ability)));
            }

            ch->Echo("%-15s   Level: %-3d   Max: %-3s   Exp: %-10ld   Next: %-10ld\r\n",
                     Capitalize(AbilityName[ability]).c_str(),
                     GetAbilityLevel(ch, AbilityClass(ability)), maxbuf,
                     GetAbilityXP(ch, AbilityClass(ability)),
                     GetRequiredXpForLevel(GetAbilityLevel( ch, AbilityClass(ability)) + 1 ) );
        }
        else
        {
            ch->Echo("%-15s   Level: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
                     Capitalize(AbilityName[ability]).c_str(),
                     GetAbilityLevel(ch, AbilityClass(ability)));
        }
    }
}
