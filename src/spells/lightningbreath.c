#include "character.h"
#include "mud.h"

ch_ret spell_lightning_breath( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  int hpch;

  hpch = UMAX( 10, ch->hit );
  dam = number_range( hpch/16+1, hpch/8 );
  if ( saves_breath( level, victim ) )
    dam /= 2;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
