#include "character.hpp"
#include "mud.hpp"

ch_ret spell_cause_light( int sn, int level, Character *ch, void *vo )
{
  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 50;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(1, 8) + level / 3, sn );
}

