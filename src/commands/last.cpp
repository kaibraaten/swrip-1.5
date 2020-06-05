#include <string.h>
#include <ctype.h>
#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "repos/playerrepository.hpp"

/*
 * Based on last time modified, show when a player was last on  -Thoric
 */
void do_last( Character *ch, std::string arg )
{
    if ( arg.empty() )
    {
        ch->Echo("Usage: last <playername>\r\n");
        return;
    }

    auto name = Capitalize(arg);
    
    if(PlayerCharacters->Exists(name))
    {
        time_t last = PlayerCharacters->LastOnline(name);
        ch->Echo("%s was last on: %s\r", name.c_str(), ctime(&last));
    }
    else
    {
        ch->Echo("%s was not found.\r\n", name.c_str());
    }
}
