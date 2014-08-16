#include "character.h"
#include "mud.h"

void do_gouge( Character *ch, char *argument )
{
  Character *victim;
  Affect af;
  short dam;
  int percent;

  if ( IsNpc(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch) && !ch->pcdata->learned[gsn_gouge] )
    {
      send_to_char("You do not yet know of this skill.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  percent = number_percent( ) - (GetCurrentLuck(ch) - 13);

  if ( IsNpc(ch) || percent < ch->pcdata->learned[gsn_gouge] )
    {
      dam = number_range( 1, get_level( ch, COMBAT_ABILITY ) );
      global_retcode = damage( ch, victim, dam, gsn_gouge );

      if ( global_retcode == rNONE )
        {
          if ( !is_affected_by( victim, AFF_BLIND ) )
            {
              af.type      = gsn_blindness;
              af.location  = APPLY_HITROLL;
              af.modifier  = -6;
              af.duration  = 3 + (get_level(ch, COMBAT_ABILITY ) / 20);
              af.bitvector = AFF_BLIND;
              affect_to_char( victim, &af );
              act( AT_SKILL, "You can't see a thing!", victim, NULL, NULL, TO_CHAR );
            }
          set_wait_state( ch,     PULSE_VIOLENCE );
          set_wait_state( victim, PULSE_VIOLENCE );
          /* Taken out by request - put back in by Thoric
           * This is how it was designed.  You'd be a tad stunned
           * if someone gouged you in the eye.
           */
        }
      else
        if ( global_retcode == rVICT_DIED )
          {
            act( AT_BLOOD, "Your fingers plunge into your victim's brain, causing immediate death!",
                 ch, NULL, NULL, TO_CHAR );
          }
      if ( global_retcode != rCHAR_DIED && global_retcode != rBOTH_DIED )
        learn_from_success( ch, gsn_gouge );
    }
  else
    {
      set_wait_state( ch, skill_table[gsn_gouge]->beats );
      global_retcode = damage( ch, victim, 0, gsn_gouge );
      learn_from_failure( ch, gsn_gouge );
    }
}
