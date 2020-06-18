#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

void do_murder(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Murder whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Suicide is a mortal sin.\r\n");
        return;
    }

    if(victim->Flags.test(Flag::Plr::Afk))
    {
        Log->Info("%s just attacked %s with an afk flag on!",
                  ch->Name.c_str(), victim->Name.c_str());
    }

    if(IsSafe(ch, victim))
        return;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
    {
        if(ch->Master == victim)
        {
            Act(AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, ActTarget::Char);
            return;
        }
    }

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("You do the best you can!\r\n");
        return;
    }

    if(!IsNpc(victim) && ch->Flags.test(Flag::Plr::Nice))
    {
        ch->Echo("You feel too nice to do that!\r\n");
        return;
    }

    if(!IsDroid(victim))
        ch->Alignment -= 10;

    SetWaitState(ch, 1 * PULSE_VIOLENCE);
    HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
}
