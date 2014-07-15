#include "character.h"
#include "mud.h"

ch_ret spell_affectchar( int sn, int level, CHAR_DATA *ch, void *vo )
{
  AFFECT_DATA af;
  SMAUG_AFF *saf;
  SKILLTYPE *skill = get_skilltype(sn);
  CHAR_DATA *victim = (CHAR_DATA *) vo;
  int aff_chance;
  ch_ret retcode = rNONE;

  if ( SPELL_FLAG( skill, SF_RECASTABLE ) )
    affect_strip( victim, sn );
  for ( saf = skill->affects; saf; saf = saf->next )
    {
      if ( saf->location >= REVERSE_APPLY )
        victim = ch;
      else
        victim = (CHAR_DATA *) vo;
      /* Check if char has this bitvector already */
      if ( (af.bitvector=saf->bitvector) != 0
           &&    is_affected_by( victim, af.bitvector )
           &&   !SPELL_FLAG( skill, SF_ACCUMULATIVE ) )
        continue;
      /*
       * necessary for affect_strip to work properly...
       */
      switch ( af.bitvector )
        {
        default:                af.type = sn;                   break;
        case AFF_POISON:        af.type = gsn_poison;
	  send_to_char("You feel the hatred grow within you!\r\n", ch);
          ch->alignment = ch->alignment - 100;
          ch->alignment = URANGE( -1000, ch->alignment, 1000 );
          sith_penalty( ch );
          aff_chance = ris_save( victim, level, RIS_POISON );

          if ( victim->race == RACE_DROID )
            aff_chance = 1000;

          if ( aff_chance == 1000 )
            {
              retcode = rVICT_IMMUNE;

              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;

              continue;
            }
          if ( saves_poison_death( aff_chance, victim ) )
            {
              if ( SPELL_FLAG(skill, SF_STOPONFAIL) )
                return retcode;
              continue;
            }
          victim->mental_state = URANGE( 30, victim->mental_state + 2, 100 );
          break;
        case AFF_BLIND: af.type = gsn_blindness;        break;
        case AFF_INVISIBLE:     af.type = gsn_invis;            break;
        case AFF_SLEEP: af.type = gsn_sleep;
          aff_chance = ris_save( victim, level, RIS_SLEEP );

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
          aff_chance = ris_save( victim, level, RIS_CHARM );
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
      af.duration  = dice_parse(ch, level, saf->duration);
      af.modifier  = dice_parse(ch, level, saf->modifier);
      af.location  = saf->location % REVERSE_APPLY;
      if ( af.duration == 0 )
        {

          switch( af.location )
            {
            case APPLY_HIT:
              if ( ch != victim && victim->hit < victim->max_hit && af.modifier > 0 && victim->race != RACE_DROID)
                {
                  send_to_char("The noble Jedi use their powers to help others!\r\n", ch);
                  ch->alignment = ch->alignment +20 ;
                  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
                  jedi_bonus(ch);
                }
              if  ( af.modifier > 0 && victim->hit >= victim->max_hit )
                {
                  return rSPELL_FAILED;
                }
              victim->hit = URANGE( 0, victim->hit + af.modifier, victim->max_hit );
              update_pos( victim );
              break;
            case APPLY_MANA:
              if  ( af.modifier > 0 && victim->mana >= victim->max_mana )
                {
                  return rSPELL_FAILED;
                }
              if ( ch != victim && victim->race != RACE_DROID)
                {
                  send_to_char("The noble Jedi use their powers to help others!\r\n", ch);
                  ch->alignment = ch->alignment +25 ;
                  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
		  jedi_bonus(ch);
                }
              victim->mana = URANGE( 0, victim->mana + af.modifier, victim->max_mana );
              update_pos( victim );
              break;
            case APPLY_MOVE:
              if  ( af.modifier > 0 && victim->move >= victim->max_move )
                {
                  return rSPELL_FAILED;
                }
              victim->move = URANGE( 0, victim->move + af.modifier, victim->max_move );
              update_pos( victim );
              break;
            default:
              affect_modify( victim, &af, TRUE );
              break;
            }
        }
      else
        if ( SPELL_FLAG( skill, SF_ACCUMULATIVE ) )
          affect_join( victim, &af );
        else
          affect_to_char( victim, &af );
    }
  update_pos( victim );
  return retcode;
}
