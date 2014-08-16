#include "character.h"
#include "mud.h"

ch_ret spell_lightning_bolt( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  static const short dam_each[] =
    {
      1,
      2,   4,   6,   8,  10,     12,  14,  16,  18,  20,
      22,  24,  26,  28,  30,    35,  40,  45,  50,  55,
      60,  65,  70,  75,  80,    82,  84,  86,  88,  90,
      92,  94,  96,  98, 100,   102, 104, 106, 108, 110,
      112, 114, 116, 118, 120,    122, 124, 126, 128, 130,
      132, 134, 136, 138, 140,    142, 144, 146, 148, 150,
      152, 154, 156, 158, 160,    162, 164, 166, 168, 170
    };

  int dam;

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  level = umin(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = umax(0, level);
  dam           = number_range( dam_each[level] / 2, dam_each[level] * 2 );
  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( IsAffectedBy(victim, AFF_PROTECT) && is_evil(ch) )
    dam -= (int) (dam / 4);
  return damage( ch, victim, dam, sn );
}
