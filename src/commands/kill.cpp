#include "mud.hpp"
#include "character.hpp"
#include "act.hpp"

void do_kill(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Kill whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(!IsNpc(victim))
    {
        ch->Echo("You must MURDER a player.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You hit yourself. Ouch!\r\n");
        HitMultipleTimes(ch, ch, TYPE_UNDEFINED);
        return;
    }

    if(IsSafe(ch, victim))
        return;

    if(IsAffectedBy(ch, Flag::Affect::Charm) && ch->Master == victim)
    {
        Act(AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, ActTarget::Char);
        return;
    }

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("You do the best you can!\r\n");
        return;
    }

    if(victim->VipFlags != 0 && !IsDroid(victim))
        ch->Alignment -= 10;

    SetWaitState(ch, 1 * PULSE_VIOLENCE);
    HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
}


