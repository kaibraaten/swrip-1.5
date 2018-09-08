#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

/*
 * Drain MOVE, MANA, HP.
 * Caster gains HP.
 */
ch_ret spell_energy_drain( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  int drain_chance;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 200;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );

  drain_chance = ModifySavingThrowBasedOnResistance( victim, victim->TopLevel, RIS_DRAIN );

  if ( drain_chance == 1000 || SaveVsSpellStaff( drain_chance, victim ) )
    {
      FailedCasting( skill, ch, victim, NULL ); /* SB */
      return rSPELL_FAILED;
    }

  if ( victim->TopLevel <= 2 )
    dam          = ch->HitPoints.Current + 1;
  else
    {
      victim->Mana.Current /= 2;
      victim->Fatigue.Current /= 2;
      dam = RollDice(1, level);
      ch->HitPoints.Current += dam;
    }

  if ( ch->HitPoints.Current > ch->HitPoints.Max )
    ch->HitPoints.Current = ch->HitPoints.Max;
  
  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}

