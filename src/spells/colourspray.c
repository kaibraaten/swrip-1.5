#include "character.h"
#include "mud.h"

ch_ret spell_colour_spray( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  static const short dam_each[] =
    {
      3,
      4,  5,  6,  7,  8,         9, 10, 15, 20, 25,
      30, 35, 40, 45, 50,       55, 55, 55, 56, 57,
      58, 58, 59, 60, 61,       61, 62, 63, 64, 64,
      65, 66, 67, 67, 68,       69, 70, 70, 71, 72,
      73, 73, 74, 75, 76, 76, 77, 78, 79, 79,
      80, 80, 81, 82, 82, 83, 83, 84, 85, 85,
      86, 86, 87, 88, 88, 89, 89, 90, 91, 91
    };
  int dam;

  level = UMIN(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = UMAX(0, level);
  dam           = number_range( dam_each[level] / 2,  dam_each[level] * 2 );

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( is_affected_by(victim, AFF_PROTECT) && IS_EVIL(ch) )
    dam -= (int) (dam / 4);

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  return damage( ch, victim, dam, sn );
}
