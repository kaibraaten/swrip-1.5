#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"

ch_ret spell_flamestrike( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam = 0;

  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 100;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  dam = RollDice(6, 8);

  if ( SaveVsSpellStaff( level, victim ) )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}

