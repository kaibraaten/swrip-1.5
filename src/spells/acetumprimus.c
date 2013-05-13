#include "mud.h"

ch_ret spell_acetum_primus( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level       = UMAX(0, level);
  dam         = 2*level*number_range( 1, 4 )+7;

  if ( saves_spell_staff( level, victim ) )
    dam = 3*dam/4;
  act( AT_MAGIC, "A cloak of primal acid enshrouds $N, sparks form as it consumes all it touches. "
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
