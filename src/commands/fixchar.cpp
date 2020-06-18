#include "character.hpp"
#include "mud.hpp"

void do_fixchar(std::shared_ptr<Character> ch, std::string argument)
{
    std::string name;
    std::shared_ptr<Character> victim;

    OneArgument(argument, name);

    if(name.empty())
    {
        ch->Echo("Usage: fixchar <playername>\r\n");
        return;
    }

    victim = GetCharacterInRoom(ch, name);

    if(!victim)
    {
        ch->Echo("They're not here.\r\n");
        return;
    }

    FixCharacterStats(victim);
    ch->Echo("Done.\r\n");
}
