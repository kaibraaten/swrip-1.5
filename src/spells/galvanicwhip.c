#include "character.h"
#include "mud.h"

ch_ret spell_galvanic_whip( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;

  level = UMAX(0, level);
  level = UMIN(10, level);
  dam           = level*number_range( 1, 6 )+5;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty(ch);


  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);
  act( AT_MAGIC, "$n conjures a whip of ionized particles, which lashes ferociously at $N."
       , ch, NULL,
       victim, TO_NOTVICT );
  return damage( ch, victim, dam, sn );
}