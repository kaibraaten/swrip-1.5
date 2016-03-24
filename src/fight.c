/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "arena.h"
#include "clan.h"
#include "skill.h"

extern char lastplayercmd[MAX_INPUT_LENGTH];
extern Character *gch_prev;

/*
 * Local functions.
 */
static void ApplyWantedFlags( Character *ch, const Character *victim );
static void UpdateKillStats( Character *ch, Character *victim );
static void SendDamageMessages( Character *ch, Character *victim, int dam, int dt );
static bool IsWieldingPoisonedWeapon( const Character *ch );
static void GainGroupXP( Character *ch, Character *victim );
static int CountGroupMembersInRoom( const Character *ch );
static void CheckObjectAlignmentZapping( Character *ch );
static int ComputeNewAlignment( const Character *gch, const Character *victim );
static int GetObjectHitrollBonus( const Object *obj );
static bool SprintForCover( Character *ch );
static int GetWeaponProficiencyBonus( const Character *ch, const Object *wield, int *gsn_ptr );
static short GetOffensiveShieldLevelModifier( const Character *ch, const Character *victim );

bool dual_flip = false;

/*
 * Check to see if weapon is poisoned.
 */
static bool IsWieldingPoisonedWeapon( const Character *ch )
{
  const Object *obj = NULL;

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) )
       && IsBitSet( obj->extra_flags, ITEM_POISONED) )
    return true;

  return false;
}

/*
 * hunting, hating and fearing code                             -Thoric
 */
bool IsHunting( const Character *ch, const Character *victim )
{
  if ( !ch->hhf.hunting || ch->hhf.hunting->who != victim )
    return false;

  return true;
}

bool IsHating( const Character *ch, const Character *victim )
{
  if ( !ch->hhf.hating || ch->hhf.hating->who != victim )
    return false;

  return true;
}

bool IsFearing( const Character *ch, const Character *victim )
{
  if ( !ch->hhf.fearing || ch->hhf.fearing->who != victim )
    return false;

  return true;
}

void StopHunting( Character *ch )
{
  if ( ch->hhf.hunting )
    {
      FreeMemory( ch->hhf.hunting->name );
      FreeMemory( ch->hhf.hunting );
      ch->hhf.hunting = NULL;
    }
}

void StopHating( Character *ch )
{
  if ( ch->hhf.hating )
    {
      FreeMemory( ch->hhf.hating->name );
      FreeMemory( ch->hhf.hating );
      ch->hhf.hating = NULL;
    }
}

void StopFearing( Character *ch )
{
  if ( ch->hhf.fearing )
    {
      FreeMemory( ch->hhf.fearing->name );
      FreeMemory( ch->hhf.fearing );
      ch->hhf.fearing = NULL;
    }
}

void StartHunting( Character *ch, Character *victim )
{
  if ( ch->hhf.hunting )
    StopHunting( ch );

  AllocateMemory( ch->hhf.hunting, HuntHateFear, 1 );
  ch->hhf.hunting->name = CopyString( victim->name );
  ch->hhf.hunting->who  = victim;
}

void StartHating( Character *ch, Character *victim )
{
  if ( ch->hhf.hating )
    StopHating( ch );

  AllocateMemory( ch->hhf.hating, HuntHateFear, 1 );
  ch->hhf.hating->name = CopyString( victim->name );
  ch->hhf.hating->who  = victim;
}

void StartFearing( Character *ch, Character *victim )
{
  if ( ch->hhf.fearing )
    StopFearing( ch );

  AllocateMemory( ch->hhf.fearing, HuntHateFear, 1 );
  ch->hhf.fearing->name = CopyString( victim->name );
  ch->hhf.fearing->who  = victim;
}

/*
 * Control the fights going on.
 * Called periodically by UpdateHandler.
 * Many hours spent fixing bugs in here by Thoric, as noted by residual
 * debugging checks.  If you never get any of these error messages again
 * in your logs... then you can comment out some of the checks without
 * worry.
 */
void ViolenceUpdate( void )
{
  char buf[MAX_STRING_LENGTH];
  Character *ch = NULL;
  Character *victim = NULL;
  Character *rch, *rch_next = NULL;
  Affect *paf = NULL;
  Affect *paf_next = NULL;
  Timer *timer = NULL;
  Timer *timer_next = NULL;
  ch_ret retcode = rNONE;
  Skill *skill = NULL;

  for ( ch = last_char; ch; ch = gch_prev )
    {
      SetCurrentGlobalCharacter( ch );

      gch_prev  = ch->prev;

      /*
       * See if we got a pointer to someone who recently died...
       * if so, either the pointer is bad... or it's a player who
       * "died", and is back at the healer...
       * Since he/she's in the char_list, it's likely to be the later...
       * and should not already be in another fight already
       */
      if ( CharacterDiedRecently(ch) )
        continue;


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
              if ( timer->type == TIMER_CMD_FUN )
                {
                  int tempsub = ch->substate;

                  ch->substate = timer->value;
                  timer->do_fun( ch, "" );

                  if ( CharacterDiedRecently(ch) )
                    break;

                  ch->substate = tempsub;
                }

              ExtractTimer( ch, timer );
            }
        }

      if ( CharacterDiedRecently(ch) )
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
                    skill = GetSkill(paf->type);
                    if ( paf->type > 0 && skill && skill->msg_off )
                      {
                        SetCharacterColor( AT_WEAROFF, ch );
                        SendToCharacter( skill->msg_off, ch );
                        SendToCharacter( "\r\n", ch );
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
                RemoveAffect( ch, paf );
              }
        }

      if ( ( victim = GetFightingOpponent( ch ) ) == NULL
           ||   IsAffectedBy( ch, AFF_PARALYSIS ) )
        continue;

      retcode = rNONE;

      if ( IsBitSet(ch->in_room->room_flags, ROOM_SAFE ) )
        {
          sprintf( buf, "ViolenceUpdate: %s fighting %s in a SAFE room.",
                   ch->name, victim->name );
          LogPrintf( buf );
          StopFighting( ch, true );
        }
      else
        if ( IsAwake(ch) && ch->in_room == victim->in_room )
          retcode = HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
        else
          StopFighting( ch, false );

      if ( CharacterDiedRecently(ch) )
        continue;

      if ( retcode == rCHAR_DIED
           || ( victim = GetFightingOpponent( ch ) ) == NULL )
        continue;

      if( IsNpc(ch) )
        {
          do_wear( ch, "blaster" );
          do_wear( ch, "all" );
        }


      /*
       *  Mob triggers
       */
      RoomProgFightTrigger( ch );
      if ( CharacterDiedRecently(ch) )
        continue;
      MobProgHitPercentTrigger( ch, victim );
      if ( CharacterDiedRecently(ch) )
        continue;
      MobProgFightTrigger( ch, victim );
      if ( CharacterDiedRecently(ch) )
        continue;

      /*
       * Fun for the whole family!
       */
      for ( rch = ch->in_room->first_person; rch; rch = rch_next )
        {
          rch_next = rch->next_in_room;

          if ( IsAwake(rch) && !rch->fighting )
            {
              /*
               * PC's auto-assist others in their group.
               */
              if ( !IsNpc(ch) || IsAffectedBy(ch, AFF_CHARM) )
                {
                  if ( ( !IsNpc(rch) || IsAffectedBy(rch, AFF_CHARM) )
                       &&   IsInSameGroup(ch, rch) )
                    HitMultipleTimes( rch, victim, TYPE_UNDEFINED );
                  continue;
                }

              /*
               * NPC's assist NPC's of same type or 12.5% chance regardless.
               */
              if ( IsNpc(rch) && !IsAffectedBy(rch, AFF_CHARM)
                   &&  !IsBitSet(rch->act, ACT_NOASSIST) )
                {
                  if ( CharacterDiedRecently(ch) )
                    break;
                  if ( rch->Prototype == ch->Prototype
                       ||   NumberBits( 3 ) == 0 )
                    {
                      Character *vch;
                      Character *target;
                      int number;

                      target = NULL;
                      number = 0;

		      for ( vch = ch->in_room->first_person; vch; vch = vch->next )
			{
			  if ( CanSeeCharacter( rch, vch )
			       &&   IsInSameGroup( vch, victim )
			       &&   GetRandomNumberFromRange( 0, number ) == 0 )
			    {
			      target = vch;
			      number++;
			    }
			}

                      if ( target )
                        HitMultipleTimes( rch, target, TYPE_UNDEFINED );
                    }
                }
            }
        }
    }
}



/*
 * Do one group of attacks.
 */
ch_ret HitMultipleTimes( Character *ch, Character *victim, int dt )
{
  int     hit_chance;
  int       dual_bonus;
  ch_ret  retcode;

  /* add timer if player is attacking another player */
  if ( !IsNpc(ch) && !IsNpc(victim) )
    AddTimerToCharacter( ch, TIMER_RECENTFIGHT, 20, NULL, SUB_NONE );

  if ( !IsNpc(ch) && IsBitSet( ch->act, PLR_NICE ) && !IsNpc( victim ) )
    return rNONE;

  if ( (retcode = HitOnce( ch, victim, dt )) != rNONE )
    return retcode;

  if ( GetFightingOpponent( ch ) != victim || dt == gsn_backstab || dt == gsn_circle)
    return rNONE;

  /* Very high chance of hitting compared to chance of going berserk */
  /* 40% or higher is always hit.. don't learn anything here though. */
  /* -- Altrag */
  hit_chance = IsNpc(ch) ? 100 : (ch->pcdata->learned[gsn_berserk]*5/2);

  if ( IsAffectedBy(ch, AFF_BERSERK) && GetRandomPercent() < hit_chance )
    if ( (retcode = HitOnce( ch, victim, dt )) != rNONE ||
         GetFightingOpponent( ch ) != victim )
      return retcode;

  if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) )
    {
      dual_bonus = IsNpc(ch) ? (GetAbilityLevel( ch, COMBAT_ABILITY ) / 10) : (ch->pcdata->learned[gsn_dual_wield] / 10);
      hit_chance = IsNpc(ch) ? ch->top_level : ch->pcdata->learned[gsn_dual_wield];
      if ( GetRandomPercent() < hit_chance )
        {
          LearnFromSuccess( ch, gsn_dual_wield );
          retcode = HitOnce( ch, victim, dt );
          if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
            return retcode;
        }
      else
        LearnFromFailure( ch, gsn_dual_wield );
    }
  else
    dual_bonus = 0;

  if ( ch->move < 10 )
    dual_bonus = -20;

  /*
   * NPC predetermined number of attacks                        -Thoric
   */
  if ( IsNpc(ch) && ch->numattacks > 0 )
    {
      for ( hit_chance = 0; hit_chance <= ch->numattacks; hit_chance++ )
        {
          retcode = HitOnce( ch, victim, dt );
          if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
            return retcode;
        }
      return retcode;
    }

  hit_chance = IsNpc(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_second_attack]+dual_bonus)/1.5);
  if ( GetRandomPercent() < hit_chance )
    {
      LearnFromSuccess( ch, gsn_second_attack );
      retcode = HitOnce( ch, victim, dt );
      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        return retcode;
    }
  else
    LearnFromFailure( ch, gsn_second_attack );

  hit_chance = IsNpc(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_third_attack]+(dual_bonus*1.5))/2);
  if ( GetRandomPercent() < hit_chance )
    {
      LearnFromSuccess( ch, gsn_third_attack );
      retcode = HitOnce( ch, victim, dt );
      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        return retcode;
    }
  else
    LearnFromFailure( ch, gsn_third_attack );

  hit_chance = IsNpc(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_fourth_attack]+(dual_bonus*1.5))/2);
  if ( GetRandomPercent() < hit_chance )
    {
      LearnFromSuccess( ch, gsn_fourth_attack );
      retcode = HitOnce( ch, victim, dt );
      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        return retcode;
    }
  else
    LearnFromFailure( ch, gsn_fourth_attack );

  hit_chance = IsNpc(ch) ? ch->top_level
    : (int) ((ch->pcdata->learned[gsn_fifth_attack]+(dual_bonus*1.5))/2);
  if ( GetRandomPercent() < hit_chance )
    {
      LearnFromSuccess( ch, gsn_fifth_attack );
      retcode = HitOnce( ch, victim, dt );
      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        return retcode;
    }
  else
    LearnFromFailure( ch, gsn_fifth_attack );

  retcode = rNONE;

  hit_chance = IsNpc(ch) ? (int) (ch->top_level / 4) : 0;
  if ( GetRandomPercent() < hit_chance )
    retcode = HitOnce( ch, victim, dt );

  if ( retcode == rNONE )
    {
      int move;

      if ( !IsAffectedBy(ch, AFF_FLYING)
           &&   !IsAffectedBy(ch, AFF_FLOATING) )
        move = GetCarryEncumbrance( ch, movement_loss[umin(SECT_MAX-1, ch->in_room->sector_type)] );
      else
        move = GetCarryEncumbrance( ch, 1 );
      if ( ch->move )
        ch->move = umax( 0, ch->move - move );
    }

  return retcode;
}


/*
 * Weapon types, haus
 */
static int GetWeaponProficiencyBonus( const Character *ch, const Object *wield, int *gsn_ptr )
{
  int bonus = 0;

  *gsn_ptr = -1;

  if ( !IsNpc(ch) && wield )
    {
      switch(wield->value[OVAL_WEAPON_TYPE])
        {
        default:
	  *gsn_ptr = -1;
	  break;

        case 3:
	  *gsn_ptr = gsn_lightsabers;
	  break;

        case 2:
	  *gsn_ptr = gsn_vibro_blades;
	  break;

        case 4:
	  *gsn_ptr = gsn_flexible_arms;
	  break;

        case 5:
	  *gsn_ptr = gsn_talonous_arms;
	  break;

        case 6:
	  *gsn_ptr = gsn_blasters;
	  break;

        case 8:
	  *gsn_ptr = gsn_bludgeons;
	  break;

        case 9:
	  *gsn_ptr = gsn_bowcasters;
	  break;

        case 11:
	  *gsn_ptr = gsn_force_pikes;
	  break;
        }

      if ( *gsn_ptr != -1 )
	{
	  bonus = (int) ( ch->pcdata->learned[*gsn_ptr] );
	}
    }

  if ( IsNpc(ch) && wield )
    {
      bonus = GetTrustLevel(ch);
    }

  return bonus;
}

/*
 * Calculate the tohit bonus on the object and return RIS values.
 * -- Altrag
 */
static int GetObjectHitrollBonus( const Object *obj )
{
  int tohit = 0;
  const Affect *paf = NULL;

  for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
    {
      if ( paf->location == APPLY_HITROLL )
	{
	  tohit += paf->modifier;
	}
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    {
      if ( paf->location == APPLY_HITROLL )
	{
	  tohit += paf->modifier;
	}
    }

  return tohit;
}

/*
 * Offensive shield level modifier
 */
static short GetOffensiveShieldLevelModifier( const Character *ch, const Character *victim )
{
  short lvl = 0;

  if ( !IsNpc(ch) )            /* players get much less effect */
    {
      lvl = umax( 1, (GetAbilityLevel( ch, FORCE_ABILITY ) ) );

      if ( GetRandomPercent() + (GetAbilityLevel( victim, COMBAT_ABILITY ) - lvl) < 35 )
	{
	  return lvl;
	}
      else
	{
	  return 0;
	}
    }
  else
    {
      lvl = ch->top_level;

      if ( GetRandomPercent() + (GetAbilityLevel( victim, COMBAT_ABILITY ) - lvl) < 70 )
	{
	  return lvl;
	}
      else
	{
	  return 0;
	}
    }
}

/*
 * Hit one guy once.
 */
ch_ret HitOnce( Character *ch, Character *victim, int dt )
{
  Object *wield = NULL;
  int victim_ac = 0;
  int thac0 = 0;
  int thac0_00 = 0;
  int thac0_32 = 0;
  int plusris = 0;
  int dam = 0;
  int x = 0;
  int diceroll = 0;
  int attacktype = 0;
  int cnt = 0;
  int prof_bonus = 0;
  int prof_gsn = 0;
  ch_ret retcode = rNONE;
  int hit_chance = 0;
  bool fail = false;
  Affect af;

  /*
   * Can't beat a dead char!
   * Guard against weird room-leavings.
   */
  if ( victim->position == POS_DEAD || ch->in_room != victim->in_room )
    return rVICT_DIED;


  /*
   * Figure out the weapon doing the damage                     -Thoric
   */
  if ( (wield = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD )) != NULL )
    {
      if ( dual_flip == false )
        {
          dual_flip = true;
          wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
        }
      else
        dual_flip = false;
    }
  else
    wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );

  prof_bonus = GetWeaponProficiencyBonus( ch, wield, &prof_gsn );

  if ( ch->fighting             /* make sure fight is already started */
       &&   dt == TYPE_UNDEFINED
       &&   IsNpc(ch)
       &&   ch->attacks != 0 )
    {
      cnt = 0;
      for ( ;; )
        {
          x = GetRandomNumberFromRange( 0, 6 );
          attacktype = 1 << x;
          if ( IsBitSet( ch->attacks, attacktype ) )
            break;
          if ( cnt++ > 16 )
            {
              attacktype = 0;
              break;
            }
        }
      if ( attacktype == ATCK_BACKSTAB )
        attacktype = 0;

      if ( wield && GetRandomPercent() > 25 )
        attacktype = 0;

      switch ( attacktype )
        {
        default:
          break;

	  /* These used to call empty functions so they were just joined
	     together */
        case ATCK_BITE:
        case ATCK_CLAWS:
        case ATCK_TAIL:
        case ATCK_STING:
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
        dt += wield->value[OVAL_WEAPON_TYPE];
    }

  /*
   * Calculate to-hit-armor-class-0 versus armor.
   */
  thac0_00 = 20;
  thac0_32 = 10;
  thac0     = Interpolate( GetAbilityLevel( ch, COMBAT_ABILITY ), thac0_00, thac0_32 ) - GetHitRoll(ch);
  victim_ac = (int) (GetArmorClass(victim) / 10);

  /* if you can't see what's coming... */
  if ( wield && !CanSeeObject( victim, wield) )
    victim_ac += 1;
  if ( !CanSeeCharacter( ch, victim ) )
    victim_ac -= 4;

  if ( ch->race == RACE_DEFEL )
    victim_ac += 2;

  if ( !IsAwake ( victim ) )
    victim_ac += 5;

  /* Weapon proficiency bonus */
  victim_ac += prof_bonus/20;

  /*
   * The moment of excitement!
   */
  diceroll = GetRandomNumberFromRange( 1,20 );

  if ( diceroll == 1
       || ( diceroll < 20 && diceroll < thac0 - victim_ac ) )
    {
      /* Miss. */
      if ( prof_gsn != -1 )
        LearnFromFailure( ch, prof_gsn );
      InflictDamage( ch, victim, 0, dt );
      return rNONE;
    }

  /*
   * Hit.
   * Calc damage.
   */

  if ( !wield )       /* dice formula fixed by Thoric */
    {
      dam = GetRandomNumberFromRange( ch->barenumdie, ch->baresizedie * ch->barenumdie );
    }
  else
    {
      dam = GetRandomNumberFromRange( wield->value[OVAL_WEAPON_NUM_DAM_DIE],
			  wield->value[OVAL_WEAPON_SIZE_DAM_DIE] );
    }

  /*
   * Bonuses.
   */

  dam += GetDamageRoll(ch);

  if ( prof_bonus )
    dam *= ( 1 + prof_bonus / 100 );


  if ( !IsNpc(ch) && ch->pcdata->learned[gsn_enhanced_damage] > 0 )
    {
      dam += (int) (dam * ch->pcdata->learned[gsn_enhanced_damage] / 120);
      LearnFromSuccess( ch, gsn_enhanced_damage );
    }


  if ( !IsAwake(victim) )
    dam *= 2;
  if ( dt == gsn_backstab )
    dam *= (2 + urange( 2, GetAbilityLevel( ch, HUNTING_ABILITY ) - (GetAbilityLevel( victim, COMBAT_ABILITY ) / 4), 30 ) / 8);

  if ( dt == gsn_circle )
    dam *= (2 + urange( 2, GetAbilityLevel( ch, HUNTING_ABILITY ) - (GetAbilityLevel( victim, COMBAT_ABILITY ) / 2), 30 ) / 40);

  plusris = 0;

  if ( wield )
    {
      if ( IsBitSet( wield->extra_flags, ITEM_MAGIC ) )
        dam = ModifyDamageBasedOnResistance( victim, dam, RIS_MAGIC );
      else
        dam = ModifyDamageBasedOnResistance( victim, dam, RIS_NONMAGIC );

      /*
       * Handle PLUS1 - PLUS6 ris bits vs. weapon hitroll       -Thoric
       */
      plusris = GetObjectHitrollBonus( wield );
    }
  else
    dam = ModifyDamageBasedOnResistance( victim, dam, RIS_NONMAGIC );

  /* check for RIS_PLUSx                                        -Thoric */
  if ( dam )
    {
      int i, res, imm, sus, mod;

      if ( plusris )
        plusris = RIS_PLUS1 << umin(plusris, 7);

      /* initialize values to handle a zero plusris */
      imm = res = -1;  sus = 1;

      /* find high ris */
      for ( i = RIS_PLUS1; i <= RIS_PLUS6; i <<= 1 )
        {
          if ( IsBitSet( victim->immune, i ) )
            imm = i;
          if ( IsBitSet( victim->resistant, i ) )
            res = i;
          if ( IsBitSet( victim->susceptible, i ) )
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
      if ( wield->value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n points their blaster at you but nothing happens.",  ch, NULL, victim, TO_VICT    );
          Act( AT_YELLOW, "*CLICK* ... your blaster needs a new ammunition cell!", ch, NULL, victim, TO_CHAR    );
          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
      else if ( wield->blaster_setting == BLASTER_FULL && wield->value[OVAL_WEAPON_CHARGE] >=5 )
        {
          dam *=  1.5;
          wield->value[OVAL_WEAPON_CHARGE] -= 5;
        }
      else if ( wield->blaster_setting == BLASTER_HIGH && wield->value[OVAL_WEAPON_CHARGE] >=4 )
        {
          dam *=  1.25;
          wield->value[OVAL_WEAPON_CHARGE] -= 4;
        }
      else if ( wield->blaster_setting == BLASTER_NORMAL && wield->value[OVAL_WEAPON_CHARGE] >=3 )
        {
          wield->value[OVAL_WEAPON_CHARGE] -= 3;
        }
      else if ( wield->blaster_setting == BLASTER_STUN && wield->value[OVAL_WEAPON_CHARGE] >=5 )
        {
          dam /= 10;
          wield->value[OVAL_WEAPON_CHARGE] -= 3;
          fail = false;
          hit_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, COMBAT_ABILITY ), RIS_PARALYSIS );
          if ( hit_chance == 1000 )
            fail = true;
          else
            fail = SaveVsParalyze( hit_chance, victim );
          if ( victim->was_stunned > 0 )
            {
              fail = true;
              victim->was_stunned--;
            }
          hit_chance = 100 - GetCurrentConstitution(victim) - GetAbilityLevel( victim, COMBAT_ABILITY ) / 2;
          /* harder for player to stun another player */
          if ( !IsNpc(ch) && !IsNpc(victim) )
            hit_chance -= sysdata.stun_plr_vs_plr;
          else
            hit_chance -= sysdata.stun_regular;

          hit_chance = urange( 5, hit_chance, 95 );

          if ( !fail && GetRandomPercent() < hit_chance )
            {
              SetWaitState( victim, PULSE_VIOLENCE );
              Act( AT_BLUE, "Blue rings of energy from $N's blaster knock you down leaving you stunned!", victim, NULL, ch, TO_CHAR );
              Act( AT_BLUE, "Blue rings of energy from your blaster strike $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
              Act( AT_BLUE, "Blue rings of energy from $n's blaster hit $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );
              StopFighting( victim, true );
              if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
                {
                  af.type      = gsn_stun;
                  af.location  = APPLY_AC;
                  af.modifier  = 20;
                  af.duration  = 7;
                  af.bitvector = AFF_PARALYSIS;
                  AffectToCharacter( victim, &af );
                  UpdatePosition( victim );
                  if ( IsNpc(victim) )
                    {
                      StartHating( victim, ch );
                      StartHunting( victim, ch );
                      victim->was_stunned = 10;
                    }
                }
            }
          else
            {
              Act( AT_BLUE, "Blue rings of energy from $N's blaster hit you but have little effect", victim, NULL, ch, TO_CHAR );
              Act( AT_BLUE, "Blue rings of energy from your blaster hit $N, but nothing seems to happen!", ch, NULL, victim, TO_CHAR );
              Act( AT_BLUE, "Blue rings of energy from $n's blaster hit $N, but nothing seems to happen!", ch, NULL, victim, TO_NOTVICT );

            }
        }
      else if ( wield->blaster_setting == BLASTER_HALF && wield->value[OVAL_WEAPON_CHARGE] >=2 )
        {
          dam *=  0.75;
          wield->value[OVAL_WEAPON_CHARGE] -= 2;
        }
      else
        {
          dam *= 0.5;
          wield->value[OVAL_WEAPON_CHARGE] -= 1;
        }

    }
  else if (
           dt == (TYPE_HIT + WEAPON_VIBRO_BLADE )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "Your vibro-blade needs recharging ...", ch, NULL, victim, TO_CHAR    );
          dam /= 3;
        }
    }
  else if (
           dt == (TYPE_HIT + WEAPON_FORCE_PIKE )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "Your force-pike needs recharging ...", ch, NULL, victim, TO_CHAR    );
          dam /= 2;
        }
      else
        wield->value[OVAL_WEAPON_CHARGE]--;
    }
  else if (
           dt == (TYPE_HIT + WEAPON_LIGHTSABER )
           && wield && wield->item_type == ITEM_WEAPON
           )
    {
      if ( wield->value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n waves a dead hand grip around in the air.",  ch, NULL, victim, TO_VICT    );
          Act( AT_YELLOW, "You need to recharge your lightsaber ... it seems to be lacking a blade.", ch, NULL, victim, TO_CHAR    );
          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_BOWCASTER ) && wield && wield->item_type == ITEM_WEAPON )
    {
      if ( wield->value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n points their bowcaster at you but nothing happens.",  ch, NULL, victim, TO_VICT    );
          Act( AT_YELLOW, "*CLICK* ... your bowcaster needs a new bolt cartridge!", ch, NULL, victim, TO_CHAR    );
          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->name );
            }
          return rNONE;
        }
      else
        wield->value[OVAL_WEAPON_CHARGE]--;
    }

  if ( dam <= 0 )
    dam = 1;

  if ( prof_gsn != -1 )
    {
      if ( dam > 0 )
        LearnFromSuccess( ch, prof_gsn );
      else
        LearnFromFailure( ch, prof_gsn );
    }

  /* immune to damage */
  if ( dam == -1 )
    {
      if ( dt >= 0 && dt < top_sn )
        {
          Skill *skill = skill_table[dt];
          bool found = false;

          if ( skill->imm_char && skill->imm_char[0] != '\0' )
            {
              Act( AT_HIT, skill->imm_char, ch, NULL, victim, TO_CHAR );
              found = true;
            }
          if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
            {
              Act( AT_HITME, skill->imm_vict, ch, NULL, victim, TO_VICT );
              found = true;
            }
          if ( skill->imm_room && skill->imm_room[0] != '\0' )
            {
              Act( AT_ACTION, skill->imm_room, ch, NULL, victim, TO_NOTVICT );
              found = true;
            }
          if ( found )
            return rNONE;
        }
      dam = 0;
    }
  if ( (retcode = InflictDamage( ch, victim, dam, dt )) != rNONE )
    return retcode;
  if ( CharacterDiedRecently(ch) )
    return rCHAR_DIED;
  if ( CharacterDiedRecently(victim) )
    return rVICT_DIED;

  retcode = rNONE;
  if ( dam == 0 )
    return retcode;

  /* weapon spells      -Thoric */
  if ( wield
       &&  !IsBitSet(victim->immune, RIS_MAGIC)
       &&  !IsBitSet(victim->in_room->room_flags, ROOM_NO_MAGIC) )
    {
      Affect *aff;

      for ( aff = wield->Prototype->first_affect; aff; aff = aff->next )
        if ( aff->location == APPLY_WEAPONSPELL
             &&   IS_VALID_SN(aff->modifier)
             &&   skill_table[aff->modifier]->spell_fun )
          retcode = (*skill_table[aff->modifier]->spell_fun) ( aff->modifier, (wield->level+3)/3, ch, victim );
      if ( retcode != rNONE || CharacterDiedRecently(ch) || CharacterDiedRecently(victim) )
        return retcode;
      for ( aff = wield->first_affect; aff; aff = aff->next )
        if ( aff->location == APPLY_WEAPONSPELL
             &&   IS_VALID_SN(aff->modifier)
             &&   skill_table[aff->modifier]->spell_fun )
          retcode = (*skill_table[aff->modifier]->spell_fun) ( aff->modifier, (wield->level+3)/3, ch, victim );
      if ( retcode != rNONE || CharacterDiedRecently(ch) || CharacterDiedRecently(victim) )
        return retcode;
    }

  /*
   * magic shields that retaliate                               -Thoric
   */
  if ( IsAffectedBy( victim, AFF_FIRESHIELD )
       &&  !IsAffectedBy( ch, AFF_FIRESHIELD ) )
    retcode = spell_fireball( gsn_fireball, GetOffensiveShieldLevelModifier(victim, ch), victim, ch );
  if ( retcode != rNONE || CharacterDiedRecently(ch) || CharacterDiedRecently(victim) )
    return retcode;

  if ( retcode != rNONE || CharacterDiedRecently(ch) || CharacterDiedRecently(victim) )
    return retcode;

  if ( IsAffectedBy( victim, AFF_SHOCKSHIELD )
       &&  !IsAffectedBy( ch, AFF_SHOCKSHIELD ) )
    retcode = spell_lightning_bolt( gsn_lightning_bolt, GetOffensiveShieldLevelModifier(victim, ch), victim, ch );
  if ( retcode != rNONE || CharacterDiedRecently(ch) || CharacterDiedRecently(victim) )
    return retcode;

  /*
   *   folks with blasters move and snipe instead of getting neatin up in one spot.
   */
  if ( IsNpc(victim) )
    {
      Object *wielding = GetEquipmentOnCharacter( victim, WEAR_WIELD );
      if ( wielding != NULL
	   && wielding->value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER
	   && SprintForCover( victim ) == true )
        {
          StartHating( victim, ch );
          StartHunting( victim, ch );
        }
    }

  return retcode;
}

/*
 * Calculate damage based on resistances, immunities and suceptibilities
 *                                      -Thoric
 */
short ModifyDamageBasedOnResistance( const Character *ch, short dam, int ris )
{
  short modifier = 10;

  if ( IsBitSet(ch->immune, ris ) )
    modifier -= 10;

  if ( IsBitSet(ch->resistant, ris ) )
    modifier -= 2;

  if ( IsBitSet(ch->susceptible, ris ) )
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
ch_ret InflictDamage( Character *ch, Character *victim, int dam, int dt )
{
  char buf1[MAX_STRING_LENGTH];
  short dameq = 0;
  bool npcvict = false;
  bool loot = false;
  int  xp_gain = 0;
  Object *damobj = NULL;
  ch_ret retcode = rNONE;
  short dampmod = 0;
  int init_gold = 0, new_gold = 0, gold_diff = 0;

  if ( !ch )
    {
      Bug( "%s: null ch!", __FUNCTION__ );
      return rERROR;
    }
  if ( !victim )
    {
      Bug( "%s: null victim!", __FUNCTION__ );
      return rVICT_DIED;
    }

  if ( victim->position == POS_DEAD )
    return rVICT_DIED;

  npcvict = IsNpc(victim);

  /*
   * Check damage types for RIS                         -Thoric
   */
  if ( dam && dt != TYPE_UNDEFINED )
    {
      if ( IS_FIRE(dt) )
        dam = ModifyDamageBasedOnResistance(victim, dam, RIS_FIRE);
      else if ( IS_COLD(dt) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_COLD);
      else if ( IS_ACID(dt) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ACID);
      else if ( IS_ELECTRICITY(dt) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ELECTRICITY);
      else if ( IS_ENERGY(dt) || dt == ( TYPE_HIT + 6 ))
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ENERGY);
      else if ( IS_DRAIN(dt) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_DRAIN);
      else if ( dt == gsn_poison || IS_POISON(dt) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_POISON);
      else if ( dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_BLUNT);
      else if ( dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11)
		|| dt == (TYPE_HIT + 10) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_PIERCE);
      else if ( dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3)
		||   dt == (TYPE_HIT + 4) || dt == (TYPE_HIT + 5) )
	dam = ModifyDamageBasedOnResistance(victim, dam, RIS_SLASH);

      if ( dam == -1 )
        {
          if ( dt >= 0 && dt < top_sn )
            {
              bool found = false;
              Skill *skill = skill_table[dt];

              if ( skill->imm_char && skill->imm_char[0] != '\0' )
                {
                  Act( AT_HIT, skill->imm_char, ch, NULL, victim, TO_CHAR );
                  found = true;
                }

              if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
                {
                  Act( AT_HITME, skill->imm_vict, ch, NULL, victim, TO_VICT );
                  found = true;
                }

              if ( skill->imm_room && skill->imm_room[0] != '\0' )
                {
                  Act( AT_ACTION, skill->imm_room, ch, NULL, victim, TO_NOTVICT );
                  found = true;
                }

              if ( found )
		{
		  return rNONE;
		}
            }

          dam = 0;
        }
    }

  if ( dam && npcvict && ch != victim )
    {
      if ( !IsBitSet( victim->act, ACT_SENTINEL ) )
        {
          if ( victim->hhf.hunting )
            {
              if ( victim->hhf.hunting->who != ch )
                {
                  FreeMemory( victim->hhf.hunting->name );
                  victim->hhf.hunting->name = CopyString( ch->name );
                  victim->hhf.hunting->who  = ch;
                }
            }
          else
            StartHunting( victim, ch );
        }

      if ( victim->hhf.hating )
        {
          if ( victim->hhf.hating->who != ch )
            {
              FreeMemory( victim->hhf.hating->name );
              victim->hhf.hating->name = CopyString( ch->name );
              victim->hhf.hating->who  = ch;
            }
        }
      else
        StartHating( victim, ch );
    }

  if ( victim != ch )
    {
      /*
       * Certain attacks are forbidden.
       * Most other attacks are returned.
       */
      if ( IsSafe( ch, victim ) )
        return rNONE;


      if ( victim->position > POS_STUNNED )
        {
          if ( !victim->fighting )
            StartFighting( victim, ch );
          if ( victim->fighting )
            victim->position = POS_FIGHTING;
        }

      if ( victim->position > POS_STUNNED )
        {
          if ( !ch->fighting )
            StartFighting( ch, victim );

          /*
           * If victim is charmed, ch might attack victim's master.
           */
          if ( IsNpc(ch)
               &&   npcvict
               &&   IsAffectedBy(victim, AFF_CHARM)
               &&   victim->master
               &&   victim->master->in_room == ch->in_room
               &&   NumberBits( 3 ) == 0 )
            {
              StopFighting( ch, false );
              retcode = HitMultipleTimes( ch, victim->master, TYPE_UNDEFINED );
              return retcode;
            }
        }


      /*
       * More charm stuff.
       */
      if ( victim->master == ch )
        StopFollowing( victim );


      /*
       * Inviso attacks ... not.
       */
      if ( IsAffectedBy(ch, AFF_INVISIBLE))
        {
          StripAffect( ch, gsn_invis );
          StripAffect( ch, gsn_mass_invis );
          RemoveBit( ch->affected_by, AFF_INVISIBLE );
          Act( AT_MAGIC, "$n fades into existence.", ch, NULL, NULL, TO_ROOM );
        }

      /* Take away Hide */
      if ( IsAffectedBy(ch, AFF_HIDE) && ch->race != RACE_DEFEL )
        RemoveBit(ch->affected_by, AFF_HIDE);
      /*
       * Damage modifiers.
       */
      if ( IsAffectedBy(victim, AFF_SANCTUARY) )
        dam /= 2;

      if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
        dam -= (int) (dam / 4);

      if ( dam < 0 )
        dam = 0;

      /*
       * Check for disarm, trip, parry, and dodge.
       */
      if ( dt >= TYPE_HIT )
        {
          if ( IsNpc(ch)
               &&   IsBitSet( ch->attacks, DFND_DISARM )
               &&   GetRandomPercent() < GetAbilityLevel( ch, COMBAT_ABILITY ) / 2 )
            Disarm( ch, victim );

          if ( IsNpc(ch)
               &&   IsBitSet( ch->attacks, ATCK_TRIP )
               &&   GetRandomPercent() < GetAbilityLevel( ch, COMBAT_ABILITY ) )
            Trip( ch, victim );

          if ( CheckParry( ch, victim ) )
            return rNONE;

          if ( CheckDodge( ch, victim ) )
            return rNONE;
        }



      /*
       * Check control panel settings and modify damage
       */
      if ( IsNpc(ch) )
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

      SendDamageMessages( ch, victim, dam, dt );
    }


  /*
   * Code to handle equipment getting damaged, and also support  -Thoric
   * bonuses/penalties for having or not having equipment where hit
   */
  if (dam > 10 && dt != TYPE_UNDEFINED)
    {
      /* get a random body eq part */
      dameq  = GetRandomNumberFromRange(WEAR_LIGHT, WEAR_EYES);
      damobj = GetEquipmentOnCharacter(victim, dameq);
      if ( damobj )
        {
          if ( dam > GetObjectResistance(damobj) )
            {
              SetCurrentGlobalObject(damobj);
              DamageObject(damobj);
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
       &&  !IsNpc(ch) && ch->fighting && ch->fighting->xp )
    {
      xp_gain = (int) (ComputeXP( ch, victim ) * 0.1 * dam) / victim->max_hit;
      GainXP( ch, COMBAT_ABILITY, xp_gain );
    }

  if ( !IsNpc(victim)
       &&   ( victim->top_level >= LEVEL_IMMORTAL
              ||     IsBitSet(victim->in_room->room_flags,ROOM_ARENA) )
       &&   victim->hit < 1 )
    {
      victim->hit = 1;
      if (IsBitSet(victim->in_room->room_flags, ROOM_ARENA) )
        {
          char buf[MAX_STRING_LENGTH];
          CharacterFromRoom(victim);
          CharacterToRoom(victim,GetRoom(victim->retran));
          do_look(victim, "auto");
          Act(AT_YELLOW,"$n falls from the sky.", victim, NULL, NULL, TO_ROOM);
          victim->hit = victim->max_hit;
          victim->mana = victim->max_mana;
          victim->move = victim->max_move;
          sprintf(buf,"%s is out of the fight.",victim->name);
          ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
          StopFighting(victim, true);

        }
    }

  if ( IsNpc(victim) && IsBitSet(victim->act,ACT_IMMORTAL) )
    victim->hit = victim->max_hit;

  /* Make sure newbies dont die */

  if (!IsNpc(victim) && !IsAuthed(victim) && victim->hit < 1)
    victim->hit = 1;

  if ( dam > 0 && dt > TYPE_HIT
       && !IsAffectedBy( victim, AFF_POISON )
       &&  IsWieldingPoisonedWeapon( ch )
       && !IsBitSet( victim->immune, RIS_POISON )
       && !SaveVsPoisonDeath( GetAbilityLevel( ch, COMBAT_ABILITY ), victim ) )
    {
      Affect af;

      af.type      = gsn_poison;
      af.duration  = 20;
      af.location  = APPLY_STR;
      af.modifier  = -2;
      af.bitvector = AFF_POISON;
      JoinAffect( victim, &af );
      ch->mental_state = urange( 20, ch->mental_state + 2, 100 );
    }

  if ( !npcvict
       &&   GetTrustLevel(victim) >= LEVEL_IMMORTAL
       &&        GetTrustLevel(ch)     >= LEVEL_IMMORTAL
       &&   victim->hit < 1 )
    victim->hit = 1;
  UpdatePosition( victim );

  switch( victim->position )
    {
    case POS_MORTAL:
      Act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      SendToCharacter( "&RYou are mortally wounded, and will die soon, if not aided.",victim);
      break;

    case POS_INCAP:
      Act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      SendToCharacter( "&RYou are incapacitated and will slowly die, if not aided.",victim);
      break;

    case POS_STUNNED:
      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          Act( AT_ACTION, "$n is stunned, but will probably recover.",
               victim, NULL, NULL, TO_ROOM );
          SendToCharacter( "&RYou are stunned, but will probably recover.",victim);
        }
      break;

    case POS_DEAD:
      if ( dt >= 0 && dt < top_sn )
        {
          Skill *skill = skill_table[dt];

          if ( skill->die_char && skill->die_char[0] != '\0' )
            Act( AT_DEAD, skill->die_char, ch, NULL, victim, TO_CHAR );
          if ( skill->die_vict && skill->die_vict[0] != '\0' )
            Act( AT_DEAD, skill->die_vict, ch, NULL, victim, TO_VICT );
          if ( skill->die_room && skill->die_room[0] != '\0' )
            Act( AT_DEAD, skill->die_room, ch, NULL, victim, TO_NOTVICT );
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_NOKILL )  )
        Act( AT_YELLOW, "$n flees for $s life... barely escaping certain death!", victim, 0, 0, TO_ROOM );
      else if ( (IsNpc(victim) && IsBitSet( victim->act, ACT_DROID ) ) || (!IsNpc(victim) && victim->race == RACE_DROID ) )
        Act( AT_DEAD, "$n EXPLODES into many small pieces!", victim, 0, 0, TO_ROOM );
      else
        Act( AT_DEAD, "$n is DEAD!", victim, 0, 0, TO_ROOM );
      SendToCharacter( "&WYou have been KILLED!\r\n", victim);
      break;

    default:
      if ( dam > victim->max_hit / 4 )
        {
          Act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );
          if ( NumberBits(3) == 0 )
            WorsenMentalState( ch, 1 );
        }
      if ( victim->hit < victim->max_hit / 4 )

        {
          Act( AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
               victim, 0, 0, TO_CHAR );
          if ( NumberBits(2) == 0 )
            WorsenMentalState( ch, 1 );
        }
      break;
    }

  /*
   * Sleep spells and extremely wounded folks.
   */
  if ( !IsAwake(victim)                /* lets make NPC's not slaughter PC's */
       &&   !IsAffectedBy( victim, AFF_PARALYSIS ) )
    {
      if ( victim->fighting
           &&   victim->fighting->who->hhf.hunting
           &&   victim->fighting->who->hhf.hunting->who == victim )
        StopHunting( victim->fighting->who );

      if ( victim->fighting
           &&   victim->fighting->who->hhf.hating
           &&   victim->fighting->who->hhf.hating->who == victim )
        StopHating( victim->fighting->who );

      StopFighting( victim, true );
    }

  if ( victim->hit <=0 && !IsNpc(victim))
    {
      Object *obj;
      Object *obj_next;
      int cnt=0;

      /* RemoveBit( victim->act, PLR_ATTACKER ); Removed to add PLR_DONTAUTOFUEL */

      StopFighting( victim, true );

      if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_DUAL_WIELD ) ) != NULL )
        UnequipCharacter( victim, obj );
      if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) != NULL )
        UnequipCharacter( victim, obj );
      if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_HOLD ) ) != NULL )
        UnequipCharacter( victim, obj );
      if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_MISSILE_WIELD ) ) != NULL )
        UnequipCharacter( victim, obj );
      if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_LIGHT ) ) != NULL )
        UnequipCharacter( victim, obj );

      for ( obj = victim->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;

          if ( obj->wear_loc == WEAR_NONE )
            {
              if ( obj->Prototype->mprog.progtypes & DROP_PROG && obj->count > 1 )
                {
                  ++cnt;
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );
                  if ( !obj_next )
                    obj_next = victim->first_carrying;
                }
              else
                {
                  cnt += obj->count;
                  ObjectFromCharacter( obj );
                }
              Act( AT_ACTION, "$n drops $p.", victim, obj, NULL, TO_ROOM );
              Act( AT_ACTION, "You drop $p.", victim, obj, NULL, TO_CHAR );
              obj = ObjectToRoom( obj, victim->in_room );
            }
        }

      if ( IsNpc( ch ) && !IsNpc( victim ) )
        {
          long xp_to_lose = umax( ( GetAbilityXP( victim, COMBAT_ABILITY ) - GetRequiredXpForLevel( GetAbilityLevel( ch, COMBAT_ABILITY ) ) ), 0 );
	  long xp_actually_lost = LoseXP( victim, COMBAT_ABILITY, xp_to_lose );

          Echo( victim, "You lose %ld experience.\r\n", xp_actually_lost );
        }

      AddTimerToCharacter( victim, TIMER_RECENTFIGHT, 100, NULL, SUB_NONE );
    }

  /*
   * Payoff for killing things.
   */
  if ( victim->position == POS_DEAD )
    {
      GainGroupXP( ch, victim );

      if ( !npcvict )
        {
          sprintf( log_buf, "%s killed by %s at %ld",
                   victim->name,
                   (IsNpc(ch) ? ch->short_descr : ch->name),
                   victim->in_room->vnum );
          LogPrintf( log_buf );
          ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );

        }
      else
        if ( !IsNpc(ch) )              /* keep track of mob vnum killed */
          AddKill( ch, victim );

      ApplyWantedFlags( ch, victim );
      UpdateKillStats( ch, victim );

      if ( !IsNpc( ch ) && ch->pcdata->ClanInfo.Clan )
        UpdateClanMember( ch );
      if ( !IsNpc( victim ) && victim->pcdata->ClanInfo.Clan )
        UpdateClanMember( victim );

      if ( victim->in_room != ch->in_room || !IsNpc(victim) || !IsBitSet( victim->act, ACT_NOKILL )  )
        loot = CanLootVictim( ch, victim );
      else
        loot = false;

      SetCurrentGlobalCharacter(victim);
      RawKill( ch, victim );
      victim = NULL;

      if ( !IsNpc(ch) && loot )
        {
          /* Autogold by Scryn 8/12 */
          if ( IsBitSet(ch->act, PLR_AUTOGOLD) )
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
          if ( IsBitSet(ch->act, PLR_AUTOLOOT) )
            do_get( ch, "all corpse" );
          else
            do_look( ch, "in corpse" );

          if ( IsBitSet(ch->act, PLR_AUTOSAC) )
            do_junk( ch, "corpse" );
        }
      if (IsNpc(ch) && loot)
        {
          do_get( ch, "credits corpse" );
          do_get( ch, "all corpse" );
          if( ch->in_room && ch->in_room->area )
            {
              BoostEconomy( ch->in_room->area, ch->gold / 5 );
              ch->gold /= 5;
            }
        }
      if( !loot && victim && IsNpc(victim) )
        if( victim->in_room && victim->in_room->area )
          BoostEconomy( victim->in_room->area, victim->gold );

      if ( IsBitSet( sysdata.save_flags, SV_KILL ) )
        SaveCharacter( ch );
      return rVICT_DIED;
    }

  if ( victim == ch )
    return rNONE;

  /*
   * Take care of link dead people.
   */
  if ( !npcvict && !victim->desc && !victim->switched )
    {
      if ( GetRandomNumberFromRange( 0, victim->wait ) == 0)
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
      if ( ( IsBitSet(victim->act, ACT_WIMPY) && NumberBits( 1 ) == 0
             &&   victim->hit < victim->max_hit / 2 )
           ||   ( IsAffectedBy(victim, AFF_CHARM) && victim->master
                  &&     victim->master->in_room != victim->in_room ) )
        {
          StartFearing( victim, ch );
          StopHunting( victim );
          do_flee( victim, "" );
        }
    }

  if ( !npcvict
       &&   victim->hit > 0
       &&   victim->hit <= victim->wimpy
       &&   victim->wait == 0 )
    do_flee( victim, "" );
  else
    if ( !npcvict && IsBitSet( victim->act, PLR_FLEE ) )
      do_flee( victim, "" );

  return rNONE;
}

bool IsSafe( const Character *ch, const Character *victim )
{
  if ( !victim )
    return false;

  /* Thx Josh! */
  if ( GetFightingOpponent( ch ) == ch )
    return false;

  if ( IsBitSet( victim->in_room->room_flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You'll have to do that elswhere.\r\n", ch );
      return true;
    }

  if ( GetTrustLevel(ch) > LEVEL_AVATAR )
    return false;

  if ( IsNpc(ch) || IsNpc(victim) )
    return false;

  return false;
}

/*
 * just verify that a corpse looting is legal
 */
bool CanLootVictim( const Character *ch, const Character *victim )
{
  /* pc's can now loot .. why not .. death is pretty final */
  if ( !IsNpc(ch) )
    return true;

  /* non-charmed mobs can loot anything */
  if ( IsNpc(ch) && !ch->master )
    return true;

  return false;
}

static void ApplyWantedFlags( Character *ch, const Character *victim )
{
  if ( IsBitSet(ch->affected_by, AFF_CHARM) )
    {
      if ( !ch->master )
        {
          Bug( "%s: %s bad AFF_CHARM",
               __FUNCTION__, IsNpc(ch) ? ch->short_descr : ch->name );
          StripAffect( ch, gsn_charm_person );
          RemoveBit( ch->affected_by, AFF_CHARM );
          return;
        }

      if ( ch->master )
        {
          ApplyWantedFlags( ch->master, victim );
        }
    }

  if ( IsNpc(victim) && !IsNpc( ch ) )
    {
      int x = 0;

      for ( x = 0; x < 32; x++ )
	{
	  if ( IsBitSet(victim->vip_flags, 1 << x ) )
	    {
	      SetBit(ch->pcdata->wanted_flags, 1 << x );
	      Echo( ch, "&YYou are now wanted on %s.&w\r\n", planet_flags[x] );
	    }
	}
    }
}

static void UpdateKillStats( Character *ch, Character *victim )
{
  if ( IsBitSet(ch->affected_by, AFF_CHARM) )
    {
      if ( !ch->master )
        {
          Bug( "%s: %s bad AFF_CHARM",
               __FUNCTION__, IsNpc(ch) ? ch->short_descr : ch->name );
          StripAffect( ch, gsn_charm_person );
          RemoveBit( ch->affected_by, AFF_CHARM );
          return;
        }

      if ( ch->master )
        {
          UpdateKillStats( ch->master, victim );
        }
    }

  if ( !IsNpc(ch) && IsNpc(victim) )
    {
      if ( ch->pcdata->ClanInfo.Clan )
        {
          ch->pcdata->ClanInfo.Clan->mkills++;
        }

      ch->pcdata->mkills++;
      ch->in_room->area->mkills++;
    }
  else if ( !IsNpc(ch) && !IsNpc(victim) )
    {
      if ( IsClanned( ch ) )
        {
          ch->pcdata->ClanInfo.Clan->pkills++;
        }

      if ( IsClanned( victim ) )
        {
          victim->pcdata->ClanInfo.Clan->pdeaths++;
        }

      ch->pcdata->pkills++;
      UpdatePosition(victim);
    }
  else if ( IsNpc(ch) && !IsNpc(victim) )
    {
      victim->in_room->area->mdeaths++;
    }
}

/*
 * Set position of a victim.
 */
void UpdatePosition( Character *victim )
{
  if ( !victim )
    {
      Bug( "%s: null victim", __FUNCTION__ );
      return;
    }

  if ( victim->hit > 0 )
    {
      if ( victim->position <= POS_STUNNED )
	{
	  victim->position = POS_STANDING;
	}

      if ( IsAffectedBy( victim, AFF_PARALYSIS ) )
	{
	  victim->position = POS_STUNNED;
	}

      return;
    }

#ifdef NODEATH
  if ( !IsNpc(victim) && victim->hit <= -500 )
    {
      victim->hit = -250;
    }
#endif

  if ( IsNpc(victim) || victim->hit <= -500 )
    {
      if ( victim->mount )
        {
          Act( AT_ACTION, "$n falls from $N.", victim, NULL, victim->mount, TO_ROOM );
          RemoveBit( victim->mount->act, ACT_MOUNTED );
          victim->mount = NULL;
        }

      victim->position = POS_DEAD;
      return;
    }

  if ( victim->hit <= -400 )
    {
      victim->position = POS_MORTAL;
    }
  else if ( victim->hit <= -200 )
    {
      victim->position = POS_INCAP;
    }
  else
    {
      victim->position = POS_STUNNED;
    }

  if ( victim->position > POS_STUNNED
       && IsAffectedBy( victim, AFF_PARALYSIS ) )
    {
      victim->position = POS_STUNNED;
    }

  if ( victim->mount )
    {
      Act( AT_ACTION, "$n falls unconscious from $N.", victim, NULL, victim->mount, TO_ROOM );
      RemoveBit( victim->mount->act, ACT_MOUNTED );
      victim->mount = NULL;
    }
}


/*
 * Start fights.
 */
void StartFighting( Character *ch, Character *victim )
{
  Fight *fight = NULL;

  if ( ch->fighting )
    {
      Bug( "%s: %s -> %s (already fighting %s)",
	   __FUNCTION__, ch->name, victim->name, ch->fighting->who->name );
      return;
    }

  if ( IsAffectedBy(ch, AFF_SLEEP) )
    StripAffect( ch, gsn_sleep );

  /* Limit attackers -Thoric */
  if ( victim->num_fighting > MAX_NUMBER_OF_FIGHTERS )
    {
      SendToCharacter( "There are too many people fighting for you to join in.\r\n", ch );
      return;
    }

  AllocateMemory( fight, Fight, 1 );
  fight->who     = victim;
  fight->xp      = (int) ComputeXP( ch, victim );
  fight->align = ComputeNewAlignment( ch, victim );

  if ( !IsNpc(ch) && IsNpc(victim) )
    fight->timeskilled = TimesKilled(ch, victim);

  ch->num_fighting = 1;
  ch->fighting = fight;
  ch->position = POS_FIGHTING;
  victim->num_fighting++;

  if ( victim->switched && IsAffectedBy(victim->switched, AFF_POSSESS) )
    {
      SendToCharacter( "You are disturbed!\r\n", victim->switched );
      do_return( victim->switched, "" );
    }
}

Character *GetFightingOpponent( const Character *ch )
{
  if ( !ch )
    {
      Bug( "%s: null ch", __FUNCTION__ );
      return NULL;
    }

  if ( !ch->fighting )
    return NULL;

  return ch->fighting->who;
}

void FreeFight( Character *ch )
{
  if ( !ch )
    {
      Bug( "Free_fight: null ch!" );
      return;
    }

  if ( ch->fighting )
    {
      if ( !CharacterDiedRecently(ch->fighting->who) )
        --ch->fighting->who->num_fighting;

      FreeMemory( ch->fighting );
    }

  ch->fighting = NULL;

  if ( ch->mount )
    ch->position = POS_MOUNTED;
  else
    ch->position = POS_STANDING;

  /* Berserk wears off after combat. -- Altrag */
  if ( IsAffectedBy(ch, AFF_BERSERK) )
    {
      StripAffect(ch, gsn_berserk);
      SetCharacterColor(AT_WEAROFF, ch);
      SendToCharacter(skill_table[gsn_berserk]->msg_off, ch);
      SendToCharacter("\r\n", ch);
    }
}

/*
 * Stop fights.
 */
void StopFighting( Character *ch, bool fBoth )
{
  Character *fch;

  FreeFight( ch );
  UpdatePosition( ch );

  if ( !fBoth )   /* major short cut here by Thoric */
    return;

  for ( fch = first_char; fch; fch = fch->next )
    {
      if ( GetFightingOpponent( fch ) == ch )
        {
          FreeFight( fch );
          UpdatePosition( fch );
        }
    }
}

void RawKill( Character *killer, Character *victim )
{
  Character *victmp;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char arg[MAX_STRING_LENGTH];
  Object *obj, *obj_next;
  Ship *ship;

  if ( !victim )
    {
      Bug( "RawKill: null victim!" );
      return;
    }

  strcpy( arg , victim->name );

  if ( !IsNpc( victim ) && victim->pcdata->ClanInfo.Clan )
    RemoveClanMember( victim );

  StopFighting( victim, true );

  if ( killer && !IsNpc(killer) && !IsNpc(victim) )
    ClaimBounty( killer, victim );

  /* Take care of polymorphed chars */
  if(IsNpc(victim) && IsBitSet(victim->act, ACT_POLYMORPHED))
    {
      CharacterFromRoom(victim->desc->original);
      CharacterToRoom(victim->desc->original, victim->in_room);
      victmp = victim->desc->original;
      do_revert(victim, "");
      RawKill(killer, victmp);
      return;
    }

  if ( victim->in_room && IsNpc(victim) && victim->vip_flags != 0 && victim->in_room->area && victim->in_room->area->planet )
    {
      victim->in_room->area->planet->population--;
      victim->in_room->area->planet->population = umax( victim->in_room->area->planet->population , 0 );
      victim->in_room->area->planet->pop_support -= (float) ( 1 + 1 / (victim->in_room->area->planet->population + 1) );

      if ( victim->in_room->area->planet->pop_support < -100 )
        victim->in_room->area->planet->pop_support = -100;
    }

  if ( !IsNpc(victim) || !IsBitSet( victim->act, ACT_NOKILL  ) )
    MobProgDeathTrigger( killer, victim );

  if ( CharacterDiedRecently(victim) )
    return;

  if ( !IsNpc(victim) || !IsBitSet( victim->act, ACT_NOKILL  ) )
    RoomProgDeathTrigger( killer, victim );

  if ( CharacterDiedRecently(victim) )
    return;

  if ( !IsNpc(victim) || ( !IsBitSet( victim->act, ACT_NOKILL  ) && !IsBitSet( victim->act, ACT_NOCORPSE ) ) )
    MakeCorpse( victim );
  else
    {
      for ( obj = victim->last_carrying; obj; obj = obj_next )
        {
          obj_next = obj->prev_content;
          ObjectFromCharacter( obj );
          ExtractObject( obj );
        }
    }

  if ( IsNpc(victim) )
    {
      victim->Prototype->killed++;
      ExtractCharacter( victim, true );
      victim = NULL;
      return;
    }

  SetCharacterColor( AT_DIEMSG, victim );
  do_help(victim, "_DIEMSG_" );

  /* swreality chnages begin here */
  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( !StrCmp( ship->owner, victim->name ) )
        {
          FreeMemory( ship->owner );
          ship->owner = CopyString( "" );
          FreeMemory( ship->pilot );
          ship->pilot = CopyString( "" );
          FreeMemory( ship->copilot );
          ship->copilot = CopyString( "" );

          SaveShip( ship );
        }
    }

  if ( victim->plr_home )
    {
      Room *room = victim->plr_home;

      FreeMemory( room->name );
      room->name = CopyString( "An Empty Apartment" );

      RemoveBit( room->room_flags , ROOM_PLR_HOME );
      SetBit( room->room_flags , ROOM_EMPTY_HOME );

      FoldArea( room->area, room->area->filename, false );
    }

  if ( victim->pcdata && victim->pcdata->ClanInfo.Clan )
    {
      if ( !StrCmp( victim->name, victim->pcdata->ClanInfo.Clan->leadership.leader ) )
        {
          FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.leader );
          if ( victim->pcdata->ClanInfo.Clan->leadership.number1 )
            {
              victim->pcdata->ClanInfo.Clan->leadership.leader = CopyString( victim->pcdata->ClanInfo.Clan->leadership.number1 );
              FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.number1 );
              victim->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( "" );
            }
          else if ( victim->pcdata->ClanInfo.Clan->leadership.number2 )
            {
              victim->pcdata->ClanInfo.Clan->leadership.leader = CopyString( victim->pcdata->ClanInfo.Clan->leadership.number2 );
              FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.number2 );
              victim->pcdata->ClanInfo.Clan->leadership.number2 = CopyString( "" );
            }
          else
            victim->pcdata->ClanInfo.Clan->leadership.leader = CopyString( "" );
        }

      if ( !StrCmp( victim->name, victim->pcdata->ClanInfo.Clan->leadership.number1 ) )
        {
          FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.number1 );
          if ( victim->pcdata->ClanInfo.Clan->leadership.number2 )
            {
              victim->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( victim->pcdata->ClanInfo.Clan->leadership.number2 );
              FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.number2 );
              victim->pcdata->ClanInfo.Clan->leadership.number2 = CopyString( "" );
            }
          else
            victim->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( "" );
        }

      if ( !StrCmp( victim->name, victim->pcdata->ClanInfo.Clan->leadership.number2 ) )
        {
          FreeMemory( victim->pcdata->ClanInfo.Clan->leadership.number2 );
          victim->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( "" );
        }

      victim->pcdata->ClanInfo.Clan->members--;
    }

  if ( !victim )
    {
      Descriptor *d;

      /* Make sure they aren't halfway logged in. */
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) && !IsNpc(victim)  )
          break;
      if ( d )
        CloseSocket( d, true );
    }
  else
    {
      int x, y;

      quitting_char = victim;
      SaveCharacter( victim );
      saving_char = NULL;
      ExtractCharacter( victim, true );
      for ( x = 0; x < MAX_WEAR; x++ )
        for ( y = 0; y < MAX_LAYERS; y++ )
          save_equipment[x][y] = NULL;
    }

  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           Capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
           Capitalize( arg ) );

  rename( buf, buf2 );

  sprintf( buf, "%s%c/%s.clone", PLAYER_DIR, tolower(arg[0]),
           Capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           Capitalize( arg ) );

  rename( buf, buf2 );

  sprintf( buf, "%s%s", GOD_DIR, Capitalize(victim->name) );

  if ( !remove( buf ) )
    {
      SendToCharacter( "Player's immortal data destroyed.\r\n", killer );
    }
  else if ( errno != ENOENT )
    {
      Echo( killer, "Unknown error #%d - %s (immortal data).  Report to Darrik\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s slaying %s", killer->name, buf );
      perror( buf2 );
    }

  sprintf( buf, "%s%c/%s.home", PLAYER_DIR, tolower(arg[0]),
           Capitalize( arg ) );
  remove( buf );
}

static void CheckObjectAlignmentZapping( Character *ch )
{
  Object *obj = NULL;
  Object *obj_next = NULL;

  for ( obj = ch->first_carrying; obj; obj = obj_next )
    {
      obj_next = obj->next_content;

      if ( obj->wear_loc == WEAR_NONE )
	{
	  continue;
	}

      if ( ( IS_OBJ_STAT(obj, ITEM_ANTI_EVIL) && IsEvil(ch) )
	   || ( IS_OBJ_STAT(obj, ITEM_ANTI_GOOD) && IsGood(ch) )
	   || ( IS_OBJ_STAT(obj, ITEM_ANTI_NEUTRAL) && IsNeutral(ch) ) )
	{
	  Act( AT_MAGIC, "You are zapped by $p.", ch, obj, NULL, TO_CHAR );
	  Act( AT_MAGIC, "$n is zapped by $p.",   ch, obj, NULL, TO_ROOM );

	  ObjectFromCharacter( obj );
	  obj = ObjectToRoom( obj, ch->in_room );
	  ObjProgZapTrigger(ch, obj);  /* mudprogs */

	  if ( CharacterDiedRecently(ch) )
	    {
	      return;
	    }
	}
    }
}

static int CountGroupMembersInRoom( const Character *ch )
{
  const Character *gch = NULL;
  int members = 0;

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( IsInSameGroup( gch, ch ) )
        {
          members++;
        }
    }

  return members;
}

static void GainGroupXP( Character *ch, Character *victim )
{
  char buf[MAX_STRING_LENGTH];
  Character *gch = NULL;
  const Character *lch = NULL;
  int xp = 0;
  int members = 0;

  /*
   * Monsters don't get kill xp's or alignment changes.
   * Dying of mortal wounds or poison doesn't give xp to anyone!
   */
  if ( IsNpc(ch) || victim == ch )
    {
      return;
    }

  members = CountGroupMembersInRoom( ch );

  if ( members == 0 )
    {
      Bug( "%s: zero members.", __FUNCTION__ );
      members = 1;
    }

  lch = ch->leader ? ch->leader : ch;

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( !IsInSameGroup( gch, ch ) )
	{
	  continue;
	}

      xp = (int) (ComputeXP( gch, victim ) / members);

      gch->alignment = ComputeNewAlignment( gch, victim );

      if ( !IsNpc(gch) && IsNpc(victim) && gch->pcdata && gch->pcdata->ClanInfo.Clan
           && !StrCmp ( gch->pcdata->ClanInfo.Clan->name , victim->mob_clan ) )
        {
          xp = 0;
          sprintf( buf, "You receive no experience for killing your organizations resources.\r\n");
          SendToCharacter( buf, gch );
        }
      else
        {
          sprintf( buf, "You receive %d combat experience.\r\n", xp );
          SendToCharacter( buf, gch );
        }

      GainXP( gch, COMBAT_ABILITY, xp );

      if ( lch == gch && members > 1 )
        {
          xp = urange( members, xp*members, (GetRequiredXpForLevel( GetAbilityLevel( gch, LEADERSHIP_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( gch, LEADERSHIP_ABILITY ) ) / 10) );
          sprintf( buf, "You get %d leadership experience for leading your group to victory.\r\n", xp );
          SendToCharacter( buf, gch );
          GainXP( gch, LEADERSHIP_ABILITY, xp );
        }

      CheckObjectAlignmentZapping( ch );
    }
}


static int ComputeNewAlignment( const Character *gch, const Character *victim )
{
  return urange ( -1000,
                  (int) ( gch->alignment - victim->alignment/5 ),
                  1000 );
}

/*
 * Calculate how much XP gch should gain for killing victim
 * Lots of redesigning for new exp system by Thoric
 */
int ComputeXP( const Character *gch, const Character *victim )
{
  int align;
  int xp = (GetXPWorth( victim )
	    *  urange( 1, (GetAbilityLevel( victim, COMBAT_ABILITY ) - GetAbilityLevel( gch, COMBAT_ABILITY ) ) + 10, 20 )) / 10;
  align = gch->alignment - victim->alignment;

  /* bonus for attacking opposite alignment */
  if ( align >  990 || align < -990 )
    xp = (xp*5) >> 2;
  else
    /* penalty for good attacking same alignment */
    if ( gch->alignment > 300 && align < 250 )
      xp = (xp*3) >> 2;

  xp = GetRandomNumberFromRange( (xp*3) >> 2, (xp*5) >> 2 );

  /* reduce exp for killing the same mob repeatedly             -Thoric */
  if ( !IsNpc( gch ) && IsNpc( victim ) )
    {
      int times = TimesKilled( gch, victim );

      if ( times >= 5 )
        xp = 0;
      else
        if ( times )
          xp = (xp * (5-times)) / 5;
    }

  /* new xp cap for swreality */

  return urange(1, xp, ( GetRequiredXpForLevel( GetAbilityLevel( gch, COMBAT_ABILITY ) + 1 ) - GetRequiredXpForLevel( GetAbilityLevel( gch, COMBAT_ABILITY ) ) ) );
}

/*
 * Revamped by Thoric to be more realistic
 */
static void SendDamageMessages( Character *ch, Character *victim, int dam, int dt )
{
  char buf1[256], buf2[256], buf3[256];
  const char *vs = NULL;
  const char *vp = NULL;
  const char *attack = NULL;
  char punct = '\0';
  short dampc = 0;
  Skill *skill = NULL;
  bool gcflag = false;
  bool gvflag = false;

  if ( dam )
    {
      dampc = ( (dam * 1000) / victim->max_hit) +
	( 50 - ((victim->hit * 50) / victim->max_hit) );
    }

  if ( dam == 0 )
    {
      vs = "miss";
      vp = "misses";
    }
  else if ( dampc <= 5 )
    {
      vs = "barely scratch";
      vp = "barely scratches";
    }
  else if ( dampc <= 10 )
    {
      vs = "scratch";
      vp = "scratches";
    }
  else if ( dampc <= 20 )
    {
      vs = "nick";
      vp = "nicks";
    }
  else if ( dampc <= 30 )
    {
      vs = "graze";
      vp = "grazes";
    }
  else if ( dampc <= 40 )
    {
      vs = "bruise";
      vp = "bruises";
    }
  else if ( dampc <= 50 )
    { vs = "hit";
      vp = "hits";
    }
  else if ( dampc <= 60 )
    {
      vs = "injure";
      vp = "injures";
    }
  else if ( dampc <= 75 )
    {
      vs = "thrash";
      vp = "thrashes";
    }
  else if ( dampc <= 80 )
    {
      vs = "wound";
      vp = "wounds";
    }
  else if ( dampc <= 90 )
    {
      vs = "maul";
      vp = "mauls";
    }
  else if ( dampc <= 125 )
    {
      vs = "decimate";
      vp = "decimates";
    }
  else if ( dampc <= 150 )
    {
      vs = "devastate";
      vp = "devastates";
    }
  else if ( dampc <= 200 )
    {
      vs = "maim";
      vp = "maims";
    }
  else if ( dampc <= 300 )
    {
      vs = "MUTILATE";
      vp = "MUTILATES";
    }
  else if ( dampc <= 400 )
    {
      vs = "DISEMBOWEL";
      vp = "DISEMBOWELS";
    }
  else if ( dampc <= 500 )
    {
      vs = "MASSACRE";
      vp = "MASSACRES";
    }
  else if ( dampc <= 600 )
    {
      vs = "PULVERIZE";
      vp = "PULVERIZES";
    }
  else if ( dampc <= 750 )
    {
      vs = "EVISCERATE";
      vp = "EVISCERATES";
    }
  else if ( dampc <= 990 )
    {
      vs = "* OBLITERATE *";
      vp = "* OBLITERATES *";
    }
  else
    {
      vs = "*** ANNIHILATE ***";
      vp = "*** ANNIHILATES ***";
    }

  punct = (dampc <= 30) ? '.' : '!';

  if ( dam == 0
       && !IsNpc(ch) && IsBitSet(ch->pcdata->flags, PCFLAG_GAG ) )
    {
      gcflag = true;
    }

  if ( dam == 0
       && !IsNpc(victim) && IsBitSet(victim->pcdata->flags, PCFLAG_GAG ) )
    {
      gvflag = true;
    }

  if ( dt >=0 && dt < top_sn )
    {
      skill = skill_table[dt];
    }

  if ( dt == TYPE_HIT || dam==0 )
    {
      sprintf( buf1, "$n %s $N%c",  vp, punct );
      sprintf( buf2, "You %s $N%c", vs, punct );
      sprintf( buf3, "$n %s you%c", vp, punct );
    }
  else if ( dt > TYPE_HIT && IsWieldingPoisonedWeapon( ch ) )
    {
      if ( dt < TYPE_HIT + (int) GetAttackTableSize() )
	{
	  attack = GetAttackType_name( dt - TYPE_HIT );
	}
      else
	{
	  Bug( "%s: bad dt %d.", __FUNCTION__, dt );
	  dt  = TYPE_HIT;
	  attack = GetAttackType_name( 0 );
	}

      sprintf( buf1, "$n's poisoned %s %s $N%c", attack, vp, punct );
      sprintf( buf2, "Your poisoned %s %s $N%c", attack, vp, punct );
      sprintf( buf3, "$n's poisoned %s %s you%c", attack, vp, punct );
    }
  else
    {
      if ( skill )
	{
	  attack = skill->noun_damage;

	  if ( dam == 0 )
	    {
	      bool found = false;

	      if ( skill->miss_char && skill->miss_char[0] != '\0' )
		{
		  Act( AT_HIT, skill->miss_char, ch, NULL, victim, TO_CHAR );
		  found = true;
		}

	      if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
		{
		  Act( AT_HITME, skill->miss_vict, ch, NULL, victim, TO_VICT );
		  found = true;
		}

	      if ( skill->miss_room && skill->miss_room[0] != '\0' )
		{
		  Act( AT_ACTION, skill->miss_room, ch, NULL, victim, TO_NOTVICT );
		  found = true;
		}

	      if ( found )    /* miss message already sent */
		{
		  return;
		}
	    }
	  else
	    {
	      if ( skill->hit_char && skill->hit_char[0] != '\0' )
		{
		  Act( AT_HIT, skill->hit_char, ch, NULL, victim, TO_CHAR );
		}

	      if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
		{
		  Act( AT_HITME, skill->hit_vict, ch, NULL, victim, TO_VICT );
		}

	      if ( skill->hit_room && skill->hit_room[0] != '\0' )
		{
		  Act( AT_ACTION, skill->hit_room, ch, NULL, victim, TO_NOTVICT );
		}
	    }
	}
      else if ( dt >= TYPE_HIT
		&& dt < TYPE_HIT + (int) GetAttackTableSize() )
	{
	  attack = GetAttackType_name( dt - TYPE_HIT );
	}
      else
	{
	  Bug( "%s: bad dt %d.", __FUNCTION__, dt );
	  dt  = TYPE_HIT;
	  attack = GetAttackType_name( 0 );
	}

      sprintf( buf1, "$n's %s %s $N%c",  attack, vp, punct );
      sprintf( buf2, "Your %s %s $N%c",  attack, vp, punct );
      sprintf( buf3, "$n's %s %s you%c", attack, vp, punct );
    }

  if ( GetAbilityLevel( ch, COMBAT_ABILITY ) >= 50 )
    {
      sprintf( buf2, "%s You do %d points of damage.", buf2, dam);
    }

  Act( AT_ACTION, buf1, ch, NULL, victim, TO_NOTVICT );

  if (!gcflag)
    {
      Act( AT_HIT, buf2, ch, NULL, victim, TO_CHAR );
    }

  if (!gvflag)
    {
      Act( AT_HITME, buf3, ch, NULL, victim, TO_VICT );
    }
}

bool IsInArena( const Character *ch )
{
  if( IsBitSet( ch->in_room->room_flags, ROOM_ARENA ) )
    {
      return true;
    }
  else
    {
      return false;
    }
}

static bool SprintForCover( Character *ch )
{
  Room *was_in = NULL;
  Room *now_in = NULL;
  int attempt = 0;
  DirectionType door = DIR_INVALID;
  Exit *pexit = NULL;

  if ( !GetFightingOpponent( ch ) )
    return false;

  if ( ch->position < POS_FIGHTING )
    return false;

  was_in = ch->in_room;

  for ( attempt = 0; attempt < 10; attempt++ )
    {
      door = GetRandomDoor();

      if ( ( pexit = GetExit(was_in, door) ) == NULL
           || !pexit->to_room
           || ( IsBitSet(pexit->exit_info, EX_CLOSED)
                && !IsAffectedBy( ch, AFF_PASS_DOOR ) )
           || ( IsNpc(ch)
                && IsBitSet(pexit->to_room->room_flags, ROOM_NO_MOB) ) )
	{
	  continue;
	}

      StripAffect( ch, gsn_sneak );
      RemoveBit( ch->affected_by, AFF_SNEAK );

      if ( ch->mount && ch->mount->fighting )
	{
	  StopFighting( ch->mount, true );
	}

      MoveCharacter( ch, pexit, 0 );

      if ( ( now_in = ch->in_room ) == was_in )
	{
	  continue;
	}

      ch->in_room = was_in;
      Act( AT_FLEE, "$n sprints for cover!", ch, NULL, NULL, TO_ROOM );
      ch->in_room = now_in;
      Act( AT_FLEE, "$n spins around and takes aim.", ch, NULL, NULL, TO_ROOM );

      StopFighting( ch, true );

      return true;
    }

  return false;
}
