#include "character.h"
#include "mud.h"

ch_ret spell_disruption( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  level = UMAX(0, level);
  level = UMIN(14, level);
  dam           = level*number_range( 1, 6 )+8;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);

  if ( saves_spell_staff( level, victim ) )
    dam = 0;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  act( AT_MAGIC, "A weird energy encompasses $N, causing you to question $S continued existence."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
