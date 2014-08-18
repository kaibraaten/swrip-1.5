#include "character.h"
#include "mud.h"

ch_ret spell_dispel_evil( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;
  Skill *skill = get_skilltype(sn);

  if ( !IsNpc(ch) && IsEvil(ch) )
    victim = ch;

  if ( IsGood(victim) )
    {
      act( AT_MAGIC, "The light side protects $N.", ch, NULL, victim, TO_ROOM );
      return rSPELL_FAILED;
    }

  if ( IsNeutral(victim) )
    {
      act( AT_MAGIC, "$N does not seem to be affected.", ch, NULL, victim, TO_CHAR );
      return rSPELL_FAILED;
    }

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  dam = RollDice( level, 4 );

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  return damage( ch, victim, dam, sn );
}
