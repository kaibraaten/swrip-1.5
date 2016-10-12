#include "character.h"
#include "mud.h"
#include "skill.h"

void do_bash( Character *ch, char *argument )
{
  Character *victim;
  int bash_chance;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&  ch->PCData->learned[gsn_bash] <= 0  )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  bash_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
		  -   (GetCurrentDexterity(ch)     + GetCurrentStrength(ch))) * 10) + 10;
  if ( !IsNpc(ch) && !IsNpc(victim) )
    bash_chance += 25;

  if ( victim->Fighting && victim->Fighting->who != ch )
    bash_chance += 19;

  SetWaitState( ch, SkillTable[gsn_bash]->Beats );

  if ( IsNpc(ch)
       || (GetRandomPercent() + bash_chance) < ch->PCData->learned[gsn_bash] )
    {
      LearnFromSuccess( ch, gsn_bash );
      /* do not change anything here!  -Thoric */
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, 2 * PULSE_VIOLENCE );
      victim->Position = POS_SITTING;
      global_retcode = InflictDamage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel( ch, COMBAT_ABILITY ) ), gsn_bash );
    }
  else
    {
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      LearnFromFailure( ch, gsn_bash );
      global_retcode = InflictDamage( ch, victim, 0, gsn_bash );
    }
}
