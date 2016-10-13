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

#include "missile.h"
#include "mud.h"
#include "vector3_aux.h"
#include "ship.h"
#include "character.h"

Missile *FirstMissile = NULL;
Missile *LastMissile = NULL;

void NewMissile( Ship *ship, Ship *target, Character *firedBy, int missiletype )
{
  Spaceobject *spaceobject = NULL;
  Missile *missile = NULL;

  if ( ship  == NULL )
    {
      return;
    }

  if ( target  == NULL )
    {
      return;
    }

  if ( ( spaceobject = ship->spaceobject ) == NULL )
    {
      return;
    }

  AllocateMemory( missile, Missile, 1 );
  LINK( missile, FirstMissile, LastMissile, next, prev );

  missile->target = target;
  missile->fired_from = ship;

  if ( firedBy )
    {
      missile->fired_by = CopyString( firedBy->Name );
    }
  else
    {
      missile->fired_by = CopyString( "" );
    }

  missile->missiletype = missiletype;
  missile->age =0;

  if ( missile->missiletype == HEAVY_BOMB )
    {
      missile->speed = 20;
    }
  else if ( missile->missiletype == PROTON_TORPEDO )
    {
      missile->speed = 200;
    }
  else if ( missile->missiletype == CONCUSSION_MISSILE )
    {
      missile->speed = 300;
    }
  else
    {
      missile->speed = 50;
    }

  CopyVector( &missile->pos, &ship->pos );
  missile->spaceobject = spaceobject;
}

void ExtractMissile( Missile *missile )
{
  Spaceobject *spaceobject = NULL;

  if ( missile == NULL )
    {
      return;
    }

  if ( ( spaceobject = missile->spaceobject ) != NULL )
    {
      missile->spaceobject = NULL;
    }

  UNLINK( missile, FirstMissile, LastMissile, next, prev );

  missile->target = NULL;
  missile->fired_from = NULL;

  if (  missile->fired_by )
    {
      FreeMemory( missile->fired_by );
    }

  FreeMemory( missile );
}

bool UpdateMissile( Missile *missile, void *unused )
{
  Ship *ship = missile->fired_from;
  Ship *target = missile->target;

  if ( target->spaceobject && IsMissileInRange( ship, missile ) )
    {
      SetMissileCourseTowardsShip( missile, target );
      MoveMissile( missile );

      if ( GetMissileDistanceToShip( missile, target ) <= 20 )
	{
	  if ( target->chaff_released <= 0)
	    {
	      bool ch_found = false;
	      Character *ch = NULL;
	      char buf[MAX_STRING_LENGTH];

	      EchoToRoom( AT_YELLOW, GetRoom(ship->room.gunseat),
			  "Your missile hits its target dead on!" );
	      EchoToCockpit( AT_BLOOD, target,
			     "The ship is hit by a missile.");
	      EchoToShip( AT_RED, target,
			  "A loud explosion shakes thee ship violently!" );
	      sprintf( buf, "You see a small explosion as %s is hit by a missile", target->Name );
	      EchoToNearbyShips( AT_ORANGE, target, buf, ship );

	      for ( ch = first_char; ch; ch = ch->next )
		{
		  if ( !IsNpc( ch ) && NiftyIsName( missile->fired_by, ch->Name ) )
		    {
		      ch_found = true;
		      DamageShip( target, 30 + missile->missiletype * missile->missiletype * 30, 50 + missile->missiletype * missile->missiletype * missile->missiletype * 50, ch, NULL );
		    }
		}

	      if ( !ch_found )
		{
		  DamageShip( target, 20+missile->missiletype*missile->missiletype*20 ,
			      30+missile->missiletype*missile->missiletype*ship->missiletype*30, NULL, ship );
		}

	      ExtractMissile( missile );
	    }
	  else
	    {
	      EchoToRoom( AT_YELLOW , GetRoom(ship->room.gunseat), "Your missile explodes harmlessly in a cloud of chaff!" );
	      EchoToCockpit( AT_YELLOW, target, "A missile explodes in your chaff.");
	      ExtractMissile( missile );
	    }

	  return true;
	}
      else
	{
	  missile->age++;

	  if (missile->age >= 50)
	    {
	      ExtractMissile( missile );
	      return true;
	    }
	}
    }
  else
    {
      missile->age++;
      
      if (missile->age >= 50)
	{
	  ExtractMissile( missile );
	}
    }

  return true;
}
