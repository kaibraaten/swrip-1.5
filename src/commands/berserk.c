#include "mud.h"
#include "character.h"

void do_berserk( Character *ch, char *argument )
{
  short percent;
  Affect af;

  if ( !ch->fighting )
    {
      send_to_char( "But you aren't fighting!\r\n", ch );
      return;
    }

  if ( is_affected_by(ch, AFF_BERSERK) )
    {
      send_to_char( "Your rage is already at its peak!\r\n", ch );
      return;
    }

  percent = IsNpc(ch) ? 80 : ch->pcdata->learned[gsn_berserk];
  set_wait_state(ch, skill_table[gsn_berserk]->beats);
  if ( !chance(ch, percent) )
    {
      send_to_char( "You couldn't build up enough rage.\r\n", ch);
      learn_from_failure(ch, gsn_berserk);
      return;
    }
  af.type = gsn_berserk;
  /* Hmmm.. 10-20 combat rounds at level 50.. good enough for most mobs,
     and if not they can always go berserk again.. shrug.. maybe even
     too high. -- Altrag */
  af.duration = number_range(ch->top_level/5, ch->top_level*2/5);
  /* Hmm.. you get stronger when yer really enraged.. mind over matter
     type thing.. */
  af.location = APPLY_STR;
  af.modifier = 1;
  af.bitvector = AFF_BERSERK;
  affect_to_char(ch, &af);
  send_to_char( "You start to lose control..\r\n", ch );
  learn_from_success(ch, gsn_berserk);
}
