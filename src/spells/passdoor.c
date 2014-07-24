#include "character.h"
#include "mud.h"

ch_ret spell_pass_door( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  AFFECT_DATA af;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( is_affected_by(victim, AFF_PASS_DOOR) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }
  af.type      = sn;
  af.duration  = number_fuzzy( level / 4 ) * DUR_CONV;
  af.location  = APPLY_NONE;
  af.modifier  = 0;
  af.bitvector = AFF_PASS_DOOR;
  affect_to_char( victim, &af );
  act( AT_MAGIC, "$n turns translucent.", victim, NULL, NULL, TO_ROOM );
  act( AT_MAGIC, "You turn translucent.", victim, NULL, NULL, TO_CHAR );
  return rNONE;
}
