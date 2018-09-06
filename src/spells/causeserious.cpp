#include "character.hpp"
#include "mud.hpp"

ch_ret spell_cause_serious( int sn, int level, Character *ch, void *vo )
{
  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment -= 90;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(level, 2) , sn );
}

