#include <cstring>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "repos/shiprepository.hpp"
#include "repos/playerrepository.hpp"

void do_shutdown(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };

    if(StrCmp(argument, "mud now") && StrCmp(argument, "nosave"))
    {
        ch->Echo("Syntax: 'shutdown mud now' or 'shutdown nosave'\r\n");
        return;
    }

    if(!OngoingAuction->Item.expired())
        do_auction(ch, "stop");

    sprintf(buf, "Shutdown by %s.", ch->Name.c_str());
    AppendFile(ch, SHUTDOWN_FILE, buf);
    strcat(buf, "\r\n");
    do_echo(ch, buf);

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

        Ships->Save();
    }

    mud_down = true;
}
