#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_weaken( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  std::shared_ptr<Affect> af = std::make_shared<Affect>();
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if (victim->Race == RACE_DROID)
    return rSPELL_FAILED;

  if ( IsAffected( victim, sn ) || SaveVsWands( level, victim ) )
    return rSPELL_FAILED;

  af->Type      = sn;
  af->Duration  = level / 2 * DUR_CONV;
  af->Location  = APPLY_STR;
  af->Modifier  = -2;
  af->AffectedBy = 0;
  AffectToCharacter( victim, af );
  SetCharacterColor( AT_MAGIC, victim );
  victim->Echo("You feel weaker.\r\n");
  if ( ch != victim )
    ch->Echo("Ok.\r\n");
  return rNONE;
}

