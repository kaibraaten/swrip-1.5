#include "character.h"
#include "mud.h"

ch_ret spell_shocking_grasp( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  static const int dam_each[] =
    {
      1,
      2,  4,  6,  8, 10,        15, 20, 25, 29, 33,
      36, 39, 39, 39, 40,       40, 41, 41, 42, 42,
      43, 43, 44, 44, 45,       45, 46, 46, 47, 47,
      48, 48, 49, 49, 50,       50, 51, 51, 52, 52,
      53, 53, 54, 54, 55, 55, 56, 56, 57, 57,
      58, 58, 59, 59, 60, 60, 61, 61, 62, 62,
      63, 63, 64, 64, 65, 65, 66, 66, 67, 67
    };
  int dam;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  level = umin(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = umax(0, level);
  dam           = GetRandomNumberFromRange( dam_each[level] / 2, dam_each[level] * 2 );
  if ( saves_spell_staff( level, victim ) )
    dam /= 2;
  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return damage( ch, victim, dam, sn );
}
