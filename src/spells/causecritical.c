#include "character.h"
#include "mud.h"
#include "skill.h"

ch_ret spell_cause_critical( int sn, int level, Character *ch, void *vo )
{
  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 70;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(3, 8) + level, sn );
}
