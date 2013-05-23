#include "mud.h"
#include "character.h"

ch_ret spell_sulfurous_spray( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level       = UMAX(0, level);
  level       = UMIN(19, level);
  dam         = 2*level*number_range( 1, 7 )+11;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_spell_staff( level, victim ) )
    dam /= 4;
  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "A stinking spray of sulfurous liquid rains down on $N.",
       ch, NULL, victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
