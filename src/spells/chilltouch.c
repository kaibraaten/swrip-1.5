#include "character.h"
#include "mud.h"

ch_ret spell_chill_touch( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  static const short dam_each[] =
    {
      3,
      4,  5,  6,  7,  8,         9, 12, 13, 13, 13,
      14, 14, 14, 15, 15,       15, 16, 16, 16, 17,
      17, 17, 18, 18, 18,       19, 19, 19, 20, 20,
      20, 21, 21, 21, 22,       22, 22, 23, 23, 23,
      24, 24, 24, 25, 25, 25, 26, 26, 26, 27,
      27, 28, 28, 29, 29, 30, 30, 31, 31, 32,
      32, 33, 34, 34, 35, 35, 36, 37, 37, 38
    };
  AFFECT_DATA af;
  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  level = UMIN(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = UMAX(0, level);
  dam           = number_range( dam_each[level] / 2, dam_each[level] * 2 );

  if ( !saves_spell_staff( level, victim ) )
    {
      af.type      = sn;
      af.duration  = 14;
      af.location  = APPLY_STR;
      af.modifier  = -1;
      af.bitvector = 0;
      affect_join( victim, &af );
    }
  else
    {
      dam /= 2;
    }

  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
