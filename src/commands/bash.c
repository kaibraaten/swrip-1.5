#include "character.h"
#include "mud.h"

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
       &&  ch->pcdata->learned[gsn_bash] <= 0  )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  bash_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
		  -   (GetCurrentDexterity(ch)     + GetCurrentStrength(ch))) * 10) + 10;
  if ( !IsNpc(ch) && !IsNpc(victim) )
    bash_chance += 25;

  if ( victim->fighting && victim->fighting->who != ch )
    bash_chance += 19;

  SetWaitState( ch, skill_table[gsn_bash]->beats );

  if ( IsNpc(ch)
       || (GetRandomPercent( ) + bash_chance) < ch->pcdata->learned[gsn_bash] )
    {
      learn_from_success( ch, gsn_bash );
      /* do not change anything here!  -Thoric */
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, 2 * PULSE_VIOLENCE );
      victim->position = POS_SITTING;
      global_retcode = damage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel( ch, COMBAT_ABILITY ) ), gsn_bash );
    }
  else
    {
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      learn_from_failure( ch, gsn_bash );
      global_retcode = damage( ch, victim, 0, gsn_bash );
    }
}
