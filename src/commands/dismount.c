#include "character.h"
#include "mud.h"

void do_dismount( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;

  if ( (victim = ch->mount) == NULL )
    {
      send_to_char( "You're not mounted.\r\n", ch );
      return;
    }

  WAIT_STATE( ch, skill_table[gsn_mount]->beats );
  if ( is_npc(ch) || number_percent( ) < ch->pcdata->learned[gsn_mount] )
    {
      act( AT_SKILL, "You dismount $N.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n skillfully dismounts $N.", ch, NULL, victim, TO_NOTVICT );
      act( AT_SKILL, "$n dismounts you.  Whew!", ch, NULL, victim, TO_VICT );
      REMOVE_BIT( victim->act, ACT_MOUNTED );
      ch->mount = NULL;
      ch->position = POS_STANDING;
      learn_from_success( ch, gsn_mount );
    }
  else
    {
      act( AT_SKILL, "You fall off while dismounting $N.  Ouch!", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n falls off of $N while dismounting.", ch, NULL, victim, TO_NOTVICT );
      act( AT_SKILL, "$n falls off your back.", ch, NULL, victim, TO_VICT );
      learn_from_failure( ch, gsn_mount );
      REMOVE_BIT( victim->act, ACT_MOUNTED );
      ch->mount = NULL;
      ch->position = POS_SITTING;
      global_retcode = damage( ch, ch, 1, TYPE_UNDEFINED );
    }
}
