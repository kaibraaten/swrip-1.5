#include "character.h"
#include "mud.h"

ch_ret spell_flamestrike( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  dam = RollDice(6, 8);

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}
