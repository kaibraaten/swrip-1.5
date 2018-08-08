#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

ch_ret spell_harm( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 100;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );


  dam = umax(  20, victim->Hit - RollDice(1,4) );

  if ( SaveVsSpellStaff( level, victim ) )
    dam = umin( 50, dam / 4 );
  dam = umin( 100, dam );

  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 4);

  return InflictDamage( ch, victim, dam, sn );
}

