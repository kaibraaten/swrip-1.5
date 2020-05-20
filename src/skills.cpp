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

#include <cstdio>
#include <cstring>
#ifndef _WIN32
#include <strings.h>
#endif
#include <cctype>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

/*
 * Dummy function
 */
void skill_notfound( Character *ch, std::string argument )
{
  ch->Echo( "Huh?\r\n" );
}

/*
 * Disarm a creature.
 * Caller must check for successful attack.
 * Check for loyalty flag (weapon disarms to inventory) for pkillers -Blodkai
 */
void Disarm( Character *ch, Character *victim )
{
  Object *obj = NULL;
  Object *tmpobj = NULL;

  if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) == NULL )
    {
      return;
    }

  if ( ( tmpobj = GetEquipmentOnCharacter( victim, WEAR_DUAL_WIELD ) ) != NULL
       && NumberBits( 1 ) == 0 )
    {
      obj = tmpobj;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_WIELD ) == NULL
       && NumberBits( 1 ) == 0 )
    {
      LearnFromFailure( ch, gsn_disarm );
      return;
    }

  if ( IsNpc( ch ) && !CanSeeObject( ch, obj )
       && NumberBits( 1 ) == 0)
    {
      LearnFromFailure( ch, gsn_disarm );
      return;
    }

  if ( CheckGrip( ch, victim ) )
    {
      LearnFromFailure( ch, gsn_disarm );
      return;
    }

  Act( AT_SKILL, "$n DISARMS you!", ch, NULL, victim, TO_VICT    );
  Act( AT_SKILL, "You disarm $N!",  ch, NULL, victim, TO_CHAR    );
  Act( AT_SKILL, "$n disarms $N!",  ch, NULL, victim, TO_NOTVICT );
  LearnFromSuccess( ch, gsn_disarm );

  if ( obj == GetEquipmentOnCharacter( victim, WEAR_WIELD )
       &&  (tmpobj = GetEquipmentOnCharacter( victim, WEAR_DUAL_WIELD)) != NULL )
    {
      tmpobj->WearLoc = WEAR_WIELD;
    }

  ObjectFromCharacter( obj );
  ObjectToRoom( obj, victim->InRoom );
}

/*
 * Trip a creature.
 * Caller must check for successful attack.
 */
void Trip( Character *ch, Character *victim )
{
    if ( IsAffectedBy( victim, Flag::Affect::Flying)
         || IsAffectedBy( victim, Flag::Affect::Floating))
    {
      return;
    }

  if ( victim->Mount )
    {
        if ( IsAffectedBy( victim->Mount, Flag::Affect::Flying)
             || IsAffectedBy( victim->Mount, Flag::Affect::Floating))
	{
	  return;
	}

      Act( AT_SKILL, "$n trips your mount and you fall off!", ch, NULL, victim, TO_VICT    );
      Act( AT_SKILL, "You trip $N's mount and $N falls off!", ch, NULL, victim, TO_CHAR    );
      Act( AT_SKILL, "$n trips $N's mount and $N falls off!", ch, NULL, victim, TO_NOTVICT );
      RemoveBit( victim->Mount->Flags, ACT_MOUNTED );
      victim->Mount = NULL;
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, 2 * PULSE_VIOLENCE );
      victim->Position = POS_RESTING;
      return;
    }

  if ( victim->Wait == 0 )
    {
      Act( AT_SKILL, "$n trips you and you go down!", ch, NULL, victim, TO_VICT    );
      Act( AT_SKILL, "You trip $N and $N goes down!", ch, NULL, victim, TO_CHAR    );
      Act( AT_SKILL, "$n trips $N and $N goes down!", ch, NULL, victim, TO_NOTVICT );

      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, 2 * PULSE_VIOLENCE );
      victim->Position = POS_RESTING;
    }
}

/*
 * Check for parry.
 */
bool CheckParry( Character *ch, Character *victim )
{
  int chances = 0;
  Object *wield = NULL;

  if ( !IsAwake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !victim->DefenseFlags.test(Flag::Defense::Parry))
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      chances = umin( 60, GetAbilityLevel( victim, COMBAT_ABILITY ) );
    }
  else
    {
      if ( ( wield = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) == NULL ||
           ( wield->Value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER ) )
        {
          if ( ( wield = GetEquipmentOnCharacter( victim, WEAR_DUAL_WIELD ) ) == NULL ||
               ( wield->Value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER ) )
	    {
	      return false;
	    }
        }

      chances = (int) (victim->PCData->Learned[gsn_parry] );
    }

  chances = urange ( 10 , chances , 90 );

  if ( GetRandomNumberFromRange( 1, 100 ) > chances )
    {
      LearnFromFailure( victim, gsn_parry );
      return false;
    }

  if ( !IsNpc(victim)
       && !victim->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      Act( AT_SKILL, "You parry $n's attack.",  ch, NULL, victim, TO_VICT    );
    }

  if ( !IsNpc(ch)
       && !ch->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      Act( AT_SKILL, "$N parries your attack.", ch, NULL, victim, TO_CHAR    );
    }

  LearnFromSuccess( victim, gsn_parry );
  return true;
}

/*
 * Check for dodge.
 */
bool CheckDodge( Character *ch, Character *victim )
{
  int chances = 0;

  if ( !IsAwake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !victim->DefenseFlags.test(Flag::Defense::Dodge))
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      chances  = umin( 60, victim->TopLevel );
    }
  else
    {
      chances  = (int) (victim->PCData->Learned[gsn_dodge] / 2);
    }

  chances += 5*(GetCurrentDexterity(victim) - 20);

  if ( GetRandomNumberFromRange( 1, 100 ) > chances )
    {
      LearnFromFailure( victim, gsn_dodge );
      return false;
    }

  if ( !IsNpc(victim)
       && !victim->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      Act( AT_SKILL, "You dodge $n's attack.", ch, NULL, victim, TO_VICT    );
    }

  if ( !IsNpc(ch)
       && !ch->PCData->Flags.test( Flag::PCData::Gag ) )
    {
      Act( AT_SKILL, "$N dodges your attack.", ch, NULL, victim, TO_CHAR    );
    }

  LearnFromSuccess( victim, gsn_dodge );
  return true;
}

bool CheckGrip( Character *ch, Character *victim )
{
  int grip_chance = 0;

  if ( !IsAwake(victim) )
    {
      return false;
    }

  if ( IsNpc(victim) && !victim->DefenseFlags.test(Flag::Defense::Grip))
    {
      return false;
    }

  if ( IsNpc(victim) )
    {
      grip_chance  = umin( 60, 2 * victim->TopLevel );
    }
  else
    {
      grip_chance  = (int) (victim->PCData->Learned[gsn_grip] / 2);
    }

  /* Consider luck as a factor */
  grip_chance += (2 * (GetCurrentLuck(victim) - 13 ) );

  if ( GetRandomPercent() >= grip_chance + victim->TopLevel - ch->TopLevel )
    {
      LearnFromFailure( victim, gsn_grip );
      return false;
    }

  Act( AT_SKILL, "You evade $n's attempt to disarm you.", ch, NULL, victim, TO_VICT    );
  Act( AT_SKILL, "$N holds $S weapon strongly, and is not disarmed.",
       ch, NULL, victim, TO_CHAR    );
  LearnFromSuccess( victim, gsn_grip );
  return true;
}

