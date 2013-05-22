#include "character.h"
#include "mud.h"

void do_gouge( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  AFFECT_DATA af;
  short dam;
  int percent;

  if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IS_NPC(ch) && !ch->pcdata->learned[gsn_gouge] )
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

  percent = number_percent( ) - (get_curr_lck(ch) - 13);

  if ( IS_NPC(ch) || percent < ch->pcdata->learned[gsn_gouge] )
    {
      dam = number_range( 1, get_level( ch, COMBAT_ABILITY ) );
      global_retcode = damage( ch, victim, dam, gsn_gouge );

      if ( global_retcode == rNONE )
        {
          if ( !IS_AFFECTED( victim, AFF_BLIND ) )
            {
              af.type      = gsn_blindness;
              af.location  = APPLY_HITROLL;
              af.modifier  = -6;
              af.duration  = 3 + (get_level(ch, COMBAT_ABILITY ) / 20);
              af.bitvector = AFF_BLIND;
              affect_to_char( victim, &af );
              act( AT_SKILL, "You can't see a thing!", victim, NULL, NULL, TO_CHAR );
            }
          WAIT_STATE( ch,     PULSE_VIOLENCE );
          WAIT_STATE( victim, PULSE_VIOLENCE );
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
      WAIT_STATE( ch, skill_table[gsn_gouge]->beats );
      global_retcode = damage( ch, victim, 0, gsn_gouge );
      learn_from_failure( ch, gsn_gouge );
    }
}
