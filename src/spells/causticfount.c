#include "character.h"
#include "mud.h"

ch_ret spell_caustic_fount( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level       = UMAX(0, level);
  level       = UMIN(42, level);
  dam         = 2*level*number_range( 1, 6 )-31;
  dam         = UMAX(0,dam);

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_spell_staff( level, victim ) )
    dam = dam*3/4;
  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "A fountain of caustic liquid forms below $N.  The smell of $S degenerating tissues is revolting! "
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
