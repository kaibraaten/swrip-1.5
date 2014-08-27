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
#include "ships.h"
#include "shuttle.h"
#include "character.h"
#include "track.h"
#include "missile.h"

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

  if ( IsImmortal(ch) || ch->race == RACE_GOD )
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

  switch( ch->ability.main )
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

  level += RaceTable[ch->race].AbilityMod[COMBAT_ABILITY];
  level += ch->stats.perm_con + ch->stats.perm_dex + ch->stats.perm_str;

  return urange( 1, level, 150 );
}

static int GetMaxPilotingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == PILOTING_ABILITY )
    level = 100;

  if ( ch->ability.main == ENGINEERING_ABILITY )
    level = 25;

  if ( ch->ability.main == HUNTING_ABILITY )
    level = 25;

  if ( ch->ability.main == SMUGGLING_ABILITY )
    level = 50;

  if ( ch->ability.main == FORCE_ABILITY )
    level = 25;

  if ( ch->ability.main == COMMANDO_ABILITY )
    level = 25;

  level += RaceTable[ch->race].AbilityMod[PILOTING_ABILITY];
  level += ch->stats.perm_dex * 2;

  return urange( 1, level, 150 );
}

static int GetMaxEngineeringLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == ENGINEERING_ABILITY )
    level = 100;

  if ( ch->ability.main == PILOTING_ABILITY )
    level = 20;

  level += RaceTable[ch->race].AbilityMod[ENGINEERING_ABILITY];
  level += ch->stats.perm_int * 2;

  return urange( 1, level, 150 );
}

static int GetMaxBountyHuntingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == HUNTING_ABILITY )
    level = 100;

  level += RaceTable[ch->race].AbilityMod[HUNTING_ABILITY];

  return urange( 1, level, 150 );
}

static int GetMaxSmugglingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == SMUGGLING_ABILITY )
    level = 100;

  if ( ch->ability.main == PILOTING_ABILITY )
    level = 20;

  if ( ch->ability.main == ENGINEERING_ABILITY )
    level = 25;

  if ( ch->ability.main == COMMANDO_ABILITY )
    level = 50;

  level += RaceTable[ch->race].AbilityMod[SMUGGLING_ABILITY];
  level += ch->stats.perm_lck * 2;

  return urange( 1, level, 150 );
}

static int GetMaxLeadershipLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == LEADERSHIP_ABILITY )
    level = 100;

  if ( ch->ability.main == COMBAT_ABILITY )
    level = 50;

  if ( ch->ability.main == DIPLOMACY_ABILITY )
    level = 50;

  level += RaceTable[ch->race].AbilityMod[LEADERSHIP_ABILITY];
  level += ch->stats.perm_wis + ch->stats.perm_cha + ch->stats.perm_int;

  return urange( 1, level, 150 );
}

static int GetMaxDiplomacyLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == DIPLOMACY_ABILITY )
    level = 100;

  if ( ch->ability.main == PILOTING_ABILITY )
    level = 10;

  if ( ch->ability.main == LEADERSHIP_ABILITY )
    level = 50;

  level += RaceTable[ch->race].AbilityMod[DIPLOMACY_ABILITY];
  level += ch->stats.perm_cha * 3;

  return urange( 1, level, 150 );
}

static int GetMaxForceLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == FORCE_ABILITY )
    {
      level = 20;
    }

  level += ch->stats.perm_frc * 5;

  return level;
}

void AdvanceLevel( Character *ch, int ability )
{
  if ( ch->top_level < GetAbilityLevel( ch, ability ) && ch->top_level < 100 )
    {
      ch->top_level = urange( 1, GetAbilityLevel( ch, ability ), 100 );
    }

  if( IsJedi( ch ) && ability == FORCE_ABILITY )
    {
      ch->max_mana += 20;
    }

  if ( !IsNpc(ch) )
    {
      RemoveBit( ch->act, PLR_BOUGHT_PET );
    }
}

void GainXP( Character *ch, short ability, long gain )
{
  if ( IsNpc(ch) )
    {
      return;
    }

  SetAbilityXP( ch, ability, umax( 0, GetAbilityXP( ch, ability ) + gain ) );

  if (!IsAuthed(ch) && GetAbilityXP( ch, ability ) >= GetRequiredXpForLevel(GetAbilityLevel(ch, ability ) + 1))
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
		 ability_name[ability], GetAbilityLevel( ch, ability ) );
      AdvanceLevel( ch , ability);
    }
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
      gain = ch->top_level;
    }
  else
    {
      gain = umin( 5, ch->top_level );

      switch ( ch->position )
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
        }

      if ( ch->pcdata->condition[COND_FULL] == 0 )
	{
	  gain /= 2;
	}

      if ( ch->pcdata->condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy(ch, AFF_POISON) )
    {
      gain /= 4;
    }

  if ( ch->race == RACE_TRANDOSHAN )
    {
      gain *= 2 ;
    }

  return umin(gain, ch->max_hit - ch->hit);
}

static int GainMana( const Character *ch )
{
  int gain = 0;

  if ( IsNpc(ch) )
    {
      gain = ch->top_level;
    }
  else
    {
      if ( !IsJedi( ch ) )
	{
	  return (0 - ch->mana);
	}

      gain = umin( 5, GetAbilityLevel( ch, FORCE_ABILITY ) / 2 );

      if ( ch->position < POS_SLEEPING )
	{
	  return 0;
	}

      switch ( ch->position )
        {
        case POS_SLEEPING:
	  gain += GetCurrentIntelligence(ch) * 3;
	  break;

        case POS_RESTING:
	  gain += GetCurrentIntelligence(ch) * 1.5;
	  break;
        }

      if ( ch->pcdata->condition[COND_FULL]   == 0 )
	{
	  gain /= 2;
	}

      if ( ch->pcdata->condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy( ch, AFF_POISON ) )
    {
      gain /= 4;
    }

  return umin(gain, ch->max_mana - ch->mana);
}

static int GainMove( const Character *ch )
{
  int gain = 0;

  if ( IsNpc(ch) )
    {
      gain = ch->top_level;
    }
  else
    {
      gain = umax( 15, 2 * ch->top_level );

      switch ( ch->position )
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
        }

      if ( ch->pcdata->condition[COND_FULL] == 0 )
	{
	  gain /= 2;
	}

      if ( ch->pcdata->condition[COND_THIRST] == 0 )
	{
	  gain /= 2;
	}
    }

  if ( IsAffectedBy(ch, AFF_POISON) )
    {
      gain /= 4;
    }

  return umin(gain, ch->max_move - ch->move);
}

static void GainAddiction( Character *ch )
{
  short drug = 0;

  for ( drug=0 ; drug <= 9 ; drug ++ )
    {
      if ( ch->pcdata->addiction[drug] < ch->pcdata->drug_level[drug] )
	{
	  ch->pcdata->addiction[drug]++;
	}

      if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+150 )
        {
	  Affect af;

          switch (ch->pcdata->addiction[drug])
            {
            default:
            case SPICE_GLITTERSTIM:
              if ( !IsAffectedBy( ch, AFF_BLIND ) )
                {
                  af.type      = gsn_blindness;
                  af.location  = APPLY_AC;
                  af.modifier  = 10;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_BLIND;
                  AffectToCharacter( ch, &af );
                }

            case SPICE_CARSANUM:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_DAMROLL;
                  af.modifier  = -10;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }

            case SPICE_RYLL:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_DEX;
                  af.modifier  = -5;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }

            case SPICE_ANDRIS:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_CON;
                  af.modifier  = -5;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  AffectToCharacter( ch, &af );
                }
            }
        }

      if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+200 )
        {
          Echo ( ch, "You feel like you are going to die. You NEED %s\r\n.",
		      GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 2 );
          InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+100 )
        {
          Echo ( ch, "You need some %s.\r\n", GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 2 );
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+50 )
        {
          Echo ( ch, "You really crave some %s.\r\n", GetSpiceTypeName(drug) );
          WorsenMentalState( ch, 1 );
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+25 )
        {
          Echo ( ch, "Some more %s would feel quite nice.\r\n", GetSpiceTypeName(drug) );
        }
      else if ( ch->pcdata->addiction[drug] < ch->pcdata->drug_level[drug]-50 )
        {
          Act( AT_POISON, "$n bends over and vomits.\r\n", ch, NULL, NULL, TO_ROOM );
          Act( AT_POISON, "You vomit.\r\n", ch, NULL, NULL, TO_CHAR );
          ch->pcdata->drug_level[drug] -= 10;
        }

      if ( ch->pcdata->drug_level[drug] > 1 )
	{
	  ch->pcdata->drug_level[drug] -=2;
	}
      else if ( ch->pcdata->drug_level[drug] > 0 )
	{
	  ch->pcdata->drug_level[drug] -=1;
	}
      else if ( ch->pcdata->addiction[drug] > 0 && ch->pcdata->drug_level[drug] <= 0 )
	{
	  ch->pcdata->addiction[drug]--;
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
      && sysdata.disable_hunger )
    {
      return;
    }

  condition                    = ch->pcdata->condition[iCond];
  ch->pcdata->condition[iCond] = urange( 0, condition + value, 48 );

  if ( ch->pcdata->condition[iCond] == 0 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are STARVING!\r\n",  ch );
              WorsenMentalState( ch, 1 );
              retcode = InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
            }
          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
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

  if ( ch->pcdata->condition[iCond] == 1 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->top_level <= LEVEL_AVATAR )
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
          if ( ch->top_level <= LEVEL_AVATAR  )
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


  if ( ch->pcdata->condition[iCond] == 2 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are hungry.\r\n",  ch );
            }

          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_THIRSTY, ch );
              SendToCharacter( "You are thirsty.\r\n", ch );
            }

          break;
        }
    }

  if ( ch->pcdata->condition[iCond] == 3 )
    {
      switch ( iCond )
        {
        case COND_FULL:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              SetCharacterColor( AT_HUNGRY, ch );
              SendToCharacter( "You are a mite peckish.\r\n",  ch );
            }
          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
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
  for ( ch = last_char; ch; ch = gch_prev )
    {
      SetCurrentGlobalCharacter( ch );

      if ( ch == first_char && ch->prev )
        {
          Bug( "%s: first_char->prev != NULL... fixed", __FUNCTION__ );
          ch->prev = NULL;
        }

      gch_prev = ch->prev;

      if ( gch_prev && gch_prev->next != ch )
        {
          Bug( "FATAL: %s: %s->prev->next doesn't point to ch.",
	       __FUNCTION__, ch->name );
          Bug( "Short-cutting here" );
          gch_prev = NULL;
          ch->prev = NULL;
          do_shout( ch, "Thoric says, 'Prepare for the worst!'" );
        }

      if ( !IsNpc(ch) )
        {
          PerformRandomDrunkBehavior(ch);
          SufferHalucinations(ch);
          continue;
        }

      if ( !ch->in_room
           || IsAffectedBy(ch, AFF_CHARM)
           || IsAffectedBy(ch, AFF_PARALYSIS) )
	{
	  continue;
	}

      /* Clean up 'animated corpses' that are not charmed' - Scryn */

      if ( ch->Prototype->vnum == 5 && !IsAffectedBy(ch, AFF_CHARM) )
        {
          if(ch->in_room->first_person)
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

      if ( !IsBitSet( ch->act, ACT_RUNNING )
           && !IsBitSet( ch->act, ACT_SENTINEL )
           && !ch->fighting && ch->hhf.hunting )
        {
          if (  ch->top_level < 20 )
	    {
	      SetWaitState( ch, 6 * PULSE_PER_SECOND );
	    }
          else if (  ch->top_level < 40 )
	    {
	      SetWaitState( ch, 5 * PULSE_PER_SECOND );
	    }
          else if (  ch->top_level < 60 )
	    {
	      SetWaitState( ch, 4 * PULSE_PER_SECOND );
	    }
          else if (  ch->top_level < 80 )
	    {
	      SetWaitState( ch, 3 * PULSE_PER_SECOND );
	    }
          else if (  ch->top_level < 100 )
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
      else if ( !ch->fighting && !ch->hhf.hunting
                && !IsBitSet( ch->act, ACT_RUNNING)
                && ch->was_sentinel && ch->position >= POS_STANDING )
        {
          Act( AT_ACTION, "$n leaves.", ch, NULL, NULL, TO_ROOM );
          CharacterFromRoom( ch );
          CharacterToRoom( ch , ch->was_sentinel );
          Act( AT_ACTION, "$n arrives.", ch, NULL, NULL, TO_ROOM );
          SetBit( ch->act , ACT_SENTINEL );
          ch->was_sentinel = NULL;
        }

      /* Examine call for special procedure */
      if ( !IsBitSet( ch->act, ACT_RUNNING )
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

      if ( !IsBitSet( ch->act, ACT_RUNNING )
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
      if ( ch->position != POS_STANDING )
	{
	  continue;
	}

      if ( IsBitSet(ch->act, ACT_MOUNTED ) )
        {
          if ( IsBitSet(ch->act, ACT_AGGRESSIVE) )
	    {
	      do_emote( ch, "snarls and growls." );
	    }

          continue;
        }

      if ( IsBitSet(ch->in_room->room_flags, ROOM_SAFE )
           && IsBitSet(ch->act, ACT_AGGRESSIVE) )
	{
	  do_emote( ch, "glares around and snarls." );
	}

      /* MOBprogram random trigger */
      if ( ch->in_room->area->nplayer > 0 )
        {
          MobProgRandomTrigger( ch );

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }

          if ( ch->position < POS_STANDING )
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

      if ( ch->position < POS_STANDING )
	{
	  continue;
	}

      /* Scavenge */
      if ( IsBitSet(ch->act, ACT_SCAVENGER)
           && ch->in_room->first_content
           && NumberBits( 2 ) == 0 )
        {
          Object *obj = NULL;
          Object *obj_best = NULL;
          int max = 1;

          for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
            {
              if ( CAN_WEAR(obj, ITEM_TAKE) && obj->cost > max
                   && !IS_OBJ_STAT( obj, ITEM_BURRIED ) )
                {
                  obj_best = obj;
                  max      = obj->cost;
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
      if ( !IsBitSet(ch->act, ACT_RUNNING)
           && !IsBitSet(ch->act, ACT_SENTINEL)
           && !IsBitSet(ch->act, ACT_PROTOTYPE)
           && ( door = NumberBits( 5 ) ) <= 9
           && ( pexit = GetExit(ch->in_room, door) ) != NULL
           && pexit->to_room
           && !IsBitSet(pexit->exit_info, EX_CLOSED)
           && !IsBitSet(pexit->to_room->room_flags, ROOM_NO_MOB)
           && ( !IsBitSet(ch->act, ACT_STAY_AREA)
                ||   pexit->to_room->area == ch->in_room->area ) )
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

          if ( retcode != rNONE || IsBitSet(ch->act, ACT_SENTINEL)
               || ch->position < POS_STANDING )
	    {
	      continue;
	    }
        }

      /* Flee */
      if ( ch->hit < ch->max_hit / 2
           && ( door = NumberBits( 4 ) ) <= 9
           && ( pexit = GetExit(ch->in_room,door) ) != NULL
           && pexit->to_room
           && !IsBitSet(pexit->exit_info, EX_CLOSED)
           && !IsBitSet(pexit->to_room->room_flags, ROOM_NO_MOB) )
        {
          Character *rch = NULL;
          bool found = false;

          for ( rch = ch->in_room->first_person;
                rch;
                rch = rch->next_in_room )
            {
              if ( IsFearing(ch, rch) )
                {
                  switch( NumberBits(2) )
                    {
                    case 0:
                      sprintf( buf, "Get away from me, %s!", rch->name );
                      break;

                    case 1:
                      sprintf( buf, "Leave me be, %s!", rch->name );
                      break;

                    case 2:
                      sprintf( buf, "%s is trying to kill me!  Help!", rch->name );
                      break;

                    case 3:
                      sprintf( buf, "Someone save me from %s!", rch->name );
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

  for ( planet = first_planet; planet; planet = planet->next )
    {
      Clan *clan = planet->governed_by;

      if ( clan )
        {
          int sCount = 0;
          Clan * subclan = NULL;

          if ( clan->first_subclan )
            {
              for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
		{
		  sCount++;
		}

              for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
                {
                  subclan->funds += GetTaxes(planet) / 1440 / sCount;
                  SaveClan(subclan);
                }

              clan->funds += GetTaxes(planet) / 1440;
              SaveClan (clan);
            }
          else
            {
              clan->funds += GetTaxes(planet) / 720;
              SaveClan( clan );
            }

          SavePlanet( planet );
        }
    }

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d && d->character && d->character->pcdata && d->connection_state == CON_PLAYING ) /* Interest */
	{
	  d->character->pcdata->bank *= 1.0071428571428571;
	}

      if ( ( d->connection_state == CON_PLAYING )
           && ( d->character->pcdata->salary > 0 )
           && ( d->character->pcdata->clan )
           && ( d->character->pcdata->clan->funds >= d->character->pcdata->salary ) )
        {
          d->character->pcdata->bank += d->character->pcdata->salary;
          d->character->pcdata->clan->funds -= d->character->pcdata->salary;
        }
    }
}

/*
 * Update the weather.
 */
static void WeatherUpdate( void )
{
  char buf[MAX_STRING_LENGTH];
  Descriptor *d = NULL;
  int diff = 0;
  short AT_TEMP = AT_PLAIN;

  buf[0] = '\0';

  switch ( ++time_info.hour )
    {
    case 5:
      weather_info.sunlight = SUN_LIGHT;
      strcat( buf, "The day has begun." );
      AT_TEMP = AT_YELLOW;
      break;

    case 6:
      weather_info.sunlight = SUN_RISE;
      strcat( buf, "The sun rises in the east." );
      AT_TEMP = AT_ORANGE;
      break;

    case 12:
      weather_info.sunlight = SUN_LIGHT;
      strcat( buf, "It's noon." );
      AT_TEMP = AT_YELLOW;
      break;

    case 19:
      weather_info.sunlight = SUN_SET;
      strcat( buf, "The sun slowly disappears in the west." );
      AT_TEMP = AT_BLOOD;
      break;

    case 20:
      weather_info.sunlight = SUN_DARK;
      strcat( buf, "The night has begun." );
      AT_TEMP = AT_DGREY;
      break;

    case 24:
      time_info.hour = 0;
      time_info.day++;
      break;
    }

  if ( time_info.day >= 30 )
    {
      time_info.day = 0;
      time_info.month++;
    }

  if ( time_info.month >= 17 )
    {
      time_info.month = 0;
      time_info.year++;
    }

  if ( buf[0] != '\0' )
    {
      for ( d = first_descriptor; d; d = d->next )
        {
          if ( d->connection_state == CON_PLAYING
               && IS_OUTSIDE(d->character)
               && IsAwake(d->character)
               && d->character->in_room
               && d->character->in_room->sector_type != SECT_UNDERWATER
               && d->character->in_room->sector_type != SECT_OCEANFLOOR
               && d->character->in_room->sector_type != SECT_UNDERGROUND )
	    {
	      Act( AT_TEMP, buf, d->character, 0, 0, TO_CHAR );
	    }
        }

      buf[0] = '\0';
    }

  /*
   * Weather change.
   */
  if ( time_info.month >= 9 && time_info.month <= 16 )
    {
      diff = weather_info.mmhg >  985 ? -2 : 2;
    }
  else
    {
      diff = weather_info.mmhg > 1015 ? -2 : 2;
    }

  weather_info.change += diff * RollDice(1, 4) + RollDice(2, 6) - RollDice(2, 6);
  weather_info.change  = umax(weather_info.change, -12);
  weather_info.change  = umin(weather_info.change,  12);

  weather_info.mmhg += weather_info.change;
  weather_info.mmhg  = umax(weather_info.mmhg,  960);
  weather_info.mmhg  = umin(weather_info.mmhg, 1040);

  AT_TEMP = AT_GREY;

  switch ( weather_info.sky )
    {
    default:
      Bug( "%s: bad sky %d.", __FUNCTION__, weather_info.sky );
      weather_info.sky = SKY_CLOUDLESS;
      break;

    case SKY_CLOUDLESS:
      if ( weather_info.mmhg <  990
           || ( weather_info.mmhg < 1010 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The sky is getting cloudy." );
          weather_info.sky = SKY_CLOUDY;
          AT_TEMP = AT_GREY;
        }
      break;

    case SKY_CLOUDY:
      if ( weather_info.mmhg <  970
           || ( weather_info.mmhg <  990 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "It starts to rain." );
          weather_info.sky = SKY_RAINING;
          AT_TEMP = AT_BLUE;
        }

      if ( weather_info.mmhg > 1030 && NumberBits( 2 ) == 0 )
        {
          strcat( buf, "The clouds disappear." );
          weather_info.sky = SKY_CLOUDLESS;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_RAINING:
      if ( weather_info.mmhg <  970 && NumberBits( 2 ) == 0 )
        {
          strcat( buf, "Lightning flashes in the sky." );
          weather_info.sky = SKY_LIGHTNING;
          AT_TEMP = AT_YELLOW;
        }

      if ( weather_info.mmhg > 1030
           || ( weather_info.mmhg > 1010 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The rain stopped." );
          weather_info.sky = SKY_CLOUDY;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_LIGHTNING:
      if ( weather_info.mmhg > 1010
           || ( weather_info.mmhg >  990 && NumberBits( 2 ) == 0 ) )
        {
          strcat( buf, "The lightning has stopped." );
          weather_info.sky = SKY_RAINING;
          AT_TEMP = AT_GREY;
          break;
        }
      break;
    }

  if ( buf[0] != '\0' )
    {
      for ( d = first_descriptor; d; d = d->next )
        {
          if ( d->connection_state == CON_PLAYING
               &&   IS_OUTSIDE(d->character)
               &&   IsAwake(d->character) )
	    {
	      Act( AT_TEMP, buf, d->character, 0, 0, TO_CHAR );
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

  for ( ch = last_char; ch; ch = gch_prev )
    {
      Character *ch_save = NULL;
      short save_count = 0;

      if ( ch == first_char && ch->prev )
        {
          Bug( "%s: first_char->prev != NULL... fixed", __FUNCTION__ );
          ch->prev = NULL;
        }

      gch_prev = ch->prev;
      SetCurrentGlobalCharacter( ch );

      if ( gch_prev && gch_prev->next != ch )
        {
          Bug( "%s: ch->prev->next != ch", __FUNCTION__ );
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
           && current_time - ch->pcdata->save_time > (sysdata.save_frequency*60) )
	{
	  ch_save = ch;
	}
      else
	{
	  ch_save = NULL;
	}

      if ( ch->alignment < -1000 )
        ch->alignment = -1000;

      if ( ch->alignment > 1000 )
        ch->alignment = 1000;

      if ( ch->position >= POS_STUNNED )
        {
          if ( ch->hit  < ch->max_hit )
            ch->hit  += GainHitPoints(ch);

          if ( ch->mana < ch->max_mana && IsJedi( ch ) )
            ch->mana += GainMana(ch);

          if ( ch->move < ch->max_move )
            ch->move += GainMove(ch);
        }

      if ( ch->position == POS_STUNNED )
        UpdatePosition( ch );

      if ( ch->pcdata )
        GainAddiction( ch );


      if ( !IsNpc(ch) && ch->top_level < LEVEL_IMMORTAL )
        {
          Object *obj = NULL;

          if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_LIGHT ) ) != NULL
               && obj->item_type == ITEM_LIGHT
               && obj->value[OVAL_LIGHT_POWER] > 0 )
            {
              if ( --obj->value[OVAL_LIGHT_POWER] == 0 && ch->in_room )
                {
                  ch->in_room->light -= obj->count;
                  Act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_CHAR );

                  if ( obj->serial == cur_obj )
		    {
		      global_objcode = rOBJ_EXPIRED;
		    }

                  ExtractObject( obj );
                }
            }

          if ( ch->pcdata->condition[COND_DRUNK] > 8 )
	    {
	      WorsenMentalState( ch, ch->pcdata->condition[COND_DRUNK]/8 );
	    }

          if ( ch->pcdata->condition[COND_FULL] > 1 )
            {
              switch( ch->position )
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
                }
            }

          if ( ch->pcdata->condition[COND_THIRST] > 1 )
            {
              switch( ch->position )
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
                }
            }

          GainCondition( ch, COND_DRUNK,  -1 );
          GainCondition( ch, COND_FULL,   -1 );

          if ( ch->in_room )
	    {
	      switch( ch->in_room->sector_type )
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
              ch->mental_state = urange( 20, ch->mental_state
                                         + 4 , 100 );
              InflictDamage( ch, ch, 6, gsn_poison );
            }
          else if ( ch->position == POS_INCAP )
	    {
	      InflictDamage( ch, ch, 1, TYPE_UNDEFINED );
	    }
	  else if ( ch->position == POS_MORTAL )
	    {
	      InflictDamage( ch, ch, 4, TYPE_UNDEFINED );
	    }

          if ( CharacterDiedRecently(ch) )
	    {
	      continue;
	    }

          if ( ch->mental_state >= 30 )
	    {
	      switch( (ch->mental_state+5) / 10 )
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

          if ( ch->mental_state <= -30 )
            switch( (abs(ch->mental_state)+5) / 10 )
              {
              case 10:
                if ( ch->position > POS_SLEEPING )
                  {
                    if ( (ch->position == POS_STANDING
                          || ch->position < POS_FIGHTING)
                         && GetRandomPercent()+10 < abs(ch->mental_state) )
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
                if ( ch->position > POS_SLEEPING )
                  {
                    if ( (ch->position == POS_STANDING
                          || ch->position < POS_FIGHTING)
                         && (GetRandomPercent()+20) < abs(ch->mental_state) )
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
                if ( ch->position > POS_SLEEPING )
                  {
                    if ( ch->position < POS_SITTING
                         &&  (GetRandomPercent()+30) < abs(ch->mental_state) )
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
                if ( ch->position > POS_RESTING )
		  {
		    SendToCharacter( "You feel very unmotivated.\r\n", ch );
		  }
                break;

              case 6:
                if ( ch->position > POS_RESTING )
		  {
		    SendToCharacter( "You feel sedated.\r\n", ch );
		  }
		break;

              case 5:
                if ( ch->position > POS_RESTING )
		  {
		    SendToCharacter( "You feel sleepy.\r\n", ch );
		  }
                break;

              case 4:
                if ( ch->position > POS_RESTING )
		  {
		    SendToCharacter( "You feel tired.\r\n", ch );
		  }
                break;

              case 3:
                if ( ch->position > POS_RESTING )
		  {
		    SendToCharacter( "You could use a rest.\r\n", ch );
		  }
                break;
              }

          if ( ch->backup_wait > 0 )
            {
              --ch->backup_wait;

              if ( ch->backup_wait == 0 )
		{
		  AddReinforcements( ch );
		}
            }

          if ( !IsNpc (ch) )
            {
              if ( ++ch->timer > 15 && !ch->desc )
                {
                  if ( ch->in_room )
		    {
		      CharacterFromRoom( ch );
		    }

                  CharacterToRoom( ch, GetRoom( ROOM_PLUOGUS_QUIT ) );
                  ch->position = POS_RESTING;
                  ch->hit = umax ( 1 , ch->hit );
                  SaveCharacter( ch );
                  do_quit( ch, "" );
                }
              else if ( ch == ch_save && IsBitSet( sysdata.save_flags, SV_AUTO )
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

  for ( obj = last_object; obj; obj = gobj_prev )
    {
      Character *rch = NULL;
      const char *message = NULL;

      if ( obj == first_object && obj->prev )
        {
          Bug( "%s: first_object->prev != NULL... fixed", __FUNCTION__ );
          obj->prev = NULL;
        }

      gobj_prev = obj->prev;

      if ( gobj_prev && gobj_prev->next != obj )
        {
          Bug( "%s: obj->prev->next != obj", __FUNCTION__ );
          return;
        }

      SetCurrentGlobalObject( obj );

      if ( obj->carried_by )
	{
	  ObjProgRandomTrigger( obj );
	}
      else if( obj->in_room && obj->in_room->area->nplayer > 0 )
	{
	  ObjProgRandomTrigger( obj );
	}

      if( IsObjectExtracted(obj) )
	{
	  continue;
	}

      if ( obj->item_type == ITEM_WEAPON && obj->carried_by
	   && ( obj->wear_loc == WEAR_WIELD || obj->wear_loc == WEAR_DUAL_WIELD )
	   && obj->value[OVAL_WEAPON_TYPE] != WEAPON_BLASTER
	   && obj->value[OVAL_WEAPON_CHARGE] > 0
	   && obj->value[OVAL_WEAPON_TYPE] != WEAPON_BOWCASTER
	   && obj->value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE)
        {
          obj->value[OVAL_WEAPON_CHARGE]--;

          if ( obj->value[OVAL_WEAPON_CHARGE] <= 0 )
            {
              if ( obj->value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER )
                {
                  Act( AT_PLAIN, "$p fizzles and dies." , obj->carried_by, obj, NULL, TO_CHAR );
                  Act( AT_PLAIN, "$n's lightsaber fizzles and dies." , obj->carried_by, NULL, NULL, TO_ROOM );
                }
              else if ( obj->value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE )
                {
                  Act( AT_PLAIN, "$p stops vibrating." , obj->carried_by, obj, NULL, TO_CHAR );
                }
            }
        }

      if ( obj->item_type == ITEM_PIPE )
        {
          if ( IsBitSet( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
            {
              if ( --obj->value[OVAL_PIPE_TOBACCO_AMOUNT] <= 0 )
                {
                  obj->value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
                  RemoveBit( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT );
                }
              else if ( IsBitSet( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT ) )
		{
		  RemoveBit( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT );
		}
	      else
		{
		  if ( IsBitSet( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT ) )
		    {
		      RemoveBit( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT );
		      RemoveBit( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		  else
		    {
		      SetBit( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		}

              if ( !IsBitSet( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
		{
		  SetBit( obj->value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH );
		}
            }
          else
	    {
	      RemoveBit( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT );
	    }
        }

      /* Corpse decay (npc corpses decay at 8 times the rate of pc corpses) - Narn */
      if ( obj->item_type == ITEM_CORPSE_PC || obj->item_type == ITEM_CORPSE_NPC
           || obj->item_type == ITEM_DROID_CORPSE )
        {
          short timerfrac = umax(1, obj->timer - 1);

          if ( obj->item_type == ITEM_CORPSE_PC )
	    {
	      timerfrac = (int)(obj->timer / 8 + 1);
	    }

          if ( obj->timer > 0 && obj->value[OVAL_CORPSE_DECAY] > timerfrac )
            {
              char buf[MAX_STRING_LENGTH];
              char name[MAX_STRING_LENGTH];
              char *bufptr = NULL;

              bufptr = OneArgument( obj->short_descr, name );
              bufptr = OneArgument( bufptr, name );
              bufptr = OneArgument( bufptr, name );

              SeparateOneObjectFromGroup(obj);
              obj->value[OVAL_CORPSE_DECAY] = timerfrac;

              if ( obj->item_type == ITEM_DROID_CORPSE )
		{
		  sprintf( buf, d_corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   bufptr );
		}
              else
		{
		  sprintf( buf, corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   Capitalize( bufptr ) );
		}

              FreeMemory( obj->description );
              obj->description = CopyString( buf );
            }
        }

      /* don't let inventory decay */
      if ( IS_OBJ_STAT(obj, ITEM_INVENTORY) )
	{
	  continue;
	}

      if ( obj->item_type == ITEM_GRENADE && obj->carried_by)
        {
          wield = GetEquipmentOnCharacter( obj->carried_by, WEAR_HOLD );

          if( wield == obj )
	    {
	      continue;
	    }
        }

      if ( obj->timer > 0 && obj->timer < 5 && obj->item_type == ITEM_ARMOR )
        {
          if ( obj->carried_by )
            {
              Act( AT_TEMP, "$p is almost dead." , obj->carried_by, obj, NULL, TO_CHAR );
            }
        }

      if ( ( obj->timer <= 0 || --obj->timer > 0 ) )
        {
          if (obj->in_room
              && obj->in_room->sector_type == SECT_AIR
              && (obj->wear_flags & ITEM_TAKE) )
            {
              Room *new_room = NULL;
              Exit *xit = NULL;

              for (xit = obj->in_room->first_exit; xit; xit = xit->next )
		{
		  if ( xit->vdir == DIR_DOWN )
		    {
		      break;
		    }
		}

              if ( !xit )
		{
		  continue;
		}

              new_room = xit->to_room;

              if (( rch = obj->in_room->first_person ) != NULL )
                {
                  Act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_CHAR );
                }

              ObjectFromRoom(obj);
              ObjectToRoom(obj, new_room);

              if (( rch = obj->in_room->first_person) != NULL )
                {
                  Act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_ROOM );
                  Act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_CHAR );
                }
            }

          continue;
        }

      /* if we get this far, object's timer has expired. */

      AT_TEMP = AT_PLAIN;

      switch ( obj->item_type )
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
          obj->item_type = ITEM_TRASH;          /* so ExtractObject        */
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
          if (obj->in_room)
            --obj->in_room->light;
          message = "$p burns out.";
          AT_TEMP = AT_FIRE;
        }

      if ( obj->carried_by )
        {
          Act( AT_TEMP, message, obj->carried_by, obj, NULL, TO_CHAR );
        }
      else if ( obj->in_room
                && ( rch = obj->in_room->first_person ) != NULL
                && !IS_OBJ_STAT( obj, ITEM_BURRIED ) )
        {
          Act( AT_TEMP, message, rch, obj, NULL, TO_ROOM );
          Act( AT_TEMP, message, rch, obj, NULL, TO_CHAR );
        }

      if ( obj->serial == cur_obj )
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

  for ( ch = first_char; ch; ch = ch_next )
    {
      Exit *pexit = NULL;
      DirectionType door = DIR_INVALID;
      int retcode = rNONE;

      SetCurrentGlobalCharacter(ch);
      ch_next = ch->next;
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
          if ( IsBitSet(ch->act, ACT_RUNNING) )
            {
              if ( !IsBitSet( ch->act, ACT_SENTINEL )
                   && !ch->fighting && ch->hhf.hunting )
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

              if ( !IsBitSet(ch->act, ACT_SENTINEL)
                   && !IsBitSet(ch->act, ACT_PROTOTYPE)
                   && ( door = NumberBits( 4 ) ) <= 9
                   && ( pexit = GetExit(ch->in_room, door) ) != NULL
                   && pexit->to_room
                   && !IsBitSet(pexit->exit_info, EX_CLOSED)
                   && !IsBitSet(pexit->to_room->room_flags, ROOM_NO_MOB)
                   && ( !IsBitSet(ch->act, ACT_STAY_AREA)
                        || pexit->to_room->area == ch->in_room->area ) )
                {
                  retcode = MoveCharacter( ch, pexit, 0 );

                  if ( CharacterDiedRecently(ch) )
		    {
		      continue;
		    }

                  if ( retcode != rNONE || IsBitSet(ch->act, ACT_SENTINEL)
                       || ch->position < POS_STANDING )
		    {
		      continue;
		    }
                }
            }

          continue;
        }
      else
        {
          if ( ch->mount
               && ch->in_room != ch->mount->in_room )
            {
              RemoveBit( ch->mount->act, ACT_MOUNTED );
              ch->mount = NULL;
              ch->position = POS_STANDING;
              SendToCharacter( "No longer upon your mount, you fall to the ground...\r\nOUCH!\r\n", ch );
            }

          if ( ( ch->in_room && ch->in_room->sector_type == SECT_UNDERWATER )
               || ( ch->in_room && ch->in_room->sector_type == SECT_OCEANFLOOR ) )
            {
              if ( !IsAffectedBy( ch, AFF_AQUA_BREATH ) )
                {
                  if ( GetTrustLevel(ch) < LEVEL_IMMORTAL )
                    {
		      int dam = GetRandomNumberFromRange( ch->max_hit / 50 , ch->max_hit / 30 );
                      dam = umax( 1, dam );

                      if(  ch->hit <= 0 )
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

          if ( ch->in_room
               && (( ch->in_room->sector_type == SECT_WATER_NOSWIM )
                   || ( ch->in_room->sector_type == SECT_WATER_SWIM ) ) )
            {
              if ( !IsAffectedBy( ch, AFF_FLYING )
                   && !IsAffectedBy( ch, AFF_FLOATING )
                   && !IsAffectedBy( ch, AFF_AQUA_BREATH )
                   && !ch->mount )
                {
                  if ( !IsImmortal( ch ) )
                    {
                      int dam;

                      if ( ch->move > 0 )
			{
			  ch->move--;
			}
                      else
                        {
                          dam = GetRandomNumberFromRange( ch->max_hit / 50, ch->max_hit / 30 );
                          dam = umax( 1, dam );

                          if( ch->hit <= 0 )
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

              wch->mprog.mpact = tmp_act->next;
              FreeMemory(tmp_act->buf);
              FreeMemory(tmp_act);
            }

          wch->mprog.mpactnum = 0;
          wch->mprog.mpact    = NULL;
        }

      mob_act_list = apdtmp->next;
      FreeMemory( apdtmp );
    }

  for( ch = first_char; ch; ch = wch_next )
    {
      wch_next = ch->next;

      if ( !IsNpc(ch)
           || ch->fighting
           || IsAffectedBy(ch, AFF_CHARM)
           || !IsAwake(ch)
           || ( IsBitSet(ch->act, ACT_WIMPY) ) )
	{
	  continue;
	}

      if ( !IsBitSet(ch->act, ACT_AGGRESSIVE)
           || IsBitSet(ch->act, ACT_MOUNTED)
           || IsBitSet(ch->in_room->room_flags, ROOM_SAFE ) )
	{
	  continue;
	}

      for ( wch = ch->in_room->first_person; wch; wch = ch_next )
        {
          ch_next = wch->next_in_room;

          if ( IsHating( ch, wch ) )
            {
              FoundPrey( ch, wch );
              continue;
            }

          if ( CharacterDiedRecently(wch)
               || wch->top_level >= LEVEL_IMMORTAL
               || !wch->in_room
               || !CanSeeCharacter( ch, wch ) )
	    {
	      continue;
	    }

          if ( IsBitSet(wch->act, ACT_AGGRESSIVE) )
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

          if ( IsNpc(ch) && IsBitSet(ch->attacks, ATCK_BACKSTAB ) )
            {
              Object *obj = NULL;

              if ( !ch->mount
                   && (obj = GetEquipmentOnCharacter( ch, WEAR_WIELD )) != NULL
                   && obj->value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
                   && !victim->fighting
                   && victim->hit >= victim->max_hit )
                {
                  SetWaitState( ch, skill_table[gsn_backstab]->beats );

                  if ( !IsAwake(victim)
                       || GetRandomPercent() + 5 < ch->top_level )
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
  short position = 0;

  if( !ch )
    {
      return;
    }

  if ( IsNpc( ch ) || !ch->pcdata || ch->pcdata->condition[COND_DRUNK] <= 0 )
    {
      return;
    }

  if ( GetRandomPercent() < 30 )
    {
      return;
    }

  drunk = ch->pcdata->condition[COND_DRUNK];
  position = ch->position;
  ch->position = POS_STANDING;

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

      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
	{
	  if ( GetRandomPercent() < 10 )
	    {
	      rvch = vch;
	    }
	}

      strcpy(name, rvch ? rvch->name : "");
      CheckSocial( ch, "puke", name);
    }

  ch->position = position;
}

static void SufferHalucinations( Character *ch )
{
  if ( ch->mental_state >= 30
       && NumberBits(5 - (ch->mental_state >= 50) - (ch->mental_state >= 75)) == 0 )
    {
      const char *t;

      switch( GetRandomNumberFromRange( 1, umin(20, (ch->mental_state+5) / 5)) )
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

  if ( !first_teleport )
    {
      return;
    }

  for ( tele = first_teleport; tele; tele = tele_next )
    {
      tele_next = tele->next;

      if ( --tele->timer <= 0 )
        {
          if ( tele->room->first_person )
            {
              Teleport( tele->room->first_person, tele->room->tele_vnum,
                        TELE_TRANSALL );
            }

          UNLINK( tele, first_teleport, last_teleport, next, prev );
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
      ForEach( Missile, first_missile, next, UpdateMissile, NULL );
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

  if ( auction->item && --auction->pulse <= 0 )
    {
      auction->pulse = PULSE_AUCTION;
      AuctionUpdate();
    }

  if(arena.in_StartArena || arena.ppl_challenged)
    {
      if( --pulse_StartArena <= 0)
	{
	  pulse_StartArena = PULSE_ARENA;
	  StartArena();
	}
    }

  if(arena.ppl_IsInArena)
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
  Room *fromRoom = portal->in_room;
  Room *toRoom = NULL;
  Character *ch = NULL;
  Exit *pexit = NULL;
  bool found = false;

  for ( pexit = fromRoom->first_exit; pexit; pexit = pexit->next )
    {
      if ( IsBitSet( pexit->exit_info, EX_PORTAL ) )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      Bug( "RemovePortal: portal not found in room %ld!", fromRoom->vnum );
      return;
    }

  if ( pexit->vdir != DIR_PORTAL )
    {
      Bug( "RemovePortal: exit in dir %d != DIR_PORTAL", pexit->vdir );
    }

  if ( ( toRoom = pexit->to_room ) == NULL )
    {
      Bug( "RemovePortal: toRoom is NULL", 0 );
    }

  ExtractExit( fromRoom, pexit );

  if ( toRoom && (ch = toRoom->first_person) != NULL )
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
  Ship *ship = NULL;

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
       && !set_boot_time->manual )
    {
      return;
    }

  if ( new_boot_time_t <= current_time )
    {
      Character *vch = NULL;

      if ( auction->item )
        {
          sprintf(buf, "Sale of %s has been stopped by mud.",
                  auction->item->short_descr);
          TalkAuction(buf);
          ObjectToCharacter(auction->item, auction->seller);
          auction->item = NULL;

          if ( auction->buyer && auction->buyer != auction->seller )
            {
              auction->buyer->gold += auction->bet;
              SendToCharacter("Your money has been returned.\r\n", auction->buyer);
            }
        }

      EchoToAll(AT_YELLOW, "You are forced from these realms by a strong "
                  "presence\r\nas life here is reconstructed.", ECHOTAR_ALL);

      for ( vch = first_char; vch; vch = vch->next )
	{
	  if ( !IsNpc(vch) )
	    {
	      SaveCharacter(vch);
	    }
	}

      for ( ship = first_ship; ship; ship = ship->next )
	{
	  SaveShip( ship );
	}

      mud_down = true;
      return;
    }

  if ( trun != -1 && new_boot_time_t - current_time <= times[trun] )
    {
      EchoToAll(AT_YELLOW, tmsg[trun], ECHOTAR_ALL);

      if ( trun <= 5 )
	{
	  sysdata.DENY_NEW_PLAYERS = true;
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

  switch (++auction->going) /* increase the going state */
    {
    case 1 : /* going once */
    case 2 : /* going twice */
      if (auction->bet > auction->starting)
	{
	  sprintf (buf, "%s: going %s for %d.", auction->item->short_descr,
		   ((auction->going == 1) ? "once" : "twice"), auction->bet);
	}
      else
	{
	  sprintf (buf, "%s: going %s (bid not received yet).", auction->item->short_descr,
		   ((auction->going == 1) ? "once" : "twice"));
	}

      TalkAuction (buf);
      break;

    case 3 : /* SOLD! */
      if (!auction->buyer && auction->bet)
        {
          Bug( "Auction code reached SOLD, with NULL buyer, but %d gold bid", auction->bet );
          auction->bet = 0;
        }

      if (auction->bet > 0 && auction->buyer != auction->seller)
        {
          sprintf (buf, "%s sold to %s for %d.",
                   auction->item->short_descr,
                   IsNpc(auction->buyer) ? auction->buyer->short_descr : auction->buyer->name,
                   auction->bet);
          TalkAuction(buf);

          Act(AT_ACTION, "The auctioneer materializes before you, and hands you $p.",
              auction->buyer, auction->item, NULL, TO_CHAR);
          Act(AT_ACTION, "The auctioneer materializes before $n, and hands $m $p.",
              auction->buyer, auction->item, NULL, TO_ROOM);

          if ( (auction->buyer->carry_weight
                + GetObjectWeight( auction->item ))
               > GetCarryCapacityWeight( auction->buyer ) )
            {
              Act( AT_PLAIN, "$p is too heavy for you to carry with your current inventory.", auction->buyer, auction->item, NULL, TO_CHAR );
              Act( AT_PLAIN, "$n is carrying too much to also carry $p, and $e drops it.", auction->buyer, auction->item, NULL, TO_ROOM );
              ObjectToRoom( auction->item, auction->buyer->in_room );
            }
          else
	    {
	      ObjectToCharacter( auction->item, auction->buyer );
	    }

          pay = (int)auction->bet * 0.9;
          tax = (int)auction->bet * 0.1;
          BoostEconomy( auction->seller->in_room->area, tax );
          auction->seller->gold += pay; /* give him the money, tax 10 % */
          sprintf(buf, "The auctioneer pays you %d gold, charging an auction fee of %d.\r\n",
		  pay, tax);
          SendToCharacter(buf, auction->seller);
          auction->item = NULL; /* reset item */

          if ( IsBitSet( sysdata.save_flags, SV_AUCTION ) )
            {
              SaveCharacter( auction->buyer );
              SaveCharacter( auction->seller );
            }
        }
      else /* not sold */
        {
          sprintf (buf, "No bids received for %s - object has been removed from auction\r\n.",
		   auction->item->short_descr);
          TalkAuction(buf);
          Act(AT_ACTION, "The auctioneer appears before you to return $p to you.",
               auction->seller,auction->item,NULL,TO_CHAR);
          Act(AT_ACTION, "The auctioneer appears before $n to return $p to $m.",
               auction->seller,auction->item,NULL,TO_ROOM);

          if ( (auction->seller->carry_weight
                + GetObjectWeight( auction->item ))
               > GetCarryCapacityWeight( auction->seller ) )
            {
              Act( AT_PLAIN, "You drop $p as it is just too much to carry"
                   " with everything else you're carrying.", auction->seller,
                   auction->item, NULL, TO_CHAR );
              Act( AT_PLAIN, "$n drops $p as it is too much extra weight"
                   " for $m with everything else.", auction->seller,
                   auction->item, NULL, TO_ROOM );
              ObjectToRoom( auction->item, auction->seller->in_room );
            }
          else
	    {
	      ObjectToCharacter (auction->item,auction->seller);
	    }

          tax = (int)auction->item->cost * 0.05;
          BoostEconomy( auction->seller->in_room->area, tax );
          sprintf(buf, "The auctioneer charges you an auction fee of %d.\r\n", tax );
          SendToCharacter(buf, auction->seller);

          if ((auction->seller->gold - tax) < 0)
	    {
	      auction->seller->gold = 0;
	    }
          else
	    {
	      auction->seller->gold -= tax;
	    }

          if ( IsBitSet( sysdata.save_flags, SV_AUCTION ) )
	    {
	      SaveCharacter( auction->seller );
	    }
        }

      auction->item = NULL;
    }
}
