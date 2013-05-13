#include "mud.h"

ch_ret spell_lightning_breath( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;
  int hpch;

  hpch = UMAX( 10, ch->hit );
  dam = number_range( hpch/16+1, hpch/8 );
  if ( saves_breath( level, victim ) )
    dam /= 2;
  if ( IS_AFFECTED(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
