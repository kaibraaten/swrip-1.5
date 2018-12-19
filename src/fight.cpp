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

#include <functional>
#include <numeric>
#include <cassert>
#include <cstring>
#include <cctype>
#include <cerrno>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "arena.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "bounty.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "exit.hpp"
#include "repos/shiprepository.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"

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
       && IsBitSet( obj->Flags, ITEM_POISONED) )
    return true;

  return false;
}

/*
 * hunting, hating and fearing code                             -Thoric
 */
bool IsHunting( const Character *ch, const Character *victim )
{
  if ( !ch->HHF.Hunting || ch->HHF.Hunting->Who != victim )
    return false;

  return true;
}

bool IsHating( const Character *ch, const Character *victim )
{
  if ( !ch->HHF.Hating || ch->HHF.Hating->Who != victim )
    return false;

  return true;
}

bool IsFearing( const Character *ch, const Character *victim )
{
  if ( !ch->HHF.Fearing || ch->HHF.Fearing->Who != victim )
    return false;

  return true;
}

void StopHunting( Character *ch )
{
  if ( ch->HHF.Hunting )
    {
      delete ch->HHF.Hunting;
      ch->HHF.Hunting = NULL;
    }
}

void StopHating( Character *ch )
{
  if ( ch->HHF.Hating )
    {
      delete ch->HHF.Hating;
      ch->HHF.Hating = NULL;
    }
}

void StopFearing( Character *ch )
{
  if ( ch->HHF.Fearing )
    {
      delete ch->HHF.Fearing;
      ch->HHF.Fearing = NULL;
    }
}

void StartHunting( Character *ch, Character *victim )
{
  if ( ch->HHF.Hunting )
    StopHunting( ch );

  ch->HHF.Hunting = new HuntHateFear();
  ch->HHF.Hunting->Name = victim->Name;
  ch->HHF.Hunting->Who  = victim;
}

void StartHating( Character *ch, Character *victim )
{
  if ( ch->HHF.Hating )
    StopHating( ch );

  ch->HHF.Hating = new HuntHateFear();
  ch->HHF.Hating->Name = victim->Name;
  ch->HHF.Hating->Who  = victim;
}

void StartFearing( Character *ch, Character *victim )
{
  if ( ch->HHF.Fearing )
    StopFearing( ch );

  ch->HHF.Fearing = new HuntHateFear();
  ch->HHF.Fearing->Name = victim->Name;
  ch->HHF.Fearing->Who  = victim;
}

static void ExpireCommandCallbackTimers(Character *ch)
{
  std::list<Timer*> characterTimers(ch->Timers());

  for(Timer *timer : characterTimers)
    {
      if ( --timer->Count <= 0 )
        {
          if ( timer->Type == TIMER_CMD_FUN )
            {
              CharacterSubState tempsub = ch->SubState;

              ch->SubState = (CharacterSubState)timer->Value;
              timer->DoFun( ch, "" );

              if ( CharacterDiedRecently(ch) )
                {
                  break;
                }

              ch->SubState = tempsub;
            }

          ExtractTimer( ch, timer );
        }
    }
}

static void RemoveExpiredAffects(Character *ch)
{
  std::list<Affect*> affects(ch->Affects());

  for(auto affectIter = std::begin(affects); affectIter != std::end(affects); ++affectIter)
    {
      Affect *paf = *affectIter;

      if ( paf->Duration > 0 )
        {
          paf->Duration--;
        }
      else if ( paf->Duration < 0 )
        {
          // Intentionally empty
        }
      else
        {
          Affect *paf_next = nullptr;
          auto nextIter = affectIter;
          ++nextIter;

          if(nextIter != std::end(affects))
            {
              paf_next = *nextIter;
            }

          if ( paf_next == nullptr
               || paf_next->Type != paf->Type
               || paf_next->Duration > 0 )
            {
              const Skill *skill = GetSkill(paf->Type);

              if ( paf->Type > 0 && skill && !skill->Messages.WearOff.empty())
                {
                  SetCharacterColor( AT_WEAROFF, ch );
                  ch->Echo( "%s\r\n", skill->Messages.WearOff.c_str() );
                }
            }

          if (paf->Type == gsn_possess)
            {
              ch->Desc->Character       = ch->Desc->Original;
              ch->Desc->Original        = NULL;
              ch->Desc->Character->Desc = ch->Desc;
              ch->Desc->Character->Switched = NULL;
              ch->Desc                  = NULL;
            }

          RemoveAffect( ch, paf );
        }
    }
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
  for ( Character *ch = LastCharacter; ch; ch = gch_prev )
    {
      SetCurrentGlobalCharacter( ch );

      gch_prev  = ch->Previous;

      /*
       * See if we got a pointer to someone who recently died...
       * if so, either the pointer is bad... or it's a player who
       * "died", and is back at the healer...
       * Since he/she's in the char_list, it's likely to be the later...
       * and should not already be in another fight already
       */
      if ( CharacterDiedRecently(ch) )
        {
          continue;
        }

      /*
       * Experience gained during battle deceases as battle drags on
       */
      if ( ch->Fighting != nullptr )
        {
          if ( (++ch->Fighting->Duration % 24) == 0 )
            {
              ch->Fighting->Xp = ((ch->Fighting->Xp * 9) / 10);
            }
        }

      ExpireCommandCallbackTimers(ch);

      if ( CharacterDiedRecently(ch) )
        {
          continue;
        }

      RemoveExpiredAffects(ch);

      Character *victim = GetFightingOpponent(ch);

      if ( victim == nullptr || IsAffectedBy( ch, AFF_PARALYSIS ) )
        {
          continue;
        }

      ch_ret retcode = rNONE;

      if ( ch->InRoom->Flags.test( Flag::Room::Safe ) )
        {
          Log->Info( "ViolenceUpdate: %s fighting %s in a SAFE room.",
                     ch->Name.c_str(), victim->Name.c_str() );
          StopFighting( ch, true );
        }
      else if ( IsAwake(ch) && ch->InRoom == victim->InRoom )
        {
          retcode = HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
        }
      else
        {
          StopFighting( ch, false );
        }

      if ( CharacterDiedRecently(ch) )
        {
          continue;
        }

      if ( retcode == rCHAR_DIED
           || ( victim = GetFightingOpponent( ch ) ) == NULL )
        {
          continue;
        }

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
        {
          continue;
        }

      MobProgHitPercentTrigger( ch, victim );

      if ( CharacterDiedRecently(ch) )
        {
          continue;
        }

      MobProgFightTrigger( ch, victim );

      if ( CharacterDiedRecently(ch) )
        {
          continue;
        }

      /*
       * Fun for the whole family!
       */
      std::list<Character*> copyOfCharacterList(ch->InRoom->Characters());

      for(Character *rch : ch->InRoom->Characters())
        {
          if ( IsAwake(rch) && !rch->Fighting )
            {
              /*
               * PC's auto-assist others in their group.
               */
              if ( !IsNpc(ch) || IsAffectedBy(ch, AFF_CHARM) )
                {
                  if ( ( !IsNpc(rch) || IsAffectedBy(rch, AFF_CHARM) )
                       && IsInSameGroup(ch, rch) )
                    {
                      HitMultipleTimes( rch, victim, TYPE_UNDEFINED );
                    }

                  continue;
                }

              /*
               * NPC's assist NPC's of same type or 12.5% chance regardless.
               */
              if ( IsNpc(rch) && !IsAffectedBy(rch, AFF_CHARM)
                   &&  !IsBitSet(rch->Flags, ACT_NOASSIST) )
                {
                  if ( CharacterDiedRecently(ch) )
                    {
                      break;
                    }

                  if ( rch->Prototype == ch->Prototype
                       || NumberBits( 3 ) == 0 )
                    {
                      Character *target = nullptr;
                      int number = 0;

                      for(Character *vch : ch->InRoom->Characters())
                        {
                          if ( CanSeeCharacter( rch, vch )
                               && IsInSameGroup( vch, victim )
                               && GetRandomNumberFromRange( 0, number ) == 0 )
                            {
                              target = vch;
                              number++;
                            }
                        }

                      if ( target != nullptr )
                        {
                          HitMultipleTimes( rch, target, TYPE_UNDEFINED );
                        }
                    }
                }
            }
        }
    }
}

static ch_ret PerformNthAttack(Character *ch, Character *victim, int dt, int gsn,
                               std::function<int()> getHitChance)
{
  int hit_chance = getHitChance();

  if ( GetRandomPercent() < hit_chance )
    {
      LearnFromSuccess( ch, gsn );
      ch_ret retcode = HitOnce( ch, victim, dt );

      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        {
          return retcode;
        }
    }
  else
    {
      LearnFromFailure( ch, gsn );
    }

  return rNONE;
}

static ch_ret Perform2ndAttack(Character *ch, Character *victim, int dual_bonus, int dt)
{
  return PerformNthAttack(ch, victim, dt, gsn_second_attack,
                          [ch, dual_bonus]()
                          {
                            return IsNpc(ch) ? ch->TopLevel
                              : (int) ((ch->PCData->Learned[gsn_second_attack]+dual_bonus)/1.5);
                          });
}

static ch_ret Perform3rdAttack(Character *ch, Character *victim, int dual_bonus, int dt)
{
  return PerformNthAttack(ch, victim, dt, gsn_third_attack,
                          [ch, dual_bonus]()
                          {
                            return IsNpc(ch) ? ch->TopLevel
                              : (int) ((ch->PCData->Learned[gsn_third_attack]+(dual_bonus*1.5))/2);
                          });
}

static ch_ret Perform4thAttack(Character *ch, Character *victim, int dual_bonus, int dt)
{
  return PerformNthAttack(ch, victim, dt, gsn_fourth_attack,
                          [ch, dual_bonus]()
                          {
                            return IsNpc(ch) ? ch->TopLevel
                              : (int) ((ch->PCData->Learned[gsn_fourth_attack]+(dual_bonus*1.5))/2);
                          });
}

static ch_ret Perform5thAttack(Character *ch, Character *victim, int dual_bonus, int dt)
{
  return PerformNthAttack(ch, victim, dt, gsn_fifth_attack,
                          [ch, dual_bonus]()
                          {
                            return IsNpc(ch) ? ch->TopLevel
                              : (int) ((ch->PCData->Learned[gsn_fifth_attack]+(dual_bonus*1.5))/2);
                          });
}

/*
 * Do one group of attacks.
 */
ch_ret HitMultipleTimes( Character *ch, Character *victim, int dt )
{
  /* add timer if player is attacking another player */
  if ( !IsNpc(ch) && !IsNpc(victim) )
    {
      AddTimerToCharacter( ch, TIMER_RECENTFIGHT, 20, NULL, SUB_NONE );
    }

  if ( !IsNpc(ch) && IsBitSet( ch->Flags, PLR_NICE ) && !IsNpc( victim ) )
    {
      return rNONE;
    }

  // First attack
  ch_ret retcode = HitOnce( ch, victim, dt );

  if ( retcode != rNONE )
    {
      return retcode;
    }

  if ( GetFightingOpponent( ch ) != victim )
    {
      return rNONE;
    }

  // Don't do more attacks if this is a backstab or a circle.
  if ( dt == gsn_backstab
       || dt == gsn_circle)
    {
      return rNONE;
    }

  // Berserk extra attack
  /* Very high chance of hitting compared to chance of going berserk */
  /* 40% or higher is always hit.. don't learn anything here though. */
  /* -- Altrag */
  int hit_chance = IsNpc(ch) ? 100 : (ch->PCData->Learned[gsn_berserk] * 5 / 2);

  if ( IsAffectedBy(ch, AFF_BERSERK) && GetRandomPercent() < hit_chance )
    {
      retcode = HitOnce( ch, victim, dt );

      if ( retcode != rNONE
           || GetFightingOpponent( ch ) != victim )
        {
          return retcode;
        }
    }

  // Dual wield
  int dual_bonus = 0;

  if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) )
    {
      dual_bonus = IsNpc(ch) ? (GetAbilityLevel( ch, COMBAT_ABILITY ) / 10) : (ch->PCData->Learned[gsn_dual_wield] / 10);

      retcode = PerformNthAttack(ch, victim, dt, gsn_dual_wield,
                                 [ch, dual_bonus]()
                                 {
                                   return IsNpc(ch) ? ch->TopLevel : ch->PCData->Learned[gsn_dual_wield];
                                 });
      if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
        {
          return retcode;
        }
    }
  else
    {
      dual_bonus = 0;
    }

  if ( ch->Fatigue.Current < 10 )
    {
      dual_bonus = -20;
    }

  /*
   * NPC predetermined number of (extra) attacks                        -Thoric
   */
  if ( IsNpc(ch) && ch->NumberOfAttacks > 0 )
    {
      for ( int i = 0; i <= ch->NumberOfAttacks; ++i )
        {
          retcode = HitOnce( ch, victim, dt );

          if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
            {
              return retcode;
            }
        }

      return retcode;
    }

  // Second attack
  retcode = Perform2ndAttack(ch, victim, dual_bonus, dt);

  if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
    {
      return retcode;
    }

  // Third attack
  retcode = Perform3rdAttack( ch, victim, dual_bonus, dt );

  if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
    {
      return retcode;
    }

  // Fourth attack
  retcode = Perform4thAttack( ch, victim, dual_bonus, dt );

  if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
    {
      return retcode;
    }

  // Fifth attack
  retcode = Perform5thAttack( ch, victim, dual_bonus, dt );

  if ( retcode != rNONE || GetFightingOpponent( ch ) != victim )
    {
      return retcode;
    }

  retcode = rNONE;

  // Extra 25% chance bonus attack for NPCs.
  hit_chance = IsNpc(ch) ? (int) (ch->TopLevel / 4) : 0;

  if ( GetRandomPercent() < hit_chance )
    {
      retcode = HitOnce( ch, victim, dt );
    }

  // Inflict movement cost
  if ( retcode == rNONE )
    {
      int move = 0;

      if ( !IsAffectedBy(ch, AFF_FLYING)
           && !IsAffectedBy(ch, AFF_FLOATING) )
        {
          move = GetCarryEncumbrance( ch, MovementLoss[umin(SECT_MAX-1, ch->InRoom->Sector)] );
        }
      else
        {
          move = GetCarryEncumbrance( ch, 1 );
        }

      if ( ch->Fatigue.Current != 0 )
        {
          ch->Fatigue.Current = umax( 0, ch->Fatigue.Current - move );
        }
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
      switch(wield->Value[OVAL_WEAPON_TYPE])
        {
        case WEAPON_LIGHTSABER:
          *gsn_ptr = gsn_lightsabers;
          break;

        case WEAPON_VIBRO_BLADE:
          *gsn_ptr = gsn_vibro_blades;
          break;

        case WEAPON_WHIP:
          *gsn_ptr = gsn_flexible_arms;
          break;

        case WEAPON_CLAW:
          *gsn_ptr = gsn_talonous_arms;
          break;

        case WEAPON_BLASTER:
          *gsn_ptr = gsn_blasters;
          break;

        case WEAPON_BLUDGEON:
          *gsn_ptr = gsn_bludgeons;
          break;

        case WEAPON_BOWCASTER:
          *gsn_ptr = gsn_bowcasters;
          break;

        case WEAPON_FORCE_PIKE:
          *gsn_ptr = gsn_force_pikes;
          break;

        default:
          *gsn_ptr = -1;
          break;
        }

      if ( *gsn_ptr != -1 )
        {
          bonus = (int) ( ch->PCData->Learned[*gsn_ptr] );
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
  int tohit = accumulate(std::begin(obj->Prototype->Affects()),
                         std::end(obj->Prototype->Affects()),
                         0,
                         [](int sumSoFar, const auto affect)
                         {
                           if(affect->Location == APPLY_HITROLL)
                             {
                               sumSoFar += affect->Modifier;
                             }

                           return sumSoFar;
                         });

  tohit += accumulate(std::begin(obj->Affects()),
                      std::end(obj->Affects()),
                      0,
                      [](int sumSoFar, const auto affect)
                      {
                        if(affect->Location == APPLY_HITROLL)
                          {
                            sumSoFar += affect->Modifier;
                          }

                        return sumSoFar;
                      });

  return tohit;
}

/*
 * Offensive shield level modifier
 */
static short GetOffensiveShieldLevelModifier( const Character *ch, const Character *victim )
{
  if ( !IsNpc(ch) )            /* players get much less effect */
    {
      short lvl = umax( 1, (GetAbilityLevel( ch, FORCE_ABILITY ) ) );

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
      short lvl = ch->TopLevel;

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
  /*
   * Can't beat a dead char!
   * Guard against weird room-leavings.
   */
  if ( victim->Position == POS_DEAD || ch->InRoom != victim->InRoom )
    {
      return rVICT_DIED;
    }

  /*
   * Figure out the weapon doing the damage                     -Thoric
   */
  Object *wield = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD );

  if ( wield != nullptr )
    {
      if ( dual_flip == false )
        {
          dual_flip = true;
          wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
        }
      else
        {
          dual_flip = false;
        }
    }
  else
    {
      wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );
    }

  int prof_gsn = 0;
  int prof_bonus = GetWeaponProficiencyBonus( ch, wield, &prof_gsn );
  ch_ret retcode = rNONE;

  if ( ch->Fighting != nullptr            /* make sure fight is already started */
       && dt == TYPE_UNDEFINED
       && IsNpc(ch)
       && ch->AttackFlags != 0 )
    {
      int cnt = 0;
      int attacktype = 0;

      for ( ;; )
        {
          int x = GetRandomNumberFromRange( 0, 6 );
          attacktype = 1 << x;

          if ( IsBitSet( ch->AttackFlags, attacktype ) )
            {
              break;
            }

          if ( cnt++ > 16 )
            {
              attacktype = 0;
              break;
            }
        }

      if ( attacktype == ATCK_BACKSTAB )
        {
          attacktype = 0;
        }

      if ( wield && GetRandomPercent() > 25 )
        {
          attacktype = 0;
        }

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
        {
          return retcode;
        }
    }

  if ( dt == TYPE_UNDEFINED )
    {
      dt = TYPE_HIT;

      if ( wield && wield->ItemType == ITEM_WEAPON )
        {
          dt += wield->Value[OVAL_WEAPON_TYPE];
        }
    }

  /*
   * Calculate to-hit-armor-class-0 versus armor.
   */
  int thac0_00 = 20;
  int thac0_32 = 10;
  int thac0 = Interpolate( GetAbilityLevel( ch, COMBAT_ABILITY ), thac0_00, thac0_32 ) - GetHitRoll(ch);
  int victim_ac = (int) (GetArmorClass(victim) / 10);

  /* if you can't see what's coming... */
  if ( wield && !CanSeeObject( victim, wield) )
    {
      victim_ac += 1;
    }

  if ( !CanSeeCharacter( ch, victim ) )
    {
      victim_ac -= 4;
    }

  if ( ch->Race == RACE_DEFEL )
    {
      victim_ac += 2;
    }

  if ( !IsAwake ( victim ) )
    {
      victim_ac += 5;
    }

  /* Weapon proficiency bonus */
  victim_ac += prof_bonus / 20;

  /*
   * The moment of excitement!
   */
  int diceroll = GetRandomNumberFromRange( 1, 20 );

  if ( diceroll == 1
       || ( diceroll < 20 && diceroll < thac0 - victim_ac ) )
    {
      /* Miss. */
      if ( prof_gsn != -1 )
        {
          LearnFromFailure( ch, prof_gsn );
        }

      InflictDamage( ch, victim, 0, dt );
      return rNONE;
    }

  int dam = 0;

  /*
   * Hit.
   * Calc damage.
   */
  if ( !wield )       /* dice formula fixed by Thoric */
    {
      dam = GetRandomNumberFromRange( ch->BareNumDie, ch->BareSizeDie * ch->BareNumDie );
    }
  else
    {
      dam = GetRandomNumberFromRange( wield->Value[OVAL_WEAPON_NUM_DAM_DIE],
                                      wield->Value[OVAL_WEAPON_SIZE_DAM_DIE] );
    }

  /*
   * Bonuses.
   */
  dam += GetDamageRoll(ch);

  if ( prof_bonus )
    {
      dam *= ( 1 + prof_bonus / 100 );
    }

  if ( !IsNpc(ch) && ch->PCData->Learned[gsn_enhanced_damage] > 0 )
    {
      dam += (int) (dam * ch->PCData->Learned[gsn_enhanced_damage] / 120);
      LearnFromSuccess( ch, gsn_enhanced_damage );
    }

  if ( !IsAwake(victim) )
    {
      dam *= 2;
    }

  if ( dt == gsn_backstab )
    {
      dam *= (2 + urange( 2, GetAbilityLevel( ch, HUNTING_ABILITY ) - (GetAbilityLevel( victim, COMBAT_ABILITY ) / 4), 30 ) / 8);
    }

  if ( dt == gsn_circle )
    {
      dam *= (2 + urange( 2, GetAbilityLevel( ch, HUNTING_ABILITY ) - (GetAbilityLevel( victim, COMBAT_ABILITY ) / 2), 30 ) / 40);
    }

  int plusris = 0;

  if ( wield )
    {
      if ( IsBitSet( wield->Flags, ITEM_MAGIC ) )
        {
          dam = ModifyDamageBasedOnResistance( victim, dam, RIS_MAGIC );
        }
      else
        {
          dam = ModifyDamageBasedOnResistance( victim, dam, RIS_NONMAGIC );
        }

      /*
       * Handle PLUS1 - PLUS6 ris bits vs. weapon hitroll       -Thoric
       */
      plusris = GetObjectHitrollBonus( wield );
    }
  else
    {
      dam = ModifyDamageBasedOnResistance( victim, dam, RIS_NONMAGIC );
    }

  /* check for RIS_PLUSx                                        -Thoric */
  if ( dam != 0 )
    {
      int res = -1;
      int imm = -1;
      int sus = -1;

      if ( plusris != 0 )
        {
          plusris = RIS_PLUS1 << umin(plusris, 7);
        }

      /* find high ris */
      for ( int i = RIS_PLUS1; i <= RIS_PLUS6; i <<= 1 )
        {
          if ( IsBitSet( victim->Immune, i ) )
            {
              imm = i;
            }

          if ( IsBitSet( victim->Resistant, i ) )
            {
              res = i;
            }

          if ( IsBitSet( victim->Susceptible, i ) )
            {
              sus = i;
            }
        }

      int mod = 10;

      if ( imm >= plusris )
        {
          mod -= 10;
        }

      if ( res >= plusris )
        {
          mod -= 2;
        }

      if ( sus <= plusris )
        {
          mod += 2;
        }

      /* check if immune */
      if ( mod <= 0 )
        {
          dam = -1;
        }

      if ( mod != 10 )
        {
          dam = (dam * mod) / 10;
        }
    }

  /* race modifier */

  /*
   * check to see if weapon is charged
   */

  if ( dt == (TYPE_HIT + WEAPON_BLASTER ) && wield && wield->ItemType == ITEM_WEAPON )
    {
      if ( wield->Value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n points their blaster at you but nothing happens.",
               ch, NULL, victim, TO_VICT );
          Act( AT_YELLOW, "*CLICK* ... your blaster needs a new ammunition cell!",
               ch, NULL, victim, TO_CHAR );

          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->Name );
            }

          return rNONE;
        }
      else if ( wield->BlasterSetting == BLASTER_FULL && wield->Value[OVAL_WEAPON_CHARGE] >=5 )
        {
          dam *=  1.5;
          wield->Value[OVAL_WEAPON_CHARGE] -= 5;
        }
      else if ( wield->BlasterSetting == BLASTER_HIGH && wield->Value[OVAL_WEAPON_CHARGE] >=4 )
        {
          dam *=  1.25;
          wield->Value[OVAL_WEAPON_CHARGE] -= 4;
        }
      else if ( wield->BlasterSetting == BLASTER_NORMAL && wield->Value[OVAL_WEAPON_CHARGE] >=3 )
        {
          wield->Value[OVAL_WEAPON_CHARGE] -= 3;
        }
      else if ( wield->BlasterSetting == BLASTER_STUN && wield->Value[OVAL_WEAPON_CHARGE] >=5 )
        {
          dam /= 10;
          wield->Value[OVAL_WEAPON_CHARGE] -= 3;
          int hit_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, COMBAT_ABILITY ), RIS_PARALYSIS );
          bool fail = false;

          if ( hit_chance == 1000 )
            {
              fail = true;
            }
          else
            {
              fail = SaveVsParalyze( hit_chance, victim );
            }

          if ( victim->WasStunned > 0 )
            {
              fail = true;
              victim->WasStunned--;
            }

          hit_chance = 100 - GetCurrentConstitution(victim) - GetAbilityLevel( victim, COMBAT_ABILITY ) / 2;
          /* harder for player to stun another player */
          if ( !IsNpc(ch) && !IsNpc(victim) )
            {
              hit_chance -= SysData.StunModPlrVsPlr;
            }
          else
            {
              hit_chance -= SysData.StunRegular;
            }

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
                  Affect af;
                  af.Type       = gsn_stun;
                  af.Location   = APPLY_AC;
                  af.Modifier   = 20;
                  af.Duration   = 7;
                  af.AffectedBy = AFF_PARALYSIS;
                  AffectToCharacter( victim, &af );
                  UpdatePosition( victim );

                  if ( IsNpc(victim) )
                    {
                      StartHating( victim, ch );
                      StartHunting( victim, ch );
                      victim->WasStunned = 10;
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
      else if ( wield->BlasterSetting == BLASTER_HALF && wield->Value[OVAL_WEAPON_CHARGE] >=2 )
        {
          dam *= 0.75;
          wield->Value[OVAL_WEAPON_CHARGE] -= 2;
        }
      else
        {
          dam *= 0.5;
          wield->Value[OVAL_WEAPON_CHARGE] -= 1;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_VIBRO_BLADE )
            && wield != nullptr
            && wield->ItemType == ITEM_WEAPON )
    {
      if ( wield->Value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "Your vibro-blade needs recharging...", ch, NULL, victim, TO_CHAR );
          dam /= 3;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_FORCE_PIKE )
            && wield != nullptr
            && wield->ItemType == ITEM_WEAPON )
    {
      if ( wield->Value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "Your force-pike needs recharging...", ch, NULL, victim, TO_CHAR    );
          dam /= 2;
        }
      else
        {
          wield->Value[OVAL_WEAPON_CHARGE]--;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_LIGHTSABER )
            && wield != nullptr
            && wield->ItemType == ITEM_WEAPON )
    {
      if ( wield->Value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n waves a dead hand grip around in the air.",  ch, NULL, victim, TO_VICT    );
          Act( AT_YELLOW, "You need to recharge your lightsaber ... it seems to be lacking a blade.", ch, NULL, victim, TO_CHAR    );

          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->Name );
            }

          return rNONE;
        }
    }
  else if ( dt == (TYPE_HIT + WEAPON_BOWCASTER ) && wield && wield->ItemType == ITEM_WEAPON )
    {
      if ( wield->Value[OVAL_WEAPON_CHARGE] < 1  )
        {
          Act( AT_YELLOW, "$n points their bowcaster at you but nothing happens.",  ch, NULL, victim, TO_VICT    );
          Act( AT_YELLOW, "*CLICK* ... your bowcaster needs a new bolt cartridge!", ch, NULL, victim, TO_CHAR    );

          if ( IsNpc(ch) )
            {
              do_remove( ch, wield->Name );
            }

          return rNONE;
        }
      else
        {
          wield->Value[OVAL_WEAPON_CHARGE]--;
        }
    }

  if ( dam <= 0 )
    {
      dam = 1;
    }

  if ( prof_gsn != -1 )
    {
      if ( dam > 0 )
        {
          LearnFromSuccess( ch, prof_gsn );
        }
      else
        {
          LearnFromFailure( ch, prof_gsn );
        }
    }

  /* immune to damage */
  if ( dam == -1 )
    {
      if ( dt >= 0 && dt < TopSN )
        {
          Skill *skill = SkillTable[dt];
          bool found = false;

          if ( !skill->Messages.VictimImmune.ToCaster.empty() )
            {
              Act( AT_HIT, skill->Messages.VictimImmune.ToCaster, ch, NULL, victim, TO_CHAR );
              found = true;
            }

          if ( !skill->Messages.VictimImmune.ToVictim.empty() )
            {
              Act( AT_HITME, skill->Messages.VictimImmune.ToVictim, ch, NULL, victim, TO_VICT );
              found = true;
            }

          if ( !skill->Messages.VictimImmune.ToRoom.empty() )
            {
              Act( AT_ACTION, skill->Messages.VictimImmune.ToRoom, ch, NULL, victim, TO_NOTVICT );
              found = true;
            }

          if ( found )
            {
              return rNONE;
            }
        }

      dam = 0;
    }

  retcode = InflictDamage( ch, victim, dam, dt );

  if ( retcode != rNONE )
    {
      return retcode;
    }

  if ( CharacterDiedRecently(ch) )
    {
      return rCHAR_DIED;
    }

  if ( CharacterDiedRecently(victim) )
    {
      return rVICT_DIED;
    }

  retcode = rNONE;

  if ( dam == 0 )
    {
      return retcode;
    }

  /* weapon spells      -Thoric */
  if ( wield != nullptr
       && !IsBitSet(victim->Immune, RIS_MAGIC)
       && !victim->InRoom->Flags.test( Flag::Room::NoMagic ) )
    {
      for(const Affect *aff : wield->Prototype->Affects())
        {
          if ( aff->Location == APPLY_WEAPONSPELL
               && IS_VALID_SN(aff->Modifier)
               && SkillTable[aff->Modifier]->SpellFunction )
            {
              retcode = SkillTable[aff->Modifier]->SpellFunction( aff->Modifier, (wield->Level+3)/3, ch, victim );
            }
        }

      if ( retcode != rNONE
           || CharacterDiedRecently(ch)
           || CharacterDiedRecently(victim) )
        {
          return retcode;
        }

      for(const Affect *aff : wield->Affects())
        {
          if ( aff->Location == APPLY_WEAPONSPELL
               && IS_VALID_SN(aff->Modifier)
               && SkillTable[aff->Modifier]->SpellFunction )
            {
              retcode = SkillTable[aff->Modifier]->SpellFunction( aff->Modifier, (wield->Level+3)/3, ch, victim );
            }
        }

      if ( retcode != rNONE
           || CharacterDiedRecently(ch)
           || CharacterDiedRecently(victim) )
        {
          return retcode;
        }
    }

  /*
   * magic shields that retaliate                               -Thoric
   */
  if ( IsAffectedBy( victim, AFF_FIRESHIELD )
       && !IsAffectedBy( ch, AFF_FIRESHIELD ) )
    {
      retcode = spell_fireball( gsn_fireball, GetOffensiveShieldLevelModifier(victim, ch), victim, ch );
    }

  if ( retcode != rNONE
       || CharacterDiedRecently(ch)
       || CharacterDiedRecently(victim) )
    {
      return retcode;
    }

  if ( IsAffectedBy( victim, AFF_SHOCKSHIELD )
       && !IsAffectedBy( ch, AFF_SHOCKSHIELD ) )
    {
      retcode = spell_lightning_bolt( gsn_lightning_bolt, GetOffensiveShieldLevelModifier(victim, ch), victim, ch );
    }

  if ( retcode != rNONE
       || CharacterDiedRecently(ch)
       || CharacterDiedRecently(victim) )
    {
      return retcode;
    }

  /*
   *   folks with blasters move and snipe instead of getting neatin up in one spot.
   */
  if ( IsNpc(victim) )
    {
      Object *wielding = GetEquipmentOnCharacter( victim, WEAR_WIELD );

      if ( wielding != nullptr
           && wielding->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER
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

  if ( IsBitSet(ch->Immune, ris ) )
    modifier -= 10;

  if ( IsBitSet(ch->Resistant, ris ) )
    modifier -= 2;

  if ( IsBitSet(ch->Susceptible, ris ) )
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
  bool npcvict = false;
  bool loot = false;
  long xp_gain = 0;
  Object *damobj = NULL;
  ch_ret retcode = rNONE;
  short dampmod = 0;
  int init_gold = 0, new_gold = 0, gold_diff = 0;

  if ( !ch )
    {
      Log->Bug( "%s: null ch!", __FUNCTION__ );
      return rERROR;
    }
  if ( !victim )
    {
      Log->Bug( "%s: null victim!", __FUNCTION__ );
      return rVICT_DIED;
    }

  if ( victim->Position == POS_DEAD )
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
          if ( dt >= 0 && dt < TopSN )
            {
              bool found = false;
              Skill *skill = SkillTable[dt];

              if ( !skill->Messages.VictimImmune.ToCaster.empty() )
                {
                  Act( AT_HIT, skill->Messages.VictimImmune.ToCaster, ch, NULL, victim, TO_CHAR );
                  found = true;
                }

              if ( !skill->Messages.VictimImmune.ToVictim.empty() )
                {
                  Act( AT_HITME, skill->Messages.VictimImmune.ToVictim, ch, NULL, victim, TO_VICT );
                  found = true;
                }

              if ( !skill->Messages.VictimImmune.ToRoom.empty() )
                {
                  Act( AT_ACTION, skill->Messages.VictimImmune.ToRoom, ch, NULL, victim, TO_NOTVICT );
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
      if ( !IsBitSet( victim->Flags, ACT_SENTINEL ) )
        {
          if ( victim->HHF.Hunting )
            {
              if ( victim->HHF.Hunting->Who != ch )
                {
                  victim->HHF.Hunting->Name = ch->Name;
                  victim->HHF.Hunting->Who  = ch;
                }
            }
          else
            StartHunting( victim, ch );
        }

      if ( victim->HHF.Hating )
        {
          if ( victim->HHF.Hating->Who != ch )
            {
              victim->HHF.Hating->Name = ch->Name;
              victim->HHF.Hating->Who  = ch;
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


      if ( victim->Position > POS_STUNNED )
        {
          if ( !victim->Fighting )
            StartFighting( victim, ch );
          if ( victim->Fighting )
            victim->Position = POS_FIGHTING;
        }

      if ( victim->Position > POS_STUNNED )
        {
          if ( !ch->Fighting )
            StartFighting( ch, victim );

          /*
           * If victim is charmed, ch might attack victim's master.
           */
          if ( IsNpc(ch)
               &&   npcvict
               &&   IsAffectedBy(victim, AFF_CHARM)
               &&   victim->Master
               &&   victim->Master->InRoom == ch->InRoom
               &&   NumberBits( 3 ) == 0 )
            {
              StopFighting( ch, false );
              retcode = HitMultipleTimes( ch, victim->Master, TYPE_UNDEFINED );
              return retcode;
            }
        }


      /*
       * More charm stuff.
       */
      if ( victim->Master == ch )
        StopFollowing( victim );


      /*
       * Inviso attacks ... not.
       */
      if ( IsAffectedBy(ch, AFF_INVISIBLE))
        {
          StripAffect( ch, gsn_invis );
          StripAffect( ch, gsn_mass_invis );
          RemoveBit( ch->AffectedBy, AFF_INVISIBLE );
          Act( AT_MAGIC, "$n fades into existence.", ch, NULL, NULL, TO_ROOM );
        }

      /* Take away Hide */
      if ( IsAffectedBy(ch, AFF_HIDE) && ch->Race != RACE_DEFEL )
        RemoveBit(ch->AffectedBy, AFF_HIDE);
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
               &&   IsBitSet( ch->AttackFlags, DFND_DISARM )
               &&   GetRandomPercent() < GetAbilityLevel( ch, COMBAT_ABILITY ) / 2 )
            Disarm( ch, victim );

          if ( IsNpc(ch)
               &&   IsBitSet( ch->AttackFlags, ATCK_TRIP )
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
            dampmod = SysData.DamageMobVsMob;
          else
            dampmod = SysData.DamageMobVsPlr;
        }
      else
        {
          if ( npcvict )
            dampmod = SysData.DamagePlrVsMob;
          else
            dampmod = SysData.DamagePlrVsPlr;
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
      WearLocation dameq  = (WearLocation)GetRandomNumberFromRange(WEAR_LIGHT, WEAR_EYES);
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

  victim->HitPoints.Current -= dam;

  /*
   * Get experience based on % of damage done                   -Thoric
   */
  if ( dam && ch != victim
       &&  !IsNpc(ch) && ch->Fighting && ch->Fighting->Xp )
    {
      xp_gain = (long) (ComputeXP( ch, victim ) * 0.1 * dam) / victim->HitPoints.Max;
      GainXP( ch, COMBAT_ABILITY, xp_gain );
    }

  if ( !IsNpc(victim)
       && ( victim->TopLevel >= LEVEL_IMMORTAL
            || IsInArena( victim ) )
       && victim->HitPoints.Current < 1 )
    {
      victim->HitPoints.Current = 1;
      
      if ( IsInArena( victim ) )
        {
          char buf[MAX_STRING_LENGTH];
          CharacterFromRoom(victim);
          CharacterToRoom(victim,GetRoom(victim->ReTran));
          do_look(victim, "auto");
          Act(AT_YELLOW,"$n falls from the sky.", victim, NULL, NULL, TO_ROOM);
          victim->HitPoints.Current = victim->HitPoints.Max;
          victim->Mana.Current = victim->Mana.Max;
          victim->Fatigue.Current = victim->Fatigue.Max;
          sprintf(buf,"%s is out of the fight.",victim->Name.c_str());
          ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
          StopFighting(victim, true);
        }
    }

  if ( IsNpc(victim) && IsBitSet(victim->Flags,ACT_IMMORTAL) )
    {
      victim->HitPoints.Current = victim->HitPoints.Max;
    }
  
  /* Make sure newbies dont die */

  if (!IsNpc(victim) && !IsAuthed(victim) && victim->HitPoints.Current < 1)
    {
      victim->HitPoints.Current = 1;
    }
  
  if ( dam > 0 && dt > TYPE_HIT
       && !IsAffectedBy( victim, AFF_POISON )
       &&  IsWieldingPoisonedWeapon( ch )
       && !IsBitSet( victim->Immune, RIS_POISON )
       && !SaveVsPoisonDeath( GetAbilityLevel( ch, COMBAT_ABILITY ), victim ) )
    {
      Affect af;

      af.Type       = gsn_poison;
      af.Duration   = 20;
      af.Location   = APPLY_STR;
      af.Modifier   = -2;
      af.AffectedBy = AFF_POISON;
      JoinAffect( victim, &af );
      ch->MentalState = urange( 20, ch->MentalState + 2, 100 );
    }

  if ( !npcvict
       && GetTrustLevel(victim) >= LEVEL_IMMORTAL
       && GetTrustLevel(ch)     >= LEVEL_IMMORTAL
       && victim->HitPoints.Current < 1 )
    {
      victim->HitPoints.Current = 1;
    }
  
  UpdatePosition( victim );

  switch( victim->Position )
    {
    case POS_MORTAL:
      Act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      victim->Echo("&RYou are mortally wounded, and will die soon, if not aided.");
      break;

    case POS_INCAP:
      Act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      victim->Echo("&RYou are incapacitated and will slowly die, if not aided.");
      break;

    case POS_STUNNED:
      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          Act( AT_ACTION, "$n is stunned, but will probably recover.",
               victim, NULL, NULL, TO_ROOM );
          victim->Echo("&RYou are stunned, but will probably recover.");
        }
      break;

    case POS_DEAD:
      if ( dt >= 0 && dt < TopSN )
        {
          Skill *skill = SkillTable[dt];

          if ( !skill->Messages.VictimDeath.ToCaster.empty() )
            Act( AT_DEAD, skill->Messages.VictimDeath.ToCaster, ch, NULL, victim, TO_CHAR );

          if ( !skill->Messages.VictimDeath.ToVictim.empty() )
            Act( AT_DEAD, skill->Messages.VictimDeath.ToVictim, ch, NULL, victim, TO_VICT );

          if ( !skill->Messages.VictimDeath.ToRoom.empty() )
            Act( AT_DEAD, skill->Messages.VictimDeath.ToRoom, ch, NULL, victim, TO_NOTVICT );
        }

      if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_NOKILL )  )
        {
          Act( AT_YELLOW, "$n flees for $s life... barely escaping certain death!",
               victim, 0, 0, TO_ROOM );
        }
      else if ( (IsNpc(victim) && IsBitSet( victim->Flags, ACT_DROID ) )
                || (!IsNpc(victim) && victim->Race == RACE_DROID ) )
        {
          Act( AT_DEAD, "$n EXPLODES into many small pieces!", victim, 0, 0, TO_ROOM );
        }
      else
        {
          Act( AT_DEAD, "$n is DEAD!", victim, 0, 0, TO_ROOM );
        }

      victim->Echo("&WYou have been KILLED!\r\n");
      break;

    default:
      if ( dam > victim->HitPoints.Max / 4 )
        {
          Act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );

          if ( NumberBits(3) == 0 )
            WorsenMentalState( ch, 1 );
        }

      if ( victim->HitPoints.Current < victim->HitPoints.Max / 4 )
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
      if ( victim->Fighting
           &&   victim->Fighting->Who->HHF.Hunting
           &&   victim->Fighting->Who->HHF.Hunting->Who == victim )
        StopHunting( victim->Fighting->Who );

      if ( victim->Fighting
           &&   victim->Fighting->Who->HHF.Hating
           &&   victim->Fighting->Who->HHF.Hating->Who == victim )
        StopHating( victim->Fighting->Who );

      StopFighting( victim, true );
    }

  if ( victim->HitPoints.Current <=0 && !IsNpc(victim))
    {
      int cnt = 0;
      Object *equippedObject = nullptr;

      StopFighting( victim, true );

      if ( ( equippedObject = GetEquipmentOnCharacter( victim, WEAR_DUAL_WIELD ) ) != NULL )
        UnequipCharacter( victim, equippedObject );

      if ( ( equippedObject = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) != NULL )
        UnequipCharacter( victim, equippedObject );

      if ( ( equippedObject = GetEquipmentOnCharacter( victim, WEAR_HOLD ) ) != NULL )
        UnequipCharacter( victim, equippedObject );

      if ( ( equippedObject = GetEquipmentOnCharacter( victim, WEAR_MISSILE_WIELD ) ) != NULL )
        UnequipCharacter( victim, equippedObject );

      if ( ( equippedObject = GetEquipmentOnCharacter( victim, WEAR_LIGHT ) ) != NULL )
        UnequipCharacter( victim, equippedObject );

      for(auto i = std::begin(victim->Objects()), i_next = std::end(victim->Objects());
          i != std::end(victim->Objects());
          i = i_next)
        {
          Object *obj = *i;
          i_next = ++i;
          
          if ( obj->WearLoc == WEAR_NONE )
            {
              if ( obj->Prototype->mprog.progtypes & DROP_PROG && obj->Count > 1 )
                {
                  ++cnt;
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );

                  if(i_next == std::end(victim->Objects()))
                    {
                      i_next = std::begin(victim->Objects());
                    }
                }
              else
                {
                  cnt += obj->Count;
                  ObjectFromCharacter( obj );
                }

              Act( AT_ACTION, "$n drops $p.", victim, obj, NULL, TO_ROOM );
              Act( AT_ACTION, "You drop $p.", victim, obj, NULL, TO_CHAR );
              obj = ObjectToRoom( obj, victim->InRoom );
            }
        }

      if ( IsNpc( ch ) && !IsNpc( victim ) )
        {
          long xp_to_lose = umax( ( GetAbilityXP( victim, COMBAT_ABILITY ) - GetRequiredXpForLevel( GetAbilityLevel( ch, COMBAT_ABILITY ) ) ), 0 );
          long xp_actually_lost = LoseXP( victim, COMBAT_ABILITY, xp_to_lose );

          victim->Echo( "You lose %ld experience.\r\n", xp_actually_lost );
        }

      AddTimerToCharacter( victim, TIMER_RECENTFIGHT, 100, NULL, SUB_NONE );
    }

  /*
   * Payoff for killing things.
   */
  if ( victim->Position == POS_DEAD )
    {
      GainGroupXP( ch, victim );

      if ( !npcvict )
        {
          sprintf( log_buf, "%s killed by %s at %ld",
                   victim->Name.c_str(),
                   (IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str()),
                   victim->InRoom->Vnum );
          Log->Info("%s", log_buf);
          ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );

        }
      else
        if ( !IsNpc(ch) )              /* keep track of mob vnum killed */
          AddKill( ch, victim );

      ApplyWantedFlags( ch, victim );
      UpdateKillStats( ch, victim );

      if ( !IsNpc( ch ) && ch->PCData->ClanInfo.Clan )
        UpdateClanMember( ch );
      if ( !IsNpc( victim ) && victim->PCData->ClanInfo.Clan )
        UpdateClanMember( victim );

      if ( victim->InRoom != ch->InRoom || !IsNpc(victim) || !IsBitSet( victim->Flags, ACT_NOKILL )  )
        loot = CanLootVictim( ch, victim );
      else
        loot = false;

      SetCurrentGlobalCharacter(victim);
      RawKill( ch, victim );
      victim = NULL;

      if ( !IsNpc(ch) && loot )
        {
          /* Autogold by Scryn 8/12 */
          if ( IsBitSet(ch->Flags, PLR_AUTOGOLD) )
            {
              init_gold = ch->Gold;
              do_get( ch, "credits corpse" );
              new_gold = ch->Gold;
              gold_diff = (new_gold - init_gold);
              if (gold_diff > 0)
                {
                  sprintf(buf1,"%d",gold_diff);
                  do_split( ch, buf1 );
                }
            }
          if ( IsBitSet(ch->Flags, PLR_AUTOLOOT) )
            do_get( ch, "all corpse" );
          else
            do_look( ch, "in corpse" );

          if ( IsBitSet(ch->Flags, PLR_AUTOSAC) )
            do_junk( ch, "corpse" );
        }
      if (IsNpc(ch) && loot)
        {
          do_get( ch, "credits corpse" );
          do_get( ch, "all corpse" );
          if( ch->InRoom && ch->InRoom->Area )
            {
              BoostEconomy( ch->InRoom->Area, ch->Gold / 5 );
              ch->Gold /= 5;
            }
        }
      if( !loot && victim && IsNpc(victim) )
        if( victim->InRoom && victim->InRoom->Area )
          BoostEconomy( victim->InRoom->Area, victim->Gold );

      if ( SysData.SaveFlags.test( Flag::AutoSave::Kill ) )
        {
          PlayerCharacters->Save( ch );
        }
      
      return rVICT_DIED;
    }

  if ( victim == ch )
    return rNONE;

  /*
   * Take care of link dead people.
   */
  if ( !npcvict && !victim->Desc && !victim->Switched )
    {
      if ( GetRandomNumberFromRange( 0, victim->Wait ) == 0)
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
      if ( ( IsBitSet(victim->Flags, ACT_WIMPY) && NumberBits( 1 ) == 0
             &&   victim->HitPoints.Current < victim->HitPoints.Max / 2 )
           ||   ( IsAffectedBy(victim, AFF_CHARM) && victim->Master
                  &&     victim->Master->InRoom != victim->InRoom ) )
        {
          StartFearing( victim, ch );
          StopHunting( victim );
          do_flee( victim, "" );
        }
    }

  if ( !npcvict
       && victim->HitPoints.Current > 0
       && victim->HitPoints.Current <= victim->Wimpy
       && victim->Wait == 0 )
    do_flee( victim, "" );
  else
    if ( !npcvict && IsBitSet( victim->Flags, PLR_FLEE ) )
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

  if ( victim->InRoom->Flags.test( Flag::Room::Safe ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo( "You'll have to do that elsewhere.\r\n" );
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
  if ( IsNpc(ch) && !ch->Master )
    return true;

  return false;
}

static void ApplyWantedFlags( Character *ch, const Character *victim )
{
  if ( IsBitSet(ch->AffectedBy, AFF_CHARM) )
    {
      if ( !ch->Master )
        {
          Log->Bug( "%s: %s bad AFF_CHARM",
                    __FUNCTION__, IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str() );
          StripAffect( ch, gsn_charm_person );
          RemoveBit( ch->AffectedBy, AFF_CHARM );
          return;
        }

      if ( ch->Master )
        {
          ApplyWantedFlags( ch->Master, victim );
        }
    }

  if ( IsNpc(victim) && !IsNpc( ch ) )
    {
      for ( size_t x = 0; x < Flag::MAX; x++ )
        {
          if ( victim->VipFlags.test( x ) )
            {
              ch->PCData->WantedOn.set( x );
              ch->Echo( "&YYou are now wanted on %s.&w\r\n", WantedFlags[x] );
            }
        }
    }
}

static void UpdateKillStats( Character *ch, Character *victim )
{
  if ( IsBitSet(ch->AffectedBy, AFF_CHARM) )
    {
      if ( !ch->Master )
        {
          Log->Bug( "%s: %s bad AFF_CHARM",
                    __FUNCTION__, IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str() );
          StripAffect( ch, gsn_charm_person );
          RemoveBit( ch->AffectedBy, AFF_CHARM );
          return;
        }

      if ( ch->Master )
        {
          UpdateKillStats( ch->Master, victim );
        }
    }

  if ( !IsNpc(ch) && IsNpc(victim) )
    {
      if ( ch->PCData->ClanInfo.Clan )
        {
          ch->PCData->ClanInfo.Clan->MobKills++;
        }

      ch->PCData->MKills++;
      ch->InRoom->Area->MKills++;
    }
  else if ( !IsNpc(ch) && !IsNpc(victim) )
    {
      if ( IsClanned( ch ) )
        {
          ch->PCData->ClanInfo.Clan->PlayerKills++;
        }

      if ( IsClanned( victim ) )
        {
          victim->PCData->ClanInfo.Clan->PlayerDeaths++;
        }

      ch->PCData->PKills++;
      UpdatePosition(victim);
    }
  else if ( IsNpc(ch) && !IsNpc(victim) )
    {
      victim->InRoom->Area->MDeaths++;
    }
}

/*
 * Set position of a victim.
 */
void UpdatePosition( Character *victim )
{
  assert(victim != nullptr);

  if ( victim->HitPoints.Current > 0 )
    {
      if ( victim->Position <= POS_STUNNED )
        {
          victim->Position = POS_STANDING;
        }

      if ( IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          victim->Position = POS_STUNNED;
        }

      return;
    }

#ifdef NODEATH
  if ( !IsNpc(victim) && victim->HitPoints.Current <= -500 )
    {
      victim->HitPoints.Current = -250;
    }
#endif

  if ( IsNpc(victim) || victim->HitPoints.Current <= -500 )
    {
      if ( victim->Mount )
        {
          Act( AT_ACTION, "$n falls from $N.", victim, NULL, victim->Mount, TO_ROOM );
          RemoveBit( victim->Mount->Flags, ACT_MOUNTED );
          victim->Mount = NULL;
        }

      victim->Position = POS_DEAD;
      return;
    }

  if ( victim->HitPoints.Current <= -400 )
    {
      victim->Position = POS_MORTAL;
    }
  else if ( victim->HitPoints.Current <= -200 )
    {
      victim->Position = POS_INCAP;
    }
  else
    {
      victim->Position = POS_STUNNED;
    }

  if ( victim->Position > POS_STUNNED
       && IsAffectedBy( victim, AFF_PARALYSIS ) )
    {
      victim->Position = POS_STUNNED;
    }

  if ( victim->Mount )
    {
      Act( AT_ACTION, "$n falls unconscious from $N.", victim, NULL, victim->Mount, TO_ROOM );
      RemoveBit( victim->Mount->Flags, ACT_MOUNTED );
      victim->Mount = NULL;
    }
}


/*
 * Start fights.
 */
void StartFighting( Character *ch, Character *victim )
{
  Fight *fight = NULL;

  if ( ch->Fighting )
    {
      Log->Bug( "%s: %s -> %s (already fighting %s)",
                __FUNCTION__, ch->Name.c_str(), victim->Name.c_str(),
                ch->Fighting->Who->Name.c_str() );
      return;
    }

  if ( IsAffectedBy(ch, AFF_SLEEP) )
    StripAffect( ch, gsn_sleep );

  /* Limit attackers -Thoric */
  if ( victim->NumFighting > MAX_NUMBER_OF_FIGHTERS )
    {
      ch->Echo( "There are too many people fighting for you to join in.\r\n" );
      return;
    }

  fight = new Fight();
  fight->Who     = victim;
  fight->Xp      = ComputeXP( ch, victim );
  fight->Align = ComputeNewAlignment( ch, victim );

  if ( !IsNpc(ch) && IsNpc(victim) )
    fight->TimesKilled = TimesKilled(ch, victim);

  ch->NumFighting = 1;
  ch->Fighting = fight;
  ch->Position = POS_FIGHTING;
  victim->NumFighting++;

  if ( victim->Switched && IsAffectedBy(victim->Switched, AFF_POSSESS) )
    {
      victim->Switched->Echo( "You are disturbed!\r\n" );
      do_return( victim->Switched, "" );
    }
}

Character *GetFightingOpponent( const Character *ch )
{
  assert(ch != nullptr);

  if ( !ch->Fighting )
    return NULL;

  return ch->Fighting->Who;
}

void FreeFight( Character *ch )
{
  if ( !ch )
    {
      Log->Bug( "Free_fight: null ch!" );
      return;
    }

  if ( ch->Fighting )
    {
      if ( !CharacterDiedRecently(ch->Fighting->Who) )
        --ch->Fighting->Who->NumFighting;

      delete ch->Fighting;
    }

  ch->Fighting = NULL;

  if ( ch->Mount )
    ch->Position = POS_MOUNTED;
  else
    ch->Position = POS_STANDING;

  /* Berserk wears off after combat. -- Altrag */
  if ( IsAffectedBy(ch, AFF_BERSERK) )
    {
      StripAffect(ch, gsn_berserk);
      SetCharacterColor(AT_WEAROFF, ch);
      ch->Echo("%s\r\n", SkillTable[gsn_berserk]->Messages.WearOff.c_str());
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

  for ( fch = FirstCharacter; fch; fch = fch->Next )
    {
      if ( GetFightingOpponent( fch ) == ch )
        {
          FreeFight( fch );
          UpdatePosition( fch );
        }
    }
}

static bool RemoveShipOwner(Ship *ship, void *userData)
{
  const Character *victim = (Character*)userData;

  if ( !StrCmp( ship->Owner, victim->Name ) )
    {
      ship->Owner.erase();
      ship->Pilot.erase();
      ship->CoPilot.erase();

      Ships->Save(ship);
    }

  return true;
}

void RawKill( Character *killer, Character *victim )
{
  Character *victmp = nullptr;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];

  if ( !victim )
    {
      Log->Bug( "RawKill: null victim!" );
      return;
    }

  std::string arg = victim->Name;

  if ( !IsNpc( victim ) && victim->PCData->ClanInfo.Clan )
    RemoveClanMember( victim );

  StopFighting( victim, true );

  if ( killer && !IsNpc(killer) && !IsNpc(victim) )
    ClaimBounty( killer, victim );

  /* Take care of polymorphed chars */
  if(IsNpc(victim) && IsBitSet(victim->Flags, ACT_POLYMORPHED))
    {
      CharacterFromRoom(victim->Desc->Original);
      CharacterToRoom(victim->Desc->Original, victim->InRoom);
      victmp = victim->Desc->Original;
      do_revert(victim, "");
      RawKill(killer, victmp);
      return;
    }

  if ( victim->InRoom && IsNpc(victim) && victim->VipFlags != 0 && victim->InRoom->Area && victim->InRoom->Area->Planet )
    {
      victim->InRoom->Area->Planet->Population--;
      victim->InRoom->Area->Planet->Population = umax( victim->InRoom->Area->Planet->Population, 0 );
      victim->InRoom->Area->Planet->PopularSupport -= (float) ( 1 + 1 / (victim->InRoom->Area->Planet->Population + 1) );

      if ( victim->InRoom->Area->Planet->PopularSupport < -100 )
        victim->InRoom->Area->Planet->PopularSupport = -100;
    }

  if ( !IsNpc(victim) || !IsBitSet( victim->Flags, ACT_NOKILL  ) )
    MobProgDeathTrigger( killer, victim );

  if ( CharacterDiedRecently(victim) )
    return;

  if ( !IsNpc(victim) || !IsBitSet( victim->Flags, ACT_NOKILL  ) )
    RoomProgDeathTrigger( killer, victim );

  if ( CharacterDiedRecently(victim) )
    return;

  if ( !IsNpc(victim) || ( !IsBitSet( victim->Flags, ACT_NOKILL  ) && !IsBitSet( victim->Flags, ACT_NOCORPSE ) ) )
    {
      MakeCorpse( victim );
    }
  else
    {
      std::list<Object*> carriedByVictim( Reverse( victim->Objects() ) );

      for(Object *obj : carriedByVictim)
        {
          ObjectFromCharacter( obj );
          ExtractObject( obj );
        }
    }

  if ( IsNpc(victim) )
    {
      victim->Prototype->Killed++;
      ExtractCharacter( victim, true );
      victim = NULL;
      return;
    }

  SetCharacterColor( AT_DIEMSG, victim );
  do_help(victim, "_DIEMSG_" );

  if( SysData.PermaDeath )
    {
      ForEachShip(RemoveShipOwner, victim);

      if ( victim->PlayerHome )
        {
          Room *room = victim->PlayerHome;

          room->Name = "An Empty Apartment";

          room->Flags.reset( Flag::Room::PlayerHome );
          room->Flags.set( Flag::Room::EmptyHome );

          FoldArea( room->Area, room->Area->Filename, false );
        }

      if ( victim->PCData && victim->PCData->ClanInfo.Clan )
        {
          if ( !StrCmp( victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Leader ) )
            {
              if ( !victim->PCData->ClanInfo.Clan->Leadership.Number1.empty() )
                {
                  victim->PCData->ClanInfo.Clan->Leadership.Leader = victim->PCData->ClanInfo.Clan->Leadership.Number1;
                  victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
                }
              else if ( !victim->PCData->ClanInfo.Clan->Leadership.Number2.empty() )
                {
                  victim->PCData->ClanInfo.Clan->Leadership.Leader = victim->PCData->ClanInfo.Clan->Leadership.Number2;
                  victim->PCData->ClanInfo.Clan->Leadership.Number2.erase();
                }
              else
                {
                  victim->PCData->ClanInfo.Clan->Leadership.Leader.erase();
                }
            }

          if ( !StrCmp( victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Number1 ) )
            {
              if ( !victim->PCData->ClanInfo.Clan->Leadership.Number2.empty() )
                {
                  victim->PCData->ClanInfo.Clan->Leadership.Number1 = victim->PCData->ClanInfo.Clan->Leadership.Number2;
                  victim->PCData->ClanInfo.Clan->Leadership.Number2.erase();
                }
              else
                {
                  victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
                }
            }

          if ( !StrCmp( victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Number2 ) )
            {
              victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
            }
        }

      if ( !victim )
        {
          /* Make sure they aren't halfway logged in. */
          Descriptor *d = Find(Descriptors->Entities(),
                               [&victim](const auto descriptor)
                               {
                                 return (victim = descriptor->Character) && !IsNpc(victim);
                               });

          if ( d != nullptr )
            {
              CloseDescriptor( d, true );
            }
        }
      else
        {
          int x, y;

          quitting_char = victim;
          PlayerCharacters->Save( victim );
          saving_char = NULL;
          ExtractCharacter( victim, true );
          for ( x = 0; x < MAX_WEAR; x++ )
            for ( y = 0; y < MAX_LAYERS; y++ )
              save_equipment[x][y] = NULL;
        }

      sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
               Capitalize( arg ).c_str() );
      sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
               Capitalize( arg ).c_str() );

      rename( buf, buf2 );

      sprintf( buf, "%s%c/%s.clone", PLAYER_DIR, tolower(arg[0]),
               Capitalize( arg ).c_str() );
      sprintf( buf2, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
               Capitalize( arg ).c_str() );

      rename( buf, buf2 );

      sprintf( buf, "%s%s", GOD_DIR, Capitalize(victim->Name).c_str() );

      if ( !remove( buf ) )
        {
          killer->Echo( "Player's immortal data destroyed.\r\n" );
        }
      else if ( errno != ENOENT )
        {
          killer->Echo( "Unknown error #%d - %s (immortal data). Report to the administration\r\n",
                        errno, strerror( errno ) );
          sprintf( buf2, "%s slaying ", killer->Name.c_str());
          strcpy(buf2, buf);
          perror( buf2 );
        }

      sprintf( buf, "%s%c/%s.home", PLAYER_DIR, tolower(arg[0]),
               Capitalize( arg ).c_str() );
      remove( buf );
    }
  else
    {
      Room *cloningCylinder = GetRoom( ROOM_VNUM_CLONING_CYLINDER );

      if( !cloningCylinder )
        {
          cloningCylinder = GetRoom( ROOM_VNUM_LIMBO );
        }

      CharacterFromRoom( victim );
      CharacterToRoom( victim, cloningCylinder);
      ResetPlayerOnDeath( victim );
      victim->Position = POS_SLEEPING;
    }
}

static void CheckObjectAlignmentZapping( Character *ch )
{
  std::list<Object*> carriedObjects(ch->Objects());

  for(Object *obj : carriedObjects)
    {
      if ( obj->WearLoc == WEAR_NONE )
        {
          continue;
        }

      if ( ( IsBitSet( obj->Flags, ITEM_ANTI_EVIL) && IsEvil(ch) )
           || ( IsBitSet( obj->Flags, ITEM_ANTI_GOOD) && IsGood(ch) )
           || ( IsBitSet( obj->Flags, ITEM_ANTI_NEUTRAL) && IsNeutral(ch) ) )
        {
          Act( AT_MAGIC, "You are zapped by $p.", ch, obj, NULL, TO_CHAR );
          Act( AT_MAGIC, "$n is zapped by $p.",   ch, obj, NULL, TO_ROOM );

          ObjectFromCharacter( obj );
          obj = ObjectToRoom( obj, ch->InRoom );
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
  const std::list<Character*> &charsInRoom = ch->InRoom->Characters();

  int members = count_if(std::begin(charsInRoom), std::end(charsInRoom),
                         [ch](auto character)
                         {
                           return IsInSameGroup(character, ch);
                         });

  return members;
}

static void GainGroupXP( Character *ch, Character *victim )
{
  const Character *lch = NULL;
  long xp = 0;
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
      Log->Bug( "%s: zero members.", __FUNCTION__ );
      members = 1;
    }

  lch = ch->Leader ? ch->Leader : ch;

  for(Character *gch : ch->InRoom->Characters())
    {
      if ( !IsInSameGroup( gch, ch ) )
        {
          continue;
        }

      xp = ComputeXP( gch, victim ) / members;

      gch->Alignment = ComputeNewAlignment( gch, victim );

      if ( !IsNpc(gch) && IsNpc(victim) && gch->PCData && gch->PCData->ClanInfo.Clan
           && !StrCmp ( gch->PCData->ClanInfo.Clan->Name , victim->MobClan ) )
        {
          xp = 0;
          gch->Echo("You receive no experience for killing your organizations resources.\r\n");
        }
      else
        {
          gch->Echo( "You receive %ld combat experience.\r\n", xp );
        }

      GainXP( gch, COMBAT_ABILITY, xp );

      if ( lch == gch && members > 1 )
        {
          xp = urange( members, xp*members, (GetRequiredXpForLevel( GetAbilityLevel( gch, LEADERSHIP_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( gch, LEADERSHIP_ABILITY ) ) / 10) );
          gch->Echo("You get %ld leadership experience for leading your group to victory.\r\n",xp);
          GainXP( gch, LEADERSHIP_ABILITY, xp );
        }

      CheckObjectAlignmentZapping( ch );
    }
}


static int ComputeNewAlignment( const Character *gch, const Character *victim )
{
  return urange ( -1000,
                  (int) ( gch->Alignment - victim->Alignment/5 ),
                  1000 );
}

/*
 * Calculate how much XP gch should gain for killing victim
 * Lots of redesigning for new exp system by Thoric
 */
long ComputeXP( const Character *gch, const Character *victim )
{
  long xp = (GetXPWorth( victim )
             *  urange( 1, (GetAbilityLevel( victim, COMBAT_ABILITY ) - GetAbilityLevel( gch, COMBAT_ABILITY ) ) + 10, 20 )) / 10;
  int align = gch->Alignment - victim->Alignment;

  /* bonus for attacking opposite alignment */
  if ( align >  990 || align < -990 )
    xp = (xp*5) >> 2;
  else
    /* penalty for good attacking same alignment */
    if ( gch->Alignment > 300 && align < 250 )
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
      dampc = ( (dam * 1000) / victim->HitPoints.Max) +
        ( 50 - ((victim->HitPoints.Current * 50) / victim->HitPoints.Max) );
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
    {
      vs = "hit";
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
       && !IsNpc(ch) && ch->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      gcflag = true;
    }

  if ( dam == 0
       && !IsNpc(victim) && victim->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      gvflag = true;
    }

  if ( 0 <= dt && dt < TopSN )
    {
      skill = SkillTable[dt];
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
          attack = GetAttackTypeName( dt - TYPE_HIT );
        }
      else
        {
          Log->Bug( "%s: bad dt %d.", __FUNCTION__, dt );
          dt  = TYPE_HIT;
          attack = GetAttackTypeName( 0 );
        }

      sprintf( buf1, "$n's poisoned %s %s $N%c", attack, vp, punct );
      sprintf( buf2, "Your poisoned %s %s $N%c", attack, vp, punct );
      sprintf( buf3, "$n's poisoned %s %s you%c", attack, vp, punct );
    }
  else
    {
      if ( skill )
        {
          attack = skill->Messages.NounDamage.c_str();

          if ( dam == 0 )
            {
              bool found = false;

              if ( !skill->Messages.Failure.ToCaster.empty() )
                {
                  Act( AT_HIT, skill->Messages.Failure.ToCaster, ch, NULL, victim, TO_CHAR );
                  found = true;
                }

              if ( !skill->Messages.Failure.ToVictim.empty() )
                {
                  Act( AT_HITME, skill->Messages.Failure.ToVictim, ch, NULL, victim, TO_VICT );
                  found = true;
                }

              if ( !skill->Messages.Failure.ToRoom.empty() )
                {
                  Act( AT_ACTION, skill->Messages.Failure.ToRoom, ch, NULL, victim, TO_NOTVICT );
                  found = true;
                }

              if ( found )    /* miss message already sent */
                {
                  return;
                }
            }
          else
            {
              if ( !skill->Messages.Success.ToCaster.empty() )
                {
                  Act( AT_HIT, skill->Messages.Success.ToCaster, ch, NULL, victim, TO_CHAR );
                }

              if ( !skill->Messages.Success.ToVictim.empty() )
                {
                  Act( AT_HITME, skill->Messages.Success.ToVictim, ch, NULL, victim, TO_VICT );
                }

              if ( !skill->Messages.Success.ToRoom.empty() )
                {
                  Act( AT_ACTION, skill->Messages.Success.ToRoom, ch, NULL, victim, TO_NOTVICT );
                }
            }
        }
      else if ( dt >= TYPE_HIT
                && dt < TYPE_HIT + (int) GetAttackTableSize() )
        {
          attack = GetAttackTypeName( dt - TYPE_HIT );
        }
      else
        {
          Log->Bug( "%s: bad dt %d.", __FUNCTION__, dt );
          dt  = TYPE_HIT;
          attack = GetAttackTypeName( 0 );
        }

      sprintf( buf1, "$n's %s %s $N%c",  attack, vp, punct );
      sprintf( buf2, "Your %s %s $N%c",  attack, vp, punct );
      sprintf( buf3, "$n's %s %s you%c", attack, vp, punct );
    }

  if ( GetAbilityLevel( ch, COMBAT_ABILITY ) >= 50 )
    {
      char damageAmountMsg[100];
      sprintf( damageAmountMsg, " You do %d points of damage.", dam);
      strcat(buf2, damageAmountMsg);
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

static bool SprintForCover( Character *ch )
{
  Room *was_in = NULL;
  Room *now_in = NULL;
  int attempt = 0;
  DirectionType door = DIR_INVALID;
  Exit *pexit = NULL;

  if ( !GetFightingOpponent( ch ) )
    return false;

  if ( ch->Position < POS_FIGHTING )
    return false;

  was_in = ch->InRoom;

  for ( attempt = 0; attempt < 10; attempt++ )
    {
      door = (DirectionType) GetRandomDoor();

      if ( ( pexit = GetExit(was_in, door) ) == NULL
           || !pexit->ToRoom
           || ( pexit->Flags.test( Flag::Exit::Closed )
                && !IsAffectedBy( ch, AFF_PASS_DOOR ) )
           || ( IsNpc(ch)
                && pexit->ToRoom->Flags.test( Flag::Room::NoMob ) ) )
        {
          continue;
        }

      StripAffect( ch, gsn_sneak );
      RemoveBit( ch->AffectedBy, AFF_SNEAK );

      if ( ch->Mount && ch->Mount->Fighting )
        {
          StopFighting( ch->Mount, true );
        }

      MoveCharacter( ch, pexit, 0 );

      if ( ( now_in = ch->InRoom ) == was_in )
        {
          continue;
        }

      ch->InRoom = was_in;
      Act( AT_FLEE, "$n sprints for cover!", ch, NULL, NULL, TO_ROOM );
      ch->InRoom = now_in;
      Act( AT_FLEE, "$n spins around and takes aim.", ch, NULL, NULL, TO_ROOM );

      StopFighting( ch, true );

      return true;
    }

  return false;
}
