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

  if ( ( spaceobject = ship->Spaceobject ) == NULL )
    {
      return;
    }

  AllocateMemory( missile, Missile, 1 );
  LINK( missile, FirstMissile, LastMissile, Next, Previous );

  missile->Target = target;
  missile->FiredFrom = ship;

  if ( firedBy )
    {
      missile->FiredBy = CopyString( firedBy->Name );
    }
  else
    {
      missile->FiredBy = CopyString( "" );
    }

  missile->Type = missiletype;
  missile->Age =0;

  if ( missile->Type == HEAVY_BOMB )
    {
      missile->Speed = 20;
    }
  else if ( missile->Type == PROTON_TORPEDO )
    {
      missile->Speed = 200;
    }
  else if ( missile->Type == CONCUSSION_MISSILE )
    {
      missile->Speed = 300;
    }
  else
    {
      missile->Speed = 50;
    }

  CopyVector( &missile->Position, &ship->Position );
  missile->Spaceobject = spaceobject;
}

void ExtractMissile( Missile *missile )
{
  if ( missile == NULL )
    {
      return;
    }

  UNLINK( missile, FirstMissile, LastMissile, Next, Previous );

  if (  missile->FiredBy )
    {
      FreeMemory( missile->FiredBy );
    }

  FreeMemory( missile );
}

bool UpdateMissile( Missile *missile, void *unused )
{
  Ship *ship = missile->FiredFrom;
  Ship *target = missile->Target;

  if ( target->Spaceobject && IsMissileInRange( ship, missile ) )
    {
      SetMissileCourseTowardsShip( missile, target );
      MoveMissile( missile );

      if ( GetMissileDistanceToShip( missile, target ) <= 20 )
	{
	  if ( target->Defenses.ChaffReleased <= 0)
	    {
	      bool ch_found = false;
	      Character *ch = NULL;
	      char buf[MAX_STRING_LENGTH];

	      EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Gunseat),
			  "Your missile hits its target dead on!" );
	      EchoToCockpit( AT_BLOOD, target,
			     "The ship is hit by a missile.");
	      EchoToShip( AT_RED, target,
			  "A loud explosion shakes thee ship violently!" );
	      sprintf( buf, "You see a small explosion as %s is hit by a missile", target->Name );
	      EchoToNearbyShips( AT_ORANGE, target, buf, ship );

	      for ( ch = first_char; ch; ch = ch->Next )
		{
		  if ( !IsNpc( ch ) && NiftyIsName( missile->FiredBy, ch->Name ) )
		    {
		      ch_found = true;
		      DamageShip( target, 30 + missile->Type * missile->Type * 30, 50 + missile->Type * missile->Type * missile->Type * 50, ch, NULL );
		    }
		}

	      if ( !ch_found )
		{
		  DamageShip( target, 20+missile->Type*missile->Type*20 ,
			      30+missile->Type*missile->Type*ship->Type*30, NULL, ship );
		}

	      ExtractMissile( missile );
	    }
	  else
	    {
	      EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Gunseat), "Your missile explodes harmlessly in a cloud of chaff!" );
	      EchoToCockpit( AT_YELLOW, target, "A missile explodes in your chaff.");
	      ExtractMissile( missile );
	    }

	  return true;
	}
      else
	{
	  missile->Age++;

	  if (missile->Age >= 50)
	    {
	      ExtractMissile( missile );
	      return true;
	    }
	}
    }
  else
    {
      missile->Age++;
      
      if (missile->Age >= 50)
	{
	  ExtractMissile( missile );
	}
    }

  return true;
}
