#include "character.h"
#include "mud.h"

ch_ret spell_weaken( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  Affect af;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
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
  affect_to_char( victim, &af );
  set_char_color( AT_MAGIC, victim );
  send_to_char( "You feel weaker.\r\n", victim );
  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );
  return rNONE;
}
