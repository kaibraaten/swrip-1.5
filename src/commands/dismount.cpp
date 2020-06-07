#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_dismount( Character *ch, std::string argument )
{
    Character *victim = ch->Mount;

    if (victim == nullptr)
    {
        ch->Echo( "You're not mounted.\r\n" );
        return;
    }

    SetWaitState( ch, SkillTable[gsn_mount]->Beats );

    if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_mount] )
    {
        Act( AT_SKILL, "You dismount $N.", ch, NULL, victim, TO_CHAR );
        Act( AT_SKILL, "$n skillfully dismounts $N.", ch, NULL, victim, TO_NOTVICT );
        Act( AT_SKILL, "$n dismounts you. Whew!", ch, NULL, victim, TO_VICT );
        victim->Flags.reset(Flag::Mob::Mounted);
        ch->Mount = nullptr;
        ch->Position = POS_STANDING;
        LearnFromSuccess( ch, gsn_mount );
    }
    else
    {
        Act( AT_SKILL, "You fall off while dismounting $N. Ouch!", ch, NULL, victim, TO_CHAR );
        Act( AT_SKILL, "$n falls off of $N while dismounting.", ch, NULL, victim, TO_NOTVICT );
        Act( AT_SKILL, "$n falls off your back.", ch, NULL, victim, TO_VICT );
        LearnFromFailure( ch, gsn_mount );
        victim->Flags.reset(Flag::Mob::Mounted);
        ch->Mount = nullptr;
        ch->Position = POS_SITTING;
        global_retcode = InflictDamage( ch, ch, 1, TYPE_UNDEFINED );
    }
}
