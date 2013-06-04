#include "character.h"
#include "mud.h"

ch_ret spell_faerie_fire( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  AFFECT_DATA af;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( is_affected_by(victim, AFF_FAERIE_FIRE) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  af.type      = sn;
  af.duration  = level * DUR_CONV;
  af.location  = APPLY_AC;
  af.modifier  = 2 * level;
  af.bitvector = AFF_FAERIE_FIRE;
  affect_to_char( victim, &af );
  act( AT_PINK, "You are surrounded by a pink outline.", victim, NULL, NULL, TO_CHAR );
  act( AT_PINK, "$n is surrounded by a pink outline.", victim, NULL, NULL, TO_ROOM );
  return rNONE;
}
