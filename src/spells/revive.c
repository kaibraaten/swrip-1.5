#include "mud.h"

ch_ret spell_revive( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  /* set mentalstate to mentalstate/2 */
  level = UMAX(0, level);
  dam           = number_range( 0, 0 );
  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  act( AT_MAGIC, "$n concentrates intently, and begins looking more centered."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
