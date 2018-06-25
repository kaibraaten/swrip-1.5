/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <sys/types.h>
#include <sys/time.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "mud.h"
#include "arena.h"
#include "ship.h"
#include "shuttle.h"
#include "character.h"
#include "track.h"
#include "missile.h"
#include "clan.h"
#include "social.h"
#include "skill.h"
#include "spaceobject.h"
#include "planet.h"
#include "area.h"

/*
 * Local functions.
 */
static int GainHitPoints( const Character *ch );
static int GainMana( const Character *ch );
static int GainMove( const Character *ch );
static void GainAddiction( Character *ch );
static void MobileUpdate( void );
static void WeatherUpdate( void );
static void TaxUpdate( void );
static void CharacterUpdate( void );
static void ObjectUpdate( void );
static void AggroUpdate( void );
static void CharacterCheck( void );
static void PerformRandomDrunkBehavior( Character *ch );
static void SufferHalucinations( Character *ch );
static void AuctionUpdate( void );
static void TeleportUpdate( void );

static int GetMaxCombatLevel( const Character *ch );
static int GetMaxPilotingLevel( const Character *ch );
static int GetMaxEngineeringLevel( const Character *ch );
static int GetMaxBountyHuntingLevel( const Character *ch );
static int GetMaxSmugglingLevel( const Character *ch );
static int GetMaxLeadershipLevel( const Character *ch );
static int GetMaxDiplomacyLevel( const Character *ch );
static int GetMaxForceLevel( const Character *ch );

/*
 * Global Variables
 */

Character *gch_prev = NULL;
Object *gobj_prev = NULL;

Character *timechar = NULL;

const char * const corpse_descs[] =
  {
    "The corpse of %s will soon be gone.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here."
  };

const char * const d_corpse_descs[] =
  {
    "The shattered remains %s will soon be gone.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here."
  };

/*
 * Advancement stuff.
 */
int GetMaxAbilityLevel( const Character *ch, int ability)
{
  int level = 0;

  if ( IsNpc(ch) )
    {
      return 100;
    }

  if ( IsImmortal(ch) || ch->Race == RACE_GOD )
    {
      return 200;
    }

  switch( ability )
    {
    case COMBAT_ABILITY:
      level = GetMaxCombatLevel( ch );
      break;

    case PILOTING_ABILITY:
      level = GetMaxPilotingLevel( ch );
      break;

    case ENGINEERING_ABILITY:
      level = GetMaxEngineeringLevel( ch );
      break;

    case HUNTING_ABILITY:
      level = GetMaxBountyHuntingLevel( ch );
      break;

    case SMUGGLING_ABILITY:
      level = GetMaxSmugglingLevel( ch );
      break;

    case LEADERSHIP_ABILITY:
      level = GetMaxLeadershipLevel( ch );
      break;

    case DIPLOMACY_ABILITY:
      level = GetMaxDiplomacyLevel( ch );
      break;

    case FORCE_ABILITY:
      level = GetMaxForceLevel( ch );
      break;
    }

  return level;
}

static int GetMaxCombatLevel( const Character *ch )
{
  int level = 0;

  switch( ch->Ability.Main )
    {
    case COMBAT_ABILITY:
      level = 100;
      break;

    case FORCE_ABILITY:
      level = 25;
      break;

    case HUNTING_ABILITY:
      level = 25;
      break;

    case COMMANDO_ABILITY:
      level = 50;
      break;

    default:
      level = 0;
      break;
    }

  level += RaceTable[ch->Race].AbilityMod[COMBAT_ABILITY];
  level += ch->Stats.PermCon + ch->Stats.PermDex + ch->Stats.PermStr;

  return urange( 1, level, 150 );
}

static int GetMaxPilotingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == PILOTING_ABILITY )
    level = 100;

  if ( ch->Ability.Main == ENGINEERING_ABILITY )
    level = 25;

  if ( ch->Ability.Main == HUNTING_ABILITY )
    level = 25;

  if ( ch->Ability.Main == SMUGGLING_ABILITY )
    level = 50;

  if ( ch->Ability.Main == FORCE_ABILITY )
    level = 25;

  if ( ch->Ability.Main == COMMANDO_ABILITY )
    level = 25;

  level += RaceTable[ch->Race].AbilityMod[PILOTING_ABILITY];
  level += ch->Stats.PermDex * 2;

  return urange( 1, level, 150 );
}

static int GetMaxEngineeringLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == ENGINEERING_ABILITY )
    level = 100;

  if ( ch->Ability.Main == PILOTING_ABILITY )
    level = 20;

  level += RaceTable[ch->Race].AbilityMod[ENGINEERING_ABILITY];
  level += ch->Stats.PermInt * 2;

  return urange( 1, level, 150 );
}

static int GetMaxBountyHuntingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == HUNTING_ABILITY )
    level = 100;

  level += RaceTable[ch->Race].AbilityMod[HUNTING_ABILITY];

  return urange( 1, level, 150 );
}

static int GetMaxSmugglingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == SMUGGLING_ABILITY )
    level = 100;

  if ( ch->Ability.Main == PILOTING_ABILITY )
    level = 20;

  if ( ch->Ability.Main == ENGINEERING_ABILITY )
    level = 25;

  if ( ch->Ability.Main == COMMANDO_ABILITY )
    level = 50;

  level += RaceTable[ch->Race].AbilityMod[SMUGGLING_ABILITY];
  level += ch->Stats.PermLck * 2;

  return urange( 1, level, 150 );
}

static int GetMaxLeadershipLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == LEADERSHIP_ABILITY )
    level = 100;

  if ( ch->Ability.Main == COMBAT_ABILITY )
    level = 50;

  if ( ch->Ability.Main == DIPLOMACY_ABILITY )
    level = 50;

  level += RaceTable[ch->Race].AbilityMod[LEADERSHIP_ABILITY];
  level += ch->Stats.PermWis + ch->Stats.PermCha + ch->Stats.PermInt;

  return urange( 1, level, 150 );
}

static int GetMaxDiplomacyLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == DIPLOMACY_ABILITY )
    level = 100;

  if ( ch->Ability.Main == PILOTING_ABILITY )
    level = 10;

  if ( ch->Ability.Main == LEADERSHIP_ABILITY )
    level = 50;

  level += RaceTable[ch->Race].AbilityMod[DIPLOMACY_ABILITY];
  level += ch->Stats.PermCha * 3;

  return urange( 1, level, 150 );
}

static int GetMaxForceLevel( const Character *ch )
{
  int level = 0;

  if ( ch->Ability.Main == FORCE_ABILITY )
    {
      level = 20;
    }

  level += ch->Stats.PermFrc * 5;

  return level;
}

void AdvanceLevel( Character *ch, int ability )
{
  if ( ch->TopLevel < GetAbilityLevel( ch, ability ) && ch->TopLevel < 100 )
    {
      ch->TopLevel = urange( 1, GetAbilityLevel( ch, ability ), 100 );
    }

  if( IsJedi( ch ) && ability == FORCE_ABILITY )
    {
      ch->MaxMana += 20;
    }

  if ( !IsNpc(ch) )
    {
      RemoveBit( ch->Flags, PLR_BOUGHT_PET );
    }
}

void GainXP( Character *ch, short ability, long gain )
{
  if ( IsNpc(ch) )
    {
      return;
    }

  SetAbilityXP( ch, ability, umax( 0, GetAbilityXP( ch, ability ) + gain ) );

  if (!IsAuthed(ch)
      && GetAbilityXP( ch, ability ) >= GetRequiredXpForLevel(GetAbilityLevel(ch, ability ) + 1))
    {
      SendToCharacter("You can not ascend to a higher level until you are authorized.\r\n", ch);
      SetAbilityXP( ch, ability, GetRequiredXpForLevel( GetAbilityLevel(ch, ability) + 1 ) - 1);
      return;
    }

  while ( GetAbilityXP( ch, ability ) >= GetRequiredXpForLevel( GetAbilityLevel( ch, ability ) + 1))
    {
      short current_level = GetAbilityLevel( ch, ability );
      short new_level = 0;

      if ( current_level >= GetMaxAbilityLevel( ch, ability ) )
        {
          SetAbilityXP( ch, ability, GetRequiredXpForLevel( GetAbilityLevel( ch, ability ) + 1 ) - 1);
          return;
        }

      SetCharacterColor( AT_WHITE + AT_BLINK, ch );
      new_level = current_level + 1;
      SetAbilityLevel( ch, ability, new_level );

      Echo( ch, "You have now obtained %s level %d!\r\n",
	    AbilityName[ability], GetAbilityLevel( ch, ability ) );
      AdvanceLevel( ch , ability);
    }

  UpdateClanMember( ch );
}

long LoseXP( Character *ch, short ability, long loss )
{
  int current_exp = 0;
  int new_exp = 0;
  int actual_loss = 0;

  if ( IsNpc(ch) )
    return 0;

  current_exp = GetAbilityXP( ch, ability );
  actual_loss = umax( loss, 0 );
  new_exp = current_exp - actual_loss;

  SetAbilityXP( ch, ability, new_exp );

  return actual_loss;
}

/*
 * Regeneration stuff.
 */
static int GainHitPoints( const Character *ch )
{
  int gain = 0;

  if ( IsNpc(ch) )
    {
      gain = ch->TopLevel;
    }
  else
    {
      gain = umin( 5, ch->TopLevel );

      switch ( ch->Position )
        {
        case POS_DEAD:
	  return 0;

        case POS_MORTAL:
	  return -25;

        case POS_INCAP:
	  return -20;

        case POS_STUNNED:
	  return GetCurrentConstitution(ch) * 2;

        case POS_SLEEPING:
	  gain += GetCurrentConstitution(ch) * 1.5;
	  break;

        case POS_RESTING:
	  gain += GetCurrentConstitution(ch);
	  break;

	default:
	  break;
        }

      if ( ch->PCData->Condition[COND_FULL] == 0 )
	{
	  gain /= 2;
	}

      if ( ch->PCData->Condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy(ch, AFF_POISON) )
    {
      gain /= 4;
    }

  if ( ch->Race == RACE_TRANDOSHAN )
    {
      gain *= 2 ;
    }

  return umin(gain, ch->MaxHit - ch->Hit);
}

static int GainMana( const Character *ch )
{
  int gain = 0;

  if ( IsNpc(ch) )
    {
      gain = ch->TopLevel;
    }
  else
    {
      if ( !IsJedi( ch ) )
	{
	  return (0 - ch->Mana);
	}

      gain = umin( 5, GetAbilityLevel( ch, FORCE_ABILITY ) / 2 );

      if ( ch->Position < POS_SLEEPING )
	{
	  return 0;
	}

      switch ( ch->Position )
        {
        case POS_SLEEPING:
	  gain += GetCurrentIntelligence(ch) * 3;
	  break;

        case POS_RESTING:
	  gain += GetCurrentIntelligence(ch) * 1.5;
	  break;

	default:
	  break;
        }

      if ( ch->PCData->Condition[COND_FULL]   == 0 )
	{
	  gain /= 2;
	}

      if ( ch->PCData->Condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy( ch, AFF_POISON ) )
    {
      gain /= 4;
    }

  return umin(gain, ch->MaxMana - ch->Mana);
}

static int GainMove( const Character *ch )
{
  int gain = 0;

  if ( IsNpc(ch) )
    {
      gain = ch->TopLevel;
    }
  else
    {
      gain = umax( 15, 2 * ch->TopLevel );

      switch ( ch->Position )
        {
        case POS_DEAD:
	  return 0;

        case POS_MORTAL:
	  return -1;

        case POS_INCAP:
	  return -1;

        case POS_STUNNED:
	  return 1;

        case POS_SLEEPING:
	  gain += GetCurrentDexterity(ch) * 2;
	  break;

        case POS_RESTING:
	  gain += GetCurrentDexterity(ch);
	  break;

	default:
	  break;
        }

      if ( ch->PCData->Condition[COND_FULL] == 0 )
	{
	  gain /= 2;
	}

      if ( ch->PCData->Condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy(ch, AFF_POISON) )
    {
      gain /= 4;
    }

  return umin(gain, ch->MaxMove - ch->Move);
}

static void GainAddiction( Character *ch )
{
  short drug = 0;

  for ( drug=0 ; drug <= 9 ; drug ++ )
    {
      if ( ch->PCData->Addiction[drug] < ch->PCData->DrugLevel[drug] )
	{
	  ch->PCData->Addiction[drug]++;
	}

      if ( ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug]+150 )
        {
	  Affect af;

          switch (ch->PCData->Addiction[drug])
            {
            default:
	      break;
	      
            case SPICE_GLITTERSTIM:
              if ( !IsAffectedBy( ch, AFF_BLIND ) )
                {
                  af.Type       = gsn_blindness;
                  af.Location   = APPLY_AC;
                  af.Modifier   = 10;
                  af.Duration   = ch->PCData->Addiction[drug];
                  af.AffectedBy = AFF_BLIND;
                  AffectToCharacter( ch, &af );
                }
	      break;
	      
            case SPICE_CARSANUM:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.Type       = -1;
                  af.Location   = APPLY_DAMROLL;
                  af.Modifier   = -10;
                  af.Duration   = ch->PCData->Addiction[drug];
                  af.AffectedBy = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }
	      break;
	      
            case SPICE_RYLL:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.Type       = -1;
                  af.Location   = APPLY_DEX;
                  af.Modifier   = -5;
                  af.Duration   = ch->PCData->Addiction[drug];
                  af.AffectedBy = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }
	      break;
	      
            case SPICE_ANDRIS:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.Type       = -1;
                  af.Location   = APPLY_CON;
                  af.Modifier   = -5;
                  af.Duration   = ch->PCData->Addiction[drug];
                  af.AffectedBy = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }
	      break;
            }
        }

      if ( ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug]+200 )
        {
          Echo ( ch, "You feel like you are going to die. You NEED %s\r\n.",
		      GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 2 );
          InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
        }
      else if ( ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug]+100 )
        {
          Echo ( ch, "You need some %s.\r\n", GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 2 );
        }
      else if ( ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug]+50 )
        {
          Echo ( ch, "You really crave some %s.\r\n", GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 1 );
        }
      else if ( ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug]+25 )
        {
          Echo ( ch, "Some more %s would feel quite nice.\r\n", GetSpiceTypeName(drug) );
        }
      else if ( ch->PCData->Addiction[drug] < ch->PCData->DrugLevel[drug]-50 )
        {
          Act( AT_POISON, "$n bends over and vomits.\r\n", ch, NULL, NULL, TO_ROOM );
          Act( AT_POISON, "You vomit.\r\n", ch, NULL, NULL, TO_CHAR );
          ch->PCData->DrugLevel[drug] -= 10;
        }

      if ( ch->PCData->DrugLevel[drug] > 1 )
	{
	  ch->PCData->DrugLevel[drug] -=2;
	}
      else if ( ch->PCData->DrugLevel[drug] > 0 )
	{
	  ch->PCData->DrugLevel[drug] -=1;
	}
      else if ( ch->PCData->Addiction[drug] > 0 && ch->PCData->DrugLevel[drug] <= 0 )
	{
	  ch->PCData->Addiction[drug]--;
	}
    }
}

void GainCondition( Character *ch, int iCond, int value )
{
  int condition = 0;
  ch_ret retcode = rNONE;

  if ( value == 0
       || IsNpc(ch)
       || IsImmortal( ch )
       || IsDroid(ch)
       || !IsAuthed(ch))
    return;

  if( ( iCond == COND_THIRST || iCond == COND_FULL )
      && SysData.DisableHunger )
    {
      return;
    }

  condition                    = ch->PCData->Condition[iCond];
  ch->PCData->Condition[iCond] = urange( 0, condition + value, 48 );

  if ( ch->PCData->Condition[iCond] == 0 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are STARVING!\r\n",  ch );
              WorsenMentalState( ch, 1 );
              retcode = InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
            }
          break;

        case COND_THIRST:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_THIRSTY, ch );
              SendToCharacter( "You are DYING of THIRST!\r\n", ch );
              WorsenMentalState( ch, 2 );
              retcode = InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
            }
          break;

        case COND_DRUNK:
          if ( condition != 0 )
	    {
	      SetCharacterColor( AT_SOBER, ch );
	      SendToCharacter( "You are sober.\r\n", ch );
	    }

          retcode = rNONE;
          break;

        default:
          Bug( "Gain_condition: invalid condition type %d", iCond );
          retcode = rNONE;
          break;
        }
    }

  if ( retcode != rNONE )
    {
      return;
    }

  if ( ch->PCData->Condition[iCond] == 1 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are really hungry.\r\n",  ch );

              if ( NumberBits(1) == 0 )
		{
		  WorsenMentalState( ch, 1 );
		}
            }
          break;

        case COND_THIRST:
          if ( ch->TopLevel <= LEVEL_AVATAR  )
            {
              SetCharacterColor( AT_THIRSTY, ch );
              SendToCharacter( "You are really thirsty.\r\n", ch );
              WorsenMentalState( ch, 1 );
            }
          break;

        case COND_DRUNK:
          if ( condition != 0 )
	    {
	      SetCharacterColor( AT_SOBER, ch );
	      SendToCharacter( "You are feeling a little less light headed.\r\n", ch );
	    }
          break;
        }
    }


  if ( ch->PCData->Condition[iCond] == 2 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are hungry.\r\n",  ch );
            }

          break;

        case COND_THIRST:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_THIRSTY, ch );
              SendToCharacter( "You are thirsty.\r\n", ch );
            }

          break;
        }
    }

  if ( ch->PCData->Condition[iCond] == 3 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are a mite peckish.\r\n",  ch );
            }
          break;

        case COND_THIRST:
          if ( ch->TopLevel <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_THIRSTY, ch );
              SendToCharacter( "You could use a sip of something refreshing.\r\n", ch );
            }
          break;

        }
    }
}

/*
 * Mob autonomous action.
 * This function takes 25% to 35% of ALL Mud cpu time.
 */
static void MobileUpdate( void )
{
  char buf[MAX_STRING_LENGTH];
  Character *ch = NULL;
  Exit *pexit = NULL;
  DirectionType door = DIR_INVALID;
  ch_ret retcode = rNONE;

  /* Examine all mobs. */
  for ( ch = LastCharacter; ch; ch = gch_prev )
    {
      SetCurrentGlobalCharacter( ch );

      if ( ch == FirstCharacter && ch->Previous )
        {
          Bug( "%s: FirstCharacter->Previous != NULL... fixed", __FUNCTION__ );
          ch->Previous = NULL;
        }

      gch_prev = ch->Previous;

      if ( gch_prev && gch_prev->Next != ch )
        {
          Bug( "FATAL: %s: %s->Previous->Next doesn't point to ch.",
	       __FUNCTION__, ch->Name );
          Bug( "Short-cutting here" );
          gch_prev = NULL;
          ch->Previous = NULL;
          do_shout( ch, "Thoric says, 'Prepare for the worst!'" );
        }

      if ( !IsNpc(ch) )
        {
          PerformRandomDrunkBehavior(ch);
          SufferHalucinations(ch);
          continue;
        }

      if ( !ch->InRoom
           || IsAffectedBy(ch, AFF_CHARM)
           || IsAffectedBy(ch, AFF_PARALYSIS) )
	{
	  continue;
	}

      /* Clean up 'animated corpses' that are not charmed' - Scryn */

      if ( ch->Prototype->Vnum == MOB_VNUM_ANIMATED_CORPSE && !IsAffectedBy(ch, AFF_CHARM) )
        {
          if(ch->InRoom->FirstPerson)
	    {
	      Act(AT_MAGIC, "$n returns to the dust from whence $e came.",
		  ch, NULL, NULL, TO_ROOM);
	    }

          if(IsNpc(ch)) /* Guard against purging switched? */
	    {
	      ExtractCharacter(ch, true);
	    }

          continue;
        }

      if ( !IsBitSet( ch->Flags, ACT_RUNNING )
           && !IsBitSet( ch->Flags, ACT_SENTINEL )
           && !ch->Fighting && ch->HHF.Hunting )
        {
          if (  ch->TopLevel < 20 )
	    {
	      SetWaitState( ch, 6 * PULSE_PER_SECOND );
	    }
          else if (  ch->TopLevel < 40 )
	    {
	      SetWaitState( ch, 5 * PULSE_PER_SECOND );
	    }
          else if (  ch->TopLevel < 60 )
	    {
	      SetWaitState( ch, 4 * PULSE_PER_SECOND );
	    }
          else if (  ch->TopLevel < 80 )
	    {
	      SetWaitState( ch, 3 * PULSE_PER_SECOND );
	    }
          else if (  ch->TopLevel < 100 )
	    {
	      SetWaitState( ch, 2 * PULSE_PER_SECOND );
	    }
          else
	    {
	      SetWaitState( ch, 1 * PULSE_PER_SECOND );
	    }

          HuntVictim( ch );
          continue;
        }
      else if ( !ch->Fighting && !ch->HHF.Hunting
                && !IsBitSet( ch->Flags, ACT_RUNNING)
                && ch->WasSentinel && ch->Position >= POS_STANDING )
        {
          Act( AT_ACTION, "$n leaves.", ch, NULL, NULL, TO_ROOM );
          CharacterFromRoom( ch );
          CharacterToRoom( ch , ch->WasSentinel );
          Act( AT_ACTION, "$n arrives.", ch, NULL, NULL, TO_ROOM );
          SetBit( ch->Flags , ACT_SENTINEL );
          ch->WasSentinel = NULL;
        }

      /* Examine call for special procedure */
      if ( !IsBitSet( ch->Flags, ACT_RUNNING )
           && ch->spec_fun )
        {
          if ( (*ch->spec_fun) ( ch ) )
	    {
	      continue;
	    }

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }
        }

      if ( !IsBitSet( ch->Flags, ACT_RUNNING )
           && ch->spec_2 )
        {
          if ( (*ch->spec_2) ( ch ) )
	    {
	      continue;
	    }

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }
        }

      /* Check for mudprogram script on mob */
      if ( IsBitSet( ch->Prototype->mprog.progtypes, SCRIPT_PROG ) )
        {
          MobProgScriptTrigger( ch );
          continue;
        }

      if ( ch != cur_char )
        {
          Bug( "%s: ch != cur_char after spec_fun", __FUNCTION__ );
          continue;
        }

      /* That's all for sleeping / busy monster */
      if ( ch->Position != POS_STANDING )
	{
	  continue;
	}

      if ( IsBitSet(ch->Flags, ACT_MOUNTED ) )
        {
          if ( IsBitSet(ch->Flags, ACT_AGGRESSIVE) )
	    {
	      do_emote( ch, "snarls and growls." );
	    }

          continue;
        }

      if ( IsBitSet(ch->InRoom->Flags, ROOM_SAFE )
           && IsBitSet(ch->Flags, ACT_AGGRESSIVE) )
	{
	  do_emote( ch, "glares around and snarls." );
	}

      /* MOBprogram random trigger */
      if ( ch->InRoom->Area->NumberOfPlayers > 0 )
        {
          MobProgRandomTrigger( ch );

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }

          if ( ch->Position < POS_STANDING )
	    {
	      continue;
	    }
        }

      /* MOBprogram hour trigger: do something for an hour */
      MobProgHourTrigger(ch);

      if ( CharacterDiedRecently(ch) )
	{
	  continue;
	}

      RoomProgHourTrigger(ch);

      if ( CharacterDiedRecently(ch) )
	{
	  continue;
	}

      if ( ch->Position < POS_STANDING )
	{
	  continue;
	}

      /* Scavenge */
      if ( IsBitSet(ch->Flags, ACT_SCAVENGER)
           && ch->InRoom->FirstContent
           && NumberBits( 2 ) == 0 )
        {
          Object *obj = NULL;
          Object *obj_best = NULL;
          int max = 1;

          for ( obj = ch->InRoom->FirstContent; obj; obj = obj->NextContent )
            {
              if ( CAN_WEAR(obj, ITEM_TAKE) && obj->Cost > max
                   && !IS_OBJ_STAT( obj, ITEM_BURRIED ) )
                {
                  obj_best = obj;
                  max      = obj->Cost;
                }
            }

          if ( obj_best )
            {
              ObjectFromRoom( obj_best );
              ObjectToCharacter( obj_best, ch );
              Act( AT_ACTION, "$n gets $p.", ch, obj_best, NULL, TO_ROOM );
            }
        }

      /* Wander */
      if ( !IsBitSet(ch->Flags, ACT_RUNNING)
           && !IsBitSet(ch->Flags, ACT_SENTINEL)
           && !IsBitSet(ch->Flags, ACT_PROTOTYPE)
           && ( door = (DirectionType)NumberBits( 5 ) ) < DIR_SOMEWHERE
           && ( pexit = GetExit(ch->InRoom, door) ) != NULL
           && pexit->ToRoom
           && !IsBitSet(pexit->Flags, EX_CLOSED)
           && !IsBitSet(pexit->ToRoom->Flags, ROOM_NO_MOB)
           && ( !IsBitSet(ch->Flags, ACT_STAY_AREA)
                ||   pexit->ToRoom->Area == ch->InRoom->Area ) )
        {
          retcode = MoveCharacter( ch, pexit, 0 );

          /* If ch changes position due
             to it's or someother mob's
             movement via MOBProgs,
             continue - Kahn */
          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }

          if ( retcode != rNONE || IsBitSet(ch->Flags, ACT_SENTINEL)
               || ch->Position < POS_STANDING )
	    {
	      continue;
	    }
        }

      /* Flee */
      if ( ch->Hit < ch->MaxHit / 2
           && ( door = (DirectionType)NumberBits( 4 ) ) < DIR_SOMEWHERE
           && ( pexit = GetExit(ch->InRoom,door) ) != NULL
           && pexit->ToRoom
           && !IsBitSet(pexit->Flags, EX_CLOSED)
           && !IsBitSet(pexit->ToRoom->Flags, ROOM_NO_MOB) )
        {
          Character *rch = NULL;
          bool found = false;

          for ( rch = ch->InRoom->FirstPerson;
                rch;
                rch = rch->NextInRoom )
            {
              if ( IsFearing(ch, rch) )
                {
                  switch( NumberBits(2) )
                    {
                    case 0:
                      sprintf( buf, "Get away from me, %s!", rch->Name );
                      break;

                    case 1:
                      sprintf( buf, "Leave me be, %s!", rch->Name );
                      break;

                    case 2:
                      sprintf( buf, "%s is trying to kill me!  Help!", rch->Name );
                      break;

                    case 3:
                      sprintf( buf, "Someone save me from %s!", rch->Name );
                      break;
                    }

                  do_yell( ch, buf );
                  found = true;
                  break;
                }
            }

          if ( found )
	    {
	      retcode = MoveCharacter( ch, pexit, 0 );
	    }
        }
    }
}

static void TaxUpdate( void )
{
  const Planet *planet = NULL;
  const Descriptor *d = NULL;

  for ( planet = FirstPlanet; planet; planet = planet->Next )
    {
      Clan *clan = planet->GovernedBy;

      if ( clan )
        {
          int sCount = 0;
          Clan *guild = NULL;

          if ( clan->FirstGuild )
            {
              for ( guild = clan->FirstGuild; guild; guild = guild->NextGuild )
		{
		  sCount++;
		}

              for ( guild = clan->FirstGuild; guild; guild = guild->NextGuild )
                {
                  guild->Funds += GetTaxes(planet) / 1440 / sCount;
                  SaveClan( guild );
                }

              clan->Funds += GetTaxes(planet) / 1440;
              SaveClan (clan);
            }
          else
            {
              clan->Funds += GetTaxes(planet) / 720;
              SaveClan( clan );
            }

          SavePlanet( planet );
        }
    }

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      if ( d && d->Character && d->Character->PCData && d->ConnectionState == CON_PLAYING ) /* Interest */
	{
	  d->Character->PCData->Bank *= 1.0071428571428571;
	}

      if ( ( d->ConnectionState == CON_PLAYING )
           && ( d->Character->PCData->ClanInfo.Salary > 0 )
           && ( d->Character->PCData->ClanInfo.Clan )
           && ( d->Character->PCData->ClanInfo.Clan->Funds >= d->Character->PCData->ClanInfo.Salary ) )
        {
          d->Character->PCData->Bank += d->Character->PCData->ClanInfo.Salary;
          d->Character->PCData->ClanInfo.Clan->Funds -= d->Character->PCData->ClanInfo.Salary;
        }
    }
}

/*
 * Update the weather.
 */
static void WeatherUpdate( void )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  Descriptor *d = NULL;
  int diff = 0;
  short AT_TEMP = AT_PLAIN;

  switch ( ++time_info.Hour )
    {
    case 5:
      weather_info.Sunlight = SUN_LIGHT;
      strcat( buf, "The day has begun." );
      AT_TEMP = AT_YELLOW;
      break;

    case 6:
      weather_info.Sunlight = SUN_RISE;
      strcat( buf, "The sun rises in the east." );
      AT_TEMP = AT_ORANGE;
      break;

    case 12:
      weather_info.Sunlight = SUN_LIGHT;
      strcat( buf, "It's noon." );
      AT_TEMP = AT_YELLOW;
      break;

    case 19:
      weather_info.Sunlight = SUN_SET;
      strcat( buf, "The sun slowly disappears in the west." );
      AT_TEMP = AT_BLOOD;
      break;

    case 20:
      weather_info.Sunlight = SUN_DARK;
      strcat( buf, "The night has begun." );
      AT_TEMP = AT_DGREY;
      break;

    case 24:
      time_info.Hour = 0;
      time_info.Day++;
      break;
    }

  if ( time_info.Day >= 30 )
    {
      time_info.Day = 0;
      time_info.Month++;
    }

  if ( time_info.Month >= 17 )
    {
      time_info.Month = 0;
      time_info.Year++;
    }

  if ( !IsNullOrEmpty( buf ) )
    {
      for ( d = FirstDescriptor; d; d = d->Next )
        {
          if ( d->ConnectionState == CON_PLAYING
               && IS_OUTSIDE(d->Character)
               && IsAwake(d->Character)
               && d->Character->InRoom
               && d->Character->InRoom->Sector != SECT_UNDERWATER
               && d->Character->InRoom->Sector != SECT_OCEANFLOOR
               && d->Character->InRoom->Sector != SECT_UNDERGROUND )
	    {
	      Act( AT_TEMP, buf, d->Character, 0, 0, TO_CHAR );
	    }
        }

      buf[0] = '\0';
    }

  /*
   * Weather change.
   */
  if ( time_info.Month >= 9 && time_info.Month <= 16 )
    {
      diff = weather_info.Mmhg >  985 ? -2 : 2;
    }
  else
    {
      diff = weather_info.Mmhg > 1015 ? -2 : 2;
    }

  weather_info.Change += diff * RollDice(1, 4) + RollDice(2, 6) - RollDice(2, 6);
  weather_info.Change  = umax(weather_info.Change, -12);
  weather_info.Change  = umin(weather_info.Change,  12);

  weather_info.Mmhg += weather_info.Change;
  weather_info.Mmhg  = umax(weather_info.Mmhg,  960);
  weather_info.Mmhg  = umin(weather_info.Mmhg, 1040);

  AT_TEMP = AT_GREY;

  switch ( weather_info.Sky )
    {
    default:
      Bug( "%s: bad sky %d.", __FUNCTION__, weather_info.Sky );
      weather_info.Sky = SKY_CLOUDLESS;
      break;

    case SKY_CLOUDLESS:
      if ( weather_info.Mmhg <  990
           || ( weather_info.Mmhg < 1010 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The sky is getting cloudy." );
          weather_info.Sky = SKY_CLOUDY;
          AT_TEMP = AT_GREY;
        }
      break;

    case SKY_CLOUDY:
      if ( weather_info.Mmhg <  970
           || ( weather_info.Mmhg <  990 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "It starts to rain." );
          weather_info.Sky = SKY_RAINING;
          AT_TEMP = AT_BLUE;
        }

      if ( weather_info.Mmhg > 1030 && NumberBits( 2 ) == 0 )
        {
          strcat( buf, "The clouds disappear." );
          weather_info.Sky = SKY_CLOUDLESS;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_RAINING:
      if ( weather_info.Mmhg <  970 && NumberBits( 2 ) == 0 )
        {
          strcat( buf, "Lightning flashes in the sky." );
          weather_info.Sky = SKY_LIGHTNING;
          AT_TEMP = AT_YELLOW;
        }

      if ( weather_info.Mmhg > 1030
           || ( weather_info.Mmhg > 1010 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The rain stopped." );
          weather_info.Sky = SKY_CLOUDY;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_LIGHTNING:
      if ( weather_info.Mmhg > 1010
           || ( weather_info.Mmhg >  990 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The lightning has stopped." );
          weather_info.Sky = SKY_RAINING;
          AT_TEMP = AT_GREY;
          break;
        }
      break;
    }

  if ( !IsNullOrEmpty( buf ) )
    {
      for ( d = FirstDescriptor; d; d = d->Next )
        {
          if ( d->ConnectionState == CON_PLAYING
               &&   IS_OUTSIDE(d->Character)
               &&   IsAwake(d->Character) )
	    {
	      Act( AT_TEMP, buf, d->Character, 0, 0, TO_CHAR );
	    }
        }
    }
}

/*
 * Update all chars, including mobs.
 * This function is performance sensitive.
 */
static void CharacterUpdate( void )
{
  Character *ch = NULL;

  for ( ch = LastCharacter; ch; ch = gch_prev )
    {
      Character *ch_save = NULL;
      short save_count = 0;

      if ( ch == FirstCharacter && ch->Previous )
        {
          Bug( "%s: FirstCharacter->Previous != NULL... fixed", __FUNCTION__ );
          ch->Previous = NULL;
        }

      gch_prev = ch->Previous;
      SetCurrentGlobalCharacter( ch );

      if ( gch_prev && gch_prev->Next != ch )
        {
          Bug( "%s: ch->Previous->Next != ch", __FUNCTION__ );
          return;
        }

      /*
       *  Do a room_prog rand check right off the bat
       *   if ch disappears (rprog might wax npc's), continue
       */
      if(!IsNpc(ch))
        RoomProgRandomTrigger( ch );

      if( CharacterDiedRecently(ch) )
        continue;

      if(IsNpc(ch))
        MobProgTimeTrigger(ch);

      if( CharacterDiedRecently(ch) )
        continue;

      RoomProgTimeTrigger(ch);

      if( CharacterDiedRecently(ch) )
        continue;

      /*
       * See if player should be auto-saved.
       */
      if ( !IsNpc(ch)
           && IsAuthed(ch)
           && current_time - ch->PCData->SaveTime > ( SysData.SaveFrequency * 60 ) )
	{
	  ch_save = ch;
	}
      else
	{
	  ch_save = NULL;
	}

      if ( ch->Alignment < -1000 )
        ch->Alignment = -1000;

      if ( ch->Alignment > 1000 )
        ch->Alignment = 1000;

      if ( ch->Position >= POS_STUNNED )
        {
          if ( ch->Hit  < ch->MaxHit )
            ch->Hit  += GainHitPoints(ch);

          if ( ch->Mana < ch->MaxMana && IsJedi( ch ) )
            ch->Mana += GainMana(ch);

          if ( ch->Move < ch->MaxMove )
            ch->Move += GainMove(ch);
        }

      if ( ch->Position == POS_STUNNED )
        UpdatePosition( ch );

      if ( ch->PCData )
        GainAddiction( ch );


      if ( !IsNpc(ch) && ch->TopLevel < LEVEL_IMMORTAL )
        {
          Object *obj = NULL;

          if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_LIGHT ) ) != NULL
               && obj->ItemType == ITEM_LIGHT
               && obj->Value[OVAL_LIGHT_POWER] > 0 )
            {
              if ( --obj->Value[OVAL_LIGHT_POWER] == 0 && ch->InRoom )
                {
                  ch->InRoom->Light -= obj->Count;
                  Act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_CHAR );

                  if ( obj->Serial == cur_obj )
		    {
		      global_objcode = rOBJ_EXPIRED;
		    }

                  ExtractObject( obj );
                }
            }

          if ( ch->PCData->Condition[COND_DRUNK] > 8 )
	    {
	      WorsenMentalState( ch, ch->PCData->Condition[COND_DRUNK]/8 );
	    }

          if ( ch->PCData->Condition[COND_FULL] > 1 )
            {
              switch( ch->Position )
                {
                case POS_SLEEPING:
		  ImproveMentalState( ch, 4 );
		  break;

                case POS_RESTING:
		  ImproveMentalState( ch, 3 );
		  break;

                case POS_SITTING:
                case POS_MOUNTED:
		  ImproveMentalState( ch, 2 );
		  break;

                case POS_STANDING:
		  ImproveMentalState( ch, 1 );
		  break;

                case POS_FIGHTING:
                  if ( NumberBits(2) == 0 )
		    {
		      ImproveMentalState( ch, 1 );
		    }
                  break;

		default:
		  break;
                }
            }

          if ( ch->PCData->Condition[COND_THIRST] > 1 )
            {
              switch( ch->Position )
                {
                case POS_SLEEPING:
		  ImproveMentalState( ch, 5 );
		  break;

                case POS_RESTING:
		  ImproveMentalState( ch, 3 );
		  break;

                case POS_SITTING:
                case POS_MOUNTED:
		  ImproveMentalState( ch, 2 );
		  break;

                case POS_STANDING:
		  ImproveMentalState( ch, 1 );
		  break;

                case POS_FIGHTING:
                  if ( NumberBits(2) == 0 )
		    {
		      ImproveMentalState( ch, 1 );
		    }

                  break;

		default:
		  break;
                }
            }

          GainCondition( ch, COND_DRUNK,  -1 );
          GainCondition( ch, COND_FULL,   -1 );

          if ( ch->InRoom )
	    {
	      switch( ch->InRoom->Sector )
		{
		default:
		  GainCondition( ch, COND_THIRST, -1 );
		  break;

		case SECT_DESERT:
		  GainCondition( ch, COND_THIRST, -2 );
		  break;

		case SECT_UNDERWATER:
		case SECT_OCEANFLOOR:
		  if ( NumberBits(1) == 0 )
		    {
		      GainCondition( ch, COND_THIRST, -1 );
		    }

		  break;
		}
	    }
        }

      if ( !CharacterDiedRecently(ch) )
        {
          /*
           * Careful with the damages here,
           *   MUST NOT refer to ch after damage taken,
           *   as it may be lethal damage (on NPC).
           */
          if ( IsAffectedBy(ch, AFF_POISON) )
            {
              Act( AT_POISON, "$n shivers and suffers.", ch, NULL, NULL, TO_ROOM );
              Act( AT_POISON, "You shiver and suffer.", ch, NULL, NULL, TO_CHAR );
              ch->MentalState = urange( 20, ch->MentalState
                                         + 4 , 100 );
              InflictDamage( ch, ch, 6, gsn_poison );
            }
          else if ( ch->Position == POS_INCAP )
	    {
	      InflictDamage( ch, ch, 1, TYPE_UNDEFINED );
	    }
	  else if ( ch->Position == POS_MORTAL )
	    {
	      InflictDamage( ch, ch, 4, TYPE_UNDEFINED );
	    }

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }

          if ( ch->MentalState >= 30 )
	    {
	      switch( (ch->MentalState+5) / 10 )
		{
		case 3:
		  SendToCharacter( "You feel feverish.\r\n", ch );
		  Act( AT_ACTION, "$n looks kind of out of it.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 4:
		  SendToCharacter( "You do not feel well at all.\r\n", ch );
		  Act( AT_ACTION, "$n doesn't look too good.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 5:
		  SendToCharacter( "You need help!\r\n", ch );
		  Act( AT_ACTION, "$n looks like $e could use your help.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 6:
		  SendToCharacter( "Seekest thou a cleric.\r\n", ch );
		  Act( AT_ACTION, "Someone should fetch a healer for $n.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 7:
		  SendToCharacter( "You feel reality slipping away...\r\n", ch );
		  Act( AT_ACTION, "$n doesn't appear to be aware of what's going on.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 8:
		  SendToCharacter( "You begin to understand... everything.\r\n", ch );
		  Act( AT_ACTION, "$n starts ranting like a madman!", ch, NULL, NULL, TO_ROOM );
		  break;

		case 9:
		  SendToCharacter( "You are ONE with the universe.\r\n", ch );
		  Act( AT_ACTION, "$n is ranting on about 'the answer', 'ONE' and other mumbo-jumbo...", ch, NULL, NULL, TO_ROOM );
		  break;

		case 10:
		  SendToCharacter( "You feel the end is near.\r\n", ch );
		  Act( AT_ACTION, "$n is muttering and ranting in tongues...", ch, NULL, NULL, TO_ROOM );
		  break;
		}
	    }

          if ( ch->MentalState <= -30 )
            switch( (int)(( abs( ch->MentalState ) + 5 ) / 10) )
              {
              case 10:
                if ( ch->Position > POS_SLEEPING )
                  {
                    if ( (ch->Position == POS_STANDING
                          || ch->Position < POS_FIGHTING)
                         && GetRandomPercent()+10 < abs(ch->MentalState) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			SendToCharacter( "You're barely conscious.\r\n", ch );
		      }
                  }
                break;

              case 9:
                if ( ch->Position > POS_SLEEPING )
                  {
                    if ( (ch->Position == POS_STANDING
                          || ch->Position < POS_FIGHTING)
                         && (GetRandomPercent()+20) < abs(ch->MentalState) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			SendToCharacter( "You can barely keep your eyes open.\r\n", ch );
		      }
                  }
                break;

              case 8:
                if ( ch->Position > POS_SLEEPING )
                  {
                    if ( ch->Position < POS_SITTING
                         &&  (GetRandomPercent()+30) < abs(ch->MentalState) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			SendToCharacter( "You're extremely drowsy.\r\n", ch );
		      }
                  }
                break;

              case 7:
                if ( ch->Position > POS_RESTING )
		  {
		    SendToCharacter( "You feel very unmotivated.\r\n", ch );
		  }
                break;

              case 6:
                if ( ch->Position > POS_RESTING )
		  {
		    SendToCharacter( "You feel sedated.\r\n", ch );
		  }
		break;

              case 5:
                if ( ch->Position > POS_RESTING )
		  {
		    SendToCharacter( "You feel sleepy.\r\n", ch );
		  }
                break;

              case 4:
                if ( ch->Position > POS_RESTING )
		  {
		    SendToCharacter( "You feel tired.\r\n", ch );
		  }
                break;

              case 3:
                if ( ch->Position > POS_RESTING )
		  {
		    SendToCharacter( "You could use a rest.\r\n", ch );
		  }
                break;
              }

          if ( ch->BackupWait > 0 )
            {
              --ch->BackupWait;

              if ( ch->BackupWait == 0 )
		{
		  AddReinforcements( ch );
		}
            }

          if ( !IsNpc (ch) )
            {
              if ( ++ch->IdleTimer > 15 && !ch->Desc )
                {
                  if ( ch->InRoom )
		    {
		      CharacterFromRoom( ch );
		    }

                  CharacterToRoom( ch, GetRoom( ROOM_PLUOGUS_QUIT ) );
                  ch->Position = POS_RESTING;
                  ch->Hit = umax ( 1 , ch->Hit );
                  SaveCharacter( ch );
                  do_quit( ch, "" );
                }
              else if ( ch == ch_save && IsBitSet( SysData.SaveFlags, SV_AUTO )
			&& ++save_count < 10 )   /* save max of 10 per tick */
		{
		  SaveCharacter( ch );
		}
            }
        }
    }
}

/*
 * Update all objs.
 * This function is performance sensitive.
 */
static void ObjectUpdate( void )
{
  Object *obj = NULL;
  Object *wield = NULL;
  short AT_TEMP = 0;

  for ( obj = LastObject; obj; obj = gobj_prev )
    {
      Character *rch = NULL;
      const char *message = NULL;

      if ( obj == FirstObject && obj->Previous )
        {
          Bug( "%s: FirstObject->Previous != NULL... fixed", __FUNCTION__ );
          obj->Previous = NULL;
        }

      gobj_prev = obj->Previous;

      if ( gobj_prev && gobj_prev->Next != obj )
        {
          Bug( "%s: obj->Previous->Next != obj", __FUNCTION__ );
          return;
        }

      SetCurrentGlobalObject( obj );

      if ( obj->CarriedBy )
	{
	  ObjProgRandomTrigger( obj );
	}
      else if( obj->InRoom && obj->InRoom->Area->NumberOfPlayers > 0 )
	{
	  ObjProgRandomTrigger( obj );
	}

      if( IsObjectExtracted(obj) )
	{
	  continue;
	}

      if ( obj->ItemType == ITEM_WEAPON && obj->CarriedBy
	   && ( obj->WearLoc == WEAR_WIELD || obj->WearLoc == WEAR_DUAL_WIELD )
	   && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_BLASTER
	   && obj->Value[OVAL_WEAPON_CHARGE] > 0
	   && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_BOWCASTER
	   && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE)
        {
          obj->Value[OVAL_WEAPON_CHARGE]--;

          if ( obj->Value[OVAL_WEAPON_CHARGE] <= 0 )
            {
              if ( obj->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER )
                {
                  Act( AT_PLAIN, "$p fizzles and dies." , obj->CarriedBy, obj, NULL, TO_CHAR );
                  Act( AT_PLAIN, "$n's lightsaber fizzles and dies." , obj->CarriedBy, NULL, NULL, TO_ROOM );
                }
              else if ( obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE )
                {
                  Act( AT_PLAIN, "$p stops vibrating." , obj->CarriedBy, obj, NULL, TO_CHAR );
                }
            }
        }

      if ( obj->ItemType == ITEM_PIPE )
        {
          if ( IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
            {
              if ( --obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] <= 0 )
                {
                  obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
                  RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT );
                }
              else if ( IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT ) )
		{
		  RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT );
		}
	      else
		{
		  if ( IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT ) )
		    {
		      RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT );
		      RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		  else
		    {
		      SetBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		}

              if ( !IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
		{
		  SetBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH );
		}
            }
          else
	    {
	      RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT );
	    }
        }

      /* Corpse decay (npc corpses decay at 8 times the rate of pc corpses) - Narn */
      if ( obj->ItemType == ITEM_CORPSE_PC || obj->ItemType == ITEM_CORPSE_NPC
           || obj->ItemType == ITEM_DROID_CORPSE )
        {
          short timerfrac = umax(1, obj->Timer - 1);

          if ( obj->ItemType == ITEM_CORPSE_PC )
	    {
	      timerfrac = (int)(obj->Timer / 8 + 1);
	    }

          if ( obj->Timer > 0 && obj->Value[OVAL_CORPSE_DECAY] > timerfrac )
            {
              char buf[MAX_STRING_LENGTH];
              char name[MAX_STRING_LENGTH];
              char *bufptr = NULL;

              bufptr = OneArgument( obj->ShortDescr, name );
              bufptr = OneArgument( bufptr, name );
              bufptr = OneArgument( bufptr, name );

              SeparateOneObjectFromGroup(obj);
              obj->Value[OVAL_CORPSE_DECAY] = timerfrac;

              if ( obj->ItemType == ITEM_DROID_CORPSE )
		{
		  sprintf( buf, d_corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   bufptr );
		}
              else
		{
		  sprintf( buf, corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   Capitalize( bufptr ) );
		}

              FreeMemory( obj->Description );
              obj->Description = CopyString( buf );
            }
        }

      /* don't let inventory decay */
      if ( IS_OBJ_STAT(obj, ITEM_INVENTORY) )
	{
	  continue;
	}

      if ( obj->ItemType == ITEM_GRENADE && obj->CarriedBy)
        {
          wield = GetEquipmentOnCharacter( obj->CarriedBy, WEAR_HOLD );

          if( wield == obj )
	    {
	      continue;
	    }
        }

      if ( obj->Timer > 0 && obj->Timer < 5 && obj->ItemType == ITEM_ARMOR )
        {
          if ( obj->CarriedBy )
            {
              Act( AT_TEMP, "$p is almost dead." , obj->CarriedBy, obj, NULL, TO_CHAR );
            }
        }

      if ( ( obj->Timer <= 0 || --obj->Timer > 0 ) )
        {
          if (obj->InRoom
              && obj->InRoom->Sector == SECT_AIR
              && (obj->WearFlags & ITEM_TAKE) )
            {
              Room *new_room = NULL;
              Exit *xit = NULL;

              for (xit = obj->InRoom->FirstExit; xit; xit = xit->Next )
		{
		  if ( xit->Direction == DIR_DOWN )
		    {
		      break;
		    }
		}

              if ( !xit )
		{
		  continue;
		}

              new_room = xit->ToRoom;

              if (( rch = obj->InRoom->FirstPerson ) != NULL )
                {
                  Act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_CHAR );
                }

              ObjectFromRoom(obj);
              ObjectToRoom(obj, new_room);

              if (( rch = obj->InRoom->FirstPerson) != NULL )
                {
                  Act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_CHAR );
                }
            }

          continue;
        }

      /* if we get this far, object's timer has expired. */

      AT_TEMP = AT_PLAIN;

      switch ( obj->ItemType )
        {
        default:
          message = "$p has depleted itself.";
          AT_TEMP = AT_PLAIN;
          break;

        case ITEM_GRENADE:
          Explode( obj );
          return;
          break;

        case ITEM_PORTAL:
          message = "$p winks out of existence.";
          RemovePortal(obj);
          obj->ItemType = ITEM_TRASH;          /* so ExtractObject        */
          AT_TEMP = AT_MAGIC;                   /* doesn't RemovePortal */
          break;

        case ITEM_FOUNTAIN:
          message = "$p dries up.";
          AT_TEMP = AT_BLUE;
          break;

        case ITEM_CORPSE_NPC:
          message = "$p decays into dust and blows away.";
          AT_TEMP = AT_OBJECT;
          break;

        case ITEM_DROID_CORPSE:
          message = "$p rusts away into oblivion.";
          AT_TEMP = AT_OBJECT;
          break;

        case ITEM_CORPSE_PC:
          message = "$p decays into dust and is blown away...";
          AT_TEMP = AT_MAGIC;
          break;

        case ITEM_FOOD:
          message = "$p is devoured by a swarm of maggots.";
          AT_TEMP = AT_HUNGRY;
          break;

        case ITEM_BLOOD:
          message = "$p slowly seeps into the ground.";
          AT_TEMP = AT_BLOOD;
          break;

        case ITEM_BLOODSTAIN:
          message = "$p dries up into flakes and blows away.";
          AT_TEMP = AT_BLOOD;
          break;

        case ITEM_SCRAPS:
          message = "$p crumbles and decays into nothing.";
          AT_TEMP = AT_OBJECT;
          break;

        case ITEM_FIRE:
          if (obj->InRoom)
            --obj->InRoom->Light;
          message = "$p burns out.";
          AT_TEMP = AT_FIRE;
        }

      if ( obj->CarriedBy )
        {
          Act( AT_TEMP, message, obj->CarriedBy, obj, NULL, TO_CHAR );
        }
      else if ( obj->InRoom
                && ( rch = obj->InRoom->FirstPerson ) != NULL
                && !IS_OBJ_STAT( obj, ITEM_BURRIED ) )
        {
          Act( AT_TEMP, message, rch, obj, NULL, TO_ROOM );
          Act( AT_TEMP, message, rch, obj, NULL, TO_CHAR );
        }

      if ( obj->Serial == cur_obj )
        global_objcode = rOBJ_EXPIRED;

      ExtractObject( obj );
    }
}

/*
 * Function to check important stuff happening to a player
 * This function should take about 5% of mud cpu time
 */
static void CharacterCheck( void )
{
  Character *ch = NULL;
  Character *ch_next = NULL;
  static int cnt = 0;

  cnt = (cnt+1) % 2;

  for ( ch = FirstCharacter; ch; ch = ch_next )
    {
      Exit *pexit = NULL;
      DirectionType door = DIR_INVALID;
      int retcode = rNONE;

      SetCurrentGlobalCharacter(ch);
      ch_next = ch->Next;
      CharacterFallIfNoFloor(ch, 0);

      if ( CharacterDiedRecently( ch ) )
	{
	  continue;
	}

      if ( IsNpc( ch ) )
        {
          if ( cnt != 0 )
	    {
	      continue;
	    }

          /* running mobs       -Thoric */
          if ( IsBitSet(ch->Flags, ACT_RUNNING) )
            {
              if ( !IsBitSet( ch->Flags, ACT_SENTINEL )
                   && !ch->Fighting && ch->HHF.Hunting )
                {
                  SetWaitState( ch, 2 * PULSE_VIOLENCE );
                  HuntVictim( ch );
                  continue;
                }

              if ( ch->spec_fun )
                {
                  if ( ch->spec_fun( ch ) )
		    {
		      continue;
		    }

                  if ( CharacterDiedRecently(ch) )
		    {
		      continue;
		    }
                }

              if ( ch->spec_2 )
                {
                  if ( (*ch->spec_2) ( ch ) )
		    {
		      continue;
		    }

                  if ( CharacterDiedRecently(ch) )
		    {
		      continue;
		    }
                }

              if ( !IsBitSet(ch->Flags, ACT_SENTINEL)
                   && !IsBitSet(ch->Flags, ACT_PROTOTYPE)
                   && ( door = (DirectionType)NumberBits( 4 ) ) < DIR_SOMEWHERE
                   && ( pexit = GetExit(ch->InRoom, door) ) != NULL
                   && pexit->ToRoom
                   && !IsBitSet(pexit->Flags, EX_CLOSED)
                   && !IsBitSet(pexit->ToRoom->Flags, ROOM_NO_MOB)
                   && ( !IsBitSet(ch->Flags, ACT_STAY_AREA)
                        || pexit->ToRoom->Area == ch->InRoom->Area ) )
                {
                  retcode = MoveCharacter( ch, pexit, 0 );

                  if ( CharacterDiedRecently(ch) )
		    {
		      continue;
		    }

                  if ( retcode != rNONE || IsBitSet(ch->Flags, ACT_SENTINEL)
                       || ch->Position < POS_STANDING )
		    {
		      continue;
		    }
                }
            }

          continue;
        }
      else
        {
          if ( ch->Mount
               && ch->InRoom != ch->Mount->InRoom )
            {
              RemoveBit( ch->Mount->Flags, ACT_MOUNTED );
              ch->Mount = NULL;
              ch->Position = POS_STANDING;
              SendToCharacter( "No longer upon your mount, you fall to the ground...\r\nOUCH!\r\n", ch );
            }

          if ( ( ch->InRoom && ch->InRoom->Sector == SECT_UNDERWATER )
               || ( ch->InRoom && ch->InRoom->Sector == SECT_OCEANFLOOR ) )
            {
              if ( !IsAffectedBy( ch, AFF_AQUA_BREATH ) )
                {
                  if ( GetTrustLevel(ch) < LEVEL_IMMORTAL )
                    {
		      int dam = GetRandomNumberFromRange( ch->MaxHit / 50 , ch->MaxHit / 30 );
                      dam = umax( 1, dam );

                      if(  ch->Hit <= 0 )
			{
			  dam = umin( 10, dam );
			}

                      if ( NumberBits(3) == 0 )
			{
			  SendToCharacter( "You cough and choke as you try to breathe water!\r\n", ch );
			}

                      InflictDamage( ch, ch, dam, TYPE_UNDEFINED );
                    }
                }
            }

          if ( CharacterDiedRecently( ch ) )
	    {
	      continue;
	    }

          if ( ch->InRoom
               && (( ch->InRoom->Sector == SECT_WATER_NOSWIM )
                   || ( ch->InRoom->Sector == SECT_WATER_SWIM ) ) )
            {
              if ( !IsAffectedBy( ch, AFF_FLYING )
                   && !IsAffectedBy( ch, AFF_FLOATING )
                   && !IsAffectedBy( ch, AFF_AQUA_BREATH )
                   && !ch->Mount )
                {
                  if ( !IsImmortal( ch ) )
                    {
                      int dam;

                      if ( ch->Move > 0 )
			{
			  ch->Move--;
			}
                      else
                        {
                          dam = GetRandomNumberFromRange( ch->MaxHit / 50, ch->MaxHit / 30 );
                          dam = umax( 1, dam );

                          if( ch->Hit <= 0 )
			    {
			      dam = umin( 10, dam );
			    }

                          if ( NumberBits(3) == 0 )
			    {
			      SendToCharacter( "Struggling with exhaustion, you choke on a mouthful of water.\r\n", ch );
			    }

                          InflictDamage( ch, ch, dam, TYPE_UNDEFINED );
                        }
                    }
                }
            }
        }
    }
}

/*
 * Aggress.
 *
 * for each descriptor
 *     for each mob in room
 *         aggress on some random PC
 *
 * This function should take 5% to 10% of ALL mud cpu time.
 * Unfortunately, checking on each PC move is too tricky,
 *   because we don't the mob to just attack the first PC
 *   who leads the party into the room.
 *
 */
static void AggroUpdate( void )
{
  Character *wch = NULL;
  Character *ch = NULL;
  Character *ch_next = NULL;
  Character *victim = NULL;
  Character *wch_next = NULL;
  struct act_prog_data *apdtmp = NULL;

  /* check mobprog act queue */
  while ( (apdtmp = mob_act_list) != NULL )
    {
      wch = (Character*)mob_act_list->vo;

      if ( !CharacterDiedRecently(wch) && wch->mprog.mpactnum > 0 )
        {
          MPROG_ACT_LIST * tmp_act = NULL;

          while ( (tmp_act = wch->mprog.mpact) != NULL )
            {
              if ( tmp_act->obj && IsObjectExtracted(tmp_act->obj) )
		{
		  tmp_act->obj = NULL;
		}

              if ( tmp_act->ch && !CharacterDiedRecently(tmp_act->ch) )
		{
		  MobProgWordlistCheck( tmp_act->buf, wch, tmp_act->ch,
					tmp_act->obj, tmp_act->vo, ACT_PROG );
		}

              wch->mprog.mpact = tmp_act->Next;
              FreeMemory(tmp_act->buf);
              FreeMemory(tmp_act);
            }

          wch->mprog.mpactnum = 0;
          wch->mprog.mpact    = NULL;
        }

      mob_act_list = apdtmp->Next;
      FreeMemory( apdtmp );
    }

  for( ch = FirstCharacter; ch; ch = wch_next )
    {
      wch_next = ch->Next;

      if ( !IsNpc(ch)
           || ch->Fighting
           || IsAffectedBy(ch, AFF_CHARM)
           || !IsAwake(ch)
           || ( IsBitSet(ch->Flags, ACT_WIMPY) ) )
	{
	  continue;
	}

      if ( !IsBitSet(ch->Flags, ACT_AGGRESSIVE)
           || IsBitSet(ch->Flags, ACT_MOUNTED)
           || IsBitSet(ch->InRoom->Flags, ROOM_SAFE ) )
	{
	  continue;
	}

      for ( wch = ch->InRoom->FirstPerson; wch; wch = ch_next )
        {
          ch_next = wch->NextInRoom;

          if ( IsHating( ch, wch ) )
            {
              FoundPrey( ch, wch );
              continue;
            }

          if ( CharacterDiedRecently(wch)
               || wch->TopLevel >= LEVEL_IMMORTAL
               || !wch->InRoom
               || !CanSeeCharacter( ch, wch ) )
	    {
	      continue;
	    }

          if ( IsBitSet(wch->Flags, ACT_AGGRESSIVE) )
	    {
	      continue;
	    }

          victim = wch;

          if ( !victim )
            {
              Bug( "%s: null victim.", __FUNCTION__ );
              continue;
            }

          if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
	    {
	      continue;
	    }

          if ( IsNpc(ch) && IsBitSet(ch->AttackFlags, ATCK_BACKSTAB ) )
            {
              Object *obj = NULL;

              if ( !ch->Mount
                   && (obj = GetEquipmentOnCharacter( ch, WEAR_WIELD )) != NULL
                   && obj->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
                   && !victim->Fighting
                   && victim->Hit >= victim->MaxHit )
                {
                  SetWaitState( ch, SkillTable[gsn_backstab]->Beats );

                  if ( !IsAwake(victim)
                       || GetRandomPercent() + 5 < ch->TopLevel )
                    {
                      global_retcode = HitMultipleTimes( ch, victim, gsn_backstab );
                      continue;
                    }
                  else
                    {
                      global_retcode = InflictDamage( ch, victim, 0, gsn_backstab );
                      continue;
                    }
                }
            }

          global_retcode = HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
        }
    }
}

/*
 * drunk randoms        - Tricops
 * (Made part of mobile_update  -Thoric)
 */
static void PerformRandomDrunkBehavior( Character *ch )
{
  Character *rvch = NULL;
  Character *vch = NULL;
  short drunk = 0;
  PositionType position = POS_DEAD;

  if( !ch )
    {
      return;
    }

  if ( IsNpc( ch ) || !ch->PCData || ch->PCData->Condition[COND_DRUNK] <= 0 )
    {
      return;
    }

  if ( GetRandomPercent() < 30 )
    {
      return;
    }

  drunk = ch->PCData->Condition[COND_DRUNK];
  position = ch->Position;
  ch->Position = POS_STANDING;

  if ( GetRandomPercent() < (2*drunk / 20) )
    {
      CheckSocial( ch, "burp", "" );
    }
  else if ( GetRandomPercent() < (2*drunk / 20) )
    {
      CheckSocial( ch, "hiccup", "" );
    }
  else if ( GetRandomPercent() < (2*drunk / 20) )
    {
      CheckSocial( ch, "drool", "" );
    }
  else if ( GetRandomPercent() < (2*drunk / 20) )
    {
      CheckSocial( ch, "fart", "" );
    }
  else if ( drunk > (10+(GetCurrentConstitution(ch)/5))
	    && GetRandomPercent() < ( 2 * drunk / 18 ) )
    {
      char name[MAX_STRING_LENGTH];

      for ( vch = ch->InRoom->FirstPerson; vch; vch = vch->NextInRoom )
	{
	  if ( GetRandomPercent() < 10 )
	    {
	      rvch = vch;
	    }
	}

      strcpy(name, rvch ? rvch->Name : "");
      CheckSocial( ch, "puke", name);
    }

  ch->Position = position;
}

static void SufferHalucinations( Character *ch )
{
  if ( ch->MentalState >= 30
       && NumberBits(5 - (ch->MentalState >= 50) - (ch->MentalState >= 75)) == 0 )
    {
      const char *t;

      switch( GetRandomNumberFromRange( 1, umin(20, (ch->MentalState+5) / 5)) )
        {
        default:
        case 1:
	  t = "You feel very restless... you can't sit still.\r\n";
	  break;

        case 2:
	  t = "You're tingling all over.\r\n";
	  break;

        case 3:
	  t = "Your skin is crawling.\r\n";
	  break;

        case 4:
	  t = "You suddenly feel that something is terribly wrong.\r\n";
	  break;

        case 5:
	  t = "Those damn little jawas keep laughing at you!\r\n";
	  break;

        case 6:
	  t = "You can hear your mother crying...\r\n";
	  break;

        case 7:
	  t = "Have you been here before, or not? You're not sure...\r\n";
	  break;

        case 8:
	  t = "Painful childhood memories flash through your mind.\r\n";
	  break;

        case 9:
	  t = "You hear someone call your name in the distance...\r\n";
	  break;

        case 10:
	  t = "Your head is pulsating... you can't think straight.\r\n";
	  break;

        case 11:
	  t = "The ground... seems to be squirming...\r\n";
	  break;

        case 12:
	  t = "You're not quite sure what is real anymore.\r\n";
	  break;

        case 13:
	  t = "It's all a dream... or is it?\r\n";
	  break;

        case 14:
	  t = "They're coming to get you... coming to take you away...\r\n";
	  break;

        case 15:
	  t = "You begin to feel all powerful!\r\n";
	  break;

        case 16:
	  t = "You're light as air... the heavens are yours for the taking.\r\n";
	  break;

        case 17:
	  t = "Your whole life flashes by... and your future...\r\n";
	  break;

        case 18:
	  t = "You are everywhere and everything... you know all and are all!\r\n";
	  break;

        case 19:
	  t = "You feel immortal!\r\n";
	  break;

        case 20:
	  t = "Ahh... the power of a Supreme Entity... what to do...\r\n";
	  break;
        }

      SendToCharacter( t, ch );
    }
}

static void TeleportUpdate( void )
{
  TeleportData *tele = NULL;
  TeleportData *tele_next = NULL;

  if ( !FirstTeleport )
    {
      return;
    }

  for ( tele = FirstTeleport; tele; tele = tele_next )
    {
      tele_next = tele->Next;

      if ( --tele->TeleportTimer <= 0 )
        {
          if ( tele->FromRoom->FirstPerson )
            {
              Teleport( tele->FromRoom->FirstPerson, tele->FromRoom->TeleVnum,
                        TELE_TRANSALL );
            }

          UNLINK( tele, FirstTeleport, LastTeleport, Next, Previous );
          FreeMemory( tele );
        }
    }
}

/*
 * Handle all kinds of updates.
 * Called once per pulse from game loop.
 * Random times to defeat tick-timing clients and players.
 */
void UpdateHandler( void )
{
  static int pulse_taxes;
  static int pulse_area;
  static int pulse_mobile;
  static int pulse_violence;
  static int pulse_point;
  static int pulse_second;
  static int pulse_space;
  static int pulse_ship;
  static int pulse_recharge;
  static int pulse_StartArena = PULSE_ARENA;
  static int pulse_arena = PULSE_ARENA;
  struct timeval start_time;
  struct timeval etime;

  if ( timechar )
    {
      SetCharacterColor(AT_PLAIN, timechar);
      SendToCharacter( "Starting update timer.\r\n", timechar );
      gettimeofday(&start_time, NULL);
    }

  if ( --pulse_area <= 0 )
    {
      pulse_area = GetRandomNumberFromRange( PULSE_AREA / 2, 3 * PULSE_AREA / 2 );
      AreaUpdate();
    }

  if ( --pulse_taxes <= 0 )
    {
      pulse_taxes = PULSE_TAXES ;
      TaxUpdate();
    }

  if ( --pulse_mobile <= 0 )
    {
      pulse_mobile = PULSE_MOBILE;
      MobileUpdate();
    }

  if ( --pulse_space <= 0 )
    {
      pulse_space = PULSE_SPACE;
      ShipUpdate();
      ShuttleUpdate();
    }

  if ( --pulse_recharge <= 0 )
    {
      pulse_recharge = PULSE_SPACE/3;
      RechargeShips();
    }

  if ( --pulse_ship <= 0 )
    {
      pulse_ship = PULSE_SPACE / 10;
      SpaceobjectUpdate();
      ForEach( Missile, FirstMissile, Next, UpdateMissile, NULL );
      UpdateShipMovement();
    }

  if ( --pulse_violence <= 0 )
    {
      pulse_violence = PULSE_VIOLENCE;
      ViolenceUpdate();
    }

  if ( --pulse_point <= 0 )
    {
      pulse_point = GetRandomNumberFromRange( PULSE_TICK * 0.75, PULSE_TICK * 1.25 );

      WeatherUpdate();
      CharacterUpdate();
      ObjectUpdate();
      ClearVirtualRooms();
    }

  if ( --pulse_second <= 0 )
    {
      pulse_second = PULSE_PER_SECOND;
      CharacterCheck();
      RebootCheck(0);
    }

  if ( auction->Item && --auction->Pulse <= 0 )
    {
      auction->Pulse = PULSE_AUCTION;
      AuctionUpdate();
    }

  if(arena.InStartArena || arena.PeopleChallenged)
    {
      if( --pulse_StartArena <= 0)
	{
	  pulse_StartArena = PULSE_ARENA;
	  StartArena();
	}
    }

  if(arena.PeopleIsInArena)
    {
      if(( --pulse_arena <= 0) || (CharactersInArena()==1))
	{
	  pulse_arena = PULSE_ARENA;
	  UpdateArena();
	}
    }

  TeleportUpdate();
  AggroUpdate();
  ObjectActUpdate();
  RoomActUpdate();
  CleanObjectQueue();            /* dispose of extracted objects */
  CleanCharacterQueue();           /* dispose of dead mobs/quitting chars */

  if ( timechar )
    {
      gettimeofday(&etime, NULL);
      SetCharacterColor(AT_PLAIN, timechar);
      SendToCharacter( "Update timing complete.\r\n", timechar );
      SubtractTimes(&etime, &start_time);
      Echo( timechar, "Timing took %d.%06d seconds.\r\n",
                 etime.tv_sec, etime.tv_usec );
      timechar = NULL;
    }
}

void RemovePortal( Object *portal )
{
  Room *fromRoom = portal->InRoom;
  Room *toRoom = NULL;
  Character *ch = NULL;
  Exit *pexit = NULL;
  bool found = false;

  for ( pexit = fromRoom->FirstExit; pexit; pexit = pexit->Next )
    {
      if ( IsBitSet( pexit->Flags, EX_PORTAL ) )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      Bug( "RemovePortal: portal not found in room %ld!", fromRoom->Vnum );
      return;
    }

  if ( pexit->Direction != DIR_PORTAL )
    {
      Bug( "RemovePortal: exit in dir %d != DIR_PORTAL", pexit->Direction );
    }

  if ( ( toRoom = pexit->ToRoom ) == NULL )
    {
      Bug( "RemovePortal: toRoom is NULL", 0 );
    }

  ExtractExit( fromRoom, pexit );

  if ( toRoom && (ch = toRoom->FirstPerson) != NULL )
    {
      Act( AT_PLAIN, "A magical portal above winks from existence.", ch, NULL, NULL, TO_ROOM );
    }
}

void RebootCheck( time_t reset )
{
  static const char * const tmsg[] =
    { "SYSTEM: Reboot in 10 seconds.",
      "SYSTEM: Reboot in 30 seconds.",
      "SYSTEM: Reboot in 1 minute.",
      "SYSTEM: Reboot in 2 minutes.",
      "SYSTEM: Reboot in 3 minutes.",
      "SYSTEM: Reboot in 4 minutes.",
      "SYSTEM: Reboot in 5 minutes.",
      "SYSTEM: Reboot in 10 minutes.",
    };
  static const int times[] = { 10, 30, 60, 120, 180, 240, 300, 600 };
  static int trun = 0;
  static bool init = false;
  int timesize = umin(sizeof(times)/sizeof(*times), sizeof(tmsg)/sizeof(*tmsg));
  char buf[MAX_STRING_LENGTH];

  if ( !init || reset >= current_time )
    {
      for ( trun = timesize-1; trun >= 0; trun-- )
	{
	  if ( reset >= current_time+times[trun] )
	    {
	      break;
	    }
	}

      init = true;
      return;
    }

  if ( (current_time % 1800) == 0 )
    {
      sprintf(buf, "%.24s: %d players", ctime(&current_time), num_descriptors);
      AppendToFile(USAGE_FILE, buf);
    }

  if ( new_boot_time_t - boot_time < 60 * 60 * 18
       && !set_boot_time->Manual )
    {
      return;
    }

  if ( new_boot_time_t <= current_time )
    {
      Character *vch = NULL;

      if ( auction->Item )
        {
          sprintf(buf, "Sale of %s has been stopped by mud.",
                  auction->Item->ShortDescr);
          TalkAuction(buf);
          ObjectToCharacter(auction->Item, auction->Seller);
          auction->Item = NULL;

          if ( auction->Buyer && auction->Buyer != auction->Seller )
            {
              auction->Buyer->Gold += auction->Bet;
              SendToCharacter("Your money has been returned.\r\n", auction->Buyer);
            }
        }

      EchoToAll(AT_YELLOW, "You are forced from these realms by a strong "
                  "presence\r\nas life here is reconstructed.", ECHOTAR_ALL);

      for ( vch = FirstCharacter; vch; vch = vch->Next )
	{
	  if ( !IsNpc(vch) )
	    {
	      SaveCharacter(vch);
	    }
	}

      SaveAllShips();

      mud_down = true;
      return;
    }

  if ( trun != -1 && new_boot_time_t - current_time <= times[trun] )
    {
      EchoToAll(AT_YELLOW, tmsg[trun], ECHOTAR_ALL);

      if ( trun <= 5 )
	{
	  SysData.DenyNewPlayers = true;
	}

      --trun;
      return;
    }
}

/* the auction update*/
static void AuctionUpdate( void )
{
  int tax = 0;
  int pay = 0;
  char buf[MAX_STRING_LENGTH];

  switch (++auction->Going) /* increase the going state */
    {
    case 1 : /* going once */
    case 2 : /* going twice */
      if (auction->Bet > auction->Starting)
	{
	  sprintf (buf, "%s: going %s for %d.", auction->Item->ShortDescr,
		   ((auction->Going == 1) ? "once" : "twice"), auction->Bet);
	}
      else
	{
	  sprintf (buf, "%s: going %s (bid not received yet).", auction->Item->ShortDescr,
		   ((auction->Going == 1) ? "once" : "twice"));
	}

      TalkAuction (buf);
      break;

    case 3 : /* SOLD! */
      if (!auction->Buyer && auction->Bet)
        {
          Bug( "Auction code reached SOLD, with NULL buyer, but %d gold bid", auction->Bet );
          auction->Bet = 0;
        }

      if (auction->Bet > 0 && auction->Buyer != auction->Seller)
        {
          sprintf (buf, "%s sold to %s for %d.",
                   auction->Item->ShortDescr,
                   IsNpc(auction->Buyer) ? auction->Buyer->ShortDescr : auction->Buyer->Name,
                   auction->Bet);
          TalkAuction(buf);

          Act(AT_ACTION, "The auctioneer materializes before you, and hands you $p.",
              auction->Buyer, auction->Item, NULL, TO_CHAR);
          Act(AT_ACTION, "The auctioneer materializes before $n, and hands $m $p.",
              auction->Buyer, auction->Item, NULL, TO_ROOM);

          if ( (auction->Buyer->CarryWeight
                + GetObjectWeight( auction->Item ))
               > GetCarryCapacityWeight( auction->Buyer ) )
            {
              Act( AT_PLAIN, "$p is too heavy for you to carry with your current inventory.", auction->Buyer, auction->Item, NULL, TO_CHAR );
              Act( AT_PLAIN, "$n is carrying too much to also carry $p, and $e drops it.", auction->Buyer, auction->Item, NULL, TO_ROOM );
              ObjectToRoom( auction->Item, auction->Buyer->InRoom );
            }
          else
	    {
	      ObjectToCharacter( auction->Item, auction->Buyer );
	    }

          pay = (int)auction->Bet * 0.9;
          tax = (int)auction->Bet * 0.1;
          BoostEconomy( auction->Seller->InRoom->Area, tax );
          auction->Seller->Gold += pay; /* give him the money, tax 10 % */
          sprintf(buf, "The auctioneer pays you %d gold, charging an auction fee of %d.\r\n",
		  pay, tax);
          SendToCharacter(buf, auction->Seller);
          auction->Item = NULL; /* reset item */

          if ( IsBitSet( SysData.SaveFlags, SV_AUCTION ) )
            {
              SaveCharacter( auction->Buyer );
              SaveCharacter( auction->Seller );
            }
        }
      else /* not sold */
        {
          sprintf (buf, "No bids received for %s - object has been removed from auction\r\n.",
		   auction->Item->ShortDescr);
          TalkAuction(buf);
          Act(AT_ACTION, "The auctioneer appears before you to return $p to you.",
               auction->Seller,auction->Item,NULL,TO_CHAR);
          Act(AT_ACTION, "The auctioneer appears before $n to return $p to $m.",
               auction->Seller,auction->Item,NULL,TO_ROOM);

          if ( (auction->Seller->CarryWeight
                + GetObjectWeight( auction->Item ))
               > GetCarryCapacityWeight( auction->Seller ) )
            {
              Act( AT_PLAIN, "You drop $p as it is just too much to carry"
                   " with everything else you're carrying.", auction->Seller,
                   auction->Item, NULL, TO_CHAR );
              Act( AT_PLAIN, "$n drops $p as it is too much extra weight"
                   " for $m with everything else.", auction->Seller,
                   auction->Item, NULL, TO_ROOM );
              ObjectToRoom( auction->Item, auction->Seller->InRoom );
            }
          else
	    {
	      ObjectToCharacter (auction->Item,auction->Seller);
	    }

          tax = (int)auction->Item->Cost * 0.05;
          BoostEconomy( auction->Seller->InRoom->Area, tax );
          sprintf(buf, "The auctioneer charges you an auction fee of %d.\r\n", tax );
          SendToCharacter(buf, auction->Seller);

          if ((auction->Seller->Gold - tax) < 0)
	    {
	      auction->Seller->Gold = 0;
	    }
          else
	    {
	      auction->Seller->Gold -= tax;
	    }

          if ( IsBitSet( SysData.SaveFlags, SV_AUCTION ) )
	    {
	      SaveCharacter( auction->Seller );
	    }
        }

      auction->Item = NULL;
    }
}
