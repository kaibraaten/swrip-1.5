#include "character.h"
#include "mud.h"

void do_gouge( Character *ch, char *argument )
{
  Character *victim;
  Affect af;
  short dam;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch) && !ch->pcdata->learned[gsn_gouge] )
    {
      SendToCharacter("You do not yet know of this skill.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      SendToCharacter( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  percent = GetRandomPercent( ) - (GetCurrentLuck(ch) - 13);

  if ( IsNpc(ch) || percent < ch->pcdata->learned[gsn_gouge] )
    {
      dam = GetRandomNumberFromRange( 1, GetAbilityLevel( ch, COMBAT_ABILITY ) );
      global_retcode = InflictDamage( ch, victim, dam, gsn_gouge );

      if ( global_retcode == rNONE )
        {
          if ( !IsAffectedBy( victim, AFF_BLIND ) )
            {
              af.type      = gsn_blindness;
              af.location  = APPLY_HITROLL;
              af.modifier  = -6;
              af.duration  = 3 + (GetAbilityLevel(ch, COMBAT_ABILITY ) / 20);
              af.bitvector = AFF_BLIND;
              AffectToCharacter( victim, &af );
              Act( AT_SKILL, "You can't see a thing!", victim, NULL, NULL, TO_CHAR );
            }
          SetWaitState( ch,     PULSE_VIOLENCE );
          SetWaitState( victim, PULSE_VIOLENCE );
          /* Taken out by request - put back in by Thoric
           * This is how it was designed.  You'd be a tad stunned
           * if someone gouged you in the eye.
           */
        }
      else
        if ( global_retcode == rVICT_DIED )
          {
            Act( AT_BLOOD, "Your fingers plunge into your victim's brain, causing immediate death!",
                 ch, NULL, NULL, TO_CHAR );
          }
      if ( global_retcode != rCHAR_DIED && global_retcode != rBOTH_DIED )
        LearnFromSuccess( ch, gsn_gouge );
    }
  else
    {
      SetWaitState( ch, skill_table[gsn_gouge]->beats );
      global_retcode = InflictDamage( ch, victim, 0, gsn_gouge );
      LearnFromFailure( ch, gsn_gouge );
    }
}
