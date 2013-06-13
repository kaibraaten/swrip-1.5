#include <string.h>
#include "mud.h"
#include "character.h"
#include "room.h"

/*
 * Generic spell affect                                         -Thoric
 */
ch_ret spell_affect( int sn, int level, Character *ch, void *vo )
{
  SMAUG_AFF *saf = NULL;
  SKILLTYPE *skill = get_skilltype(sn);
  Character *victim = (Character *) vo;
  bool groupsp = FALSE;
  bool areasp = FALSE;
  bool hitchar = FALSE;
  bool hitroom = FALSE;
  bool hitvict = FALSE;
  ch_ret retcode = rNONE;

  if ( !skill->affects )
    {
      bug( "spell_affect has no affects sn %d", sn );
      return rNONE;
    }

  if ( SPELL_FLAG(skill, SF_GROUPSPELL) )
    {
      groupsp = TRUE;
    }
  else
    {
      groupsp = FALSE;
    }

  if ( SPELL_FLAG(skill, SF_AREA ) )
    {
      areasp = TRUE;
    }
  else
    {
      areasp = FALSE;
    }

  if ( !groupsp && !areasp )
    {
      /* Can't find a victim */
      if ( !victim )
        {
          failed_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( (skill->type != SKILL_HERB
            && IS_SET( victim->immune, RIS_MAGIC ))
           || is_immune( victim, SPELL_DAMAGE(skill) ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      /* Spell is already on this guy */
      if ( is_affected( victim, sn )
           && !SPELL_FLAG( skill, SF_ACCUMULATIVE )
           && !SPELL_FLAG( skill, SF_RECASTABLE ) )
        {
          failed_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( (saf = skill->affects) && !saf->next
           && saf->location == APPLY_STRIPSN
           && !is_affected( victim, dice_parse(ch, level, saf->modifier) ) )
        {
          failed_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( check_save( sn, level, ch, victim ) )
        {
          failed_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }
    }
  else
    {
      if ( skill->hit_char && skill->hit_char[0] != '\0' )
        {
          if ( strstr(skill->hit_char, "$N") )
	    {
	      hitchar = TRUE;
	    }
          else
	    {
	      act( AT_MAGIC, skill->hit_char, ch, NULL, NULL, TO_CHAR );
	    }
        }

      if ( skill->hit_room && skill->hit_room[0] != '\0' )
        {
          if ( strstr(skill->hit_room, "$N") )
	    {
	      hitroom = TRUE;
	    }
          else
	    {
	      act( AT_MAGIC, skill->hit_room, ch, NULL, NULL, TO_ROOM );
	    }
        }

      if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
	{
	  hitvict = TRUE;
	}

      if ( victim )
	{
	  victim = GetFirstPersonInRoom( victim->in_room );
	}
      else
	{
	  victim = GetFirstPersonInRoom( ch->in_room );
	}
    }

  if ( !victim )
    {
      bug( "spell_affect: could not find victim: sn %d", sn );
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  for ( ; victim; victim = victim->next_in_room )
    {
      if ( groupsp || areasp )
        {
          if ((groupsp && !is_same_group( victim, ch ))
              || IS_SET( victim->immune, RIS_MAGIC )
              || is_immune( victim, SPELL_DAMAGE(skill) )
              || check_save(sn, level, ch, victim)
              || (!SPELL_FLAG(skill, SF_RECASTABLE) && is_affected(victim, sn)))
	    {
	      continue;
	    }

          if ( hitvict && ch != victim )
            {
              act( AT_MAGIC, skill->hit_vict, ch, NULL, victim, TO_VICT );

              if ( hitroom )
                {
                  act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_NOTVICT );
                  act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_CHAR );
                }
            }
          else if ( hitroom )
	    {
	      act( AT_MAGIC, skill->hit_room, ch, NULL, victim, TO_ROOM );
	    }

          if ( ch == victim )
            {
              if ( hitvict )
		{
		  act( AT_MAGIC, skill->hit_vict, ch, NULL, ch, TO_CHAR );
		}
              else if ( hitchar )
		{
		  act( AT_MAGIC, skill->hit_char, ch, NULL, ch, TO_CHAR );
		}
            }
          else if ( hitchar )
	    {
	      act( AT_MAGIC, skill->hit_char, ch, NULL, victim, TO_CHAR );
	    }
        }

      retcode = spell_affectchar( sn, level, ch, victim );

      if ( !groupsp && !areasp )
        {
          if ( retcode == rSPELL_FAILED )
            {
              failed_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }

          if ( retcode == rVICT_IMMUNE )
	    {
	      immune_casting( skill, ch, victim, NULL );
	    }
          else
	    {
	      successful_casting( skill, ch, victim, NULL );
	    }

          break;
        }
    }

  return rNONE;
}
