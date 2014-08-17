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

/* mud_prog.c */
void room_act_update( void );
void obj_act_update( void );

/*
 * Local functions.
 */
static int hit_gain( const Character *ch );
static int mana_gain( const Character *ch );
static int move_gain( const Character *ch );
static void gain_addiction( Character *ch );
static void mobile_update( void );
static void weather_update( void );
static void update_taxes( void );
static void char_update( void );
static void obj_update( void );
static void aggr_update( void );
static void char_check( void );
static void drunk_randoms( Character *ch );
static void halucinations( Character *ch );

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
OBJ_DATA *gobj_prev = NULL;

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

bool IsDroid( const Character *ch )
{
  return ch->race == RACE_DROID
    || ch->race == RACE_PROTOCOL_DROID
    || ch->race == RACE_ASSASSIN_DROID
    || ch->race == RACE_GLADIATOR_DROID
    || ch->race == RACE_ASTROMECH_DROID
    || ch->race == RACE_INTERROGATION_DROID;
}
/*
 * Advancement stuff.
 */
int max_level( const Character *ch, int ability)
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

  level += race_table[ch->race].AbilityMod[COMBAT_ABILITY];
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

  level += race_table[ch->race].AbilityMod[PILOTING_ABILITY];
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

  level += race_table[ch->race].AbilityMod[ENGINEERING_ABILITY];
  level += ch->stats.perm_int * 2;

  return urange( 1, level, 150 );
}

static int GetMaxBountyHuntingLevel( const Character *ch )
{
  int level = 0;

  if ( ch->ability.main == HUNTING_ABILITY )
    level = 100;

  level += race_table[ch->race].AbilityMod[HUNTING_ABILITY];

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

  level += race_table[ch->race].AbilityMod[SMUGGLING_ABILITY];
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

  level += race_table[ch->race].AbilityMod[LEADERSHIP_ABILITY];
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

  level += race_table[ch->race].AbilityMod[DIPLOMACY_ABILITY];
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

void advance_level( Character *ch, int ability )
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
      REMOVE_BIT( ch->act, PLR_BOUGHT_PET );
    }
}

void gain_exp( Character *ch, short ability, long gain )
{
  if ( IsNpc(ch) )
    {
      return;
    }

  SetExperience( ch, ability, umax( 0, GetExperience( ch, ability ) + gain ) );

  if (!IsAuthed(ch) && GetExperience( ch, ability ) >= exp_level(GetAbilityLevel(ch, ability ) + 1))
    {
      send_to_char("You can not ascend to a higher level until you are authorized.\r\n", ch);
      SetExperience( ch, ability, exp_level( GetAbilityLevel(ch, ability) + 1 ) - 1);
      return;
    }

  while ( GetExperience( ch, ability ) >= exp_level( GetAbilityLevel( ch, ability ) + 1))
    {
      short current_level = GetAbilityLevel( ch, ability );
      short new_level = 0;

      if ( current_level >= max_level( ch, ability ) )
        {
          SetExperience( ch, ability, exp_level( GetAbilityLevel( ch, ability ) + 1 ) - 1);
          return;
        }

      set_char_color( AT_WHITE + AT_BLINK, ch );
      new_level = current_level + 1;
      SetAbilityLevel( ch, ability, new_level );

      ch_printf( ch, "You have now obtained %s level %d!\r\n",
		 ability_name[ability], GetAbilityLevel( ch, ability ) );
      advance_level( ch , ability);
    }
}

long lose_exp( Character *ch, short ability, long loss )
{
  int current_exp = 0;
  int new_exp = 0;
  int actual_loss = 0;

  if ( IsNpc(ch) )
    return 0;

  current_exp = GetExperience( ch, ability );
  actual_loss = umax( loss, 0 );
  new_exp = current_exp - actual_loss;

  SetExperience( ch, ability, new_exp );

  return actual_loss;
}

/*
 * Regeneration stuff.
 */
int hit_gain( const Character *ch )
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



int mana_gain( const Character *ch )
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

int move_gain( const Character *ch )
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

void gain_addiction( Character *ch )
{
  short drug = 0;
  Affect af;

  for ( drug=0 ; drug <= 9 ; drug ++ )
    {
      if ( ch->pcdata->addiction[drug] < ch->pcdata->drug_level[drug] )
	{
	  ch->pcdata->addiction[drug]++;
	}

      if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+150 )
        {
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
                  affect_to_char( ch, &af );
                }

            case SPICE_CARSANUM:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_DAMROLL;
                  af.modifier  = -10;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  affect_to_char( ch, &af );
                }

            case SPICE_RYLL:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_DEX;
                  af.modifier  = -5;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  affect_to_char( ch, &af );
                }

            case SPICE_ANDRIS:
              if ( !IsAffectedBy( ch, AFF_WEAKEN ) )
                {
                  af.type      = -1;
                  af.location  = APPLY_CON;
                  af.modifier  = -5;
                  af.duration  = ch->pcdata->addiction[drug];
                  af.bitvector = AFF_WEAKEN;
                  affect_to_char( ch, &af );
                }
            }
        }

      if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+200 )
        {
          ch_printf ( ch, "You feel like you are going to die. You NEED %s\r\n.",
		      get_spicetype_name(drug) );
          WorsenMentalState( ch, 2 );
          damage(ch, ch, 5, TYPE_UNDEFINED);
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+100 )
        {
          ch_printf ( ch, "You need some %s.\r\n", get_spicetype_name(drug) );
          WorsenMentalState( ch, 2 );
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+50 )
        {
          ch_printf ( ch, "You really crave some %s.\r\n", get_spicetype_name(drug) );
          WorsenMentalState( ch, 1 );
        }
      else if ( ch->pcdata->addiction[drug] > ch->pcdata->drug_level[drug]+25 )
        {
          ch_printf ( ch, "Some more %s would feel quite nice.\r\n", get_spicetype_name(drug) );
        }
      else if ( ch->pcdata->addiction[drug] < ch->pcdata->drug_level[drug]-50 )
        {
          act( AT_POISON, "$n bends over and vomits.\r\n", ch, NULL, NULL, TO_ROOM );
          act( AT_POISON, "You vomit.\r\n", ch, NULL, NULL, TO_CHAR );
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

void gain_condition( Character *ch, int iCond, int value )
{
  int condition = 0;
  ch_ret retcode = 0;

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
              set_char_color( AT_HUNGRY, ch );
              send_to_char( "You are STARVING!\r\n",  ch );
              WorsenMentalState( ch, 1 );
              retcode = damage(ch, ch, 5, TYPE_UNDEFINED);
            }
          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              set_char_color( AT_THIRSTY, ch );
              send_to_char( "You are DYING of THIRST!\r\n", ch );
              WorsenMentalState( ch, 2 );
              retcode = damage(ch, ch, 5, TYPE_UNDEFINED);
            }
          break;

        case COND_DRUNK:
          if ( condition != 0 )
	    {
	      set_char_color( AT_SOBER, ch );
	      send_to_char( "You are sober.\r\n", ch );
	    }

          retcode = rNONE;
          break;

        default:
          bug( "Gain_condition: invalid condition type %d", iCond );
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
              set_char_color( AT_HUNGRY, ch );
              send_to_char( "You are really hungry.\r\n",  ch );

              if ( number_bits(1) == 0 )
		{
		  WorsenMentalState( ch, 1 );
		}
            }
          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR  )
            {
              set_char_color( AT_THIRSTY, ch );
              send_to_char( "You are really thirsty.\r\n", ch );
              WorsenMentalState( ch, 1 );
            }
          break;

        case COND_DRUNK:
          if ( condition != 0 )
	    {
	      set_char_color( AT_SOBER, ch );
	      send_to_char( "You are feeling a little less light headed.\r\n", ch );
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
              set_char_color( AT_HUNGRY, ch );
              send_to_char( "You are hungry.\r\n",  ch );
            }

          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              set_char_color( AT_THIRSTY, ch );
              send_to_char( "You are thirsty.\r\n", ch );
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
              set_char_color( AT_HUNGRY, ch );
              send_to_char( "You are a mite peckish.\r\n",  ch );
            }
          break;

        case COND_THIRST:
          if ( ch->top_level <= LEVEL_AVATAR )
            {
              set_char_color( AT_THIRSTY, ch );
              send_to_char( "You could use a sip of something refreshing.\r\n", ch );
            }
          break;

        }
    }
}

/*
 * Mob autonomous action.
 * This function takes 25% to 35% of ALL Mud cpu time.
 */
void mobile_update( void )
{
  char buf[MAX_STRING_LENGTH];
  Character *ch = NULL;
  Exit *pexit = NULL;
  DirectionType door = DIR_INVALID;
  ch_ret retcode = rNONE;

  /* Examine all mobs. */
  for ( ch = last_char; ch; ch = gch_prev )
    {
      set_cur_char( ch );

      if ( ch == first_char && ch->prev )
        {
          bug( "mobile_update: first_char->prev != NULL... fixed" );
          ch->prev = NULL;
        }

      gch_prev = ch->prev;

      if ( gch_prev && gch_prev->next != ch )
        {
          bug( "FATAL: Mobile_update: %s->prev->next doesn't point to ch.",
	       ch->name );
          bug( "Short-cutting here" );
          gch_prev = NULL;
          ch->prev = NULL;
          do_shout( ch, "Thoric says, 'Prepare for the worst!'" );
        }

      if ( !IsNpc(ch) )
        {
          drunk_randoms(ch);
          halucinations(ch);
          continue;
        }

      if ( !ch->in_room
           || IsAffectedBy(ch, AFF_CHARM)
           || IsAffectedBy(ch, AFF_PARALYSIS) )
	{
	  continue;
	}

      /* Clean up 'animated corpses' that are not charmed' - Scryn */

      if ( ch->pIndexData->vnum == 5 && !IsAffectedBy(ch, AFF_CHARM) )
        {
          if(ch->in_room->first_person)
	    {
	      act(AT_MAGIC, "$n returns to the dust from whence $e came.",
		  ch, NULL, NULL, TO_ROOM);
	    }

          if(IsNpc(ch)) /* Guard against purging switched? */
	    {
	      extract_char(ch, true);
	    }

          continue;
        }

      if ( !IS_SET( ch->act, ACT_RUNNING )
           && !IS_SET( ch->act, ACT_SENTINEL )
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
                && !IS_SET( ch->act, ACT_RUNNING)
                && ch->was_sentinel && ch->position >= POS_STANDING )
        {
          act( AT_ACTION, "$n leaves.", ch, NULL, NULL, TO_ROOM );
          char_from_room( ch );
          char_to_room( ch , ch->was_sentinel );
          act( AT_ACTION, "$n arrives.", ch, NULL, NULL, TO_ROOM );
          SET_BIT( ch->act , ACT_SENTINEL );
          ch->was_sentinel = NULL;
        }

      /* Examine call for special procedure */
      if ( !IS_SET( ch->act, ACT_RUNNING )
           && ch->spec_fun )
        {
          if ( (*ch->spec_fun) ( ch ) )
	    {
	      continue;
	    }

          if ( char_died(ch) )
	    {
	      continue;
	    }
        }

      if ( !IS_SET( ch->act, ACT_RUNNING )
           && ch->spec_2 )
        {
          if ( (*ch->spec_2) ( ch ) )
	    {
	      continue;
	    }

          if ( char_died(ch) )
	    {
	      continue;
	    }
        }

      /* Check for mudprogram script on mob */
      if ( IS_SET( ch->pIndexData->mprog.progtypes, SCRIPT_PROG ) )
        {
          mprog_script_trigger( ch );
          continue;
        }

      if ( ch != cur_char )
        {
          bug( "Mobile_update: ch != cur_char after spec_fun", 0 );
          continue;
        }

      /* That's all for sleeping / busy monster */
      if ( ch->position != POS_STANDING )
	{
	  continue;
	}

      if ( IS_SET(ch->act, ACT_MOUNTED ) )
        {
          if ( IS_SET(ch->act, ACT_AGGRESSIVE) )
	    {
	      do_emote( ch, "snarls and growls." );
	    }

          continue;
        }

      if ( IS_SET(ch->in_room->room_flags, ROOM_SAFE )
           && IS_SET(ch->act, ACT_AGGRESSIVE) )
	{
	  do_emote( ch, "glares around and snarls." );
	}

      /* MOBprogram random trigger */
      if ( ch->in_room->area->nplayer > 0 )
        {
          mprog_random_trigger( ch );

          if ( char_died(ch) )
	    {
	      continue;
	    }

          if ( ch->position < POS_STANDING )
	    {
	      continue;
	    }
        }

      /* MOBprogram hour trigger: do something for an hour */
      mprog_hour_trigger(ch);

      if ( char_died(ch) )
	{
	  continue;
	}

      rprog_hour_trigger(ch);

      if ( char_died(ch) )
	{
	  continue;
	}

      if ( ch->position < POS_STANDING )
	{
	  continue;
	}

      /* Scavenge */
      if ( IS_SET(ch->act, ACT_SCAVENGER)
           && ch->in_room->first_content
           && number_bits( 2 ) == 0 )
        {
          OBJ_DATA *obj = NULL;
          OBJ_DATA *obj_best = NULL;
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
              obj_from_room( obj_best );
              obj_to_char( obj_best, ch );
              act( AT_ACTION, "$n gets $p.", ch, obj_best, NULL, TO_ROOM );
            }
        }

      /* Wander */
      if ( !IS_SET(ch->act, ACT_RUNNING)
           && !IS_SET(ch->act, ACT_SENTINEL)
           && !IS_SET(ch->act, ACT_PROTOTYPE)
           && ( door = number_bits( 5 ) ) <= 9
           && ( pexit = get_exit(ch->in_room, door) ) != NULL
           && pexit->to_room
           && !IS_SET(pexit->exit_info, EX_CLOSED)
           && !IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB)
           && ( !IS_SET(ch->act, ACT_STAY_AREA)
                ||   pexit->to_room->area == ch->in_room->area ) )
        {
          retcode = move_char( ch, pexit, 0 );

          /* If ch changes position due
             to it's or someother mob's
             movement via MOBProgs,
             continue - Kahn */
          if ( char_died(ch) )
	    {
	      continue;
	    }

          if ( retcode != rNONE || IS_SET(ch->act, ACT_SENTINEL)
               || ch->position < POS_STANDING )
	    {
	      continue;
	    }
        }

      /* Flee */
      if ( ch->hit < ch->max_hit / 2
           && ( door = number_bits( 4 ) ) <= 9
           && ( pexit = get_exit(ch->in_room,door) ) != NULL
           && pexit->to_room
           && !IS_SET(pexit->exit_info, EX_CLOSED)
           && !IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB) )
        {
          Character *rch = NULL;
          bool found = false;

          for ( rch = ch->in_room->first_person;
                rch;
                rch = rch->next_in_room )
            {
              if ( is_fearing(ch, rch) )
                {
                  switch( number_bits(2) )
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
	      retcode = move_char( ch, pexit, 0 );
	    }
        }
    }
}

void update_taxes( void )
{
  const PLANET_DATA *planet = NULL;
  const Descriptor *d = NULL;

  for ( planet = first_planet; planet; planet = planet->next )
    {
      CLAN_DATA *clan = planet->governed_by;

      if ( clan )
        {
          int sCount = 0;
          CLAN_DATA * subclan = NULL;

          if ( clan->first_subclan )
            {
              for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
		{
		  sCount++;
		}

              for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
                {
                  subclan->funds += get_taxes(planet)/1440/sCount;
                  save_clan (subclan);
                }

              clan->funds += get_taxes(planet)/1440;
              save_clan (clan);
            }
          else
            {
              clan->funds += get_taxes(planet)/720;
              save_clan( clan );
            }

          save_planet( planet );
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
void weather_update( void )
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
	      act( AT_TEMP, buf, d->character, 0, 0, TO_CHAR );
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

  weather_info.change += diff * dice(1, 4) + dice(2, 6) - dice(2, 6);
  weather_info.change  = umax(weather_info.change, -12);
  weather_info.change  = umin(weather_info.change,  12);

  weather_info.mmhg += weather_info.change;
  weather_info.mmhg  = umax(weather_info.mmhg,  960);
  weather_info.mmhg  = umin(weather_info.mmhg, 1040);

  AT_TEMP = AT_GREY;

  switch ( weather_info.sky )
    {
    default:
      bug( "Weather_update: bad sky %d.", weather_info.sky );
      weather_info.sky = SKY_CLOUDLESS;
      break;

    case SKY_CLOUDLESS:
      if ( weather_info.mmhg <  990
           || ( weather_info.mmhg < 1010 && number_bits( 2 ) == 0 ) )
        {
          strcat( buf, "The sky is getting cloudy." );
          weather_info.sky = SKY_CLOUDY;
          AT_TEMP = AT_GREY;
        }
      break;

    case SKY_CLOUDY:
      if ( weather_info.mmhg <  970
           || ( weather_info.mmhg <  990 && number_bits( 2 ) == 0 ) )
        {
          strcat( buf, "It starts to rain." );
          weather_info.sky = SKY_RAINING;
          AT_TEMP = AT_BLUE;
        }

      if ( weather_info.mmhg > 1030 && number_bits( 2 ) == 0 )
        {
          strcat( buf, "The clouds disappear." );
          weather_info.sky = SKY_CLOUDLESS;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_RAINING:
      if ( weather_info.mmhg <  970 && number_bits( 2 ) == 0 )
        {
          strcat( buf, "Lightning flashes in the sky." );
          weather_info.sky = SKY_LIGHTNING;
          AT_TEMP = AT_YELLOW;
        }

      if ( weather_info.mmhg > 1030
           || ( weather_info.mmhg > 1010 && number_bits( 2 ) == 0 ) )
        {
          strcat( buf, "The rain stopped." );
          weather_info.sky = SKY_CLOUDY;
          AT_TEMP = AT_WHITE;
        }
      break;

    case SKY_LIGHTNING:
      if ( weather_info.mmhg > 1010
           || ( weather_info.mmhg >  990 && number_bits( 2 ) == 0 ) )
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
	      act( AT_TEMP, buf, d->character, 0, 0, TO_CHAR );
	    }
        }
    }
}



/*
 * Update all chars, including mobs.
 * This function is performance sensitive.
 */
void char_update( void )
{
  Character *ch = NULL;
  Character *ch_save = NULL;
  short save_count = 0;

  for ( ch = last_char; ch; ch = gch_prev )
    {
      if ( ch == first_char && ch->prev )
        {
          bug( "char_update: first_char->prev != NULL... fixed" );
          ch->prev = NULL;
        }

      gch_prev = ch->prev;
      set_cur_char( ch );

      if ( gch_prev && gch_prev->next != ch )
        {
          bug( "char_update: ch->prev->next != ch" );
          return;
        }

      /*
       *  Do a room_prog rand check right off the bat
       *   if ch disappears (rprog might wax npc's), continue
       */
      if(!IsNpc(ch))
        rprog_random_trigger( ch );

      if( char_died(ch) )
        continue;

      if(IsNpc(ch))
        mprog_time_trigger(ch);

      if( char_died(ch) )
        continue;

      rprog_time_trigger(ch);

      if( char_died(ch) )
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
            ch->hit  += hit_gain(ch);

          if ( ch->mana < ch->max_mana && IsJedi( ch ) )
            ch->mana += mana_gain(ch);

          if ( ch->move < ch->max_move )
            ch->move += move_gain(ch);
        }

      if ( ch->position == POS_STUNNED )
        update_pos( ch );

      if ( ch->pcdata )
        gain_addiction( ch );


      if ( !IsNpc(ch) && ch->top_level < LEVEL_IMMORTAL )
        {
          OBJ_DATA *obj = NULL;

          if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_LIGHT ) ) != NULL
               && obj->item_type == ITEM_LIGHT
               && obj->value[OVAL_LIGHT_POWER] > 0 )
            {
              if ( --obj->value[OVAL_LIGHT_POWER] == 0 && ch->in_room )
                {
                  ch->in_room->light -= obj->count;
                  act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "$p goes out.", ch, obj, NULL, TO_CHAR );

                  if ( obj->serial == cur_obj )
		    {
		      global_objcode = rOBJ_EXPIRED;
		    }

                  extract_obj( obj );
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
                  if ( number_bits(2) == 0 )
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
                  if ( number_bits(2) == 0 )
		    {
		      ImproveMentalState( ch, 1 );
		    }

                  break;
                }
            }

          gain_condition( ch, COND_DRUNK,  -1 );
          gain_condition( ch, COND_FULL,   -1 );

          if ( ch->in_room )
	    {
	      switch( ch->in_room->sector_type )
		{
		default:
		  gain_condition( ch, COND_THIRST, -1 );
		  break;

		case SECT_DESERT:
		  gain_condition( ch, COND_THIRST, -2 );
		  break;

		case SECT_UNDERWATER:
		case SECT_OCEANFLOOR:
		  if ( number_bits(1) == 0 )
		    {
		      gain_condition( ch, COND_THIRST, -1 );
		    }

		  break;
		}
	    }
        }

      if ( !char_died(ch) )
        {
          /*
           * Careful with the damages here,
           *   MUST NOT refer to ch after damage taken,
           *   as it may be lethal damage (on NPC).
           */
          if ( IsAffectedBy(ch, AFF_POISON) )
            {
              act( AT_POISON, "$n shivers and suffers.", ch, NULL, NULL, TO_ROOM );
              act( AT_POISON, "You shiver and suffer.", ch, NULL, NULL, TO_CHAR );
              ch->mental_state = urange( 20, ch->mental_state
                                         + 4 , 100 );
              damage( ch, ch, 6, gsn_poison );
            }
          else if ( ch->position == POS_INCAP )
	    {
	      damage( ch, ch, 1, TYPE_UNDEFINED );
	    }
	  else if ( ch->position == POS_MORTAL )
	    {
	      damage( ch, ch, 4, TYPE_UNDEFINED );
	    }

          if ( char_died(ch) )
	    {
	      continue;
	    }

          if ( ch->mental_state >= 30 )
	    {
	      switch( (ch->mental_state+5) / 10 )
		{
		case 3:
		  send_to_char( "You feel feverish.\r\n", ch );
		  act( AT_ACTION, "$n looks kind of out of it.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 4:
		  send_to_char( "You do not feel well at all.\r\n", ch );
		  act( AT_ACTION, "$n doesn't look too good.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 5:
		  send_to_char( "You need help!\r\n", ch );
		  act( AT_ACTION, "$n looks like $e could use your help.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 6:
		  send_to_char( "Seekest thou a cleric.\r\n", ch );
		  act( AT_ACTION, "Someone should fetch a healer for $n.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 7:
		  send_to_char( "You feel reality slipping away...\r\n", ch );
		  act( AT_ACTION, "$n doesn't appear to be aware of what's going on.", ch, NULL, NULL, TO_ROOM );
		  break;

		case 8:
		  send_to_char( "You begin to understand... everything.\r\n", ch );
		  act( AT_ACTION, "$n starts ranting like a madman!", ch, NULL, NULL, TO_ROOM );
		  break;

		case 9:
		  send_to_char( "You are ONE with the universe.\r\n", ch );
		  act( AT_ACTION, "$n is ranting on about 'the answer', 'ONE' and other mumbo-jumbo...", ch, NULL, NULL, TO_ROOM );
		  break;

		case 10:
		  send_to_char( "You feel the end is near.\r\n", ch );
		  act( AT_ACTION, "$n is muttering and ranting in tongues...", ch, NULL, NULL, TO_ROOM );
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
                         && number_percent()+10 < abs(ch->mental_state) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			send_to_char( "You're barely conscious.\r\n", ch );
		      }
                  }
                break;

              case 9:
                if ( ch->position > POS_SLEEPING )
                  {
                    if ( (ch->position == POS_STANDING
                          || ch->position < POS_FIGHTING)
                         && (number_percent()+20) < abs(ch->mental_state) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			send_to_char( "You can barely keep your eyes open.\r\n", ch );
		      }
                  }
                break;

              case 8:
                if ( ch->position > POS_SLEEPING )
                  {
                    if ( ch->position < POS_SITTING
                         &&  (number_percent()+30) < abs(ch->mental_state) )
		      {
			do_sleep( ch, "" );
		      }
                    else
		      {
			send_to_char( "You're extremely drowsy.\r\n", ch );
		      }
                  }
                break;

              case 7:
                if ( ch->position > POS_RESTING )
		  {
		    send_to_char( "You feel very unmotivated.\r\n", ch );
		  }
                break;

              case 6:
                if ( ch->position > POS_RESTING )
		  {
		    send_to_char( "You feel sedated.\r\n", ch );
		  }
		break;

              case 5:
                if ( ch->position > POS_RESTING )
		  {
		    send_to_char( "You feel sleepy.\r\n", ch );
		  }
                break;

              case 4:
                if ( ch->position > POS_RESTING )
		  {
		    send_to_char( "You feel tired.\r\n", ch );
		  }
                break;

              case 3:
                if ( ch->position > POS_RESTING )
		  {
		    send_to_char( "You could use a rest.\r\n", ch );
		  }
                break;
              }

          if ( ch->backup_wait > 0 )
            {
              --ch->backup_wait;

              if ( ch->backup_wait == 0 )
		{
		  add_reinforcements( ch );
		}
            }

          if ( !IsNpc (ch) )
            {
              if ( ++ch->timer > 15 && !ch->desc )
                {
                  if ( ch->in_room )
		    {
		      char_from_room( ch );
		    }

                  char_to_room( ch, get_room_index( ROOM_PLUOGUS_QUIT ) );
                  ch->position = POS_RESTING;
                  ch->hit = umax ( 1 , ch->hit );
                  save_char_obj( ch );
                  do_quit( ch, "" );
                }
              else if ( ch == ch_save && IS_SET( sysdata.save_flags, SV_AUTO )
			&& ++save_count < 10 )   /* save max of 10 per tick */
		{
		  save_char_obj( ch );
		}
            }
        }
    }
}

/*
 * Update all objs.
 * This function is performance sensitive.
 */
void obj_update( void )
{
  OBJ_DATA *obj = NULL;
  OBJ_DATA *wield = NULL;
  short AT_TEMP = 0;

  for ( obj = last_object; obj; obj = gobj_prev )
    {
      Character *rch = NULL;
      const char *message = NULL;

      if ( obj == first_object && obj->prev )
        {
          bug( "obj_update: first_object->prev != NULL... fixed" );
          obj->prev = NULL;
        }

      gobj_prev = obj->prev;

      if ( gobj_prev && gobj_prev->next != obj )
        {
          bug( "obj_update: obj->prev->next != obj" );
          return;
        }

      set_cur_obj( obj );

      if ( obj->carried_by )
	{
	  oprog_random_trigger( obj );
	}
      else if( obj->in_room && obj->in_room->area->nplayer > 0 )
	{
	  oprog_random_trigger( obj );
	}

      if( obj_extracted(obj) )
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
                  act( AT_PLAIN, "$p fizzles and dies." , obj->carried_by, obj, NULL, TO_CHAR );
                  act( AT_PLAIN, "$n's lightsaber fizzles and dies." , obj->carried_by, NULL, NULL, TO_ROOM );
                }
              else if ( obj->value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE )
                {
                  act( AT_PLAIN, "$p stops vibrating." , obj->carried_by, obj, NULL, TO_CHAR );
                }
            }
        }

      if ( obj->item_type == ITEM_PIPE )
        {
          if ( IS_SET( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
            {
              if ( --obj->value[OVAL_PIPE_TOBACCO_AMOUNT] <= 0 )
                {
                  obj->value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
                  REMOVE_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT );
                }
              else if ( IS_SET( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT ) )
		{
		  REMOVE_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT );
		}
	      else
		{
		  if ( IS_SET( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT ) )
		    {
		      REMOVE_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT );
		      REMOVE_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		  else
		    {
		      SET_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT );
		    }
		}

              if ( !IS_SET( obj->value[OVAL_PIPE_FLAGS], PIPE_LIT ) )
		{
		  SET_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH );
		}
            }
          else
	    {
	      REMOVE_BIT( obj->value[OVAL_PIPE_FLAGS], PIPE_HOT );
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

              bufptr = one_argument( obj->short_descr, name );
              bufptr = one_argument( bufptr, name );
              bufptr = one_argument( bufptr, name );

              separate_obj(obj);
              obj->value[OVAL_CORPSE_DECAY] = timerfrac;

              if ( obj->item_type == ITEM_DROID_CORPSE )
		{
		  sprintf( buf, d_corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   bufptr );
		}
              else
		{
		  sprintf( buf, corpse_descs[ umin( timerfrac - 1, 4 ) ],
			   capitalize( bufptr ) );
		}

              STRFREE( obj->description );
              obj->description = STRALLOC( buf );
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
              act( AT_TEMP, "$p is almost dead." , obj->carried_by, obj, NULL, TO_CHAR );
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
                  act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "$p falls away.", rch, obj, NULL, TO_CHAR );
                }

              obj_from_room(obj);
              obj_to_room(obj, new_room);

              if (( rch = obj->in_room->first_person) != NULL )
                {
                  act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "$p floats by.", rch, obj, NULL, TO_CHAR );
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
          explode( obj );
          return;
          break;

        case ITEM_PORTAL:
          message = "$p winks out of existence.";
          remove_portal(obj);
          obj->item_type = ITEM_TRASH;          /* so extract_obj        */
          AT_TEMP = AT_MAGIC;                   /* doesn't remove_portal */
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
          act( AT_TEMP, message, obj->carried_by, obj, NULL, TO_CHAR );
        }
      else if ( obj->in_room
                &&      ( rch = obj->in_room->first_person ) != NULL
                &&      !IS_OBJ_STAT( obj, ITEM_BURRIED ) )
        {
          act( AT_TEMP, message, rch, obj, NULL, TO_ROOM );
          act( AT_TEMP, message, rch, obj, NULL, TO_CHAR );
        }

      if ( obj->serial == cur_obj )
        global_objcode = rOBJ_EXPIRED;
      extract_obj( obj );
    }
  return;
}


/*
 * Function to check important stuff happening to a player
 * This function should take about 5% of mud cpu time
 */
void char_check( void )
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

      set_cur_char(ch);
      ch_next = ch->next;
      will_fall(ch, 0);

      if ( char_died( ch ) )
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
          if ( IS_SET(ch->act, ACT_RUNNING) )
            {
              if ( !IS_SET( ch->act, ACT_SENTINEL )
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

                  if ( char_died(ch) )
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

                  if ( char_died(ch) )
		    {
		      continue;
		    }
                }

              if ( !IS_SET(ch->act, ACT_SENTINEL)
                   && !IS_SET(ch->act, ACT_PROTOTYPE)
                   && ( door = number_bits( 4 ) ) <= 9
                   && ( pexit = get_exit(ch->in_room, door) ) != NULL
                   && pexit->to_room
                   && !IS_SET(pexit->exit_info, EX_CLOSED)
                   && !IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB)
                   && ( !IS_SET(ch->act, ACT_STAY_AREA)
                        || pexit->to_room->area == ch->in_room->area ) )
                {
                  retcode = move_char( ch, pexit, 0 );

                  if ( char_died(ch) )
		    {
		      continue;
		    }

                  if ( retcode != rNONE || IS_SET(ch->act, ACT_SENTINEL)
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
              REMOVE_BIT( ch->mount->act, ACT_MOUNTED );
              ch->mount = NULL;
              ch->position = POS_STANDING;
              send_to_char( "No longer upon your mount, you fall to the ground...\r\nOUCH!\r\n", ch );
            }

          if ( ( ch->in_room && ch->in_room->sector_type == SECT_UNDERWATER )
               || ( ch->in_room && ch->in_room->sector_type == SECT_OCEANFLOOR ) )
            {
              if ( !IsAffectedBy( ch, AFF_AQUA_BREATH ) )
                {
                  if ( GetTrustLevel(ch) < LEVEL_IMMORTAL )
                    {
		      int dam = number_range( ch->max_hit / 50 , ch->max_hit / 30 );
                      dam = umax( 1, dam );

                      if(  ch->hit <= 0 )
			{
			  dam = umin( 10, dam );
			}

                      if ( number_bits(3) == 0 )
			{
			  send_to_char( "You cough and choke as you try to breathe water!\r\n", ch );
			}

                      damage( ch, ch, dam, TYPE_UNDEFINED );
                    }
                }
            }

          if ( char_died( ch ) )
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
                          dam = number_range( ch->max_hit / 50, ch->max_hit / 30 );
                          dam = umax( 1, dam );

                          if( ch->hit <= 0 )
			    {
			      dam = umin( 10, dam );
			    }

                          if ( number_bits(3) == 0 )
			    {
			      send_to_char( "Struggling with exhaustion, you choke on a mouthful of water.\r\n", ch );
			    }

                          damage( ch, ch, dam, TYPE_UNDEFINED );
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
void aggr_update( void )
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

      if ( !char_died(wch) && wch->mprog.mpactnum > 0 )
        {
          MPROG_ACT_LIST * tmp_act = NULL;

          while ( (tmp_act = wch->mprog.mpact) != NULL )
            {
              if ( tmp_act->obj && obj_extracted(tmp_act->obj) )
		{
		  tmp_act->obj = NULL;
		}

              if ( tmp_act->ch && !char_died(tmp_act->ch) )
		{
		  mprog_wordlist_check( tmp_act->buf, wch, tmp_act->ch,
					tmp_act->obj, tmp_act->vo, ACT_PROG );
		}

              wch->mprog.mpact = tmp_act->next;
              DISPOSE(tmp_act->buf);
              DISPOSE(tmp_act);
            }

          wch->mprog.mpactnum = 0;
          wch->mprog.mpact    = NULL;
        }

      mob_act_list = apdtmp->next;
      DISPOSE( apdtmp );
    }

  for( ch = first_char; ch; ch = wch_next )
    {
      wch_next = ch->next;

      if ( !IsNpc(ch)
           || ch->fighting
           || IsAffectedBy(ch, AFF_CHARM)
           || !IsAwake(ch)
           || ( IS_SET(ch->act, ACT_WIMPY) ) )
	{
	  continue;
	}

      if ( !IS_SET(ch->act, ACT_AGGRESSIVE)
           || IS_SET(ch->act, ACT_MOUNTED)
           || IS_SET(ch->in_room->room_flags, ROOM_SAFE ) )
	{
	  continue;
	}

      for ( wch = ch->in_room->first_person; wch; wch = ch_next )
        {
          ch_next = wch->next_in_room;

          if ( is_hating( ch, wch ) )
            {
              FoundPrey( ch, wch );
              continue;
            }

          if ( char_died(wch)
               || wch->top_level >= LEVEL_IMMORTAL
               || !wch->in_room
               || !CanSeeCharacter( ch, wch ) )
	    {
	      continue;
	    }

          if ( IS_SET(wch->act, ACT_AGGRESSIVE) )
	    {
	      continue;
	    }

          victim = wch;

          if ( !victim )
            {
              bug( "Aggr_update: null victim." );
              continue;
            }

          if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
	    {
	      continue;
	    }

          if ( IsNpc(ch) && IS_SET(ch->attacks, ATCK_BACKSTAB ) )
            {
              OBJ_DATA *obj = NULL;

              if ( !ch->mount
                   && (obj = GetEquipmentOnCharacter( ch, WEAR_WIELD )) != NULL
                   && obj->value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
                   && !victim->fighting
                   && victim->hit >= victim->max_hit )
                {
                  SetWaitState( ch, skill_table[gsn_backstab]->beats );

                  if ( !IsAwake(victim)
                       || number_percent( )+5 < ch->top_level )
                    {
                      global_retcode = multi_hit( ch, victim, gsn_backstab );
                      continue;
                    }
                  else
                    {
                      global_retcode = damage( ch, victim, 0, gsn_backstab );
                      continue;
                    }
                }
            }

          global_retcode = multi_hit( ch, victim, TYPE_UNDEFINED );
        }
    }
}

/* From interp.c */
bool check_social( Character *ch, const char *command, char *argument );

/*
 * drunk randoms        - Tricops
 * (Made part of mobile_update  -Thoric)
 */
void drunk_randoms( Character *ch )
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

  if ( number_percent() < 30 )
    {
      return;
    }

  drunk = ch->pcdata->condition[COND_DRUNK];
  position = ch->position;
  ch->position = POS_STANDING;

  if ( number_percent() < (2*drunk / 20) )
    {
      check_social( ch, "burp", "" );
    }
  else if ( number_percent() < (2*drunk / 20) )
    {
      check_social( ch, "hiccup", "" );
    }
  else if ( number_percent() < (2*drunk / 20) )
    {
      check_social( ch, "drool", "" );
    }
  else if ( number_percent() < (2*drunk / 20) )
    {
      check_social( ch, "fart", "" );
    }
  else if ( drunk > (10+(GetCurrentConstitution(ch)/5))
	    && number_percent() < ( 2 * drunk / 18 ) )
    {
      char name[MAX_STRING_LENGTH];

      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
	{
	  if ( number_percent() < 10 )
	    {
	      rvch = vch;
	    }
	}

      strcpy(name, rvch ? rvch->name : "");
      check_social( ch, "puke", name);
    }

  ch->position = position;
}

void halucinations( Character *ch )
{
  if ( ch->mental_state >= 30
       && number_bits(5 - (ch->mental_state >= 50) - (ch->mental_state >= 75)) == 0 )
    {
      const char *t;

      switch( number_range( 1, umin(20, (ch->mental_state+5) / 5)) )
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

      send_to_char( t, ch );
    }
}

void tele_update( void )
{
  TELEPORT_DATA *tele = NULL;
  TELEPORT_DATA *tele_next = NULL;

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
              teleport( tele->room->first_person, tele->room->tele_vnum,
                        TELE_TRANSALL );
            }

          UNLINK( tele, first_teleport, last_teleport, next, prev );
          DISPOSE( tele );
        }
    }
}

/*
 * Handle all kinds of updates.
 * Called once per pulse from game loop.
 * Random times to defeat tick-timing clients and players.
 */
void update_handler( void )
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
      set_char_color(AT_PLAIN, timechar);
      send_to_char( "Starting update timer.\r\n", timechar );
      gettimeofday(&start_time, NULL);
    }

  if ( --pulse_area <= 0 )
    {
      pulse_area = number_range( PULSE_AREA / 2, 3 * PULSE_AREA / 2 );
      area_update();
    }

  if ( --pulse_taxes <= 0 )
    {
      pulse_taxes = PULSE_TAXES ;
      update_taxes();
    }

  if ( --pulse_mobile <= 0 )
    {
      pulse_mobile = PULSE_MOBILE;
      mobile_update();
    }

  if ( --pulse_space <= 0 )
    {
      pulse_space = PULSE_SPACE;
      UpdateShips();
      UpdateShuttle();
    }

  if ( --pulse_recharge <= 0 )
    {
      pulse_recharge = PULSE_SPACE/3;
      RechargeShips();
    }

  if ( --pulse_ship <= 0 )
    {
      pulse_ship = PULSE_SPACE / 10;
      update_spaceobjects();
      update_missiles();
      UpdateShipMovement();
    }

  if ( --pulse_violence <= 0 )
    {
      pulse_violence = PULSE_VIOLENCE;
      violence_update();
    }

  if ( --pulse_point <= 0 )
    {
      pulse_point = number_range( PULSE_TICK * 0.75, PULSE_TICK * 1.25 );

      weather_update();
      char_update();
      obj_update();
      clear_vrooms();
    }

  if ( --pulse_second   <= 0 )
    {
      pulse_second = PULSE_PER_SECOND;
      char_check();
      reboot_check(0);
    }

  if ( auction->item && --auction->pulse <= 0 )
    {
      auction->pulse = PULSE_AUCTION;
      auction_update();
    }

  if(arena.in_StartArena || arena.ppl_challenged)
    {
      if( --pulse_StartArena <= 0)
	{
	  pulse_StartArena = PULSE_ARENA;
	  StartArena();
	}
    }

  if(arena.ppl_in_arena)
    {
      if(( --pulse_arena <= 0) || (CharactersInArena()==1))
	{
	  pulse_arena = PULSE_ARENA;
	  UpdateArena();
	}
    }

  tele_update();
  aggr_update();
  obj_act_update();
  room_act_update();
  clean_obj_queue();            /* dispose of extracted objects */
  clean_char_queue();           /* dispose of dead mobs/quitting chars */

  if ( timechar )
    {
      gettimeofday(&etime, NULL);
      set_char_color(AT_PLAIN, timechar);
      send_to_char( "Update timing complete.\r\n", timechar );
      subtract_times(&etime, &start_time);
      ch_printf( timechar, "Timing took %d.%06d seconds.\r\n",
                 etime.tv_sec, etime.tv_usec );
      timechar = NULL;
    }
}

void remove_portal( OBJ_DATA *portal )
{
  Room *fromRoom = portal->in_room;
  Room *toRoom = NULL;
  Character *ch = NULL;
  Exit *pexit = NULL;
  bool found = false;

  for ( pexit = fromRoom->first_exit; pexit; pexit = pexit->next )
    {
      if ( IS_SET( pexit->exit_info, EX_PORTAL ) )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      bug( "remove_portal: portal not found in room %ld!", fromRoom->vnum );
      return;
    }

  if ( pexit->vdir != DIR_PORTAL )
    {
      bug( "remove_portal: exit in dir %d != DIR_PORTAL", pexit->vdir );
    }

  if ( ( toRoom = pexit->to_room ) == NULL )
    {
      bug( "remove_portal: toRoom is NULL", 0 );
    }

  extract_exit( fromRoom, pexit );

  if ( toRoom && (ch = toRoom->first_person) != NULL )
    {
      act( AT_PLAIN, "A magical portal above winks from existence.", ch, NULL, NULL, TO_ROOM );
    }
}

void reboot_check( time_t reset )
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
      append_to_file(USAGE_FILE, buf);
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
          talk_auction(buf);
          obj_to_char(auction->item, auction->seller);
          auction->item = NULL;

          if ( auction->buyer && auction->buyer != auction->seller )
            {
              auction->buyer->gold += auction->bet;
              send_to_char("Your money has been returned.\r\n", auction->buyer);
            }
        }

      echo_to_all(AT_YELLOW, "You are forced from these realms by a strong "
                  "presence\r\nas life here is reconstructed.", ECHOTAR_ALL);

      for ( vch = first_char; vch; vch = vch->next )
	{
	  if ( !IsNpc(vch) )
	    {
	      save_char_obj(vch);
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
      echo_to_all(AT_YELLOW, tmsg[trun], ECHOTAR_ALL);

      if ( trun <= 5 )
	{
	  sysdata.DENY_NEW_PLAYERS = true;
	}

      --trun;
      return;
    }
}

/* the auction update*/

void auction_update (void)
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

      talk_auction (buf);
      break;

    case 3 : /* SOLD! */
      if (!auction->buyer && auction->bet)
        {
          bug( "Auction code reached SOLD, with NULL buyer, but %d gold bid", auction->bet );
          auction->bet = 0;
        }

      if (auction->bet > 0 && auction->buyer != auction->seller)
        {
          sprintf (buf, "%s sold to %s for %d.",
                   auction->item->short_descr,
                   IsNpc(auction->buyer) ? auction->buyer->short_descr : auction->buyer->name,
                   auction->bet);
          talk_auction(buf);

          act(AT_ACTION, "The auctioneer materializes before you, and hands you $p.",
              auction->buyer, auction->item, NULL, TO_CHAR);
          act(AT_ACTION, "The auctioneer materializes before $n, and hands $m $p.",
              auction->buyer, auction->item, NULL, TO_ROOM);

          if ( (auction->buyer->carry_weight
                + get_obj_weight( auction->item ))
               > GetCarryCapacityWeight( auction->buyer ) )
            {
              act( AT_PLAIN, "$p is too heavy for you to carry with your current inventory.", auction->buyer, auction->item, NULL, TO_CHAR );
              act( AT_PLAIN, "$n is carrying too much to also carry $p, and $e drops it.", auction->buyer, auction->item, NULL, TO_ROOM );
              obj_to_room( auction->item, auction->buyer->in_room );
            }
          else
	    {
	      obj_to_char( auction->item, auction->buyer );
	    }

          pay = (int)auction->bet * 0.9;
          tax = (int)auction->bet * 0.1;
          boost_economy( auction->seller->in_room->area, tax );
          auction->seller->gold += pay; /* give him the money, tax 10 % */
          sprintf(buf, "The auctioneer pays you %d gold, charging an auction fee of %d.\r\n",
		  pay, tax);
          send_to_char(buf, auction->seller);
          auction->item = NULL; /* reset item */

          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
            {
              save_char_obj( auction->buyer );
              save_char_obj( auction->seller );
            }
        }
      else /* not sold */
        {
          sprintf (buf, "No bids received for %s - object has been removed from auction\r\n.",
		   auction->item->short_descr);
          talk_auction(buf);
          act (AT_ACTION, "The auctioneer appears before you to return $p to you.",
               auction->seller,auction->item,NULL,TO_CHAR);
          act (AT_ACTION, "The auctioneer appears before $n to return $p to $m.",
               auction->seller,auction->item,NULL,TO_ROOM);

          if ( (auction->seller->carry_weight
                + get_obj_weight( auction->item ))
               > GetCarryCapacityWeight( auction->seller ) )
            {
              act( AT_PLAIN, "You drop $p as it is just too much to carry"
                   " with everything else you're carrying.", auction->seller,
                   auction->item, NULL, TO_CHAR );
              act( AT_PLAIN, "$n drops $p as it is too much extra weight"
                   " for $m with everything else.", auction->seller,
                   auction->item, NULL, TO_ROOM );
              obj_to_room( auction->item, auction->seller->in_room );
            }
          else
	    {
	      obj_to_char (auction->item,auction->seller);
	    }

          tax = (int)auction->item->cost * 0.05;
          boost_economy( auction->seller->in_room->area, tax );
          sprintf(buf, "The auctioneer charges you an auction fee of %d.\r\n", tax );
          send_to_char(buf, auction->seller);

          if ((auction->seller->gold - tax) < 0)
	    {
	      auction->seller->gold = 0;
	    }
          else
	    {
	      auction->seller->gold -= tax;
	    }

          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
	    {
	      save_char_obj( auction->seller );
	    }
        }

      auction->item = NULL;
    }
}
