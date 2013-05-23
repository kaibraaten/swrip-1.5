#include "character.h"
#include "mud.h"

void do_mount( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;

  if ( !is_npc(ch)
       &&   ch->pcdata->learned[gsn_mount] <= 0  )
    {
      send_to_char(
                   "I don't think that would be a good idea...\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You're already mounted!\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, argument ) ) == NULL )
    {
      send_to_char( "You can't find that here.\r\n", ch );
      return;
    }

  if ( !is_npc(victim) || !IS_SET(victim->act, ACT_MOUNTABLE ) )
    {
      send_to_char( "You can't mount that!\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, ACT_MOUNTED ) )
    {
      send_to_char( "That mount already has a rider.\r\n", ch );
      return;
    }

  if ( victim->position < POS_STANDING )
    {
      send_to_char( "Your mount must be standing.\r\n", ch );
      return;
    }

  if ( victim->position == POS_FIGHTING || victim->fighting )
    {
      send_to_char( "Your mount is moving around too much.\r\n", ch );
      return;
    }

  WAIT_STATE( ch, skill_table[gsn_mount]->beats );
  if ( is_npc(ch) || number_percent( ) < ch->pcdata->learned[gsn_mount] )
    {
      SET_BIT( victim->act, ACT_MOUNTED );
      ch->mount = victim;
      act( AT_SKILL, "You mount $N.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n skillfully mounts $N.", ch, NULL, victim, TO_NOTVICT );
      act( AT_SKILL, "$n mounts you.", ch, NULL, victim, TO_VICT );
      learn_from_success( ch, gsn_mount );
      ch->position = POS_MOUNTED;
    }
  else
    {
      act( AT_SKILL, "You unsuccessfully try to mount $N.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n unsuccessfully attempts to mount $N.", ch, NULL, victim, TO_NOTVICT );
      act( AT_SKILL, "$n tries to mount you.", ch, NULL, victim, TO_VICT );
      learn_from_failure( ch, gsn_mount );
    }
}
