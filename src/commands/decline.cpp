#include "mud.hpp"
#include "arena.hpp"
#include "character.hpp"

void do_decline(std::shared_ptr<Character> ch, std::string argument)
{
    if(!ch->Challenged.expired())
    {
        auto challenged = ch->Challenged.lock();
        char buf[MAX_INPUT_LENGTH];
        sprintf(buf, "%s has DECLINED %s's challenge! WHAT A WUSS!!!\r\n",
                ch->Name.c_str(), challenged->Name.c_str());
        ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
        ch->Challenged.reset();
    }
    else
    {
        ch->Echo("You have not been challenged!\r\n");
    }
}

