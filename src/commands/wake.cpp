#include "mud.hpp"
#include "character.hpp"
#include "act.hpp"

void do_wake(Character *ch, std::string arg)
{
    Character *victim = NULL;

    if(arg.empty())
    {
        do_stand(ch, arg);
        return;
    }

    if(!IsAwake(ch))
    {
        ch->Echo("You are asleep yourself!\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsAwake(victim))
    {
        Act(AT_PLAIN, "$N is already awake.", ch, NULL, victim, TO_CHAR);
        return;
    }

    if(IsAffectedBy(victim, Flag::Affect::Sleep) || victim->Position < POS_SLEEPING)
    {
        Act(AT_PLAIN, "You can't seem to wake $M!",
            ch, NULL, victim, TO_CHAR);
        return;
    }

    Act(AT_ACTION, "You wake $M.", ch, NULL, victim, TO_CHAR);
    victim->Position = POS_STANDING;
    Act(AT_ACTION, "$n wakes you.", ch, NULL, victim, TO_VICT);
}
