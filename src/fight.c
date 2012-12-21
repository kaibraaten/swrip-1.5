/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                          Battle & death module                          *
 ****************************************************************************/

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <errno.h>
#include "mud.h"

extern char             lastplayercmd[MAX_INPUT_LENGTH];
extern CHAR_DATA *      gch_prev;

/* From Skills.c */
int ris_save( CHAR_DATA *ch, int chnce, int ris );

/*
 * Local functions.
 */
void    dam_message( CHAR_DATA *ch, CHAR_DATA *victim, int dam, int dt );
void    group_gain( CHAR_DATA *ch, CHAR_DATA *victim );
int     xp_compute( CHAR_DATA *gch, CHAR_DATA *victim );
int     align_compute( CHAR_DATA *gch, CHAR_DATA *victim );
ch_ret  one_hit( CHAR_DATA *ch, CHAR_DATA *victim, int dt );
int     obj_hitroll( OBJ_DATA *obj );
bool    get_cover( CHAR_DATA *ch );
bool    dual_flip = FALSE;

/*
 * Check to see if weapon is poisoned.
 */
bool is_wielding_poisoned( CHAR_DATA *ch )
{
  OBJ_DATA *obj;

  if ( ( obj = get_eq_char( ch, WEAR_WIELD )    )
       &&   (IS_SET( obj->extra_flags, ITEM_POISONED) ) )
    return TRUE;

  return FALSE;

}

/*
 * hunting, hating and fearing code                             -Thoric
 */
bool is_hunting( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( !ch->hunting || ch->hunting->who != victim )
    return FALSE;

  return TRUE;
}

bool is_hating( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( !ch->hating || ch->hating->who != victim )
    return FALSE;

  return TRUE;
}

bool is_fearing( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( !ch->fearing || ch->fearing->who != victim )
    return FALSE;

  return TRUE;
}

void stop_hunting( CHAR_DATA *ch )
{
  if ( ch->hunting )
    {
      STRFREE( ch->hunting->name );
      DISPOSE( ch->hunting );
      ch->hunting = NULL;
    }
  return;
}

void stop_hating( CHAR_DATA *ch )
{
  if ( ch->hating )
    {
      STRFREE( ch->hating->name );
      DISPOSE( ch->hating );
      ch->hating = NULL;
    }
  return;
}

void stop_fearing( CHAR_DATA *ch )
{
  if ( ch->fearing )
    {
      STRFREE( ch->fearing->name );
      DISPOSE( ch->fearing );
      ch->fearing = NULL;
    }
  return;
}

void start_hunting( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( ch->hunting )
    stop_hunting( ch );

  CREATE( ch->hunting, HHF_DATA, 1 );
  ch->hunting->name = QUICKLINK( victim->name );
  ch->hunting->who  = victim;
  return;
}

void start_hating( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( ch->hating )
    stop_hating( ch );

  CREATE( ch->hating, HHF_DATA, 1 );
  ch->hating->name = QUICKLINK( victim->name );
  ch->hating->who  = victim;
  return;
}

void start_fearing( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( ch->fearing )
    stop_fearing( ch );

  CREATE( ch->fearing, HHF_DATA, 1 );
  ch->fearing->name = QUICKLINK( victim->name );
  ch->fearing->who  = victim;
  return;
}


int max_fight( CHAR_DATA *ch )
{
  return 8;
}

/*
 * Control the fights going on.
 * Called periodically by update_handler.
 * Many hours spent fixing bugs in here by Thoric, as noted by residual
 * debugging checks.  If you never get any of these error messages again
 * in your logs... then you can comment out some of the checks without
 * worry.
 */
void violence_update( void )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *ch;
  CHAR_DATA *lst_ch;
  CHAR_DATA *victim;
  CHAR_DATA *rch, *rch_next;
  AFFECT_DATA *paf, *paf_next;
  TIMER *timer, *timer_next;
  ch_ret     retcode;
  SKILLTYPE     *skill;

  lst_ch = NULL;
  for ( ch = last_char; ch; lst_ch = ch, ch = gch_prev )
    {
      set_cur_char( ch );

      if ( ch == first_char && ch->prev )
        {
          bug( "ERROR: first_char->prev != NULL, fixing...", 0 );
          ch->prev = NULL;
        }

      gch_prev  = ch->prev;

      if ( gch_prev && gch_prev->next != ch )
        {
          sprintf( buf, "FATAL: violence_update: %s->prev->next doesn't point to ch.",
                   ch->name );
          bug( buf, 0 );
          bug( "Short-cutting here", 0 );
          ch->prev = NULL;
          gch_prev = NULL;
          do_shout( ch, "Thoric says, 'Prepare for the worst!'" );
        }

      /*
       * See if we got a pointer to someone who recently died...
       * if so, either the pointer is bad... or it's a player who
       * "died", and is back at the healer...
       * Since he/she's in the char_list, it's likely to be the later...
       * and should not already be in another fight already
       */
      if ( char_died(ch) )
        continue;

      /*
       * See if we got a pointer to some bad looking data...
       */
      if ( !ch->in_room || !ch->name )
        {
          log_string( "violence_update: bad ch record!  (Shortcutting.)" );
          sprintf( buf, "ch: %d  ch->in_room: %d  ch->prev: %d  ch->next: %d",
                   (int) ch, (int) ch->in_room, (int) ch->prev, (int) ch->next );
          log_string( buf );
          log_string( lastplayercmd );
          if ( lst_ch )
            sprintf( buf, "lst_ch: %d  lst_ch->prev: %d  lst_ch->next: %d",
                     (int) lst_ch, (int) lst_ch->prev, (int) lst_ch->next );
          else
            strcpy( buf, "lst_ch: NULL" );
          log_string( buf );
          gch_prev = NULL;
          continue;
        }

      /*
       * Experience gained during battle deceases as battle drags on
       */
      if ( ch->fighting )
        if ( (++ch->fighting->duration % 24) == 0 )
          ch->fighting->xp = ((ch->fighting->xp * 9) / 10);


      for ( timer = ch->first_timer; timer; timer = timer_next )
        {
          timer_next = timer->next;
          if ( --timer->count <= 0 )
            {
              if ( timer->type == TIMER_DO_FUN )
                {
                  int tempsub;

                  tempsub = ch->substate;
                  ch->substate = timer->value;
                  (timer->do_fun)( ch, "" );
                  if ( char_died(ch) )
                    break;
                  ch->substate = tempsub;
                }
              extract_timer( ch, timer );
            }
        }

      if ( char_died(ch) )
        continue;

      /*
       * We need spells that have shorter durations than an hour.
       * So a melee round sounds good to me... -Thoric
       */
      for ( paf = ch->first_affect; paf; paf = paf_next )
        {
          paf_next      = paf->next;
          if ( paf->duration > 0 )
            paf->duration--;
          else
            if ( paf->duration < 0 )
              ;
            else
              {
                if ( !paf_next
                     ||    paf_next->type != paf->type
                     ||    paf_next->duration > 0 )
                  {
                    skill = get_skilltype(paf->type);
                    if ( paf->type > 0 && skill && skill->msg_off )
                      {
                        set_char_color( AT_WEAROFF, ch );
                        send_to_char( skill->msg_off, ch );
                        send_to_char( "\r\n", ch );
                      }
                  }
                if (paf->type == gsn_possess)
                  {
                    ch->desc->character       = ch->desc->original;
                    ch->desc->original        = NULL;
                    ch->desc->character->desc = ch->desc;
                    ch->desc->character->switched = NULL;
                    ch->desc                  = NULL;
                  }
                affect_remove( ch, paf );
              }
        }

      if ( ( victim = who_fighting( ch ) ) == NULL
           ||   IS_AFFECTED( ch, AFF_PARALYSIS ) )
        continue;

      retcode = rNONE;

      if ( IS_SET(ch->in_room->room_flags, ROOM_SAFE ) )
        {
          sprintf( buf, "violence_update: %s fighting %s in a SAFE room.",
                   ch->name, victim->name );
          log_string( buf );
          stop_fighting( ch, TRUE );
        }
      else
        if ( IS_AWAKE(ch) && ch->in_room == victim->in_room )
          retcode = multi_hit( ch, victim, TYPE_UNDEFINED );
        else
          stop_fighting( ch, FALSE );

      if ( char_died(ch) )
        continue;

      if ( retcode == rCHAR_DIED
           || ( victim = who_fighting( ch ) ) == NULL )
        continue;

      if( IS_NPC(ch) )
        {
          do_wear( ch, "blaster" );
          do_wear( ch, "all" );
        }


      /*
       *  Mob triggers
       */
      rprog_rfight_trigger( ch );
      if ( char_died(ch) )
        continue;
      mprog_hitprcnt_trigger( ch, victim );
      if ( char_died(ch) )
        continue;
      mprog_fight_trigger( ch, victim );
      if ( char_died(ch) )
        continue;

      /*
       * Fun for the whole family!
       */
      for ( rch = ch->in_room->first_person; rch; rch = rch_next )
        {
          rch_next = rch->next_in_room;

          if ( IS_AWAKE(rch) && !rch->fighting )
            {
              /*
               * PC's auto-assist others in their group.
               */
              if ( !IS_NPC(ch) || IS_AFFECTED(ch, AFF_CHARM) )
                {
                  if ( ( !IS_NPC(rch) || IS_AFFECTED(rch, AFF_CHARM) )
                       &&   is_same_group(ch, rch) )
                    multi_hit( rch, victim, TYPE_UNDEFINED );
                  continue;
                }

              /*
               * NPC's assist NPC's of same type or 12.5% chance regardless.
               */
              if ( IS_NPC(rch) && !IS_AFFECTED(rch, AFF_CHARM)
                   &&  !IS_SET(rch->act, ACT_NOASSIST) )
                {
                  if ( char_died(ch) )
                    break;
                  if ( rch->pIndexData == ch->pIndexData
                       ||   number_bits( 3 ) == 0 )
                    {
                      CHAR_DATA *vch;
                      CHAR_DATA *target;
                      int number;

                      target = NULL;
                      number = 0;                       for ( vch = ch->in_room->first_person; vch; vch = vch->next )
                                                          {
                                                            if ( can_see( rch, vch )
                                                                 &&   is_same_group( vch, victim )
                                                                 &&   number_range( 0, number ) == 0 )
                                                              {
                                                                target = vch;
                                                                number++;
                                                              }
                                                          }

                      if ( target )
                        multi_hit( rch, target, TYPE_UNDEFINED );
                    }
                }
            }
        }
    }

  return;
}



/*
 * Do one group of attacks.
 */
ch_ret multi_hit( CHAR_DATA *ch, CHAR_DATA *victim, int dt )
{
  int     hit_chance;
  int       dual_bonus;
  ch_ret  retcode;

  /* add timer if player is attacking another player */
  if ( !IS_NPC(ch) && !IS_NPC(victim) )
    add_timer( ch, TIMER_RECENTFIGHT, 20, NULL, 0 );

  if ( !IS_NPC(ch) && IS_SET( ch->act, PLR_NICE ) && !IS_NPC( victim ) )
    return rNONE;

  if ( (retcode = one_hit( ch, victim, dt )) != rNONE )
    return retcode;

  if ( who_fighting( ch ) != victim || dt == gsn_backstab || dt == gsn_circle)
    return rNONE;

  /* Very high chance of hitting compared to chance of going berserk */
  /* 40% or higher is always hit.. don't learn anything here though. */
  /* -- Altrag */
  hit_chance = IS_NPC(ch) ? 100 : (ch->pcdata->learned[gsn_berserk]*5/2);

  if ( IS_AFFECTED(ch, AFF_BERSERK) && number_percent() < hit_chance )
    if ( (retcode = one_hit( ch, victim, dt )) != rNONE ||
         who_fighting( ch ) != victim )
      return retcode;

  if ( get_eq_char( ch, WEAR_DUAL_WIELD ) )
    {
      dual_bonus = IS_NPC(ch) ? (ch->skill_level[COMBAT_ABILITY] / 10) : (ch->pcdata->learned[gsn_dual_wield] / 10);
      hit_chance = IS_NPC(ch) ? ch->top_level : ch->pcdata->learned[gsn_dual_wield];
      if ( number_percent( ) < hit_chance )
        {
          learn_from_success( ch, gsn_dual_wield );
          retcode = one_hit( ch, victim, dt );
          if ( retcode != rNONE || who_fighting( ch ) != victim )
            return retcode;
        }
      else
        learn_from_failure( ch, gsn_dual_wield );
    }
  else
    dual_bonus = 0;

  if ( ch->move < 10 )
    dual_bonus = -20;

  /*
   * NPC predetermined number of attacks                        -Thoric
   */
  if ( IS_NPC(ch) && ch->numattacks > 0 )
    {
      for ( hit_chance = 0; hit_chance <= ch->numattacks; hit_chance++ )
        {
          retcode = one_hit( ch, victim, dt );
          if ( retcode != rNONE || who_fighting( ch ) != victim )
            return retcode;
        }
      return retcode;
    }

  hit_chance = IS_NPC(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_second_attack]+dual_bonus)/1.5);
  if ( number_percent( ) < hit_chance )
    {
      learn_from_success( ch, gsn_second_attack );
      retcode = one_hit( ch, victim, dt );
      if ( retcode != rNONE || who_fighting( ch ) != victim )
        return retcode;
    }
  else
    learn_from_failure( ch, gsn_second_attack );

  hit_chance = IS_NPC(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_third_attack]+(dual_bonus*1.5))/2);
  if ( number_percent( ) < hit_chance )
    {
      learn_from_success( ch, gsn_third_attack );
      retcode = one_hit( ch, victim, dt );
      if ( retcode != rNONE || who_fighting( ch ) != victim )
        return retcode;
    }
  else
    learn_from_failure( ch, gsn_third_attack );

  hit_chance = IS_NPC(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_fourth_attack]+(dual_bonus*1.5))/2);
  if ( number_percent( ) < hit_chance )
    {
      learn_from_success( ch, gsn_fourth_attack );
      retcode = one_hit( ch, victim, dt );
      if ( retcode != rNONE || who_fighting( ch ) != victim )
        return retcode;
    }
  else
    learn_from_failure( ch, gsn_fourth_attack );

  hit_chance = IS_NPC(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_fifth_attack]+(dual_bonus*1.5))/2);
  if ( number_percent( ) < hit_chance )
    {
      learn_from_success( ch, gsn_fifth_attack );
      retcode = one_hit( ch, victim, dt );
      if ( retcode != rNONE || who_fighting( ch ) != victim )
        return retcode;
    }
  else
    learn_from_failure( ch, gsn_fifth_attack );

  retcode = rNONE;

  hit_chance = IS_NPC(ch) ? (int) (ch->top_level / 4) : 0;
  if ( number_percent( ) < hit_chance )
    retcode = one_hit( ch, victim, dt );

  if ( retcode == rNONE )
    {
      int move;

      if ( !IS_AFFECTED(ch, AFF_FLYING)
           &&   !IS_AFFECTED(ch, AFF_FLOATING) )
        move = encumbrance( ch, movement_loss[UMIN(SECT_MAX-1, ch->in_room->sector_type)] );
      else
        move = encumbrance( ch, 1 );
      if ( ch->move )
        ch->move = UMAX( 0, ch->move - move );
    }

  return retcode;
}


/*
 * Weapon types, haus
 */
int weapon_prof_bonus_check( CHAR_DATA *ch, OBJ_DATA *wield, int *gsn_ptr )
{
  int bonus;

  bonus = 0;    *gsn_ptr = -1;
  if ( !IS_NPC(ch) && wield )
    {
      switch(wield->value[3])
        {
        default:        *gsn_ptr = -1;                  break;
        case 3:      *gsn_ptr = gsn_lightsabers;     break;
        case 2: *gsn_ptr = gsn_vibro_blades;    break;
        case 4: *gsn_ptr = gsn_flexible_arms;   break;
        case 5: *gsn_ptr = gsn_talonous_arms;   break;
        case 6: *gsn_ptr = gsn_blasters;        break;
        case 8: *gsn_ptr = gsn_bludgeons;       break;
        case 9: *gsn_ptr = gsn_bowcasters;      break;
        case 11:        *gsn_ptr = gsn_force_pikes;     break;

        }
      if ( *gsn_ptr != -1 )
        bonus = (int) ( ch->pcdata->learned[*gsn_ptr] );

    }
  if ( IS_NPC(ch) && wield )
    bonus = get_trust(ch);
  return bonus;
}

/*
 * Calculate the tohit bonus on the object and return RIS values.
 * -- Altrag
 */
int obj_hitroll( OBJ_DATA *obj )
{
  int tohit = 0;
  AFFECT_DATA *paf;

  for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
    if ( paf->location == APPLY_HITROLL )
      tohit += paf->modifier;
  for ( paf = obj->first_affect; paf; paf = paf->next )
    if ( paf->location == APPLY_HITROLL )
      tohit += paf->modifier;
  return tohit;
}

/*
 * Offensive shield level modifier
 */
short off_shld_lvl( CHAR_DATA *ch, CHAR_DATA *victim )
{
  short lvl;

  if ( !IS_NPC(ch) )            /* players get much less effect */
    {
      lvl = UMAX( 1, (ch->skill_level[FORCE_ABILITY])  );
      if ( number_percent() + (victim->skill_level[COMBAT_ABILITY] - lvl) < 35 )
        return lvl;
      else
        return 0;
    }
  else
    {
      lvl = ch->top_level;
      if ( number_percent() + (victim->skill_level[COMBAT_ABILITY] - lvl) < 70 )
        return lvl;
      else
        return 0;
    }
}

/*
 * Hit one guy once.
 */
ch_ret one_hit( CHAR_DATA *ch, CHAR_DATA *victim, int dt )
{
  OBJ_DATA *wield;
  int victim_ac;
  int thac0;
  int thac0_00;
  int thac0_32;
  int plusris;
  int dam, x;
  int diceroll;
  int attacktype, cnt;
  int   prof_bonus;
  int   prof_gsn;
  ch_ret retcode;
  int hit_chance;
  bool fail;
  AFFECT_DATA af;


  /*
   * Can't beat a dead char!
   * Guard against weird room-leavings.
   */
  if ( victim->position == POS_DEAD || ch->in_room != victim->in_room )
    return rVICT_DIED;


  /*
   * Figure out the weapon doing the damage                     -Thoric
   */
  if ( (wield = get_eq_char( ch, WEAR_DUAL_WIELD )) != NULL )
    {
      if ( dual_flip == FALSE )
        {
          dual_flip = TRUE;
          wield = get_eq_char( ch, WEAR_WIELD );
        }
      else
        dual_flip = FALSE;
    }
  else
    wield = get_eq_char( ch, WEAR_WIELD );

  prof_bonus = weapon_prof_bonus_check( ch, wield, &prof_gsn );

  if ( ch->fighting             /* make sure fight is already started */
       &&   dt == TYPE_UNDEFINED
       &&   IS_NPC(ch)
       &&   ch->attacks != 0 )
    {
      cnt = 0;
      for ( ;; )
        {
          x = number_range( 0, 6 );
          attacktype = 1 << x;
          if ( IS_SET( ch->attacks, attacktype ) )
            break;
          if ( cnt++ > 16 )
            {
              attacktype = 0;
              break;
            }
        }
      if ( attacktype == ATCK_BACKSTAB )
        attacktype = 0;
      if ( wield && number_percent( ) > 25 )
        attacktype = 0;
      switch ( attacktype )
        {
        default:
          break;
        case ATCK_BITE:
          do_bite( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_CLAWS:
          do_claw( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_TAIL:
          do_tail( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_STING:
          do_sting( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_PUNCH:
          do_punch( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_KICK:
          do_kick( ch, "" );
          retcode = global_retcode;
          break;
        case ATCK_TRIP:
          attacktype = 0;
          break;
        }
      if ( attacktype )
        return retcode;
    }

  if ( dt == TYPE_UNDEFINED )
    {
      dt = TYPE_HIT;
      if ( wield && wield->item_type == ITEM_WEAPON )
        dt += wield->value[3];
    }

  /*
   * Calculate to-hit-armor-class-0 versus armor.
   */
  thac0_00 = 20;
  thac0_32 = 10;
  thac0     = interpolate( ch->skill_level[COMBAT_ABILITY] , thac0_00, thac0_32 ) - GET_HITROLL(ch);
  victim_ac = (int) (GET_AC(victim) / 10);

  /* if you can't see what's coming... */
  if ( wield && !can_see_obj( victim, wield) )
    victim_ac += 1;
  if ( !can_see( ch, victim ) )
    victim_ac -= 4;

  if ( ch->race == RACE_DEFEL )
    victim_ac += 2;

  if ( !IS_AWAKE ( victim ) )
    victim_ac += 5;

  /* Weapon proficiency bonus */
  victim_ac += prof_bonus/20;

  /*
   * The moment of excitement!
   */
  diceroll = number_range( 1,20 );

  if ( diceroll == 1
       || ( diceroll < 20 && diceroll < thac0 - victim_ac ) )
    {
      /* Miss. */
      if ( prof_gsn != -1 )
        learn_from_failure( ch, prof_gsn );
      damage( ch, victim, 0, dt );
      return rNONE;
    }

  /*
   * Hit.
   * Calc damage.
   */

  if ( !wield )       /* dice formula fixed by Thoric */
    dam = number_range( ch->barenumdie, ch->baresizedie * ch->barenumdie );
  else
    dam = number_range( wield->value[1], wield->value[2] );

  /*
   * Bonuses.
   */

  dam += GET_DAMROLL(ch);

  if ( prof_bonus )
    dam *= ( 1 + prof_bonus / 100 );


  if ( !IS_NPC(ch) && ch->pcdata->learned[gsn_enhanced_damage] > 0 )
    {
      dam += (int) (dam * ch->pcdata->learned[gsn_enhanced_damage] / 120);
      learn_from_success( ch, gsn_enhanced_damage );
    }


  if ( !IS_AWAKE(victim) )
    dam *= 2;
  if ( dt == gsn_backstab )
    dam *= (2 + URANGE( 2, ch->skill_level[HUNTING_ABILITY] - (victim->skill_level[COMBAT_ABILITY]/4), 30 ) / 8);

  if ( dt == gsn_circle )
    dam *= (2 + URANGE( 2, ch->skill_level[HUNTING_ABILITY] - (victim->skill_level[COMBAT_ABILITY]/2), 30 ) / 40);

  plusris = 0;

  if ( wield )
    {
      if ( IS_SET( wield->extra_flags, ITEM_MAGIC ) )
        dam = ris_damage( victim, dam, RIS_MAGIC );
      else
        dam = ris_damage( victim, dam, RIS_NONMAGIC );

      /*
       * Handle PLUS1 - PLUS6 ris bits vs. weapon hitroll       -Thoric
       */
      plusris = obj_hitroll( wield );
    }
  else
    dam = ris_damage( victim, dam, RIS_NONMAGIC );

  /* check for RIS_PLUSx                                        -Thoric */
  if ( dam )
    {
      int i, res, imm, sus, mod;

      if ( plusris )
        plusris = RIS_PLUS1 << UMIN(plusris, 7);

      /* initialize values to handle a zero plusris */
      imm = res = -1;  sus = 1;

      /* find high ris */
      for ( i = RIS_PLUS1; i <= RIS_PLUS6; i <<= 1 )
        {
          if ( IS_SET( victim->immune, i ) )
            imm = i;
          if ( IS_SET( victim->resistant, i ) )
            res = i;
          if ( IS_SET( victim->susceptible, i ) )
            sus = i;
        }
      mod = 10;
      if ( imm >= plusris )
        mod -= 10;
      if ( res >= plusris )
        mod -= 2;
      if ( sus <= plusris )
        mod += 2;

      /* check if immune */
      if ( mod <= 0 )
        dam = -1;
      if ( mod != 10 )
        dam = (dam * mod) / 10;
    }

  /* race modifier */

  /*
   * check to see if weapon is charged
   */

  if ( dt == (TYPE_HIT + WEAPON_BLASTER ) && wield && wield->item_type == ITEM_WEAPON )
    {
      if ( wield->value[4] < 1  )
        {
          act( AT_YELLOW, "$n points their blaster at you but nothing happens.",  ch, NULL, victim, TO_VICT    );
          act( AT_YELLOW, "*CLICK* ... your blaster needs a new ammunition cell!", ch, NULL, victim, TO_CHAR    );
          if ( IS_NPC(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
      else if ( wield->blaster_setting == BLASTER_FULL && wield->value[4] >=5 )
        {
          dam *=  1.5;
          wield->value[4] -= 5;
        }
      else if ( wield->blaster_setting == BLASTER_HIGH && wield->value[4] >=4 )
        {
          dam *=  1.25;
          wield->value[4] -= 4;
        }
      else if ( wield->blaster_setting == BLASTER_NORMAL && wield->value[4] >=3 )
        {
          wield->value[4] -= 3;
        }
      else if ( wield->blaster_setting == BLASTER_STUN && wield->value[4] >=5 )
        {
          dam /= 10;
          wield->value[4] -= 3;
          fail = FALSE;
          hit_chance = ris_save( victim, ch->skill_level[COMBAT_ABILITY], RIS_PARALYSIS );
          if ( hit_chance == 1000 )
            fail = TRUE;
          else
            fail = saves_para_petri( hit_chance, victim );
          if ( victim->was_stunned > 0 )
            {
              fail = TRUE;
              victim->was_stunned--;
            }
          hit_chance = 100 - get_curr_con(victim) - victim->skill_level[COMBAT_ABILITY]/2;
          /* harder for player to stun another player */
          if ( !IS_NPC(ch) && !IS_NPC(victim) )
            hit_chance -= sysdata.stun_plr_vs_plr;
          else
            hit_chance -= sysdata.stun_regular;

          hit_chance = URANGE( 5, hit_chance, 95 );

          if ( !fail && number_percent() < hit_chance )
            {
              WAIT_STATE( victim, PULSE_VIOLENCE );
              act( AT_BLUE, "Blue rings of energy from $N's blaster knock you down leaving you stunned!", victim, NULL, ch, TO_CHAR );
              act( AT_BLUE, "Blue rings of energy from your blaster strike $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
              act( AT_BLUE, "Blue rings of energy from $n's blaster hit $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );
              stop_fighting( victim, TRUE );
              if ( !IS_AFFECTED( victim, AFF_PARALYSIS ) )
                {
                  af.type      = gsn_stun;
                  af.location  = APPLY_AC;
                  af.modifier  = 20;
                  af.duration  = 7;
                  af.bitvector = AFF_PARALYSIS;
                  affect_to_char( victim, &af );
                  update_pos( victim );
                  if ( IS_NPC(victim) )
                    {
                      start_hating( victim, ch );
                      start_hunting( victim, ch );
                      victim->was_stunned = 10;
                    }
                }
            }
          else
            {
              act( AT_BLUE, "Blue rings of energy from $N's blaster hit you but have little effect", victim, NULL, ch, TO_CHAR );
              act( AT_BLUE, "Blue rings of energy from your blaster hit $N, but nothing seems to happen!", ch, NULL, victim, TO_CHAR );
              act( AT_BLUE, "Blue rings of energy from $n's blaster hit $N, but nothing seems to happen!", ch, NULL, victim, TO_NOTVICT );

            }
        }
      else if ( wield->blaster_setting == BLASTER_HALF && wield->value[4] >=2 )
        {
          dam *=  0.75;
          wield->value[4] -= 2;
        }
      else
        {
          dam *= 0.5;
          wield->value[4] -= 1;
        }

    }
  else if (
           dt == (TYPE_HIT + WEAPON_VIBRO_BLADE )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[4] < 1  )
        {
          act( AT_YELLOW, "Your vibro-blade needs recharging ...", ch, NULL, victim, TO_CHAR    );
          dam /= 3;
        }
    }
  else if (
           dt == (TYPE_HIT + WEAPON_FORCE_PIKE )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[4] < 1  )
        {
          act( AT_YELLOW, "Your force-pike needs recharging ...", ch, NULL, victim, TO_CHAR    );
          dam /= 2;
        }
      else
        wield->value[4]--;
    }
  else if (
           dt == (TYPE_HIT + WEAPON_LIGHTSABER )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[4] < 1  )
        {
          act( AT_YELLOW, "$n waves a dead hand grip around in the air.",  ch, NULL, victim, TO_VICT    );
          act( AT_YELLOW, "You need to recharge your lightsaber ... it seems to be lacking a blade.", ch, NULL, victim, TO_CHAR    );
          if ( IS_NPC(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_BOWCASTER ) && wield && wield->item_type == ITEM_WEAPON )
    {
      if ( wield->value[4] < 1  )
        {
          act( AT_YELLOW, "$n points their bowcaster at you but nothing happens.",  ch, NULL, victim, TO_VICT    );
          act( AT_YELLOW, "*CLICK* ... your bowcaster needs a new bolt cartridge!", ch, NULL, victim, TO_CHAR    );
          if ( IS_NPC(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
      else
        wield->value[4]--;
    }

  if ( dam <= 0 )
    dam = 1;

  if ( prof_gsn != -1 )
    {
      if ( dam > 0 )
        learn_from_success( ch, prof_gsn );
      else
        learn_from_failure( ch, prof_gsn );
    }

  /* immune to damage */
  if ( dam == -1 )
    {
      if ( dt >= 0 && dt < top_sn )
        {
          SKILLTYPE *skill = skill_table[dt];
          bool found = FALSE;

          if ( skill->imm_char && skill->imm_char[0] != '\0' )
            {
              act( AT_HIT, skill->imm_char, ch, NULL, victim, TO_CHAR );
              found = TRUE;
            }
          if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
            {
              act( AT_HITME, skill->imm_vict, ch, NULL, victim, TO_VICT );
              found = TRUE;
            }
          if ( skill->imm_room && skill->imm_room[0] != '\0' )
            {
              act( AT_ACTION, skill->imm_room, ch, NULL, victim, TO_NOTVICT );
              found = TRUE;
            }
          if ( found )
            return rNONE;
        }
      dam = 0;
    }
  if ( (retcode = damage( ch, victim, dam, dt )) != rNONE )
    return retcode;
  if ( char_died(ch) )
    return rCHAR_DIED;
  if ( char_died(victim) )
    return rVICT_DIED;

  retcode = rNONE;
  if ( dam == 0 )
    return retcode;

  /* weapon spells      -Thoric */
  if ( wield
       &&  !IS_SET(victim->immune, RIS_MAGIC)
       &&  !IS_SET(victim->in_room->room_flags, ROOM_NO_MAGIC) )
    {
      AFFECT_DATA *aff;

      for ( aff = wield->pIndexData->first_affect; aff; aff = aff->next )
        if ( aff->location == APPLY_WEAPONSPELL
             &&   IS_VALID_SN(aff->modifier)
             &&   skill_table[aff->modifier]->spell_fun )
          retcode = (*skill_table[aff->modifier]->spell_fun) ( aff->modifier, (wield->level+3)/3, ch, victim );
      if ( retcode != rNONE || char_died(ch) || char_died(victim) )
        return retcode;
      for ( aff = wield->first_affect; aff; aff = aff->next )
        if ( aff->location == APPLY_WEAPONSPELL
             &&   IS_VALID_SN(aff->modifier)
             &&   skill_table[aff->modifier]->spell_fun )
          retcode = (*skill_table[aff->modifier]->spell_fun) ( aff->modifier, (wield->level+3)/3, ch, victim );
      if ( retcode != rNONE || char_died(ch) || char_died(victim) )
        return retcode;
    }

  /*
   * magic shields that retaliate                               -Thoric
   */
  if ( IS_AFFECTED( victim, AFF_FIRESHIELD )
       &&  !IS_AFFECTED( ch, AFF_FIRESHIELD ) )
    retcode = spell_fireball( gsn_fireball, off_shld_lvl(victim, ch), victim, ch );
  if ( retcode != rNONE || char_died(ch) || char_died(victim) )
    return retcode;

  if ( retcode != rNONE || char_died(ch) || char_died(victim) )
    return retcode;

  if ( IS_AFFECTED( victim, AFF_SHOCKSHIELD )
       &&  !IS_AFFECTED( ch, AFF_SHOCKSHIELD ) )
    retcode = spell_lightning_bolt( gsn_lightning_bolt, off_shld_lvl(victim, ch), victim, ch );
  if ( retcode != rNONE || char_died(ch) || char_died(victim) )
    return retcode;

  /*
   *   folks with blasters move and snipe instead of getting neatin up in one spot.
   */
  if ( IS_NPC(victim) )
    {
      OBJ_DATA *wielding = get_eq_char( victim, WEAR_WIELD );
      if ( wielding != NULL && wielding->value[3] == WEAPON_BLASTER && get_cover( victim ) == TRUE )
        {
          start_hating( victim, ch );
          start_hunting( victim, ch );
        }
    }

  return retcode;
}

/*
 * Calculate damage based on resistances, immunities and suceptibilities
 *                                      -Thoric
 */
short ris_damage( CHAR_DATA *ch, short dam, int ris )
{
  short modifier;

  modifier = 10;
  if ( IS_SET(ch->immune, ris ) )
    modifier -= 10;
  if ( IS_SET(ch->resistant, ris ) )
    modifier -= 2;
  if ( IS_SET(ch->susceptible, ris ) )
    modifier += 2;
  if ( modifier <= 0 )
    return -1;
  if ( modifier == 10 )
    return dam;
  return (dam * modifier) / 10;
}


/*
 * Inflict damage from a hit.
 */
ch_ret damage( CHAR_DATA *ch, CHAR_DATA *victim, int dam, int dt )
{
  char buf1[MAX_STRING_LENGTH];
  short dameq;
  bool npcvict;
  bool loot;
  int  xp_gain;
  OBJ_DATA *damobj;
  ch_ret retcode;
  short dampmod;

  int init_gold, new_gold, gold_diff;

  retcode = rNONE;

  if ( !ch )
    {
      bug( "Damage: null ch!", 0 );
      return rERROR;
    }
  if ( !victim )
    {
      bug( "Damage: null victim!", 0 );
      return rVICT_DIED;
    }

  if ( victim->position == POS_DEAD )
    return rVICT_DIED;

  npcvict = IS_NPC(victim);

  /*
   * Check damage types for RIS                         -Thoric
   */
  if ( dam && dt != TYPE_UNDEFINED )
    {
      if ( IS_FIRE(dt) )
        dam = ris_damage(victim, dam, RIS_FIRE);
      else
        if ( IS_COLD(dt) )
          dam = ris_damage(victim, dam, RIS_COLD);
        else
          if ( IS_ACID(dt) )
            dam = ris_damage(victim, dam, RIS_ACID);
          else
            if ( IS_ELECTRICITY(dt) )
              dam = ris_damage(victim, dam, RIS_ELECTRICITY);
            else
              if ( IS_ENERGY(dt) || dt == ( TYPE_HIT + 6 ))
                dam = ris_damage(victim, dam, RIS_ENERGY);
              else
                if ( IS_DRAIN(dt) )
                  dam = ris_damage(victim, dam, RIS_DRAIN);
                else
                  if ( dt == gsn_poison || IS_POISON(dt) )
                    dam = ris_damage(victim, dam, RIS_POISON);
                  else
                    if ( dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8) )
                      dam = ris_damage(victim, dam, RIS_BLUNT);
                    else
                      if ( dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11)
                           ||   dt == (TYPE_HIT + 10) )
                        dam = ris_damage(victim, dam, RIS_PIERCE);
                      else
                        if ( dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3)
                             ||   dt == (TYPE_HIT + 4) || dt == (TYPE_HIT + 5) )
                          dam = ris_damage(victim, dam, RIS_SLASH);

      if ( dam == -1 )
        {
          if ( dt >= 0 && dt < top_sn )
            {
              bool found = FALSE;
              SKILLTYPE *skill = skill_table[dt];

              if ( skill->imm_char && skill->imm_char[0] != '\0' )
                {
                  act( AT_HIT, skill->imm_char, ch, NULL, victim, TO_CHAR );
                  found = TRUE;
                }
              if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
                {
                  act( AT_HITME, skill->imm_vict, ch, NULL, victim, TO_VICT );
                  found = TRUE;
                }
              if ( skill->imm_room && skill->imm_room[0] != '\0' )
                {
                  act( AT_ACTION, skill->imm_room, ch, NULL, victim, TO_NOTVICT );
                  found = TRUE;
                }
              if ( found )
                return rNONE;
            }
          dam = 0;
        }
    }

  if ( dam && npcvict && ch != victim )
    {
      if ( !IS_SET( victim->act, ACT_SENTINEL ) )
        {
          if ( victim->hunting )
            {
              if ( victim->hunting->who != ch )
                {
                  STRFREE( victim->hunting->name );
                  victim->hunting->name = QUICKLINK( ch->name );
                  victim->hunting->who  = ch;
                }
            }
          else
            start_hunting( victim, ch );
        }

      if ( victim->hating )
        {
          if ( victim->hating->who != ch )
            {
              STRFREE( victim->hating->name );
              victim->hating->name = QUICKLINK( ch->name );
              victim->hating->who  = ch;
            }
        }
      else
        start_hating( victim, ch );
    }

  if ( victim != ch )
    {
      /*
       * Certain attacks are forbidden.
       * Most other attacks are returned.
       */
      if ( is_safe( ch, victim ) )
        return rNONE;


      if ( victim->position > POS_STUNNED )
        {
          if ( !victim->fighting )
            set_fighting( victim, ch );
          if ( victim->fighting )
            victim->position = POS_FIGHTING;
        }

      if ( victim->position > POS_STUNNED )
        {
          if ( !ch->fighting )
            set_fighting( ch, victim );

          /*
           * If victim is charmed, ch might attack victim's master.
           */
          if ( IS_NPC(ch)
               &&   npcvict
               &&   IS_AFFECTED(victim, AFF_CHARM)
               &&   victim->master
               &&   victim->master->in_room == ch->in_room
               &&   number_bits( 3 ) == 0 )
            {
              stop_fighting( ch, FALSE );
              retcode = multi_hit( ch, victim->master, TYPE_UNDEFINED );
              return retcode;
            }
        }


      /*
       * More charm stuff.
       */
      if ( victim->master == ch )
        stop_follower( victim );


      /*
       * Inviso attacks ... not.
       */
      if ( IS_AFFECTED(ch, AFF_INVISIBLE))
        {
          affect_strip( ch, gsn_invis );
          affect_strip( ch, gsn_mass_invis );
          REMOVE_BIT( ch->affected_by, AFF_INVISIBLE );
          act( AT_MAGIC, "$n fades into existence.", ch, NULL, NULL, TO_ROOM );
        }

      /* Take away Hide */
      if ( IS_AFFECTED(ch, AFF_HIDE) && ch->race != RACE_DEFEL )
        REMOVE_BIT(ch->affected_by, AFF_HIDE);
      /*
       * Damage modifiers.
       */
      if ( IS_AFFECTED(victim, AFF_SANCTUARY) )
        dam /= 2;

      if ( IS_AFFECTED(victim, AFF_PROTECT) && IS_EVIL(ch) )
        dam -= (int) (dam / 4);

      if ( dam < 0 )
        dam = 0;

      /*
       * Check for disarm, trip, parry, and dodge.
       */
      if ( dt >= TYPE_HIT )
        {
          if ( IS_NPC(ch)
               &&   IS_SET( ch->attacks, DFND_DISARM )
               &&   number_percent( ) < ch->skill_level[COMBAT_ABILITY] / 2 )
            disarm( ch, victim );

          if ( IS_NPC(ch)
               &&   IS_SET( ch->attacks, ATCK_TRIP )
               &&   number_percent( ) < ch->skill_level[COMBAT_ABILITY] )
            trip( ch, victim );

          if ( check_parry( ch, victim ) )
            return rNONE;
          if ( check_dodge( ch, victim ) )
            return rNONE;
        }



      /*
       * Check control panel settings and modify damage
       */
      if ( IS_NPC(ch) )
        {
          if ( npcvict )
            dampmod = sysdata.dam_mob_vs_mob;
          else
            dampmod = sysdata.dam_mob_vs_plr;
        }
      else
        {
          if ( npcvict )
            dampmod = sysdata.dam_plr_vs_mob;
          else
            dampmod = sysdata.dam_plr_vs_plr;
        }
      if ( dampmod > 0 )
        dam = ( dam * dampmod ) / 100;

      dam_message( ch, victim, dam, dt );
    }


  /*
   * Code to handle equipment getting damaged, and also support  -Thoric
   * bonuses/penalties for having or not having equipment where hit
   */
  if (dam > 10 && dt != TYPE_UNDEFINED)
    {
      /* get a random body eq part */
      dameq  = number_range(WEAR_LIGHT, WEAR_EYES);
      damobj = get_eq_char(victim, dameq);
      if ( damobj )
        {
          if ( dam > get_obj_resistance(damobj) )
            {
              set_cur_obj(damobj);
              damage_obj(damobj);
            }
          dam -= 5;  /* add a bonus for having something to block the blow */
        }
      else
        dam += 5;  /* add penalty for bare skin! */
    }

  /*
   * Hurt the victim.
   * Inform the victim of his new state.
   */

  victim->hit -= dam;

  /*
   * Get experience based on % of damage done                   -Thoric
   */
  if ( dam && ch != victim
       &&  !IS_NPC(ch) && ch->fighting && ch->fighting->xp )
    {
      xp_gain = (int) (xp_compute( ch, victim ) * 0.1 * dam) / victim->max_hit;
      gain_exp( ch, xp_gain, COMBAT_ABILITY );
    }

  if ( !IS_NPC(victim)
       &&   ( victim->top_level >= LEVEL_IMMORTAL
              ||     IS_SET(victim->in_room->room_flags,ROOM_ARENA) )
       &&   victim->hit < 1 )
    {
      victim->hit = 1;
      if (IS_SET(victim->in_room->room_flags, ROOM_ARENA) )
        {
          char buf[MAX_STRING_LENGTH];
          char_from_room(victim);
          char_to_room(victim,get_room_index(victim->retran));
          do_look(victim, "auto");
          act(AT_YELLOW,"$n falls from the sky.", victim, NULL, NULL, TO_ROOM);
          victim->hit = victim->max_hit;
          victim->mana = victim->max_mana;
          victim->move = victim->max_move;
          sprintf(buf,"%s is out of the fight.",victim->name);
          to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
          stop_fighting(victim, TRUE);

        }
    }

  if ( IS_NPC(victim) && IS_SET(victim->act,ACT_IMMORTAL) )
    victim->hit = victim->max_hit;

  /* Make sure newbies dont die */

  if (!IS_NPC(victim) && NOT_AUTHED(victim) && victim->hit < 1)
    victim->hit = 1;

  if ( dam > 0 && dt > TYPE_HIT
       && !IS_AFFECTED( victim, AFF_POISON )
       &&  is_wielding_poisoned( ch )
       && !IS_SET( victim->immune, RIS_POISON )
       && !saves_poison_death( ch->skill_level[COMBAT_ABILITY], victim ) )
    {
      AFFECT_DATA af;

      af.type      = gsn_poison;
      af.duration  = 20;
      af.location  = APPLY_STR;
      af.modifier  = -2;
      af.bitvector = AFF_POISON;
      affect_join( victim, &af );
      ch->mental_state = URANGE( 20, ch->mental_state + 2, 100 );
    }

  if ( !npcvict
       &&   get_trust(victim) >= LEVEL_IMMORTAL
       &&        get_trust(ch)     >= LEVEL_IMMORTAL
       &&   victim->hit < 1 )
    victim->hit = 1;
  update_pos( victim );

  switch( victim->position )
    {
    case POS_MORTAL:
      act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      send_to_char( "&RYou are mortally wounded, and will die soon, if not aided.",victim);
      break;

    case POS_INCAP:
      act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      send_to_char( "&RYou are incapacitated and will slowly die, if not aided.",victim);
      break;

    case POS_STUNNED:
      if ( !IS_AFFECTED( victim, AFF_PARALYSIS ) )
        {
          act( AT_ACTION, "$n is stunned, but will probably recover.",
               victim, NULL, NULL, TO_ROOM );
          send_to_char( "&RYou are stunned, but will probably recover.",victim);
        }
      break;

    case POS_DEAD:
      if ( dt >= 0 && dt < top_sn )
        {
          SKILLTYPE *skill = skill_table[dt];

          if ( skill->die_char && skill->die_char[0] != '\0' )
            act( AT_DEAD, skill->die_char, ch, NULL, victim, TO_CHAR );
          if ( skill->die_vict && skill->die_vict[0] != '\0' )
            act( AT_DEAD, skill->die_vict, ch, NULL, victim, TO_VICT );
          if ( skill->die_room && skill->die_room[0] != '\0' )
            act( AT_DEAD, skill->die_room, ch, NULL, victim, TO_NOTVICT );
        }
      if ( IS_NPC(victim) && IS_SET( victim->act, ACT_NOKILL )  )
        act( AT_YELLOW, "$n flees for $s life ... barely escaping certain death!", victim, 0, 0, TO_ROOM );
      else if ( (IS_NPC(victim) && IS_SET( victim->act, ACT_DROID ) ) || (!IS_NPC(victim) && victim->race == RACE_DROID ) )
        act( AT_DEAD, "$n EXPLODES into many small pieces!", victim, 0, 0, TO_ROOM );
      else
        act( AT_DEAD, "$n is DEAD!", victim, 0, 0, TO_ROOM );
      send_to_char( "&WYou have been KILLED!\r\n", victim);
      break;

    default:
      if ( dam > victim->max_hit / 4 )
        {
          act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );
          if ( number_bits(3) == 0 )
            worsen_mental_state( ch, 1 );
        }
      if ( victim->hit < victim->max_hit / 4 )

        {
          act( AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
               victim, 0, 0, TO_CHAR );
          if ( number_bits(2) == 0 )
            worsen_mental_state( ch, 1 );
        }
      break;
    }

  /*
   * Sleep spells and extremely wounded folks.
   */
  if ( !IS_AWAKE(victim)                /* lets make NPC's not slaughter PC's */
       &&   !IS_AFFECTED( victim, AFF_PARALYSIS ) )
    {
      if ( victim->fighting
           &&   victim->fighting->who->hunting
           &&   victim->fighting->who->hunting->who == victim )
        stop_hunting( victim->fighting->who );

      if ( victim->fighting
           &&   victim->fighting->who->hating
           &&   victim->fighting->who->hating->who == victim )
        stop_hating( victim->fighting->who );

      stop_fighting( victim, TRUE );
    }

  if ( victim->hit <=0 && !IS_NPC(victim))
    {
      OBJ_DATA *obj;
      OBJ_DATA *obj_next;
      int cnt=0;

      /* REMOVE_BIT( victim->act, PLR_ATTACKER ); Removed to add PLR_DONTAUTOFUEL */

      stop_fighting( victim, TRUE );

      if ( ( obj = get_eq_char( victim, WEAR_DUAL_WIELD ) ) != NULL )
        unequip_char( victim, obj );
      if ( ( obj = get_eq_char( victim, WEAR_WIELD ) ) != NULL )
        unequip_char( victim, obj );
      if ( ( obj = get_eq_char( victim, WEAR_HOLD ) ) != NULL )
        unequip_char( victim, obj );
      if ( ( obj = get_eq_char( victim, WEAR_MISSILE_WIELD ) ) != NULL )
        unequip_char( victim, obj );
      if ( ( obj = get_eq_char( victim, WEAR_LIGHT ) ) != NULL )
        unequip_char( victim, obj );

      for ( obj = victim->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;

          if ( obj->wear_loc == WEAR_NONE )
            {
              if ( obj->pIndexData->progtypes & DROP_PROG && obj->count > 1 )
                {
                  ++cnt;
                  separate_obj( obj );
                  obj_from_char( obj );
                  if ( !obj_next )
                    obj_next = victim->first_carrying;
                }
              else
                {
                  cnt += obj->count;
                  obj_from_char( obj );
                }
              act( AT_ACTION, "$n drops $p.", victim, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You drop $p.", victim, obj, NULL, TO_CHAR );
              obj = obj_to_room( obj, victim->in_room );
            }
        }

      if ( IS_NPC( ch ) && !IS_NPC( victim ) )
        {
          long lose_exp;
          lose_exp = UMAX( ( victim->experience[COMBAT_ABILITY] - exp_level( victim->skill_level[COMBAT_ABILITY] ) ) , 0 );
          ch_printf( victim, "You lose %ld experience.\r\n", lose_exp );
          victim->experience[COMBAT_ABILITY] -= lose_exp;
        }

      add_timer( victim, TIMER_RECENTFIGHT, 100, NULL, 0 );

    }

  /*
   * Payoff for killing things.
   */
  if ( victim->position == POS_DEAD )
    {
      group_gain( ch, victim );

      if ( !npcvict )
        {
          sprintf( log_buf, "%s killed by %s at %d",
                   victim->name,
                   (IS_NPC(ch) ? ch->short_descr : ch->name),
                   victim->in_room->vnum );
          log_string( log_buf );
          to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );

        }
      else
        if ( !IS_NPC(ch) )              /* keep track of mob vnum killed */
          add_kill( ch, victim );

      check_killer( ch, victim );

      if ( !IS_NPC( ch ) && ch->pcdata->clan )
        update_member( ch );
      if ( !IS_NPC( victim ) && victim->pcdata->clan )
        update_member( victim );

      if ( victim->in_room != ch->in_room || !IS_NPC(victim) || !IS_SET( victim->act, ACT_NOKILL )  )
        loot = legal_loot( ch, victim );
      else
        loot = FALSE;

      set_cur_char(victim);
      raw_kill( ch, victim );
      victim = NULL;

      if ( !IS_NPC(ch) && loot )
        {
          /* Autogold by Scryn 8/12 */
          if ( IS_SET(ch->act, PLR_AUTOGOLD) )
            {
              init_gold = ch->gold;
              do_get( ch, "credits corpse" );
              new_gold = ch->gold;
              gold_diff = (new_gold - init_gold);
              if (gold_diff > 0)
                {
                  sprintf(buf1,"%d",gold_diff);
                  do_split( ch, buf1 );
                }
            }
          if ( IS_SET(ch->act, PLR_AUTOLOOT) )
            do_get( ch, "all corpse" );
          else
            do_look( ch, "in corpse" );

          if ( IS_SET(ch->act, PLR_AUTOSAC) )
            do_sacrifice( ch, "corpse" );
        }
      if (IS_NPC(ch) && loot)
        {
          do_get( ch, "credits corpse" );
          do_get( ch, "all corpse" );
          if( ch->in_room && ch->in_room->area )
            {
              boost_economy( ch->in_room->area, ch->gold / 5 );
              ch->gold /= 5;
            }
        }
      if( !loot && victim && IS_NPC(victim) )
        if( victim->in_room && victim->in_room->area )
          boost_economy( victim->in_room->area, victim->gold );

      if ( IS_SET( sysdata.save_flags, SV_KILL ) )
        save_char_obj( ch );
      return rVICT_DIED;
    }

  if ( victim == ch )
    return rNONE;

  /*
   * Take care of link dead people.
   */
  if ( !npcvict && !victim->desc && !victim->switched )
    {
      if ( number_range( 0, victim->wait ) == 0)
        {
          do_flee( victim, "" );
          do_flee( victim, "" );
          do_flee( victim, "" );
          do_flee( victim, "" );
          do_flee( victim, "" );
          do_hail( victim, "" );
          do_quit( victim, "" );
          return rNONE;
        }
    }

  /*
   * Wimp out?
   */
  if ( npcvict && dam > 0 )
    {
      if ( ( IS_SET(victim->act, ACT_WIMPY) && number_bits( 1 ) == 0
             &&   victim->hit < victim->max_hit / 2 )
           ||   ( IS_AFFECTED(victim, AFF_CHARM) && victim->master
                  &&     victim->master->in_room != victim->in_room ) )
        {
          start_fearing( victim, ch );
          stop_hunting( victim );
          do_flee( victim, "" );
        }
    }

  if ( !npcvict
       &&   victim->hit > 0
       &&   victim->hit <= victim->wimpy
       &&   victim->wait == 0 )
    do_flee( victim, "" );
  else
    if ( !npcvict && IS_SET( victim->act, PLR_FLEE ) )
      do_flee( victim, "" );

  return rNONE;
}

bool is_safe( CHAR_DATA *ch, CHAR_DATA *victim )
{
  if ( !victim )
    return FALSE;

  /* Thx Josh! */
  if ( who_fighting( ch ) == ch )
    return FALSE;

  if ( IS_SET( victim->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You'll have to do that elswhere.\r\n", ch );
      return TRUE;
    }

  if ( get_trust(ch) > LEVEL_HERO )
    return FALSE;

  if ( IS_NPC(ch) || IS_NPC(victim) )
    return FALSE;


  return FALSE;

}

/* checks is_safe but without the output
   cuts out imms and safe rooms as well
   for info only */

bool is_safe_nm( CHAR_DATA *ch, CHAR_DATA *victim )
{
  return FALSE;
}


/*
 * just verify that a corpse looting is legal
 */
bool legal_loot( CHAR_DATA *ch, CHAR_DATA *victim )
{
  /* pc's can now loot .. why not .. death is pretty final */
  if ( !IS_NPC(ch) )
    return TRUE;
  /* non-charmed mobs can loot anything */
  if ( IS_NPC(ch) && !ch->master )
    return TRUE;

  return FALSE;
}

/*
  see if an attack justifies a KILLER flag --- edited so that none do but can't
  murder a no pk person. --- edited again for planetary wanted flags -- well will be soon :p
*/

void check_killer( CHAR_DATA *ch, CHAR_DATA *victim )
{

  int x;

  /*
   * Charm-o-rama.
   */
  if ( IS_SET(ch->affected_by, AFF_CHARM) )
    {
      if ( !ch->master )
        {
          char buf[MAX_STRING_LENGTH];

          sprintf( buf, "Check_killer: %s bad AFF_CHARM",
                   IS_NPC(ch) ? ch->short_descr : ch->name );
          bug( buf, 0 );
          affect_strip( ch, gsn_charm_person );
          REMOVE_BIT( ch->affected_by, AFF_CHARM );
          return;
        }

      /* stop_follower( ch ); */
      if ( ch->master )
        check_killer( ch->master, victim );
    }

  if ( IS_NPC(victim) )
    {
      if ( !IS_NPC( ch ) )
        {
          for ( x = 0; x < 32; x++ )
            {
              if ( IS_SET(victim->vip_flags , 1 << x ) )
                {
                  SET_BIT(ch->pcdata->wanted_flags, 1 << x );
                  ch_printf( ch, "&YYou are now wanted on %s.&w\r\n", planet_flags[x] , victim->short_descr );
                }
            }
          if ( ch->pcdata->clan )
            ch->pcdata->clan->mkills++;
          ch->pcdata->mkills++;
          ch->in_room->area->mkills++;
        }
      return;
    }

  if ( !IS_NPC(ch) && !IS_NPC(victim) )
    {
      if ( ch->pcdata->clan ) ch->pcdata->clan->pkills++;
      ch->pcdata->pkills++;
      update_pos(victim);
      if ( victim->pcdata->clan )
        victim->pcdata->clan->pdeaths++;
    }


  if ( IS_NPC(ch) )
    if ( !IS_NPC(victim) )
      victim->in_room->area->mdeaths++;

  return;
}



/*
 * Set position of a victim.
 */
void update_pos( CHAR_DATA *victim )
{
  if ( !victim )
    {
      bug( "update_pos: null victim", 0 );
      return;
    }

  if ( victim->hit > 0 )
    {
      if ( victim->position <= POS_STUNNED )
        victim->position = POS_STANDING;
      if ( IS_AFFECTED( victim, AFF_PARALYSIS ) )
        victim->position = POS_STUNNED;
      return;
    }

#ifdef NODEATH
  if ( !IS_NPC(victim) && victim->hit <= -500 )
    victim->hit = -250;
#endif

  if ( IS_NPC(victim) || victim->hit <= -500 )
    {
      if ( victim->mount )
        {
          act( AT_ACTION, "$n falls from $N.",
               victim, NULL, victim->mount, TO_ROOM );
          REMOVE_BIT( victim->mount->act, ACT_MOUNTED );
          victim->mount = NULL;
        }
      victim->position = POS_DEAD;
      return;
    }

  if ( victim->hit <= -400 ) victim->position = POS_MORTAL;
  else if ( victim->hit <= -200 ) victim->position = POS_INCAP;
  else                          victim->position = POS_STUNNED;

  if ( victim->position > POS_STUNNED
       &&   IS_AFFECTED( victim, AFF_PARALYSIS ) )
    victim->position = POS_STUNNED;

  if ( victim->mount )
    {
      act( AT_ACTION, "$n falls unconscious from $N.",
           victim, NULL, victim->mount, TO_ROOM );
      REMOVE_BIT( victim->mount->act, ACT_MOUNTED );
      victim->mount = NULL;
    }
  return;
}


/*
 * Start fights.
 */
void set_fighting( CHAR_DATA *ch, CHAR_DATA *victim )
{
  FIGHT_DATA *fight;

  if ( ch->fighting )
    {
      char buf[MAX_STRING_LENGTH];

      sprintf( buf, "Set_fighting: %s -> %s (already fighting %s)",
               ch->name, victim->name, ch->fighting->who->name );
      bug( buf, 0 );
      return;
    }

  if ( IS_AFFECTED(ch, AFF_SLEEP) )
    affect_strip( ch, gsn_sleep );

  /* Limit attackers -Thoric */
  if ( victim->num_fighting > max_fight(victim) )
    {
      send_to_char( "There are too many people fighting for you to join in.\r\n", ch );
      return;
    }

  CREATE( fight, FIGHT_DATA, 1 );
  fight->who     = victim;
  fight->xp      = (int) xp_compute( ch, victim );
  fight->align = align_compute( ch, victim );
  if ( !IS_NPC(ch) && IS_NPC(victim) )
    fight->timeskilled = times_killed(ch, victim);
  ch->num_fighting = 1;
  ch->fighting = fight;
  ch->position = POS_FIGHTING;
  victim->num_fighting++;
  if ( victim->switched && IS_AFFECTED(victim->switched, AFF_POSSESS) )
    {
      send_to_char( "You are disturbed!\r\n", victim->switched );
      do_return( victim->switched, "" );
    }
  return;
}


CHAR_DATA *who_fighting( CHAR_DATA *ch )
{
  if ( !ch )
    {
      bug( "who_fighting: null ch", 0 );
      return NULL;
    }
  if ( !ch->fighting )
    return NULL;
  return ch->fighting->who;
}

void free_fight( CHAR_DATA *ch )
{
  if ( !ch )
    {
      bug( "Free_fight: null ch!", 0 );
      return;
    }
  if ( ch->fighting )
    {
      if ( !char_died(ch->fighting->who) )
        --ch->fighting->who->num_fighting;
      DISPOSE( ch->fighting );
    }
  ch->fighting = NULL;
  if ( ch->mount )
    ch->position = POS_MOUNTED;
  else
    ch->position = POS_STANDING;
  /* Berserk wears off after combat. -- Altrag */
  if ( IS_AFFECTED(ch, AFF_BERSERK) )
    {
      affect_strip(ch, gsn_berserk);
      set_char_color(AT_WEAROFF, ch);
      send_to_char(skill_table[gsn_berserk]->msg_off, ch);
      send_to_char("\r\n", ch);
    }
  return;
}


/*
 * Stop fights.
 */
void stop_fighting( CHAR_DATA *ch, bool fBoth )
{
  CHAR_DATA *fch;

  free_fight( ch );
  update_pos( ch );

  if ( !fBoth )   /* major short cut here by Thoric */
    return;

  for ( fch = first_char; fch; fch = fch->next )
    {
      if ( who_fighting( fch ) == ch )
        {
          free_fight( fch );
          update_pos( fch );
        }
    }
  return;
}



void death_cry( CHAR_DATA *ch )
{

  return;
}



void raw_kill( CHAR_DATA *ch, CHAR_DATA *victim )
{

  CHAR_DATA *victmp;

  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char arg[MAX_STRING_LENGTH];
  OBJ_DATA *obj, *obj_next;
  SHIP_DATA *ship;

  if ( !victim )
    {
      bug( "raw_kill: null victim!", 0 );
      return;
    }

  strcpy( arg , victim->name );

  if ( !IS_NPC( victim ) && victim->pcdata->clan )
    remove_member( victim );


  stop_fighting( victim, TRUE );

  if ( ch && !IS_NPC(ch) && !IS_NPC(victim) )
    claim_disintigration( ch , victim );

  /* Take care of polymorphed chars */
  if(IS_NPC(victim) && IS_SET(victim->act, ACT_POLYMORPHED))
    {
      char_from_room(victim->desc->original);
      char_to_room(victim->desc->original, victim->in_room);
      victmp = victim->desc->original;
      do_revert(victim, "");
      raw_kill(ch, victmp);
      return;
    }

  if ( victim->in_room && IS_NPC(victim) && victim->vip_flags != 0 && victim->in_room->area && victim->in_room->area->planet )
    {
      victim->in_room->area->planet->population--;
      victim->in_room->area->planet->population = UMAX( victim->in_room->area->planet->population , 0 );
      victim->in_room->area->planet->pop_support -= (float) ( 1 + 1 / (victim->in_room->area->planet->population + 1) );
      if ( victim->in_room->area->planet->pop_support < -100 )
        victim->in_room->area->planet->pop_support = -100;
    }

  if ( !IS_NPC(victim) || !IS_SET( victim->act, ACT_NOKILL  ) )
    mprog_death_trigger( ch, victim );
  if ( char_died(victim) )
    return;

  if ( !IS_NPC(victim) || !IS_SET( victim->act, ACT_NOKILL  ) )
    rprog_death_trigger( ch, victim );
  if ( char_died(victim) )
    return;

  if ( !IS_NPC(victim) || ( !IS_SET( victim->act, ACT_NOKILL  ) && !IS_SET( victim->act, ACT_NOCORPSE ) ) )
    make_corpse( victim, ch );
  else
    {
      for ( obj = victim->last_carrying; obj; obj = obj_next )
        {
          obj_next = obj->prev_content;
          obj_from_char( obj );
          extract_obj( obj );
        }
    }

  /*    make_blood( victim ); */

  if ( IS_NPC(victim) )
    {
      if ( victim->pIndexData->vnum == ch->questmob )
        {
          ch->questmob = -1;
          send_to_char("&RYou have completed your quest! Return to your employer now to gain the reward!\r\n",ch);

        }
      victim->pIndexData->killed++;
      extract_char( victim, TRUE );
      victim = NULL;
      return;
    }

  set_char_color( AT_DIEMSG, victim );
  do_help(victim, "_DIEMSG_" );


  /* swreality chnages begin here */


  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( !str_cmp( ship->owner, victim->name ) )
        {
          STRFREE( ship->owner );
          ship->owner = STRALLOC( "" );
          STRFREE( ship->pilot );
          ship->pilot = STRALLOC( "" );
          STRFREE( ship->copilot );
          ship->copilot = STRALLOC( "" );

          save_ship( ship );
        }

    }


  if ( victim->plr_home )
    {
      ROOM_INDEX_DATA *room = victim->plr_home;

      STRFREE( room->name );
      room->name = STRALLOC( "An Empty Apartment" );

      REMOVE_BIT( room->room_flags , ROOM_PLR_HOME );
      SET_BIT( room->room_flags , ROOM_EMPTY_HOME );

      fold_area( room->area, room->area->filename, FALSE );
    }

  if ( victim->pcdata && victim->pcdata->clan )
    {
      if ( !str_cmp( victim->name, victim->pcdata->clan->leader ) )
        {
          STRFREE( victim->pcdata->clan->leader );
          if ( victim->pcdata->clan->number1 )
            {
              victim->pcdata->clan->leader = STRALLOC( victim->pcdata->clan->number1 );
              STRFREE( victim->pcdata->clan->number1 );
              victim->pcdata->clan->number1 = STRALLOC( "" );
            }
          else if ( victim->pcdata->clan->number2 )
            {
              victim->pcdata->clan->leader = STRALLOC( victim->pcdata->clan->number2 );
              STRFREE( victim->pcdata->clan->number2 );
              victim->pcdata->clan->number2 = STRALLOC( "" );
            }
          else
            victim->pcdata->clan->leader = STRALLOC( "" );
        }

      if ( !str_cmp( victim->name, victim->pcdata->clan->number1 ) )
        {
          STRFREE( victim->pcdata->clan->number1 );
          if ( victim->pcdata->clan->number2 )
            {
              victim->pcdata->clan->number1 = STRALLOC( victim->pcdata->clan->number2 );
              STRFREE( victim->pcdata->clan->number2 );
              victim->pcdata->clan->number2 = STRALLOC( "" );
            }
          else
            victim->pcdata->clan->number1 = STRALLOC( "" );
        }

      if ( !str_cmp( victim->name, victim->pcdata->clan->number2 ) )
        {
          STRFREE( victim->pcdata->clan->number2 );
          victim->pcdata->clan->number1 = STRALLOC( "" );
        }

      victim->pcdata->clan->members--;
    }

  if ( !victim )
    {
      DESCRIPTOR_DATA *d;

      /* Make sure they aren't halfway logged in. */
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) && !IS_NPC(victim)  )
          break;
      if ( d )
        close_socket( d, TRUE );
    }
  else
    {
      int x, y;

      quitting_char = victim;
      save_char_obj( victim );
      saving_char = NULL;
      extract_char( victim, TRUE );
      for ( x = 0; x < MAX_WEAR; x++ )
        for ( y = 0; y < MAX_LAYERS; y++ )
          save_equipment[x][y] = NULL;
    }

  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
           capitalize( arg ) );

  rename( buf, buf2 );

  sprintf( buf, "%s%c/%s.clone", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );

  rename( buf, buf2 );

  sprintf( buf, "%s%s", GOD_DIR, capitalize(victim->name) );

  if ( !remove( buf ) )
    send_to_char( "Player's immortal data destroyed.\r\n", ch );
  else if ( errno != ENOENT )
    {
      ch_printf( ch, "Unknown error #%d - %s (immortal data).  Report to Darrik\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s slaying %s", ch->name, buf );
      perror( buf2 );
    }

  sprintf( buf, "%s%c/%s.home", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );
  remove( buf );

  return;


  /* original player kill started here

     extract_char( victim, FALSE );
     if ( !victim )
     {
     bug( "oops! raw_kill: extract_char destroyed pc char", 0 );
     return;
     }
     while ( victim->first_affect )
     affect_remove( victim, victim->first_affect );
     victim->affected_by        = race_table[victim->race].affected;
     victim->resistant   = 0;
     victim->susceptible = 0;
     victim->immune      = 0;
     victim->carry_weight= 0;
     victim->armor      = 100;
     victim->mod_str    = 0;
     victim->mod_dex    = 0;
     victim->mod_wis    = 0;
     victim->mod_int    = 0;
     victim->mod_con    = 0;
     victim->mod_cha    = 0;
     victim->mod_lck    = 0;
     victim->damroll    = 0;
     victim->hitroll    = 0;
     victim->mental_state = -10;
     victim->alignment  = URANGE( -1000, victim->alignment, 1000 );
     victim->saving_spell_staff = 0;
     victim->position   = POS_RESTING;
     victim->hit                = UMAX( 1, victim->hit  );
     victim->mana       = UMAX( 1, victim->mana );
     victim->move       = UMAX( 1, victim->move );

     victim->pcdata->condition[COND_FULL]   = 12;
     victim->pcdata->condition[COND_THIRST] = 12;

     if ( IS_SET( sysdata.save_flags, SV_DEATH ) )
     save_char_obj( victim );
     return;

  */

}



void group_gain( CHAR_DATA *ch, CHAR_DATA *victim )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *gch;
  CHAR_DATA *lch;
  int xp;
  int members;

  /*
   * Monsters don't get kill xp's or alignment changes.
   * Dying of mortal wounds or poison doesn't give xp to anyone!
   */
  if ( IS_NPC(ch) || victim == ch )
    return;

  members = 0;

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( is_same_group( gch, ch ) )
        members++;
    }

  if ( members == 0 )
    {
      bug( "Group_gain: members.", members );
      members = 1;
    }

  lch = ch->leader ? ch->leader : ch;

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      OBJ_DATA *obj;
      OBJ_DATA *obj_next;

      if ( !is_same_group( gch, ch ) )
        continue;

      xp = (int) (xp_compute( gch, victim ) / members);

      gch->alignment = align_compute( gch, victim );

      if ( !IS_NPC(gch) && IS_NPC(victim) && gch->pcdata && gch->pcdata->clan
           && !str_cmp ( gch->pcdata->clan->name , victim->mob_clan ) )
        {
          xp = 0;
          sprintf( buf, "You receive no experience for killing your organizations resources.\r\n");
          send_to_char( buf, gch );
        }
      else
        {
          sprintf( buf, "You receive %d combat experience.\r\n", xp );
          send_to_char( buf, gch );
        }

      gain_exp( gch, xp , COMBAT_ABILITY );

      if ( lch == gch && members > 1 )
        {
          xp = URANGE( members, xp*members, (exp_level( gch->skill_level[LEADERSHIP_ABILITY]+1) - exp_level(gch->skill_level[LEADERSHIP_ABILITY] )/10) );
          sprintf( buf, "You get %d leadership experience for leading your group to victory.\r\n", xp );
          send_to_char( buf, gch );
          gain_exp( gch, xp , LEADERSHIP_ABILITY );
        }


      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->wear_loc == WEAR_NONE )
            continue;

          if ( ( IS_OBJ_STAT(obj, ITEM_ANTI_EVIL)    && IS_EVIL(ch)    )
               ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_GOOD)    && IS_GOOD(ch)    )
               ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_NEUTRAL) && IS_NEUTRAL(ch) ) )
            {
              act( AT_MAGIC, "You are zapped by $p.", ch, obj, NULL, TO_CHAR );
              act( AT_MAGIC, "$n is zapped by $p.",   ch, obj, NULL, TO_ROOM );

              obj_from_char( obj );
              obj = obj_to_room( obj, ch->in_room );
              oprog_zap_trigger(ch, obj);  /* mudprogs */
              if ( char_died(ch) )
                return;
            }
        }
    }

  return;
}


int align_compute( CHAR_DATA *gch, CHAR_DATA *victim )
{

  /* never cared much for this system

     int align, newalign;

     align = gch->alignment - victim->alignment;

     if ( align >  500 )
     newalign  = UMIN( gch->alignment + (align-500)/4,  1000 );
     else
     if ( align < -500 )
     newalign  = UMAX( gch->alignment + (align+500)/4, -1000 );
     else
     newalign  = gch->alignment - (int) (gch->alignment / 4);

     return newalign;

     make it simple instead */

  return URANGE ( -1000,
                  (int) ( gch->alignment - victim->alignment/5 ),
                  1000 );

}


/*
 * Calculate how much XP gch should gain for killing victim
 * Lots of redesigning for new exp system by Thoric
 */
int xp_compute( CHAR_DATA *gch, CHAR_DATA *victim )
{
  int align;
  int xp;

  xp      = (get_exp_worth( victim )
             *  URANGE( 1, (victim->skill_level[COMBAT_ABILITY] - gch->skill_level[COMBAT_ABILITY]) + 10, 20 )) / 10;
  align = gch->alignment - victim->alignment;

  /* bonus for attacking opposite alignment */
  if ( align >  990 || align < -990 )
    xp = (xp*5) >> 2;
  else
    /* penalty for good attacking same alignment */
    if ( gch->alignment > 300 && align < 250 )
      xp = (xp*3) >> 2;

  xp = number_range( (xp*3) >> 2, (xp*5) >> 2 );

  /* reduce exp for killing the same mob repeatedly             -Thoric */
  if ( !IS_NPC( gch ) && IS_NPC( victim ) )
    {
      int times = times_killed( gch, victim );

      if ( times >= 5 )
        xp = 0;
      else
        if ( times )
          xp = (xp * (5-times)) / 5;
    }

  /* new xp cap for swreality */

  return URANGE(1, xp, ( exp_level(  gch->skill_level[COMBAT_ABILITY]+1 ) - exp_level( gch->skill_level[COMBAT_ABILITY]) )   );
}


/*
 * Revamped by Thoric to be more realistic
 */
void dam_message( CHAR_DATA *ch, CHAR_DATA *victim, int dam, int dt )
{
  char buf1[256], buf2[256], buf3[256];
  const char *vs;
  const char *vp;
  const char *attack;
  char punct;
  short dampc;
  struct skill_type *skill = NULL;
  bool gcflag = FALSE;
  bool gvflag = FALSE;

  if ( ! dam )
    dampc = 0;
  else
    dampc = ( (dam * 1000) / victim->max_hit) +
      ( 50 - ((victim->hit * 50) / victim->max_hit) );

  /*                 10 * percent                                       */
  if ( dam ==      0 ) { vs = "miss";   vp = "misses";          }
  else if ( dampc <=    5 ) { vs = "barely scratch";vp = "barely scratches";}
  else if ( dampc <=   10 ) { vs = "scratch";   vp = "scratches";       }
  else if ( dampc <=   20 ) { vs = "nick";      vp = "nicks";           }
  else if ( dampc <=   30 ) { vs = "graze";     vp = "grazes";          }
  else if ( dampc <=   40 ) { vs = "bruise";    vp = "bruises";         }
  else if ( dampc <=   50 ) { vs = "hit";       vp = "hits";            }
  else if ( dampc <=   60 ) { vs = "injure";    vp = "injures";         }
  else if ( dampc <=   75 ) { vs = "thrash";    vp = "thrashes";        }
  else if ( dampc <=   80 ) { vs = "wound";     vp = "wounds";          }
  else if ( dampc <=   90 ) { vs = "maul";    vp = "mauls";             }
  else if ( dampc <=  125 ) { vs = "decimate";vp = "decimates"; }
  else if ( dampc <=  150 ) { vs = "devastate";vp = "devastates";       }
  else if ( dampc <=  200 ) { vs = "maim";      vp = "maims";           }
  else if ( dampc <=  300 ) { vs = "MUTILATE";vp = "MUTILATES"; }
  else if ( dampc <=  400 ) { vs = "DISEMBOWEL";vp = "DISEMBOWELS";     }
  else if ( dampc <=  500 ) { vs = "MASSACRE";  vp = "MASSACRES";       }
  else if ( dampc <=  600 ) { vs = "PULVERIZE"; vp = "PULVERIZES";      }
  else if ( dampc <=  750 ) { vs = "EVISCERATE";vp = "EVISCERATES";     }
  else if ( dampc <=  990 ) { vs = "* OBLITERATE *";
    vp = "* OBLITERATES *";                     }
  else                      { vs = "*** ANNIHILATE ***";
    vp = "*** ANNIHILATES ***";         }

  punct   = (dampc <= 30) ? '.' : '!';

  if ( dam == 0 && (!IS_NPC(ch) &&
                    (IS_SET(ch->pcdata->flags, PCFLAG_GAG)))) gcflag = TRUE;

  if ( dam == 0 && (!IS_NPC(victim) &&
                    (IS_SET(victim->pcdata->flags, PCFLAG_GAG)))) gvflag = TRUE;

  if ( dt >=0 && dt < top_sn )
    skill = skill_table[dt];

  if ( dt == (TYPE_HIT + WEAPON_BLASTER ) )
    {
      char sound[MAX_STRING_LENGTH];
      int vol = number_range( 20 , 80 );

      sprintf( sound , "!!SOUND(blaster V=%d)" , vol );
      sound_to_room(ch->in_room, sound);
    }

  if ( dt == TYPE_HIT || dam==0 )
    {
      sprintf( buf1, "$n %s $N%c",  vp, punct );
      sprintf( buf2, "You %s $N%c", vs, punct );
      sprintf( buf3, "$n %s you%c", vp, punct );
    }
  else
    if ( dt > TYPE_HIT && is_wielding_poisoned( ch ) )
      {
        if ( dt < TYPE_HIT + (int) attacktable_size() )
	  {
	    attack = get_attacktype_name( dt - TYPE_HIT );
	  }
        else
          {
            bug( "Dam_message: bad dt %d.", dt );
            dt  = TYPE_HIT;
            attack = get_attacktype_name( 0 );
          }

        sprintf( buf1, "$n's poisoned %s %s $N%c", attack, vp, punct );
        sprintf( buf2, "Your poisoned %s %s $N%c", attack, vp, punct );
        sprintf( buf3, "$n's poisoned %s %s you%c", attack, vp, punct );
      }
    else
      {
        if ( skill )
          {
            attack      = skill->noun_damage;
            if ( dam == 0 )
              {
                bool found = FALSE;

                if ( skill->miss_char && skill->miss_char[0] != '\0' )
                  {
                    act( AT_HIT, skill->miss_char, ch, NULL, victim, TO_CHAR );
                    found = TRUE;
                  }
                if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
                  {
                    act( AT_HITME, skill->miss_vict, ch, NULL, victim, TO_VICT );
                    found = TRUE;
                  }
                if ( skill->miss_room && skill->miss_room[0] != '\0' )
                  {
                    act( AT_ACTION, skill->miss_room, ch, NULL, victim, TO_NOTVICT );
                    found = TRUE;
                  }
                if ( found )    /* miss message already sent */
                  return;
              }
            else
              {
                if ( skill->hit_char && skill->hit_char[0] != '\0' )
                  act( AT_HIT, skill->hit_char, ch, NULL, victim, TO_CHAR );
                if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
                  act( AT_HITME, skill->hit_vict, ch, NULL, victim, TO_VICT );
                if ( skill->hit_room && skill->hit_room[0] != '\0' )
                  act( AT_ACTION, skill->hit_room, ch, NULL, victim, TO_NOTVICT );
              }
          }
        else if ( dt >= TYPE_HIT
                  && dt < TYPE_HIT + (int) attacktable_size() )
	  {
	    attack = get_attacktype_name( dt - TYPE_HIT );
	  }
        else
          {
            bug( "Dam_message: bad dt %d.", dt );
            dt  = TYPE_HIT;
            attack = get_attacktype_name( 0 );
          }

        sprintf( buf1, "$n's %s %s $N%c",  attack, vp, punct );
        sprintf( buf2, "Your %s %s $N%c",  attack, vp, punct );
        sprintf( buf3, "$n's %s %s you%c", attack, vp, punct );
      }

  if ( ch->skill_level[COMBAT_ABILITY] >= 50 )
    sprintf( buf2, "%s You do %d points of damage.", buf2, dam);

  act( AT_ACTION, buf1, ch, NULL, victim, TO_NOTVICT );
  if (!gcflag)  act( AT_HIT, buf2, ch, NULL, victim, TO_CHAR );
  if (!gvflag) act( AT_HITME, buf3, ch, NULL, victim, TO_VICT );

  return;
}


void do_kill( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Kill whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !IS_NPC(victim) )
    {
      send_to_char( "You must MURDER a player.\r\n", ch );
      return;
    }

  /*
   *
   else
   {
   if ( IS_AFFECTED(victim, AFF_CHARM) && victim->master != NULL )
   {
   send_to_char( "You must MURDER a charmed creature.\r\n", ch );
   return;
   }
   }
   *
   */

  if ( victim == ch )
    {
      send_to_char( "You hit yourself.  Ouch!\r\n", ch );
      multi_hit( ch, ch, TYPE_UNDEFINED );
      return;
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
    {
      act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You do the best you can!\r\n", ch );
      return;
    }

  if ( victim->vip_flags != 0 && !IS_SET( victim->act, ACT_DROID )  )
    ch->alignment -= 10;

  WAIT_STATE( ch, 1 * PULSE_VIOLENCE );
  multi_hit( ch, victim, TYPE_UNDEFINED );
  return;
}



void do_murde( CHAR_DATA *ch, char *argument )
{
  send_to_char( "If you want to MURDER, spell it out.\r\n", ch );
  return;
}



void do_murder( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  char  logbuf[MAX_STRING_LENGTH];

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Murder whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( IS_AFFECTED(ch, AFF_CHARM) )
    {
      if ( ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
    {
      send_to_char( "You feel too nice to do that!\r\n", ch );
      return;
    }

  if ( !IS_SET( victim->act, ACT_DROID )  )
    ch->alignment -= 10;

  WAIT_STATE( ch, 1 * PULSE_VIOLENCE );
  multi_hit( ch, victim, TYPE_UNDEFINED );
  return;
}

bool in_arena( CHAR_DATA *ch )
{

  if ( !str_cmp( ch->in_room->area->filename, "arena.are" ) )
    return TRUE;

  if ( ch->in_room->vnum < 29 || ch->in_room->vnum > 43 )
    return FALSE;

  return TRUE;
}


void do_flee( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *was_in;
  ROOM_INDEX_DATA *now_in;
  char buf[MAX_STRING_LENGTH];
  int attempt;
  short door;
  EXIT_DATA *pexit;

  if ( !who_fighting( ch ) )
    {
      if ( ch->position == POS_FIGHTING )
        {
          if ( ch->mount )
            ch->position = POS_MOUNTED;
          else
            ch->position = POS_STANDING;
        }
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ch->move <= 0 )
    {
      send_to_char( "You're too exhausted to flee from combat!\r\n", ch );
      return;
    }

  /* No fleeing while stunned. - Narn */
  if ( ch->position < POS_FIGHTING )
    return;

  was_in = ch->in_room;
  for ( attempt = 0; attempt < 8; attempt++ )
    {

      door = number_door( );
      if ( ( pexit = get_exit(was_in, door) ) == NULL
           ||   !pexit->to_room
           || ( IS_SET(pexit->exit_info, EX_CLOSED)
                &&   !IS_AFFECTED( ch, AFF_PASS_DOOR ) )
           || ( IS_NPC(ch)
                &&   IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB) ) )
        continue;

      if ( !permsneak(ch) )
        {
          affect_strip ( ch, gsn_sneak );
          REMOVE_BIT   ( ch->affected_by, AFF_SNEAK );
        }
      if ( ch->mount && ch->mount->fighting )
        stop_fighting( ch->mount, TRUE );
      move_char( ch, pexit, 0 );

      mprog_entry_trigger( ch );
      if ( char_died(ch) )
        return;

      rprog_enter_trigger( ch );
      if ( char_died(ch) )
        return;

      mprog_greet_trigger( ch );
      if ( char_died(ch) )
        return;

      oprog_greet_trigger( ch );
      if ( char_died(ch) )
        return;

      if ( ( now_in = ch->in_room ) == was_in )
        continue;

      ch->in_room = was_in;
      act( AT_FLEE, "$n runs for cover!", ch, NULL, NULL, TO_ROOM );
      ch->in_room = now_in;
      act( AT_FLEE, "$n glances around for signs of pursuit.", ch, NULL, NULL, TO_ROOM );
      sprintf(buf, "You run for cover!");
      send_to_char( buf, ch );

      stop_fighting( ch, TRUE );
      return;
    }

  sprintf(buf, "You attempt to run for cover!");
  send_to_char( buf, ch );
  return;
}

bool get_cover( CHAR_DATA *ch )
{
  ROOM_INDEX_DATA *was_in;
  ROOM_INDEX_DATA *now_in;
  int attempt;
  short door;
  EXIT_DATA *pexit;

  if ( !who_fighting( ch ) )
    return FALSE;

  if ( ch->position < POS_FIGHTING )
    return FALSE;

  was_in = ch->in_room;
  for ( attempt = 0; attempt < 10; attempt++ )
    {

      door = number_door( );
      if ( ( pexit = get_exit(was_in, door) ) == NULL
           ||   !pexit->to_room
           || ( IS_SET(pexit->exit_info, EX_CLOSED)
                &&   !IS_AFFECTED( ch, AFF_PASS_DOOR ) )
           || ( IS_NPC(ch)
                &&   IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB) ) )
        continue;

      affect_strip ( ch, gsn_sneak );
      REMOVE_BIT   ( ch->affected_by, AFF_SNEAK );
      if ( ch->mount && ch->mount->fighting )
        stop_fighting( ch->mount, TRUE );
      move_char( ch, pexit, 0 );
      if ( ( now_in = ch->in_room ) == was_in )
        continue;

      ch->in_room = was_in;
      act( AT_FLEE, "$n sprints for cover!", ch, NULL, NULL, TO_ROOM );
      ch->in_room = now_in;
      act( AT_FLEE, "$n spins around and takes aim.", ch, NULL, NULL, TO_ROOM );

      stop_fighting( ch, TRUE );

      return TRUE;
    }

  return FALSE;
}



void do_sla( CHAR_DATA *ch, char *argument )
{
  send_to_char( "If you want to SLAY, spell it out.\r\n", ch );
  return;
}



void do_slay( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  one_argument( argument, arg2 );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Slay whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( ch == victim )
    {
      send_to_char( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( !IS_NPC(victim)
       && ( get_trust( victim ) == 103 || get_trust( ch ) < 103) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "immolate" ) )
    {
      act( AT_FIRE, "Your fireball turns $N into a blazing inferno.",  ch, NULL, victim, TO_CHAR    );
      act( AT_FIRE, "$n releases a searing fireball in your direction.", ch, NULL, victim, TO_VICT    );
      act( AT_FIRE, "$n points at $N, who bursts into a flaming inferno.",  ch, NULL, victim, TO_NOTVICT );
    }

  else if ( !str_cmp( arg2, "shatter" ) )
    {
      act( AT_LBLUE, "You freeze $N with a glance and shatter the frozen corpse into tiny shards.",  ch, NULL, victim, TO_CHAR    );
      act( AT_LBLUE, "$n freezes you with a glance and shatters your frozen body into tiny shards.", ch, NULL, victim, TO_VICT    );
      act( AT_LBLUE, "$n freezes $N with a glance and shatters the frozen body into tiny shards.",  ch, NULL, victim, TO_NOTVICT );
    }

  else if ( !str_cmp( arg2, "demon" ) )
    {
      act( AT_IMMORT, "You gesture, and a slavering demon appears.  With a horrible grin, the",  ch, NULL, victim, TO_CHAR );
      act( AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",  ch, NULL, victim, TO_CHAR );
      act( AT_IMMORT, "$n gestures, and a slavering demon appears.  The foul creature turns on",  ch, NULL, victim, TO_VICT );
      act( AT_IMMORT, "you with a horrible grin.   You scream in panic before being eaten alive.",  ch, NULL, victim, TO_VICT );
      act( AT_IMMORT, "$n gestures, and a slavering demon appears.  With a horrible grin, the",  ch, NULL, victim, TO_NOTVICT );
      act( AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",  ch, NULL, victim, TO_NOTVICT );
    }

  else if ( !str_cmp( arg2, "pounce" ) && get_trust(ch) >= LEVEL_ASCENDANT )
    {
      act( AT_BLOOD, "Leaping upon $N with bared fangs, you tear open $S throat and toss the corpse to the ground...",  ch, NULL, victim, TO_CHAR );
      act( AT_BLOOD, "In a heartbeat, $n rips $s fangs through your throat!  Your blood sprays and pours to the ground as your life ends...", ch, NULL, victim, TO_VICT );
      act( AT_BLOOD, "Leaping suddenly, $n sinks $s fangs into $N's throat.  As blood sprays and gushes to the ground, $n tosses $N's dying body away.",  ch, NULL, victim, TO_NOTVICT );
    }

  else if ( !str_cmp( arg2, "slit" ) && get_trust(ch) >= LEVEL_ASCENDANT )
    {
      act( AT_BLOOD, "You calmly slit $N's throat.", ch, NULL, victim, TO_CHAR );
      act( AT_BLOOD, "$n reaches out with a clawed finger and calmly slits your throat.", ch, NULL, victim, TO_VICT );
      act( AT_BLOOD, "$n calmly slits $N's throat.", ch, NULL, victim, TO_NOTVICT );
    }

  else
    {
      act( AT_IMMORT, "You slay $N in cold blood!",  ch, NULL, victim, TO_CHAR    );
      act( AT_IMMORT, "$n slays you in cold blood!", ch, NULL, victim, TO_VICT    );
      act( AT_IMMORT, "$n slays $N in cold blood!",  ch, NULL, victim, TO_NOTVICT );
    }

  set_cur_char(victim);
  raw_kill( ch, victim );
  return;
}
