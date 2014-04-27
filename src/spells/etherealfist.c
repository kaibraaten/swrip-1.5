#include "character.h"
#include "mud.h"

ch_ret spell_ethereal_fist( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level       = UMAX(0, level);
  level       = UMIN(35, level);
  dam         = level*number_range( 1, 6 )-31;
  dam         = UMAX(0,dam);

  if ( saves_spell_staff( level, victim ) )
    dam = 0;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  act( AT_MAGIC, "A fist of black, otherworldly ether rams into $N, leaving $M looking stunned!"
       , ch, NULL,
       victim, TO_NOTVICT );
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
