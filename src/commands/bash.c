#include "character.h"
#include "mud.h"

void do_bash( Character *ch, char *argument )
{
  Character *victim;
  int bash_chance;

  if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !is_npc(ch)
       &&  ch->pcdata->learned[gsn_bash] <= 0  )
    {
      send_to_char(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  bash_chance = (((get_curr_dex(victim) + get_curr_str(victim))
		  -   (get_curr_dex(ch)     + get_curr_str(ch))) * 10) + 10;
  if ( !is_npc(ch) && !is_npc(victim) )
    bash_chance += 25;

  if ( victim->fighting && victim->fighting->who != ch )
    bash_chance += 19;

  set_wait_state( ch, skill_table[gsn_bash]->beats );

  if ( is_npc(ch)
       || (number_percent( ) + bash_chance) < ch->pcdata->learned[gsn_bash] )
    {
      learn_from_success( ch, gsn_bash );
      /* do not change anything here!  -Thoric */
      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      set_wait_state( victim, 2 * PULSE_VIOLENCE );
      victim->position = POS_SITTING;
      global_retcode = damage( ch, victim, number_range( 1, get_level( ch, COMBAT_ABILITY ) ), gsn_bash );
    }
  else
    {
      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      learn_from_failure( ch, gsn_bash );
      global_retcode = damage( ch, victim, 0, gsn_bash );
    }
}
