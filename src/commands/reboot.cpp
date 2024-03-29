#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "repos/shiprepository.hpp"
#include "repos/playerrepository.hpp"
#include "impscript/scriptscheduler.hpp"

void do_reboot(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];

    if(StrCmp(argument, "mud now")
       && StrCmp(argument, "nosave")
       && StrCmp(argument, "and sort skill table"))
    {
        ch->Echo("Syntax: 'reboot mud now' or 'reboot nosave'\r\n");
        return;
    }

    if(!OngoingAuction->Item.expired())
    {
        do_auction(ch, "stop");
    }

    AbortAllScripts();

    sprintf(buf, "Reboot by %s.", ch->Name.c_str());
    do_echo(ch, buf);

    if(!StrCmp(argument, "and sort skill table"))
    {
        SortSkillTable();
        SaveSkills();
    }

    /* Save all characters before booting. */
    if(StrCmp(argument, "nosave"))
    {
        for(auto vch = FirstCharacter; vch; vch = vch->Next)
        {
            if(!IsNpc(vch))
            {
                PlayerCharacters->Save(vch);
            }
        }
    }

    Ships->Save();
    mud_down = true;
}
