#include "mud.h"

ch_ret spell_mind_wrack( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  /* decrement mentalstate by up to 50 */

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  level = UMAX(0, level);
  dam           = number_range( 0, 0 );
  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( IS_AFFECTED(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  act( AT_MAGIC, "$n stares intently at $N, causing $N to seem very lethargic."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
