#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_afk(std::shared_ptr<Character> ch, std::string argument)
{
    if(IsNpc(ch))
        return;

    ch->Flags.flip(Flag::Plr::Afk);

    if(!ch->Flags.test(Flag::Plr::Afk))
    {
        ch->Echo("You are no longer afk.\r\n");
        Act(AT_GREY, "$n is no longer afk.", ch, NULL, NULL, ActTarget::Room);
    }
    else
    {
        ch->Echo("You are now afk.\r\n");
        Act(AT_GREY, "$n is now afk.", ch, NULL, NULL, ActTarget::Room);
    }
}
