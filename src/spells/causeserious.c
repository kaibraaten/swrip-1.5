#include "character.h"
#include "mud.h"

ch_ret spell_cause_serious( int sn, int level, Character *ch, void *vo )
{
  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->Alignment = ch->Alignment - 90;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(level, 2) , sn );
}
