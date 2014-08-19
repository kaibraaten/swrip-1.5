#include "mud.h"
#include "character.h"

ch_ret spell_scorching_surge( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  static const short dam_each[] =
    {
      1,
      1,   2,   3,   4,   5,          6,   8,  10,  12,  14,
      16,  18,  20,  25,  30,         35,  40,  45,  50,  55,
      60,  65,  70,  75,  80,         82,  84,  86,  88,  90,
      92,  94,  96,  98, 100,           102, 104, 106, 108, 110,
      112, 114, 116, 118, 120,       122, 124, 126, 128, 130,
      132, 134, 136, 138, 140,          142, 144, 146, 148, 150,
      152, 154, 156, 158, 160,          162, 164, 166, 168, 170
    };
  int dam;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  level       = umin(level/2, sizeof(dam_each)/sizeof(dam_each[0]) - 1);
  level       = umax(0, level);
  dam         = GetRandomNumberFromRange( dam_each[level] , dam_each[level] * 10 );

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  Act( AT_MAGIC, "A fiery current lashes through $n's body!",
       ch, NULL, NULL, TO_ROOM );
  Act( AT_MAGIC, "A fiery current lashes through your body!",
       ch, NULL, NULL, TO_CHAR );
  return InflictDamage( ch, victim, (dam*1.4), sn );
}
