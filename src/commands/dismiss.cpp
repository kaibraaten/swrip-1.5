#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_dismiss(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Dismiss whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsAffectedBy(victim, Flag::Affect::Charm)
       && IsNpc(victim)
       && victim->Master == ch)
    {
        StopFollowing(victim);
        StopHating(victim);
        StopHunting(victim);
        StopFearing(victim);
        Act(AT_ACTION, "$n dismisses $N.", ch, NULL, victim, ActTarget::NotVict);
        Act(AT_ACTION, "You dismiss $N.", ch, NULL, victim, ActTarget::Char);
    }
    else
    {
        ch->Echo("You cannot dismiss them.\r\n");
    }
}

