#include "mud.h"
#include "character.h"

ch_ret spell_magic_missile( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  static const short dam_each[] =
    {
      1,
      3,  3,  4,  4,  5,         6,  6,  6,  6,  6,
      7,  7,  7,  7,  7,         8,  8,  8,  8,  8,
      9,  9,  9,  9,  9,        10, 10, 10, 10, 10,
      11, 11, 11, 11, 11,       12, 12, 12, 12, 12,
      13, 13, 13, 13, 13, 14, 14, 14, 14, 14,
      15, 15, 15, 15, 15, 16, 16, 16, 16, 16,
      17, 17, 17, 17, 17, 18, 18, 18, 18, 18
    };
  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  level = UMIN(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = UMAX(0, level);
  dam           = number_range( dam_each[level] / 2, dam_each[level] * 2 );

  return damage( ch, victim, dam, sn );
}
