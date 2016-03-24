#include <string.h>
#include "mud.h"
#include "character.h"
#include "skill.h"

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

  if ( !skill->affects )
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

      if ( (skill->type != SKILL_HERB
            &&    IsBitSet( victim->immune, RIS_MAGIC ))
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

      if ( (saf = skill->affects) && !saf->next
           &&    saf->location == APPLY_STRIPSN
           &&   !IsAffected( victim, ParseDice(ch, level, saf->modifier) ) )
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
      if ( skill->hit_char && skill->hit_char[0] != '\0' )
        {
          if ( strstr(skill->hit_char, "$N") )
            hitchar = true;
          else
	    Act( AT_MAGIC, skill->hit_char, ch, NULL, NULL, TO_CHAR );
        }
      if ( skill->hit_room && skill->hit_room[0] != '\0' )
        {
          if ( strstr(skill->hit_room, "$N") )
            hitroom = true;
          else
            Act( AT_MAGIC, skill->hit_room, ch, NULL, NULL, TO_ROOM );
        }
      if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
        hitvict = true;
      if ( victim )
        victim = victim->in_room->first_person;
      else
        victim = ch->in_room->first_person;
    }
  if ( !victim )
    {
      Bug( "spell_affect: could not find victim: sn %d", sn );
      FailedCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  for ( ; victim; victim = victim->next_in_room )
    {
      if ( groupsp || areasp )
        {
          if ((groupsp && !IsInSameGroup( victim, ch ))
              ||         IsBitSet( victim->immune, RIS_MAGIC )
              ||   IsImmuneToDamageType( victim, SPELL_DAMAGE(skill) )
              ||   CheckSavingThrow(sn, level, ch, victim)
              || (!SPELL_FLAG(skill, SF_RECASTABLE) && IsAffected(victim, sn)))
            continue;

          if ( hitvict && ch != victim )
            {
              Act( AT_MAGIC, skill->hit_vict, ch, NULL, victim, TO_VICT );
              if ( hitroom )
                {
                  Act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_NOTVICT );
                  Act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_CHAR );
                }
            }
          else
            if ( hitroom )
	      Act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_ROOM );
          if ( ch == victim )
            {
              if ( hitvict )
                Act( AT_MAGIC, skill->hit_vict, ch, NULL, ch, TO_CHAR );
              else
                if ( hitchar )
                  Act( AT_MAGIC, skill->hit_char, ch, NULL, ch, TO_CHAR );
            }
          else
            if ( hitchar )
              Act( AT_MAGIC, skill->hit_char, ch, NULL, victim, TO_CHAR );
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
