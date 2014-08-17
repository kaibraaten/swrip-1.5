#include "character.h"
#include "mud.h"

ch_ret spell_hand_of_chaos( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  level       = umax(0, level);
  dam         = level*GetRandomNumberFromRange( 1, 7 )+9;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  if ( saves_spell_staff( level, victim ) )
    dam = 0;

  act( AT_MAGIC, "$N is grasped by an incomprehensible hand of darkness!"
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}
