#include "character.h"
#include "mud.h"

ch_ret spell_poison( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  int poison_chance;
  bool first = true;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  poison_chance = ModifySavingThrowBasedOnResistance( victim, level, RIS_POISON );

  if ( poison_chance == 1000 || SaveVsPoisonDeath( poison_chance, victim ) )
    return rSPELL_FAILED;

  if ( IsAffectedBy( victim, AFF_POISON ) )
    first = false;

  af.Type      = sn;
  af.Duration  = level * DUR_CONV;
  af.Location  = APPLY_STR;
  af.Modifier  = -2;
  af.AffectedBy = AFF_POISON;
  JoinAffect( victim, &af );
  SetCharacterColor( AT_MAGIC, victim );
  SendToCharacter( "You feel very sick.\r\n", victim );
  victim->mental_state = urange( 20, victim->mental_state
                                 + (first ? 5 : 0), 100 );
  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );
  return rNONE;
}
