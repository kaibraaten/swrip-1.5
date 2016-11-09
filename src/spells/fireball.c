#include "character.hpp"
#include "mud.h"

ch_ret spell_fireball( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  static const short dam_each[] =
    {
      1,
      1,  4,  7, 10, 13,        16, 19, 22, 25, 28,
      31, 34, 37, 40, 40,       41, 42, 42, 43, 44,
      44, 45, 46, 46, 47,       48, 48, 49, 50, 50,
      51, 52, 52, 53, 54,       54, 55, 56, 56, 57,
      58, 58, 59, 60, 60, 61, 62, 62, 63, 64,
      64, 65, 65, 66, 66, 67, 68, 68, 69, 69,
      70, 71, 71, 72, 72, 73, 73, 74, 75, 75
    };
  int dam;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->Alignment = ch->Alignment - 100;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  level = umin(level, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level = umax(0, level);
  dam           = GetRandomNumberFromRange( dam_each[level] / 2, dam_each[level] * 2 );

  if ( SaveVsSpellStaff( level, victim ) )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}
