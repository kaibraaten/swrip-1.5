#include "mud.hpp"
#include "character.hpp"
#include "act.hpp"

void do_follow(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Follow whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsAffectedBy(ch, Flag::Affect::Charm) && ch->Master)
    {
        Act(AT_PLAIN, "But you'd rather follow $N!", ch, NULL, ch->Master, ActTarget::Char);
        return;
    }

    if(victim == ch)
    {
        if(!ch->Master)
        {
            ch->Echo("You already follow yourself.\r\n");
            return;
        }

        StopFollowing(ch);
        return;
    }

    if(IsFollowingInCircle(ch, victim))
    {
        ch->Echo("Following in loops is not allowed... sorry.\r\n");
        return;
    }

    if(ch->Master)
        StopFollowing(ch);

    StartFollowing(ch, victim);
}

