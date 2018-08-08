#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_gouge( Character *ch, char *argument )
{
  Character *victim = NULL;
  Affect af;
  short dam = 0;
  int percent = 0;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo( "You can't concentrate enough for that.\r\n" );
      return;
    }

  if ( !IsNpc(ch) && !ch->PCData->Learned[gsn_gouge] )
    {
      ch->Echo("You do not yet know of this skill.\r\n" );
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo( "You can't get close enough while mounted.\r\n" );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      ch->Echo( "You aren't fighting anyone.\r\n" );
      return;
    }

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 13);

  if ( IsNpc(ch) || percent < ch->PCData->Learned[gsn_gouge] )
    {
      dam = GetRandomNumberFromRange( 1, GetAbilityLevel( ch, COMBAT_ABILITY ) );
      global_retcode = InflictDamage( ch, victim, dam, gsn_gouge );

      if ( global_retcode == rNONE )
        {
          if ( !IsAffectedBy( victim, AFF_BLIND ) )
            {
              af.Type       = gsn_blindness;
              af.Location   = APPLY_HITROLL;
              af.Modifier   = -6;
              af.Duration   = 3 + (GetAbilityLevel(ch, COMBAT_ABILITY ) / 20);
              af.AffectedBy = AFF_BLIND;
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
      else if ( global_retcode == rVICT_DIED )
	{
	  Act( AT_BLOOD, "Your fingers plunge into your victim's brain, causing immediate death!",
	       ch, NULL, NULL, TO_CHAR );
	}

      if ( global_retcode != rCHAR_DIED && global_retcode != rBOTH_DIED )
        LearnFromSuccess( ch, gsn_gouge );
    }
  else
    {
      SetWaitState( ch, SkillTable[gsn_gouge]->Beats );
      global_retcode = InflictDamage( ch, victim, 0, gsn_gouge );
      LearnFromFailure( ch, gsn_gouge );
    }
}

