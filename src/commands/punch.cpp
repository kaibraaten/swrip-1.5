#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_punch( Character *ch, std::string arg )
{
  Character *victim = NULL;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo("You can't concentrate enough for that.\r\n");
      return;
    }

  if ( !IsNpc(ch)
       && ch->PCData->Learned[gsn_punch] <= 0 )
    {
      ch->Echo("Your mind races as you realize you have no idea how to do that.\r\n");
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      if ( arg.empty() )
        {
          ch->Echo("Punch whom?\r\n");
          return;
        }

      if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
        {
          ch->Echo("They aren't here.\r\n");
          return;
        }

      if ( !IsNpc(victim) )
        {
          ch->Echo("You must MURDER a player.\r\n");
          return;
        }

      if ( victim == ch )
        {
          ch->Echo("You punch yourself. Ouch!\r\n");
          HitMultipleTimes( ch, ch, TYPE_UNDEFINED );
	  return;
        }

      if ( IsSafe( ch, victim ) )
        return;

      if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
        {
          Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( victim->VipFlags != 0 )
        ch->Alignment -= 10;
    }

  SetWaitState( ch, SkillTable[gsn_punch]->Beats );

  if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_punch] )
    {
      LearnFromSuccess( ch, gsn_punch );
      global_retcode = InflictDamage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel(ch, COMBAT_ABILITY ) ), gsn_punch );
    }
  else
    {
      LearnFromFailure( ch, gsn_punch );
      global_retcode = InflictDamage( ch, victim, 0, gsn_punch );
    }
}
