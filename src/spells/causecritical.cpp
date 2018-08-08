#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_cause_critical( int sn, int level, Character *ch, void *vo )
{
  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 70;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  return InflictDamage( ch, (Character *) vo, RollDice(3, 8) + level, sn );
}

