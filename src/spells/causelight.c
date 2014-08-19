#include "character.h"
#include "mud.h"

ch_ret spell_cause_light( int sn, int level, Character *ch, void *vo )
{
  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 50;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(1, 8) + level / 3, sn );
}
