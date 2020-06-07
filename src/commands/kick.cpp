#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_kick( Character *ch, std::string argument )
{
    Character *victim = NULL;

    if ( IsNpc(ch) && IsAffectedBy( ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
        ch->Echo("You aren't fighting anyone.\r\n");
        return;
    }

    if (victim->Flags.test(Flag::Plr::Afk))
    {
        Log->Info("%s just attacked %s with an afk flag on!"
                  , ch->Name.c_str(), victim->Name.c_str() );
    }

    SetWaitState( ch, SkillTable[gsn_kick]->Beats );

    if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_kick] )
    {
        LearnFromSuccess( ch, gsn_kick );
        global_retcode = InflictDamage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel(ch, COMBAT_ABILITY ) ), gsn_kick );
    }
    else
    {
        LearnFromFailure( ch, gsn_kick );
        global_retcode = InflictDamage( ch, victim, 0, gsn_kick );
    }
}
