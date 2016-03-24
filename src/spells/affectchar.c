#include "character.h"
#include "mud.h"
#include "skill.h"

ch_ret spell_affectchar( int sn, int level, Character *ch, void *vo )
{
  Affect af;
  SmaugAffect *saf;
  Skill *skill = GetSkill(sn);
  Character *victim = (Character *) vo;
  int aff_chance;
  ch_ret retcode = rNONE;

  if ( SPELL_FLAG( skill, SF_RECASTABLE ) )
    StripAffect( victim, sn );
  for ( saf = skill->Affects; saf; saf = saf->next )
    {
      if ( saf->location >= REVERSE_APPLY )
        victim = ch;
      else
        victim = (Character *) vo;
      /* Check if char has this bitvector already */
      if ( (af.bitvector=saf->bitvector) != 0
           &&    IsAffectedBy( victim, af.bitvector )
           &&   !SPELL_FLAG( skill, SF_ACCUMULATIVE ) )
        continue;
      /*
       * necessary for StripAffect to work properly...
       */
      switch ( af.bitvector )
        {
        default:                af.type = sn;                   break;
        case AFF_POISON:        af.type = gsn_poison;
	  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
          ch->alignment = ch->alignment - 100;
          ch->alignment = urange( -1000, ch->alignment, 1000 );
          ApplySithPenalty( ch );
          aff_chance = ModifySavingThrowBasedOnResistance( victim, level, RIS_POISON );

          if ( victim->race == RACE_DROID )
            aff_chance = 1000;

          if ( aff_chance == 1000 )
            {
              retcode = rVICT_IMMUNE;

              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;

              continue;
            }
          if ( SaveVsPoisonDeath( aff_chance, victim ) )
            {
              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;
              continue;
            }
          victim->mental_state = urange( 30, victim->mental_state + 2, 100 );
          break;
        case AFF_BLIND: af.type = gsn_blindness;        break;
        case AFF_INVISIBLE:     af.type = gsn_invis;            break;
        case AFF_SLEEP: af.type = gsn_sleep;
          aff_chance = ModifySavingThrowBasedOnResistance( victim, level, RIS_SLEEP );

          if ( victim->race == RACE_DROID )
            aff_chance = 1000;

          if ( aff_chance == 1000 )
            {
              retcode = rVICT_IMMUNE;
              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;
              continue;
            }
          break;
        case AFF_CHARM:         af.type = gsn_charm_person;
          aff_chance = ModifySavingThrowBasedOnResistance( victim, level, RIS_CHARM );
	  if ( victim->race == RACE_DROID )
            aff_chance = 1000;
          if ( aff_chance == 1000 )
            {
              retcode = rVICT_IMMUNE;
              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;
              continue;
            }
          break;
        case AFF_POSSESS:       af.type = gsn_possess;          break;
        }
      af.duration  = ParseDice(ch, level, saf->duration);
      af.modifier  = ParseDice(ch, level, saf->modifier);
      af.location  = saf->location % REVERSE_APPLY;
      if ( af.duration == 0 )
        {

          switch( af.location )
            {
            case APPLY_HIT:
              if ( ch != victim && victim->hit < victim->max_hit && af.modifier > 0 && victim->race != RACE_DROID)
                {
                  SendToCharacter("The noble Jedi use their powers to help others!\r\n", ch);
                  ch->alignment = ch->alignment +20 ;
                  ch->alignment = urange( -1000, ch->alignment, 1000 );
                  ApplyJediBonus(ch);
                }
              if  ( af.modifier > 0 && victim->hit >= victim->max_hit )
                {
                  return rSPELL_FAILED;
                }
              victim->hit = urange( 0, victim->hit + af.modifier, victim->max_hit );
              UpdatePosition( victim );
              break;
            case APPLY_MANA:
              if  ( af.modifier > 0 && victim->mana >= victim->max_mana )
                {
                  return rSPELL_FAILED;
                }
              if ( ch != victim && victim->race != RACE_DROID)
                {
                  SendToCharacter("The noble Jedi use their powers to help others!\r\n", ch);
                  ch->alignment = ch->alignment +25 ;
                  ch->alignment = urange( -1000, ch->alignment, 1000 );
		  ApplyJediBonus(ch);
                }
              victim->mana = urange( 0, victim->mana + af.modifier, victim->max_mana );
              UpdatePosition( victim );
              break;
            case APPLY_MOVE:
              if  ( af.modifier > 0 && victim->move >= victim->max_move )
                {
                  return rSPELL_FAILED;
                }
              victim->move = urange( 0, victim->move + af.modifier, victim->max_move );
              UpdatePosition( victim );
              break;
            default:
              ModifyAffect( victim, &af, true );
              break;
            }
        }
      else
        if ( SPELL_FLAG( skill, SF_ACCUMULATIVE ) )
          JoinAffect( victim, &af );
        else
          AffectToCharacter( victim, &af );
    }
  UpdatePosition( victim );
  return retcode;
}
