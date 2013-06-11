#include "mud.h"
#include "character.h"

void do_torture( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  int the_chance, dam;
  bool fail;

  if ( !IsNpc(ch)
       &&  ch->pcdata->learned[gsn_torture] <= 0  )
    {
      send_to_char(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( IsNpc(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't do that right now.\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( ch->mount )
    {
      send_to_char( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "Torture whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Are you masacistic or what...\r\n", ch );
      return;
    }

  if ( !is_awake(victim) )
    {
      send_to_char( "You need to wake them first.\r\n", ch );
      return;
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( victim->fighting )
    {
      send_to_char( "You can't torture someone whos in combat.\r\n", ch );
      return;
    }

  ch->alignment -= 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );

  set_wait_state( ch, skill_table[gsn_torture]->beats );

  fail = FALSE;
  the_chance = ris_save( victim, GetLevel( ch, LEADERSHIP_ABILITY ) / 10, RIS_PARALYSIS );

  if ( the_chance == 1000 )
    fail = TRUE;
  else
    fail = saves_para_petri( the_chance, victim );

  if ( !IsNpc(ch) && !IsNpc(victim) )
    the_chance = sysdata.stun_plr_vs_plr;
  else
    the_chance = sysdata.stun_regular;

  if ( !fail
       && (  IsNpc(ch)
             || (number_percent( ) + the_chance) < ch->pcdata->learned[gsn_torture] ) )
    {
      learn_from_success( ch, gsn_torture );
      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      set_wait_state( victim, PULSE_VIOLENCE );
      act( AT_SKILL, "$N slowly tortures you. The pain is excruciating.", victim, NULL, ch, TO_CHAR );
      act( AT_SKILL, "You torture $N, leaving $M screaming in pain.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n tortures $N, leaving $M screaming in agony!", ch, NULL, victim, TO_NOTVICT );

      dam = dice( GetLevel( ch, LEADERSHIP_ABILITY ) / 80 , 4 );
      dam = URANGE( 0, victim->max_hit-10, dam );
      victim->hit -= dam;
      victim->max_hit -= dam;

      ch_printf( victim, "You lose %d permanent hit points." ,dam);
      ch_printf( ch, "They lose %d permanent hit points." , dam);
    }
  else
    {
      act( AT_SKILL, "$N tries to cut off your finger!", victim, NULL, ch, TO_CHAR );
      act( AT_SKILL, "You mess up big time.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n tries to painfully torture $N.", ch, NULL, victim, TO_NOTVICT );
      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
    }
}
