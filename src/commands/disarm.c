#include "mud.h"
#include "character.h"

void do_disarm( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  OBJ_DATA *obj;
  int percent;

  if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !is_npc(ch)
       &&   ch->pcdata->learned[gsn_disarm] <= 0  )
    {
      send_to_char( "You don't know how to disarm opponents.\r\n", ch );
      return;
    }

  if ( get_eq_char( ch, WEAR_WIELD ) == NULL )
    {
      send_to_char( "You must wield a weapon to disarm.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ( obj = get_eq_char( victim, WEAR_WIELD ) ) == NULL )
    {
      send_to_char( "Your opponent is not wielding a weapon.\r\n", ch );
      return;
    }

  WAIT_STATE( ch, skill_table[gsn_disarm]->beats );
  percent = number_percent() + get_level( victim, COMBAT_ABILITY )
    - get_level( ch, COMBAT_ABILITY )
    - (get_curr_lck(ch) - 15) + (get_curr_lck(victim) - 15);

  if ( !can_see_obj( ch, obj ) )
    percent += 10;

  if ( is_npc(ch) || percent < ch->pcdata->learned[gsn_disarm] * 2 / 3 )
    disarm( ch, victim );
  else
    {
      send_to_char( "You failed.\r\n", ch );
      learn_from_failure( ch, gsn_disarm );
    }
}
