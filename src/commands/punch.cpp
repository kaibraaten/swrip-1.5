#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_punch( Character *ch, std::string argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&   ch->PCData->Learned[gsn_punch] <= 0 )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {

      OneArgument( argument, arg );

      if ( IsNullOrEmpty( arg ) )
        {
          SendToCharacter( "Punch whom?\r\n", ch );
          return;
        }

      if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( !IsNpc(victim) )
        {
          SendToCharacter( "You must MURDER a player.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          SendToCharacter( "You punch yourself.  Ouch!\r\n", ch );
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
