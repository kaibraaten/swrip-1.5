#include "character.h"
#include "mud.h"

ch_ret spell_dispel_evil( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int dam;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( !is_npc(ch) && is_evil(ch) )
    victim = ch;

  if ( is_good(victim) )
    {
      act( AT_MAGIC, "The light side protects $N.", ch, NULL, victim, TO_ROOM );
      return rSPELL_FAILED;
    }

  if ( is_neutral(victim) )
    {
      act( AT_MAGIC, "$N does not seem to be affected.", ch, NULL, victim, TO_CHAR );
      return rSPELL_FAILED;
    }

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  dam = dice( level, 4 );

  if ( saves_spell_staff( level, victim ) )
    dam /= 2;

  return damage( ch, victim, dam, sn );
}
