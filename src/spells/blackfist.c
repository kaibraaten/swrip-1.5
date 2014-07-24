#include "character.h"
#include "mud.h"

ch_ret spell_black_fist( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  level       = UMAX(0, level);
  dam         = level*number_range( 1, 9 )+4;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_poison_death( level, victim ) )
    dam /= 4;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "$n forms a fist with the force, which swoops menacingly at $N."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
