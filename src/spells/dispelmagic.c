#include "character.h"
#include "mud.h"

ch_ret spell_dispel_magic( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int affected_by, cnt;
  Skill *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->affected_by && ch == victim )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You pass your hands around your body...\r\n", ch );
      while ( victim->first_affect )
        RemoveAffect( victim, victim->first_affect );
      victim->affected_by = RaceTable[victim->race].affected;
      return rNONE;
    }
  else
    if ( victim->affected_by == RaceTable[victim->race].affected
         ||   level < victim->top_level
         ||   saves_spell_staff( level, victim ) )
      {
        FailedCasting( skill, ch, victim, NULL );
        return rSPELL_FAILED;
      }

  if ( !IsNpc(victim) )
    {
      SendToCharacter( "You can't do that... yet.\r\n", ch );
      return rSPELL_FAILED;
    }

  cnt = 0;

  for ( ;; )
    {
      affected_by = 1 << NumberBits( 5 );
      if ( IsBitSet(victim->affected_by, affected_by) )
        break;
      if ( cnt++ > 30 )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rNONE;
        }
    }

  RemoveBit(victim->affected_by, affected_by);
  SuccessfulCasting( skill, ch, victim, NULL );

  return rNONE;
}
