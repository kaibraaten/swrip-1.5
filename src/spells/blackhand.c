#include "mud.h"
#include "character.h"

ch_ret spell_black_hand( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level = UMAX(0, level);
  level = UMIN(5, level);
  dam           = level*number_range( 1, 6 )+3;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_poison_death( level, victim ) )
    dam /= 4;
  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "$n conjures a mystical hand, which swoops menacingly at $N."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
