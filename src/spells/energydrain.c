#include "character.h"
#include "mud.h"

/*
 * Drain MOVE, MANA, HP.
 * Caster gains HP.
 */
ch_ret spell_energy_drain( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  int drain_chance;
  Skill *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 200;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  drain_chance = ris_save( victim, victim->top_level, RIS_DRAIN );

  if ( drain_chance == 1000 || saves_spell_staff( drain_chance, victim ) )
    {
      failed_casting( skill, ch, victim, NULL ); /* SB */
      return rSPELL_FAILED;
    }

  if ( victim->top_level <= 2 )
    dam          = ch->hit + 1;
  else
    {
      victim->mana      /= 2;
      victim->move      /= 2;
      dam                = RollDice(1, level);
      ch->hit           += dam;
    }

  if ( ch->hit > ch->max_hit )
    ch->hit = ch->max_hit;
  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}
