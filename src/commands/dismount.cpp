#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_dismount(std::shared_ptr<Character> ch, std::string argument)
{
    Character *victim = ch->Mount;

    if(victim == nullptr)
    {
        ch->Echo("You're not mounted.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_mount]->Beats);

    if(IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_mount])
    {
        Act(AT_SKILL, "You dismount $N.", ch, NULL, victim, ActTarget::Char);
        Act(AT_SKILL, "$n skillfully dismounts $N.", ch, NULL, victim, ActTarget::NotVict);
        Act(AT_SKILL, "$n dismounts you. Whew!", ch, NULL, victim, ActTarget::Vict);
        victim->Flags.reset(Flag::Mob::Mounted);
        ch->Mount = nullptr;
        ch->Position = POS_STANDING;
        LearnFromSuccess(ch, gsn_mount);
    }
    else
    {
        Act(AT_SKILL, "You fall off while dismounting $N. Ouch!", ch, NULL, victim, ActTarget::Char);
        Act(AT_SKILL, "$n falls off of $N while dismounting.", ch, NULL, victim, ActTarget::NotVict);
        Act(AT_SKILL, "$n falls off your back.", ch, NULL, victim, ActTarget::Vict);
        LearnFromFailure(ch, gsn_mount);
        victim->Flags.reset(Flag::Mob::Mounted);
        ch->Mount = nullptr;
        ch->Position = POS_SITTING;
        global_retcode = InflictDamage(ch, ch, 1, TYPE_UNDEFINED);
    }
}
