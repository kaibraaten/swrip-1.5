#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

ch_ret spell_dispel_magic( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int affected_by, cnt;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->AffectedBy && ch == victim )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo("You pass your hands around your body...\r\n");
      while ( victim->FirstAffect )
        RemoveAffect( victim, victim->FirstAffect );
      victim->AffectedBy = RaceTable[victim->Race].Affected;
      return rNONE;
    }
  else
    if ( victim->AffectedBy == RaceTable[victim->Race].Affected
         ||   level < victim->TopLevel
         ||   SaveVsSpellStaff( level, victim ) )
      {
        FailedCasting( skill, ch, victim, NULL );
        return rSPELL_FAILED;
      }

  if ( !IsNpc(victim) )
    {
      ch->Echo("You can't do that... yet.\r\n");
      return rSPELL_FAILED;
    }

  cnt = 0;

  for ( ;; )
    {
      affected_by = 1 << NumberBits( 5 );
      if ( IsBitSet(victim->AffectedBy, affected_by) )
        break;
      if ( cnt++ > 30 )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rNONE;
        }
    }

  RemoveBit(victim->AffectedBy, affected_by);
  SuccessfulCasting( skill, ch, victim, NULL );

  return rNONE;
}
