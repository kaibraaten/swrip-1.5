#include "character.h"
#include "mud.h"

ch_ret spell_quantum_spike( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam,l;

  level       = UMAX(0, level);
  l             = UMAX(1,level-90);
  dam         = l*number_range( 1,40)+145;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "$N seems to dissolve into tiny unconnected particles, then is painfully reassembled."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
