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
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <time.h>
#include <ctype.h>
#include "mud.h"
#include "ships.h"
#include "character.h"

/*
 * Dummy function
 */
void skill_notfound( Character *ch, char *argument )
{
  send_to_char( "Huh?\r\n", ch );
}

extern char *spell_target_name;       /* from magic.c */

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
bool check_skill( Character *ch, const char *command, char *argument )
{
  int sn = 0;
  int first = gsn_first_skill;
  int top   = gsn_first_weapon-1;
  struct timeval time_used;
  int mana = 0;

  /* bsearch for the skill */
  for (;;)
    {
      sn = (first + top) >> 1;

      if ( LOWER(command[0]) == LOWER(skill_table[sn]->name[0])
           &&  !str_prefix(command, skill_table[sn]->name)
           &&  (skill_table[sn]->skill_fun || skill_table[sn]->spell_fun != spell_null)
           &&  (IsNpc(ch)
                ||  ( ch->pcdata->learned[sn] > 0 )) )
	{
	  break;
	}

      if (first >= top)
	{
	  return false;
	}

      if (strcasecmp( command, skill_table[sn]->name) < 1)
	{
	  top = sn - 1;
	}
      else
	{
	  first = sn + 1;
	}
    }

  if ( !check_pos( ch, skill_table[sn]->minimum_position ) )
    {
      return true;
    }

  if ( IsNpc(ch)
       && (is_affected_by( ch, AFF_CHARM ) || is_affected_by( ch, AFF_POSSESS )) )
    {
      send_to_char( "For some reason, you seem unable to perform that...\r\n", ch );
      act( AT_GREY,"$n looks around.", ch, NULL, NULL, TO_ROOM );
      return true;
    }

  /* check if mana is required */
  if ( skill_table[sn]->min_mana )
    {
      mana = IsNpc(ch) ? 0 : skill_table[sn]->min_mana;

      if ( !IsNpc(ch) && ch->mana < mana )
        {
          send_to_char( "You need to rest before using the Force any more.\r\n", ch );
          return true;
        }
    }
  else
    {
      mana = 0;
    }

  /*
   * Is this a real do-fun, or a really a spell?
   */
  if ( !skill_table[sn]->skill_fun )
    {
      ch_ret retcode = rNONE;
      void *vo = NULL;
      Character *victim = NULL;
      OBJ_DATA *obj = NULL;

      spell_target_name = "";

      switch ( skill_table[sn]->target )
        {
        default:
          bug( "Check_skill: bad target for sn %d.", sn );
          send_to_char( "Something went wrong...\r\n", ch );
          return true;

        case TAR_IGNORE:
          vo = NULL;
          if ( argument[0] == '\0' )
            {
              if ( (victim=who_fighting(ch)) != NULL )
		{
		  spell_target_name = victim->name;
		}
            }
          else
	    {
	      spell_target_name = argument;
	    }
          break;

        case TAR_CHAR_OFFENSIVE:
          if ( argument[0] == '\0'
               && (victim=who_fighting(ch)) == NULL )
            {
              ch_printf( ch, "%s who?\r\n", capitalize( skill_table[sn]->name ) );
              return true;
            }
          else  if ( argument[0] != '\0'
		     && (victim=get_char_room(ch, argument)) == NULL )
	    {
	      send_to_char( "They aren't here.\r\n", ch );
	      return true;
	    }

          if ( is_safe( ch, victim ) )
	    {
	      return true;
	    }

          vo = (void *) victim;
          break;

        case TAR_CHAR_DEFENSIVE:
          if ( argument[0] != '\0'
               &&  (victim=get_char_room(ch, argument)) == NULL )
            {
              send_to_char( "They aren't here.\r\n", ch );
              return true;
            }

          if ( !victim )
	    {
	      victim = ch;
	    }

          vo = (void *) victim;
          break;

        case TAR_CHAR_SELF:
          vo = (void *) ch;
          break;

        case TAR_OBJ_INV:
          if ( (obj=get_obj_carry(ch, argument)) == NULL )
            {
              send_to_char( "You can't find that.\r\n", ch );
              return true;
            }

          vo = (void *) obj;
          break;
        }

      /* waitstate */
      set_wait_state( ch, skill_table[sn]->beats );

      /* check for failure */
      if ( (number_percent( ) + skill_table[sn]->difficulty * 5)
           > (IsNpc(ch) ? 75 : ch->pcdata->learned[sn]) )
        {
          failed_casting( skill_table[sn], ch, vo, obj );
          learn_from_failure( ch, sn );

          if ( mana )
            {
              ch->mana -= mana/2;
            }

          return true;
        }

      if ( mana )
        {
          ch->mana -= mana;
        }

      start_timer(&time_used);
      retcode = skill_table[sn]->spell_fun( sn, ch->top_level, ch, vo );
      end_timer(&time_used);
      update_userec(&time_used, &skill_table[sn]->userec);

      if ( retcode == rCHAR_DIED || retcode == rERROR )
	{
	  return true;
	}

      if ( char_died(ch) )
	{
	  return true;
	}

      if ( retcode == rSPELL_FAILED )
        {
          learn_from_failure( ch, sn );
          retcode = rNONE;
        }
      else
	{
	  learn_from_success( ch, sn );
	}

      if ( skill_table[sn]->target == TAR_CHAR_OFFENSIVE
           && victim != ch
           && !char_died(victim) )
        {
          Character *vch = NULL;
          Character *vch_next = NULL;

          for ( vch = ch->in_room->first_person; vch; vch = vch_next )
            {
              vch_next = vch->next_in_room;

              if ( victim == vch && !victim->fighting && victim->master != ch )
                {
                  retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
                  break;
                }
            }
        }

      return true;
    }

  if ( mana )
    {
      ch->mana -= mana;
    }

  ch->prev_cmd = ch->last_cmd;    /* haus, for automapping */
  ch->last_cmd = skill_table[sn]->skill_fun;
  start_timer(&time_used);
  skill_table[sn]->skill_fun( ch, argument );
  end_timer(&time_used);
  update_userec(&time_used, &skill_table[sn]->userec);

  return true;
}

void learn_from_success( Character *ch, int sn )
{
  int adept = 0;
  int gain = 0;
  int sklvl = 0;
  int learn = 0;
  int percent = 0;
  int learn_chance = 0;

  if ( IsNpc(ch) || ch->pcdata->learned[sn] <= 0 )
    {
      return;
    }

  if ( sn == skill_lookup( "meditate" ) && !is_jedi( ch ) )
    {
      if ( ch->pcdata->learned[sn] < 50 )
	{
	  gain_exp( ch, FORCE_ABILITY, 25 );
	}
    }

  sklvl = skill_table[sn]->min_level;

  if (skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
    {
      return;
    }

  adept = ( get_level(ch, skill_table[sn]->guild ) - skill_table[sn]->min_level )* 5 + 50;
  adept = UMIN(adept, 100);

  if ( ch->pcdata->learned[sn] >= adept )
    {
      return;
    }

  if ( sklvl == 0 || sklvl > get_level( ch, skill_table[sn]->guild ) )
    {
      sklvl = get_level( ch, skill_table[sn]->guild );
    }

  if ( ch->pcdata->learned[sn] < 100 )
    {
      learn_chance = ch->pcdata->learned[sn] + (5 * skill_table[sn]->difficulty);
      percent = number_percent();

      if ( percent >= learn_chance )
	{
	  learn = 2;
	}
      else if ( learn_chance - percent > 25 )
	{
	  return;
	}
      else
	{
	  learn = 1;
	}

      ch->pcdata->learned[sn] = UMIN( adept, ch->pcdata->learned[sn] + learn );

      if ( ch->pcdata->learned[sn] == 100 )      /* fully learned! */
        {
          gain = 50 * sklvl;
          set_char_color( AT_WHITE, ch );
          ch_printf( ch, "You are now an adept of %s! You gain %d bonus experience!\r\n",
                     skill_table[sn]->name, gain );
        }
      else
        {
          gain = 10 * sklvl;

          if ( !ch->fighting && sn != gsn_hide && sn != gsn_sneak )
            {
              set_char_color( AT_WHITE, ch );
              ch_printf( ch, "You gain %d experience points from your success!\r\n", gain );
            }
        }

      gain_exp( ch, skill_table[sn]->guild, gain );
    }
}


void learn_from_failure( Character *ch, int sn )
{

}

/*
 * Disarm a creature.
 * Caller must check for successful attack.
 * Check for loyalty flag (weapon disarms to inventory) for pkillers -Blodkai
 */
void disarm( Character *ch, Character *victim )
{
  OBJ_DATA *obj = NULL;
  OBJ_DATA *tmpobj = NULL;

  if ( ( obj = get_eq_char( victim, WEAR_WIELD ) ) == NULL )
    {
      return;
    }

  if ( ( tmpobj = get_eq_char( victim, WEAR_DUAL_WIELD ) ) != NULL
       && number_bits( 1 ) == 0 )
    {
      obj = tmpobj;
    }

  if ( get_eq_char( ch, WEAR_WIELD ) == NULL
       && number_bits( 1 ) == 0 )
    {
      learn_from_failure( ch, gsn_disarm );
      return;
    }

  if ( IsNpc( ch ) && !can_see_obj( ch, obj )
       && number_bits( 1 ) == 0)
    {
      learn_from_failure( ch, gsn_disarm );
      return;
    }

  if ( check_grip( ch, victim ) )
    {
      learn_from_failure( ch, gsn_disarm );
      return;
    }

  act( AT_SKILL, "$n DISARMS you!", ch, NULL, victim, TO_VICT    );
  act( AT_SKILL, "You disarm $N!",  ch, NULL, victim, TO_CHAR    );
  act( AT_SKILL, "$n disarms $N!",  ch, NULL, victim, TO_NOTVICT );
  learn_from_success( ch, gsn_disarm );

  if ( obj == get_eq_char( victim, WEAR_WIELD )
       &&  (tmpobj = get_eq_char( victim, WEAR_DUAL_WIELD)) != NULL )
    {
      tmpobj->wear_loc = WEAR_WIELD;
    }

  obj_from_char( obj );
  obj_to_room( obj, victim->in_room );
}

/*
 * Trip a creature.
 * Caller must check for successful attack.
 */
void trip( Character *ch, Character *victim )
{
  if ( is_affected_by( victim, AFF_FLYING )
       ||   is_affected_by( victim, AFF_FLOATING ) )
    {
      return;
    }

  if ( victim->mount )
    {
      if ( is_affected_by( victim->mount, AFF_FLYING )
           || is_affected_by( victim->mount, AFF_FLOATING ) )
	{
	  return;
	}

      act( AT_SKILL, "$n trips your mount and you fall off!", ch, NULL, victim, TO_VICT    );
      act( AT_SKILL, "You trip $N's mount and $N falls off!", ch, NULL, victim, TO_CHAR    );
      act( AT_SKILL, "$n trips $N's mount and $N falls off!", ch, NULL, victim, TO_NOTVICT );
      REMOVE_BIT( victim->mount->act, ACT_MOUNTED );
      victim->mount = NULL;
      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      set_wait_state( victim, 2 * PULSE_VIOLENCE );
      victim->position = POS_RESTING;
      return;
    }

  if ( victim->wait == 0 )
    {
      act( AT_SKILL, "$n trips you and you go down!", ch, NULL, victim, TO_VICT    );
      act( AT_SKILL, "You trip $N and $N goes down!", ch, NULL, victim, TO_CHAR    );
      act( AT_SKILL, "$n trips $N and $N goes down!", ch, NULL, victim, TO_NOTVICT );

      set_wait_state( ch,     2 * PULSE_VIOLENCE );
      set_wait_state( victim, 2 * PULSE_VIOLENCE );
      victim->position = POS_RESTING;
    }
}

bool permsneak( const Character *ch )
{
  switch(ch->race)
    {
    case RACE_SHISTAVANEN:
      return true;

    case RACE_DEFEL:
      return true;

    case RACE_BOTHAN:
      return true;

    case RACE_TOGORIAN:
      return true;

    case RACE_DUG:
      return true;

    case RACE_COYNITE:
      return true;

    default:
      return false;
    }

  return false;
}

/*
 * Check for parry.
 */
bool check_parry( Character *ch, Character *victim )
{
  int chances = 0;
  OBJ_DATA *wield = NULL;

  if ( !is_awake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !IS_SET(victim->defenses, DFND_PARRY) )
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      chances = UMIN( 60, get_level( victim, COMBAT_ABILITY ) );
    }
  else
    {
      if ( ( wield = get_eq_char( victim, WEAR_WIELD ) ) == NULL ||
           ( wield->value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER ) )
        {
          if ( ( wield = get_eq_char( victim, WEAR_DUAL_WIELD ) ) == NULL ||
               ( wield->value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER ) )
	    {
	      return false;
	    }
        }

      chances = (int) (victim->pcdata->learned[gsn_parry] );
    }

  chances = URANGE ( 10 , chances , 90 );

  if ( number_range( 1, 100 ) > chances )
    {
      learn_from_failure( victim, gsn_parry );
      return false;
    }

  if ( !IsNpc(victim)
       && !IS_SET( victim->pcdata->flags, PCFLAG_GAG) ) /*SB*/
    {
      act( AT_SKILL, "You parry $n's attack.",  ch, NULL, victim, TO_VICT    );
    }

  if ( !IsNpc(ch)
       && !IS_SET( ch->pcdata->flags, PCFLAG_GAG) )  /* SB */
    {
      act( AT_SKILL, "$N parries your attack.", ch, NULL, victim, TO_CHAR    );
    }

  learn_from_success( victim, gsn_parry );
  return true;
}

/*
 * Check for dodge.
 */
bool check_dodge( Character *ch, Character *victim )
{
  int chances = 0;

  if ( !is_awake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !IS_SET(victim->defenses, DFND_DODGE) )
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      chances  = UMIN( 60, victim->top_level );
    }
  else
    {
      chances  = (int) (victim->pcdata->learned[gsn_dodge] / 2);
    }

  chances += 5*(GetCurrentDexterity(victim) - 20);

  if ( number_range( 1, 100 ) > chances )
    {
      learn_from_failure( victim, gsn_dodge );
      return false;
    }

  if ( !IsNpc(victim) && !IS_SET( victim->pcdata->flags, PCFLAG_GAG) )
    {
      act( AT_SKILL, "You dodge $n's attack.", ch, NULL, victim, TO_VICT    );
    }

  if ( !IsNpc(ch) && !IS_SET( ch->pcdata->flags, PCFLAG_GAG) )
    {
      act( AT_SKILL, "$N dodges your attack.", ch, NULL, victim, TO_CHAR    );
    }

  learn_from_success( victim, gsn_dodge );
  return true;
}

bool check_grip( Character *ch, Character *victim )
{
  int grip_chance = 0;

  if ( !is_awake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !IS_SET(victim->defenses, DFND_GRIP) )
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      grip_chance  = UMIN( 60, 2 * victim->top_level );
    }
  else
    {
      grip_chance  = (int) (victim->pcdata->learned[gsn_grip] / 2);
    }

  /* Consider luck as a factor */
  grip_chance += (2 * (GetCurrentLuck(victim) - 13 ) );

  if ( number_percent( ) >= grip_chance + victim->top_level - ch->top_level )
    {
      learn_from_failure( victim, gsn_grip );
      return false;
    }

  act( AT_SKILL, "You evade $n's attempt to disarm you.", ch, NULL, victim, TO_VICT    );
  act( AT_SKILL, "$N holds $S weapon strongly, and is not disarmed.",
       ch, NULL, victim, TO_CHAR    );
  learn_from_success( victim, gsn_grip );
  return true;
}
