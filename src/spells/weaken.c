#include "character.h"
#include "mud.h"

ch_ret spell_weaken( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  Skill *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  if (victim->race == RACE_DROID)
    return rSPELL_FAILED;
  if ( IsAffected( victim, sn ) || saves_wands( level, victim ) )
    return rSPELL_FAILED;
  af.type      = sn;
  af.duration  = level / 2 * DUR_CONV;
  af.location  = APPLY_STR;
  af.modifier  = -2;
  af.bitvector = 0;
  AffectToCharacter( victim, &af );
  SetCharacterColor( AT_MAGIC, victim );
  SendToCharacter( "You feel weaker.\r\n", victim );
  if ( ch != victim )
    SendToCharacter( "Ok.\r\n", ch );
  return rNONE;
}
