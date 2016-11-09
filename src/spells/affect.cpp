#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

/*
 * Generic spell affect                                         -Thoric
 */
ch_ret spell_affect( int sn, int level, Character *ch, void *vo )
{
  SmaugAffect *saf;
  Skill *skill = GetSkill(sn);
  Character *victim = (Character *) vo;
  bool groupsp;
  bool areasp;
  bool hitchar, hitroom, hitvict = false;
  ch_ret retcode;

  if ( !skill->Affects )
    {
      Bug( "spell_affect has no affects sn %d", sn );
      return rNONE;
    }
  if ( SPELL_FLAG(skill, SF_GROUPSPELL) )
    groupsp = true;
  else
    groupsp = false;

  if ( SPELL_FLAG(skill, SF_AREA ) )
    areasp = true;
  else
    areasp = false;
  if ( !groupsp && !areasp )
    {
      /* Can't find a victim */
      if ( !victim )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( (skill->Type != SKILL_HERB
            &&    IsBitSet( victim->Immune, RIS_MAGIC ))
           ||    IsImmuneToDamageType( victim, SPELL_DAMAGE(skill) ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      /* Spell is already on this guy */
      if ( IsAffected( victim, sn )
           &&  !SPELL_FLAG( skill, SF_ACCUMULATIVE )
           &&  !SPELL_FLAG( skill, SF_RECASTABLE ) )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( (saf = skill->Affects) && !saf->Next
           &&    saf->Location == APPLY_STRIPSN
           &&   !IsAffected( victim, ParseDice(ch, level, saf->Modifier) ) )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( CheckSavingThrow( sn, level, ch, victim ) )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }
    }
  else
    {
      if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
        {
          if ( strstr(skill->Messages.Success.ToCaster, "$N") )
            hitchar = true;
          else
	    Act( AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, NULL, TO_CHAR );
        }
      
      if ( !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
        {
          if ( strstr(skill->Messages.Success.ToRoom, "$N") )
            hitroom = true;
          else
            Act( AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, NULL, TO_ROOM );
        }
      
      if ( !IsNullOrEmpty( skill->Messages.Success.ToVictim ) )
        hitvict = true;

      if ( victim )
        victim = victim->InRoom->FirstPerson;
      else
        victim = ch->InRoom->FirstPerson;
    }
  
  if ( !victim )
    {
      Bug( "spell_affect: could not find victim: sn %d", sn );
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  for ( ; victim; victim = victim->NextInRoom )
    {
      if ( groupsp || areasp )
        {
          if ((groupsp && !IsInSameGroup( victim, ch ))
              ||         IsBitSet( victim->Immune, RIS_MAGIC )
              ||   IsImmuneToDamageType( victim, SPELL_DAMAGE(skill) )
              ||   CheckSavingThrow(sn, level, ch, victim)
              || (!SPELL_FLAG(skill, SF_RECASTABLE) && IsAffected(victim, sn)))
            continue;

          if ( hitvict && ch != victim )
            {
              Act( AT_MAGIC, skill->Messages.Success.ToVictim, ch, NULL, victim, TO_VICT );
              if ( hitroom )
                {
                  Act( AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, TO_NOTVICT );
                  Act( AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, TO_CHAR );
                }
            }
          else
            if ( hitroom )
	      Act( AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, victim, TO_ROOM );
          if ( ch == victim )
            {
              if ( hitvict )
                Act( AT_MAGIC, skill->Messages.Success.ToVictim, ch, NULL, ch, TO_CHAR );
              else
                if ( hitchar )
                  Act( AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, ch, TO_CHAR );
            }
          else
            if ( hitchar )
              Act( AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, victim, TO_CHAR );
        }
      retcode = spell_affectchar( sn, level, ch, victim );
      if ( !groupsp && !areasp )
        {
          if ( retcode == rSPELL_FAILED )
            {
              FailedCasting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
          if ( retcode == rVICT_IMMUNE )
            ImmuneCasting( skill, ch, victim, NULL );
          else
            SuccessfulCasting( skill, ch, victim, NULL );
          break;
        }
    }
  return rNONE;
}
