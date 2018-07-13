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

#include <cctype>
#include <cstring>
#include <cassert>
#include "ship.h"
#include "mud.h"
#include "vector3_aux.h"
#include "character.h"
#include "turret.h"
#include "missile.h"
#include "clan.h"
#include "skill.h"
#include "spaceobject.h"
#include "area.h"
#include "script.h"
#include <utility/repositorybase.hpp>

Repository *ShipRepository = NULL;

static int baycount = 0;

static void ApproachLandingSite( Ship *ship, const char *arg );
static void LandShip( Ship *ship, const char *arg );
static void LaunchShip( Ship *ship );
static void MakeDebris( const Ship *ship );
static bool CaughtInGravity( const Ship *ship, const Spaceobject *space);
static bool WillCollideWithSun( const Ship *ship, const Spaceobject *sun );
static void EvadeCollisionWithSun( Ship *ship, const Spaceobject *sun );
static bool ShipHasState( const Ship *ship, ShipState state );
static void DockShip( Character *ch, Ship *ship );
static void ReadyShipAfterLoad( Ship *ship );

static bool WillCollideWithSun( const Ship *ship, const Spaceobject *sun )
{
  if ( sun->Name
       && StrCmp( sun->Name, "" )
       && GetShipDistanceToSpaceobject( ship, sun ) < 10 )
    {
      return true;
    }

  return false;
}

static bool ShipHasState( const Ship *ship, ShipState state )
{
  return ship->State == state;
}

bool IsShipInHyperspace( const Ship *ship )
{
  return ShipHasState( ship, SHIP_HYPERSPACE );
}

bool IsShipDisabled( const Ship *ship )
{
  return ShipHasState( ship, SHIP_DISABLED );
}

static void EvadeCollisionWithSun( Ship *ship, const Spaceobject *sun )
{
  ship->Heading.x = 10 * ship->Position.x;
  ship->Heading.y = 10 * ship->Position.y;
  ship->Heading.z = 10 * ship->Position.z;
  ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
  ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;
  EchoToRoom( AT_RED , GetRoom(ship->Rooms.Pilotseat),
		"Automatic Override: Evading to avoid collision with sun!\r\n" );

  if ( ship->Class == FIGHTER_SHIP
       || ( ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50 ) )
    {
      ship->State = SHIP_BUSY_3;
    }
  else if ( ship->Class == MIDSIZE_SHIP
	    || ( ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50 ) )
    {
      ship->State = SHIP_BUSY_2;
    }
  else
    {
      ship->State = SHIP_BUSY;
    }
}

void UpdateShipMovement( void )
{
  ListIterator *shipIter = NULL;
  Spaceobject *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];
  const List *shipList = GetEntities(ShipRepository);

  shipIter = AllocateListIterator(shipList);

  while(ListHasMoreElements(shipIter))
    {
      Ship *ship = (Ship*)GetListData(shipIter);
      MoveToNextListElement(shipIter);

      if ( !ship->Spaceobject )
	{
	  continue;
	}

      if( ship->State == SHIP_LANDED && ship->Spaceobject )
	{
	  ship->State = SHIP_READY;
	}

      if ( ship->State != SHIP_LAND && ship->State != SHIP_LAND_2)
        {
          MoveShip( ship );
        }

      /*
       * Tractor beam handling
       */
      if ( ship->TractoredBy )
        {
          /* Tractoring ship is smaller and therefore moves towards target */
          if( ship->TractoredBy->Class <= ship->Class )
            {
              ship->TractoredBy->Thrusters.Speed.Current = ship->TractoredBy->WeaponSystems.TractorBeam.Strength / 4;
              SetShipCourseTowardsShip( ship->TractoredBy, ship );

	      if( GetShipDistanceToShip( ship, ship->TractoredBy ) < 10 )
                {
                  CopyVector( &ship->TractoredBy->Position, &ship->Position );
                }
            }

          /* Target is smaller and therefore pulled to target */
          if ( ship->TractoredBy->Class > ship->Class )
            {
              ship->Thrusters.Speed.Current = ship->TractoredBy->WeaponSystems.TractorBeam.Strength / 4;
              SetShipCourseTowardsShip( ship, ship->TractoredBy );

              if( GetShipDistanceToShip( ship, ship->TractoredBy ) < 10 )
                {
                  CopyVector( &ship->Position, &ship->TractoredBy->Position );
                }
            }
        }

      if ( IsShipAutoflying(ship) )
	{
	  continue;
	}

      for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
        {
          if ( spaceobj->Type == SPACE_SUN
	       && WillCollideWithSun( ship, spaceobj ) )
            {
	      EvadeCollisionWithSun( ship, spaceobj );
            }

          if ( ship->Thrusters.Speed.Current > 0 )
            {
              if ( spaceobj->Type >= SPACE_PLANET
                   && spaceobj->Name && StrCmp(spaceobj->Name,"")
                   && GetShipDistanceToSpaceobject( ship, spaceobj ) < 10 )
                {
                  sprintf( buf, "You begin orbitting %s.", spaceobj->Name);
                  EchoToCockpit( AT_YELLOW, ship, buf);
                  sprintf( buf, "%s begins orbiting %s.", ship->Name, spaceobj->Name);
                  EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
                  ship->InOrbitOf = spaceobj;
                  ship->Thrusters.Speed.Current = 0;
                }
            }
        }
    }

  FreeListIterator(shipIter);
  shipIter = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(shipIter))
    {
      Ship *ship = (Ship*)GetListData(shipIter);
      MoveToNextListElement(shipIter);

      if ( IsShipInHyperspace( ship ) )
        {
          Vector3 tmp;
          float dist = 0;
	  float origdist = 0;

          ship->Hyperdistance -= ship->Hyperdrive.Speed;

          dist = (float) ship->Hyperdistance;
          origdist = (float) ship->OriginalHyperdistance;

	  if ( dist == 0)
            dist = -1;

          SetVector( &tmp,
                      ship->Position.x - ship->Jump.x,
                      ship->Position.y - ship->Jump.y,
                      ship->Position.z - ship->Jump.z );
          SetVector( &ship->HyperPosition,
                      ship->Position.x - ( tmp.x * ( dist / origdist ) ),
                      ship->Position.y - ( tmp.y * ( dist / origdist ) ),
                      ship->Position.z - ( tmp.z * ( dist / origdist ) ) );

          ship->Count++;

          for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
	    {
	      if( CaughtInGravity( ship, spaceobj ) )
		{
		  int dmg = 0;

		  EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat),
				"Hyperjump complete." );
		  EchoToShip( AT_YELLOW, ship,
				"The ship slams to a halt as it comes out of hyperspace." );
		  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
		  dmg = 15 * GetRandomNumberFromRange( 1, 4 );
		  ship->Defenses.Hull.Current -= dmg;
		  EchoToShip( AT_YELLOW, ship,
				"The hull cracks from the pressure." );
		  CopyVector( &ship->Position, &ship->HyperPosition );
		  ShipToSpaceobject( ship, ship->CurrentJump );
		  ship->CurrentJump = NULL;
		  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
		  ship->State = SHIP_READY;
		  FreeMemory( ship->Home );
		  ship->Home = CopyString( ship->Spaceobject->Name );
		}
	    }

          if ( IsShipInHyperspace( ship )
              && ship->Hyperdistance <= 0
              && !ship->Tracking)
            {
              ship->Count = 0;
              ShipToSpaceobject (ship, ship->CurrentJump);

              if (ship->Spaceobject == NULL)
                {
                  EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {
                  EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
                           ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
                  CopyVector( &ship->HyperPosition, &ship->Position );
                  ShipToSpaceobject( ship, ship->CurrentJump );
                  ship->CurrentJump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->State = SHIP_READY;
                  FreeMemory( ship->Home );
                  ship->Home = CopyString( ship->Spaceobject->Name );
                }
            }
          else if ( ( ship->Count >= (ship->tcount ? ship->tcount : 10 ) )
		    && IsShipInHyperspace( ship )
		    && ship->Tracking == true )
            {
              ShipToSpaceobject(ship, ship->CurrentJump);

              if (ship->Spaceobject == NULL)
		{
                  EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {
                  EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
			   ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
                  CopyVector( &ship->Position, &ship->HyperPosition );
                  ShipToSpaceobject( ship, ship->CurrentJump );
                  ship->CurrentJump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->State = SHIP_READY;
                  FreeMemory( ship->Home );
                  ship->Home = CopyString( ship->Spaceobject->Name );

                  SetVector( &ship->Jump,
                              ship->Position.x + ship->TrackVector.x,
                              ship->Position.y + ship->TrackVector.y,
                              ship->Position.z + ship->TrackVector.z );

                  for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
		    {
		      if( IsSpaceobjectInRange( ship, spaceobj ) )
			{
			  ship->CurrentJump = spaceobj;
			  break;
			}
		    }

                  if( !spaceobj )
		    {
		      ship->CurrentJump = ship->Spaceobject;
		    }

                  ship->Hyperdistance = GetDistanceBetweenVectors( &ship->Position, &ship->Jump ) / 50;
                  ship->OriginalHyperdistance = ship->Hyperdistance;
                  ship->Count = 0;
                  do_radar( ship->Ch, "" );
                }
            }
	  else if ( ship->Count >= 10 && IsShipInHyperspace( ship ) )
            {
              ship->Count = 0;
              sprintf( buf, "%d", ship->Hyperdistance );
              EchoToRoomNoNewline( AT_YELLOW , GetRoom(ship->Rooms.Pilotseat), "Remaining jump distance: " );
              EchoToRoom( AT_WHITE , GetRoom(ship->Rooms.Pilotseat), buf );
            }

	  if( IsShipInHyperspace( ship ) )
	    {
	      if( ship->Count % 2
		  && ship->Hyperdistance < 10 * ship->Hyperdrive.Speed
		  && ship->Hyperdistance > 0 )
		{
		  sprintf( buf,"An alarm sounds. Your hyperjump is ending: %d",
			   ship->Hyperdistance );
		  EchoToShip( AT_RED , ship,  buf );
		}
	    }
        }

      if( ship->Docked )
        {
          Ship *docked = ship->Docked;
          CopyVector( &ship->Position, &docked->Position );
          CopyVector( &ship->HyperPosition, &docked->HyperPosition );
          CopyVector( &ship->OriginPosition, &docked->OriginPosition );
          CopyVector( &ship->Jump, &docked->Jump );
          CopyVector( &ship->Heading, &docked->Heading );

          ship->State = ship->Docked->State;
          ship->Hyperdistance = ship->Docked->Hyperdistance;
          ship->Thrusters.Speed.Current = ship->Docked->Thrusters.Speed.Current;
          ship->OriginalHyperdistance = ship->Docked->OriginalHyperdistance;
          ship->Location = ship->Docked->Location;
          ship->LandingDestination = ship->Docked->LandingDestination;
          ship->Spaceobject = ship->Docked->Spaceobject;
          ship->CurrentJump = ship->Docked->CurrentJump;
        }

      if( ship->Position.x > MAX_COORD)
        ship->Position.x = -MAX_COORD_S;

      if( ship->Position.y > MAX_COORD)
        ship->Position.y = -MAX_COORD_S;

      if( ship->Position.z > MAX_COORD)
        ship->Position.z = -MAX_COORD_S;

      if( ship->Position.x > MAX_COORD)
        ship->Position.x = MAX_COORD_S;

      if( ship->Position.y > MAX_COORD)
        ship->Position.y = MAX_COORD_S;

      if( ship->Position.z > MAX_COORD)
        ship->Position.z = MAX_COORD_S;
    }

  FreeListIterator(shipIter);
}

static void LandShip( Ship *ship, const char *arg )
{
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH];
  vnum_t destination = INVALID_VNUM;
  Character *ch = NULL;
  LandingSite *site = GetLandingSiteFromLocationName( ship->Spaceobject, arg );

  if( site )
    {
      destination = site->Dock;
    }

  if ( target != ship && target != NULL && target->BayOpen
       && ( ship->Class != MIDSIZE_SHIP || target->Class != MIDSIZE_SHIP ) )
    {
      destination = target->Rooms.Hangar;
    }

  if ( !ShipToRoom( ship, destination ) )
    {
      EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Could not complete approach. Landing aborted.");
      EchoToShip( AT_YELLOW, ship , "The ship pulls back up out of its landing sequence.");

      if ( !IsShipDisabled( ship ))
	{
	  ship->State = SHIP_READY;
	}

      return;
    }

  EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Pilotseat), "Landing sequence complete.");
  EchoToShip( AT_YELLOW , ship , "You feel a slight thud as the ship sets down on the ground.");
  sprintf( buf ,"%s disapears from your scanner." , ship->Name  );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );

  if( ship->Ch && ship->Ch->Desc )
    {
      long xp = 0;

      ch = ship->Ch;
      xp =  (GetRequiredXpForLevel( GetAbilityLevel(ch, PILOTING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel(ch, PILOTING_ABILITY)));
      xp = umin( GetShipValue( ship ) , xp );
      GainXP( ch, PILOTING_ABILITY, xp );
      Echo( ch, "&WYou gain %ld points of flight experience!\r\n",
		 umin( GetShipValue( ship ) , xp ) );
      ship->Ch = NULL;
    }

  ship->Location = destination;
  ship->LastDock = ship->Location;

  if (!IsShipDisabled( ship ))
    {
      ship->State = SHIP_LANDED;
    }

  ShipFromSpaceobject(ship, ship->Spaceobject);

  if (ship->WeaponSystems.TractorBeam.Tractoring)
    {
      if (ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy == ship)
	{
	  ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;
	}

      ship->WeaponSystems.TractorBeam.Tractoring = NULL;
    }

  sprintf( buf, "%s lands on the platform.", ship->Name );
  EchoToRoom( AT_YELLOW, GetRoom(ship->Location), buf );

  ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Current - 25 - 25*ship->Class;

  if ( !StrCmp("Public",ship->Owner)
       || !StrCmp("trainer",ship->Owner)
       || ship->Class == SHIP_TRAINER )
    {
      int turret_num = 0;

      ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
      ship->Defenses.Shield.Current = 0;
      ship->AutoRecharge = false;
      ship->AutoTrack = false;
      ship->AutoSpeed = false;
      ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;

      ship->WeaponSystems.Tube.State = MISSILE_READY;
      ship->WeaponSystems.Laser.State = LASER_READY;

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];
	  ResetTurret( turret );
	}

      ship->State = SHIP_LANDED;

      EchoToCockpit( AT_YELLOW, ship, "Repairing and refueling ship..." );
    }

  SaveShip(ship);
}

static void ApproachLandingSite( Ship *ship, const char *arg)
{
  Spaceobject *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  bool found = false;
  Ship *target = NULL;

  for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
    {
      if( IsSpaceobjectInRange( ship, spaceobj ) )
	{
	  found = GetLandingSiteFromLocationName( spaceobj, arg ) ? true : false;
	  break;
	}
    }

  if( found )
    {
      size_t siteNum = 0;

      for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
	{
	  if ( !StringPrefix(arg, spaceobj->LandingSites[siteNum].LocationName) )
	    {
	      strcpy( buf2, spaceobj->LandingSites[siteNum].LocationName);
	      break;
	    }
	}
    }

  target = GetShipInRange( arg, ship );

  if ( target && target != ship && target->BayOpen
       && ( ship->Class != MIDSIZE_SHIP || target->Class != MIDSIZE_SHIP ) )
    {
      strcpy( buf2, target->Name);
    }

  if ( !found && !target )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Pilotseat), "ERROR");
      return;
    }

  sprintf( buf, "Approaching %s.", buf2 );
  EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Pilotseat), buf);
  sprintf( buf, "%s begins its approach to %s.", ship->Name, buf2 );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}

static void CopyPositionToDockedShips(void *element, void *userData)
{
  Ship *ship = (Ship*)userData;
  Ship *target = (Ship*)element;

  if (ship->LastDock == target->Rooms.Hangar)
    {
      CopyVector( &ship->Position, &target->Position );
    }
}

static void LaunchShip( Ship *ship )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  Spaceobject *spaceobject = GetSpaceobjectFromDockVnum( ship->Location );
  int plusminus = 0;

  ShipToSpaceobject( ship, spaceobject );

  if ( !ship->Spaceobject )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Pilotseat) , "Launch path blocked... Launch aborted.");
      EchoToShip( AT_YELLOW , ship , "The ship slowly sets back back down on the landing pad.");
      sprintf( buf ,  "%s slowly sets back down." ,ship->Name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
      ship->State = SHIP_LANDED;
      return;
    }

  ExtractShip(ship);

  ship->Location = INVALID_VNUM;

  if (!IsShipDisabled( ship ))
    {
      ship->State = SHIP_READY;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->Heading.x = 1;
    }
  else
    {
      ship->Heading.x = -1;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->Heading.y = 1;
    }
  else
    {
      ship->Heading.y = -1;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->Heading.z = 1;
    }
  else
    {
      ship->Heading.z = -1;
    }

  if (ship->Spaceobject
      && GetLandingSiteFromVnum( ship->Spaceobject, ship->LastDock ) )
    {
      CopyVector( &ship->Position, &ship->Spaceobject->Position );
    }
  else
    {
      const List *shipList = GetEntities(ShipRepository);
      ForEachInList(shipList, CopyPositionToDockedShips, ship);
    }

  ship->Thrusters.Energy.Current -= (100+100*ship->Class);

  ship->Position.x += (ship->Heading.x * ship->Thrusters.Speed.Current * 2);
  ship->Position.y += (ship->Heading.y * ship->Thrusters.Speed.Current * 2);
  ship->Position.z += (ship->Heading.z * ship->Thrusters.Speed.Current * 2);

  EchoToRoom( AT_GREEN , GetRoom(ship->Location) , "Launch complete.\r\n");
  EchoToShip( AT_YELLOW , ship , "The ship leaves the platform far behind as it flies into space." );
  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
	   ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
  sprintf( buf, "%s lifts off into space.", ship->Name );
  EchoToRoom( AT_YELLOW , GetRoom(ship->LastDock) , buf );
}

static void MakeDebris( const Ship *ship )
{
  Ship *debris = NULL;
  char buf[MAX_STRING_LENGTH];
  int turret_num = 0;

  if ( ship->Class == SHIP_DEBRIS )
    {
      return;
    }

  AllocateMemory( debris, Ship, 1 );

  AddShip(debris);

  debris->Owner       = CopyString( "" );
  debris->CoPilot     = CopyString( "" );
  debris->Pilot       = CopyString( "" );
  debris->Home        = CopyString( "" );
  debris->Type        = SHIP_CIVILIAN;

  if( ship->Type != MOB_SHIP )
    {
      debris->Type          = ship->Type;
    }

  debris->Class      = SHIP_DEBRIS;
  debris->WeaponSystems.Laser.Count = ship->WeaponSystems.Laser.Count;
  debris->WeaponSystems.Tube.Missiles.Current = ship->WeaponSystems.Tube.Missiles.Current;
  debris->WeaponSystems.Tube.Rockets.Current = ship->WeaponSystems.Tube.Rockets.Current;
  debris->WeaponSystems.Tube.Torpedoes.Current = ship->WeaponSystems.Tube.Torpedoes.Current;
  debris->Defenses.Shield.Max   = ship->Defenses.Shield.Max;
  debris->Defenses.Hull.Max     = ship->Defenses.Hull.Max;
  debris->Thrusters.Energy.Max   = ship->Thrusters.Energy.Max;
  debris->Hyperdrive.Speed  = ship->Hyperdrive.Speed;
  debris->Defenses.Chaff.Current       = ship->Defenses.Chaff.Current;
  debris->Thrusters.Speed.Max   = ship->Thrusters.Speed.Max;
  debris->Thrusters.Speed.Current = ship->Thrusters.Speed.Current;
  debris->Thrusters.Maneuver    = ship->Thrusters.Maneuver;

  debris->Defenses.Hull.Current = ship->Defenses.Hull.Max;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      debris->WeaponSystems.Turret[turret_num] = CopyTurret( ship->WeaponSystems.Turret[turret_num], debris );
    }

  strcpy( buf, "Debris of a " );
  strcat( buf, ship->Name );
  debris->Name          = CopyString( "Debris" );
  debris->PersonalName  = CopyString( "Debris" );
  debris->Description   = CopyString( buf );

  ShipToSpaceobject( debris, ship->Spaceobject );
  CopyVector( &debris->Position, &ship->Position );
  CopyVector( &debris->Heading, &ship->Heading );
}

static void DockShip( Character *ch, Ship *ship )
{
  if ( ship->DockingState == SHIP_DISABLED )
    {
      EchoToShip( AT_YELLOW , ship , "Maneuver Aborted. Docking clamps damaged.");
      EchoToShip( AT_YELLOW , ship->Docked, "The ship aborted the docking manuever.");
      ship->Docking = SHIP_READY;
      ship->Docked = NULL;
      return;
    }

  if ( ship->Docked->DockingState == SHIP_DISABLED )
    {
      EchoToShip( AT_YELLOW , ship->Docked , "Maneuver Aborted. Docking clamps damaged.");
      EchoToShip( AT_YELLOW , ship, "The ship aborted the docking manuever.");
      ship->Docking = SHIP_READY;
      ship->Docked = NULL;
      return;
    }

  EchoToShip( AT_YELLOW , ship , "The ship finishing its docking manuevers.");
  EchoToShip( AT_YELLOW , ship->Docked, "The ship finishes its docking manuevers.");

  ship->Docking = SHIP_DOCKED;
  ship->Thrusters.Speed.Current = 0;
  CopyVector( &ship->Position, &ship->Docked->Position );

  if( ch )
    {
      if ( ship->Class == FIGHTER_SHIP )
        {
          LearnFromSuccess( ch, gsn_starfighters );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->Class == MIDSIZE_SHIP )
        {
          LearnFromSuccess( ch, gsn_midships );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->Class == CAPITAL_SHIP )
        {
          LearnFromSuccess( ch, gsn_capitalships );
          LearnFromSuccess( ch, gsn_shipdocking);
        }
    }
}

void TransferShip(Ship *ship, vnum_t destination)
{
  vnum_t origShipyard = INVALID_VNUM;

  if ( !ship )
    {
      return;
    }

  origShipyard = ship->Shipyard;

  ship->Shipyard = destination;
  ship->State = SHIP_READY;

  ExtractShip( ship );
  ShipToRoom( ship , ship->Shipyard );

  ship->Location = ship->Shipyard;
  ship->LastDock = ship->Shipyard;
  ship->State = SHIP_LANDED;
  ship->Shipyard = origShipyard;

  if (ship->Spaceobject)
    {
      ShipFromSpaceobject( ship, ship->Spaceobject );
    }

  SaveShip(ship);
}

void TargetShip( Ship *ship, Ship *target )
{
  char buf[MAX_STRING_LENGTH];

  ship->WeaponSystems.Target = target;
  sprintf( buf , "You are being targetted by %s." , ship->Name);
  EchoToCockpit( AT_BLOOD , target , buf );
  sprintf( buf , "The ship targets %s." , target->Name);
  EchoToCockpit( AT_BLOOD , ship , buf );
}

bool CheckHostile( Ship *ship )
{
  long distance = -1;
  Ship *enemy = NULL;
  ListIterator *iterator = NULL;

  if ( !IsShipAutoflying(ship) || ship->Class == SHIP_DEBRIS )
    return false;

  iterator = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(iterator))
    {
      Ship *target = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( !IsShipInCombatRange( ship, target ) )
        continue;

      if ( !StrCmp( ship->Owner, BADGUY_CLAN ) )
        {
          if ( !StrCmp( target->Owner , GOODGUY_CLAN ) )
            {
              long tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || tempdistance < distance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!StrCmp( ship->Owner, GOODGUY_CLAN ) ) )
        {
          if ( !StrCmp( target->Owner, BADGUY_CLAN ) )
            {
              long tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || tempdistance < distance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( !StrCmp( ship->Owner , "Pirates" ) )
        {
          if ( StrCmp(target->Owner, "Pirates") )
            {
              long tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }
    }

  FreeListIterator(iterator);

  if ( enemy )
    {
      TargetShip( ship, enemy );
      return true;
    }

  return false;
}

ch_ret DriveShip( Character *ch, Ship *ship, Exit *pexit, int fall )
{
  Room *in_room = NULL;
  Room *to_room = NULL;
  Room *original = NULL;
  char buf[MAX_STRING_LENGTH];
  const char *txt = NULL;
  const char *dtxt = NULL;
  ch_ret retcode = rNONE;
  DirectionType door = DIR_INVALID;
  short the_chance = 0;
  bool drunk = false;
  Character *rch = NULL;
  Character *next_rch = NULL;

  if ( !IsNpc( ch ) )
    {
      if ( IsDrunk( ch ) && ( ch->Position != POS_SHOVE )
	   && ( ch->Position != POS_DRAG ) )
	{
	  drunk = true;
	}
    }

  if ( drunk && !fall )
    {
      door = (DirectionType)GetRandomDoor();
      pexit = GetExit( GetRoom(ship->Location), door );
    }

  in_room = GetRoom(ship->Location);

  if ( !pexit || (to_room = pexit->ToRoom) == NULL )
    {
      if ( drunk )
	{
	  SendToCharacter( "You drive into a wall in your drunken state.\r\n", ch );
	}
      else
	{
	  SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
	}

      return rNONE;
    }

  door = pexit->Direction;

  if ( IsBitSet( pexit->Flags, EX_WINDOW )
       && !IsBitSet( pexit->Flags, EX_ISDOOR ) )
    {
      SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if ( IsBitSet(pexit->Flags, EX_PORTAL)
       && IsNpc(ch) )
    {
      Act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->Flags, EX_NOMOB)
       && IsNpc(ch) )
    {
      Act( AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->Flags, EX_CLOSED)
       && (IsBitSet(pexit->Flags, EX_NOPASSDOOR)) )
    {
      if ( !IsBitSet( pexit->Flags, EX_SECRET )
           &&   !IsBitSet( pexit->Flags, EX_DIG ) )
        {
          if ( drunk )
            {
              Act( AT_PLAIN, "$n drives into the $d in $s drunken state.",
		   ch, NULL, pexit->Keyword, TO_ROOM );
	      Act( AT_PLAIN, "You drive into the $d in your drunken state.",
		   ch, NULL, pexit->Keyword, TO_CHAR );
            }
          else
	    {
	      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->Keyword, TO_CHAR );
	    }
        }
      else
        {
          if ( drunk )
	    {
	      SendToCharacter( "You hit a wall in your drunken state.\r\n", ch );
	    }
          else
	    {
	      SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
	    }
        }

      return rNONE;
    }

  if ( IsRoomPrivate( ch, to_room ) )
    {
      SendToCharacter( "That room is private right now.\r\n", ch );
      return rNONE;
    }

  if ( !IsImmortal(ch)
       && !IsNpc(ch)
       && ch->InRoom->Area != to_room->Area )
    {
      if ( ch->TopLevel < to_room->Area->LevelRanges.Hard.Low )
        {
          SetCharacterColor( AT_TELL, ch );

          switch( to_room->Area->LevelRanges.Hard.Low - ch->TopLevel )
            {
            case 1:
              SendToCharacter( "A voice in your mind says, 'You are nearly ready to go that way...'", ch );
              break;

            case 2:
              SendToCharacter( "A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'", ch );
              break;

            case 3:
              SendToCharacter( "A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n", ch);
              break;

	    default:
              SendToCharacter( "A voice in your mind says, 'You are not ready to go down that path.'.\r\n", ch);
            }

          return rNONE;
        }
      else if ( ch->TopLevel > to_room->Area->LevelRanges.Hard.High )
	{
	  SetCharacterColor( AT_TELL, ch );
	  SendToCharacter( "A voice in your mind says, 'There is nothing more for you down that path.'", ch );
	  return rNONE;
	}
    }

  if ( !fall )
    {
      if ( IsBitSet( to_room->Flags, ROOM_INDOORS )
           || IsBitSet( to_room->Flags, ROOM_SPACECRAFT )
           || to_room->Sector == SECT_INSIDE )
        {
          SendToCharacter( "You can't drive indoors!\r\n", ch );
          return rNONE;
        }

      if ( IsBitSet( to_room->Flags, ROOM_NO_DRIVING ) )
        {
          SendToCharacter( "You can't take a vehicle through there!\r\n", ch );
          return rNONE;
        }

      if ( in_room->Sector == SECT_AIR
           || to_room->Sector == SECT_AIR
           || IsBitSet( pexit->Flags, EX_FLY ) )
        {
          if ( ship->Class > CLOUD_CAR )
            {
              SendToCharacter( "You'd need to fly to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( in_room->Sector == SECT_WATER_NOSWIM
           || to_room->Sector == SECT_WATER_NOSWIM
	   || to_room->Sector == SECT_WATER_SWIM
           || to_room->Sector == SECT_UNDERWATER
           || to_room->Sector == SECT_OCEANFLOOR )
        {
          if ( ship->Class != OCEAN_SHIP )
            {
              SendToCharacter( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }

        }

      if ( IsBitSet( pexit->Flags, EX_CLIMB ) )
        {
          if ( ship->Class < CLOUD_CAR )
            {
              SendToCharacter( "You need to fly or climb to get up there.\r\n", ch );
              return rNONE;
            }
        }
    }

  if ( to_room->Tunnel > 0 )
    {
      Character *ctmp = NULL;
      int count = 0;

      for ( ctmp = to_room->FirstPerson; ctmp; ctmp = ctmp->NextInRoom )
	{
	  if ( ++count >= to_room->Tunnel )
	    {
	      SendToCharacter( "There is no room for you in there.\r\n", ch );
	      return rNONE;
	    }
	}
    }

  if ( fall )
    {
      txt = "falls";
    }
  else if ( !txt )
    {
      if (  ship->Class < OCEAN_SHIP )
	{
	  txt = "fly";
	}
      else if ( ship->Class == OCEAN_SHIP  )
	{
	  txt = "float";
	}
      else if ( ship->Class > OCEAN_SHIP  )
	{
	  txt = "drive";
	}
    }

  the_chance = IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->Learned[gsn_speeders]) ;

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou can't figure out which switch it is.\r\n",ch);
      LearnFromFailure( ch, gsn_speeders );
      return retcode;
    }

  sprintf( buf, "$n %ss the vehicle $T.", txt );
  Act( AT_ACTION, buf, ch, NULL, GetDirectionName(door), TO_ROOM );
  sprintf( buf, "You %s the vehicle $T.", txt );
  Act( AT_ACTION, buf, ch, NULL, GetDirectionName(door), TO_CHAR );
  sprintf( buf, "%s %ss %s.", ship->Name, txt, GetDirectionName(door) );
  EchoToRoom( AT_ACTION , GetRoom(ship->Location) , buf );

  ExtractShip( ship );
  ShipToRoom(ship, to_room->Vnum );

  ship->Location = to_room->Vnum;
  ship->LastDock = ship->Location;

  if ( fall )
    {
      txt = "falls";
    }
  else if (  ship->Class < OCEAN_SHIP )
    {
      txt = "flys in";
    }
  else if ( ship->Class == OCEAN_SHIP  )
    {
      txt = "floats in";
    }
  else if ( ship->Class > OCEAN_SHIP  )
    {
      txt = "drives in";
    }

  switch( door )
    {
    default: dtxt = "somewhere";        break;
    case 0:  dtxt = "the south";        break;
    case 1:  dtxt = "the west"; break;
    case 2:  dtxt = "the north";        break;
    case 3:  dtxt = "the east"; break;
    case 4:  dtxt = "below";            break;
    case 5:  dtxt = "above";            break;
    case 6:  dtxt = "the south-west";   break;
    case 7:  dtxt = "the south-east";   break;
    case 8:  dtxt = "the north-west";   break;
    case 9:  dtxt = "the north-east";   break;
    }

  sprintf( buf, "%s %s from %s.", ship->Name, txt, dtxt );
  EchoToRoom( AT_ACTION , GetRoom(ship->Location) , buf );

  for ( rch = ch->InRoom->LastPerson ; rch ; rch = next_rch )
    {
      next_rch = rch->PreviousInRoom;
      original = rch->InRoom;
      CharacterFromRoom( rch );
      CharacterToRoom( rch, to_room );
      do_look( rch, "auto" );
      CharacterFromRoom( rch );
      CharacterToRoom( rch, original );
    }

  LearnFromSuccess( ch, gsn_speeders );
  return retcode;
}

void EchoToShip( int color, const Ship *ship, const char *argument )
{
  vnum_t roomVnum = INVALID_VNUM;

  for ( roomVnum = ship->Rooms.First ; roomVnum <= ship->Rooms.Last ;roomVnum++ )
    {
      Room *room = GetRoom( roomVnum );

      if( room )
	{
	  EchoToRoom( color, room, argument );
	}
      else
	{
	  Bug( "%s:%d %s(): Ship '%s (%s)' has invalid room vnum %d",
	       __FILE__, __LINE__, __FUNCTION__,
	       ship->Name, ship->PersonalName, roomVnum );
	}
    }
}

bool IsShipAutoflying( const Ship *ship )
{
  if (!ship)
    {
      return false;
    }

  if ( ship->Type == MOB_SHIP )
    {
      return true;
    }

  if ( ship->Autopilot )
    {
      return true;
    }

  return false;
}

void RechargeShips( void )
{
  ListIterator *iterator = NULL;
  char buf[MAX_STRING_LENGTH] = { '\0' };
  bool closeem = false;
  int origchance = 100;

  baycount++;

  if ( baycount >= 60 )
    {
      closeem = true;
      baycount = 0;
    }

  iterator = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(iterator))
    {
      int turret_num = 0;
      Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( ship->Class == SHIP_PLATFORM )
	{
	  if ( closeem && ship->Guard )
	    {
	      ship->BayOpen = false;
	    }
	}

      if (ship->WeaponSystems.Laser.State > LASER_READY)
        {
          ship->Thrusters.Energy.Current -= ship->WeaponSystems.Laser.State;
          ship->WeaponSystems.Laser.State = LASER_READY;
        }

      if (ship->WeaponSystems.IonCannon.State > LASER_READY)
        {
          ship->Thrusters.Energy.Current -= 10*ship->WeaponSystems.IonCannon.State;
          ship->WeaponSystems.IonCannon.State = LASER_READY;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];
	  ship->Thrusters.Energy.Current -= GetTurretEnergyDraw( turret );
	}

      if( ship->Docked && ship->Docked->Class == SHIP_PLATFORM )
        {
          if( ship->Thrusters.Energy.Max - ship->Thrusters.Energy.Current > 500 )
	    {
	      ship->Thrusters.Energy.Current += 500;
	    }
          else
	    {
	      ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
	    }
        }

      if (ship->WeaponSystems.Tube.State == MISSILE_RELOAD_2)
        {
          ship->WeaponSystems.Tube.State = MISSILE_READY;

          if ( ship->WeaponSystems.Tube.Missiles.Current > 0 )
	    {
	      EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Gunseat),
			    "Missile launcher reloaded.");
	    }
        }

      if (ship->WeaponSystems.Tube.State == MISSILE_RELOAD )
        {
          ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
        }

      if (ship->WeaponSystems.Tube.State == MISSILE_FIRED )
	{
	  ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
	}

      if ( IsShipAutoflying(ship) )
        {
          if ( ship->Spaceobject && ship->Class != SHIP_DEBRIS )
            {
              if (ship->WeaponSystems.Target && ship->WeaponSystems.Laser.State != LASER_DAMAGED )
                {
                  int the_chance = 75;
                  Ship *target = ship->WeaponSystems.Target;
                  int shots = 0, guns = 0;
                  int whichguns = 0;

                  if ( ship->WeaponSystems.Laser.Count > 0
		       && ship->WeaponSystems.IonCannon.Count > 0
		       && ship->WeaponSystems.Laser.Count < 7
		       && ship->WeaponSystems.IonCannon.Count < 7 )
                    {
                      whichguns = 2;
                      guns = ship->WeaponSystems.Laser.Count + ship->WeaponSystems.IonCannon.Count;
                    }
                  else if ( ship->WeaponSystems.Target->Defenses.Shield.Current > 0
			    && ship->WeaponSystems.IonCannon.Count )
                    {
		      whichguns = 1;
                      guns = ship->WeaponSystems.IonCannon.Count;
                    }
                  else
		    {
		      guns = ship->WeaponSystems.Laser.Count;
		    }

                  for ( shots = 0; shots < guns; shots++ )
                    {
                      if ( !IsShipInHyperspace( ship )
                          && ship->Thrusters.Energy.Current > 25
                          && IsShipInCombatRange( ship, target )
                          && GetShipDistanceToShip( target, ship ) <= 1000 )
                        {
                          if ( ship->Class > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                            {
                              the_chance += target->Class - ship->Class;
                              the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
                              the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
                              the_chance -= GetShipDistanceToShip( ship, target ) / ( 10 * ( target->Class + 1 ) );
                              the_chance -= origchance;
                              the_chance /= 2;
                              the_chance += origchance;
                              the_chance = urange( 1 , the_chance , 99 );

                              if ( GetRandomPercent() > the_chance )
                                {
                                  sprintf( buf , "%s fires at you but misses." , ship->Name);
                                  EchoToCockpit( AT_ORANGE , target , buf );
                                  sprintf( buf, "Weaponsfire from %s barely misses %s." , ship->Name , target->Name );
                                  EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                }
                              else
                                {
                                  if( whichguns == 0 )
                                    {
                                      sprintf( buf, "Laserfire from %s hits %s." , ship->Name, target->Name );
                                      EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are hit by lasers from %s!" , ship->Name);
                                      EchoToCockpit( AT_BLOOD , target , buf );
                                      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->Class == SHIP_PLATFORM )
					{
					  DamageShip( target, 100, 250, NULL, ship );
					}
                                      else if( ship->Class == CAPITAL_SHIP
					       && target->Class != CAPITAL_SHIP )
					{
					  DamageShip( target, 50, 200, NULL, ship );
					}
                                      else
					{
					  DamageShip( target, 5, 10, NULL, ship );
					}
                                    }
                                  else if( whichguns == 1 )
                                    {
                                      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->Name, target->Name );
                                      EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->Name);
                                      EchoToCockpit( AT_BLOOD , target , buf );
                                      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->Class == SHIP_PLATFORM )
					{
					  DamageShip( target, -250, -100, NULL, ship );
					}
                                      else if( ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP )
					{
					  DamageShip( target, -200, -50, NULL, ship );
					}
                                      else
					{
					  DamageShip( target, -10, -5, NULL, ship );
					}
                                    }
                                  else if( whichguns == 2 )
                                    {
                                      if( shots < ship->WeaponSystems.Laser.Count )
                                        {
                                          sprintf( buf, "Laserfire from %s hits %s.",
						   ship->Name, target->Name );
                                          EchoToNearbyShips( AT_ORANGE, target, buf , NULL );
                                          sprintf( buf, "You are hit by lasers from %s!",
						   ship->Name);
                                          EchoToCockpit( AT_BLOOD, target, buf );
                                          EchoToShip( AT_RED, target, "A small explosion vibrates through the ship." );
                                          if( ship->Class == SHIP_PLATFORM )
					    {
					      DamageShip( target, 100, 250, NULL, ship );
					    }
                                          else if( ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP )
					    {
					      DamageShip( target, 50, 200, NULL, ship );
					    }
                                          else
					    {
					      DamageShip( target, 5, 10, NULL, ship );
					    }
                                        }
                                      else
                                        {
                                          sprintf( buf, "Ion energy from %s hits %s." , ship->Name, target->Name );
                                          EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by an ion cannon from %s!" , ship->Name);
                                          EchoToCockpit( AT_BLOOD , target , buf );
                                          EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->Class == SHIP_PLATFORM )
					    {
					      DamageShip( target, -250, -100, NULL, ship );
					    }
                                          else if( ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP )
					    {
					      DamageShip( target, -200, -50, NULL, ship );
					    }
                                          else
					    {
					      DamageShip( target, -10, -5, NULL, ship );
					    }
					}
                                    }
                                }

                              ship->WeaponSystems.Laser.State++;

                              if ( IsShipAutoflying(target) && !target->WeaponSystems.Target )
                                {
                                  sprintf( buf , "You are being targetted by %s." , target->Name);
                                  EchoToCockpit( AT_BLOOD , ship , buf );
                                  target->WeaponSystems.Target = ship;
                                }
			    }
                        }
                    }
                }
            }
        }
    }

  FreeListIterator(iterator);
}

void ShipUpdate( void )
{
  char buf[MAX_STRING_LENGTH];
  int too_close = 0, target_too_close = 0;
  Spaceobject *spaceobj = NULL;
  int recharge = 0;
  ListIterator *iterator = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(iterator))
    {
      int turret_num = 0;
      Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( ship->Spaceobject
	   && ship->Thrusters.Energy.Current > 0
	   && IsShipDisabled( ship )
	   && ship->Class != SHIP_PLATFORM )
	{
	  ship->Thrusters.Energy.Current -= 100;
	}
      else if ( ship->Thrusters.Energy.Current > 0 )
	{
	  ship->Thrusters.Energy.Current += ( 5 + ship->Class*5 );
	}
      else
	{
	  ship->Thrusters.Energy.Current = 0;
	}

      if ( ship->Defenses.ChaffReleased > 0 )
	{
	  ship->Defenses.ChaffReleased = !ship->Defenses.ChaffReleased;
	}

      /* following was originaly to fix ships that lost their pilot
         in the middle of a manuever and are stuck in a busy state
         but now used for timed manouevers such as turning */

      if( ship->State == SHIP_READY && ship->Tracking == true )
        {
          if( ship->Count == 0 )
            {
              ship->Count++;
            }
          else
            {
	      do_hyperspace( ship->Ch, "" );
              ship->Count = 0;
            }
        }

      if (ship->State == SHIP_BUSY_3)
        {
          EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Manuever complete.");
          ship->State = SHIP_READY;
        }

      if (ship->State == SHIP_BUSY_2)
	{
	  ship->State = SHIP_BUSY_3;
	}

      if (ship->State == SHIP_BUSY)
	{
	  ship->State = SHIP_BUSY_2;
	}

      if (ship->State == SHIP_LAND_2)
	{
	  LandShip( ship , ship->LandingDestination );
	}

      if (ship->State == SHIP_LAND)
        {
          ApproachLandingSite( ship, ship->LandingDestination );
          ship->State = SHIP_LAND_2;
        }

      if (ship->State == SHIP_LAUNCH_2)
	{
	  LaunchShip( ship );
	}

      if (ship->State == SHIP_LAUNCH)
	{
	  ship->State = SHIP_LAUNCH_2;
	}

      if (ship->Docking == SHIP_DOCK_2)
	{
	  DockShip( ship->Ch , ship );
	}

      if (ship->Docking == SHIP_DOCK)
	{
	  ship->Docking = SHIP_DOCK_2;
	}

      ship->Defenses.Shield.Current = umax( 0 , ship->Defenses.Shield.Current-1-ship->Class);

      if (ship->AutoRecharge
	  && ship->Defenses.Shield.Max > ship->Defenses.Shield.Current
	  && ship->Thrusters.Energy.Current > 100)
        {
          recharge = umin( ship->Defenses.Shield.Max-ship->Defenses.Shield.Current, 10 + ship->Class*10 );
          recharge = umin( recharge , ship->Thrusters.Energy.Current/2 -100 );
	  recharge = umax( 1, recharge );
          ship->Defenses.Shield.Current += recharge;
          ship->Thrusters.Energy.Current -= recharge;
        }

      if ( IsShipAutoflying(ship)
	   && ( ship->Thrusters.Energy.Current >= ( ( 25 + ((int)ship->Class) * 25 ) * ( 2 + ((int)ship->Class) ) ) )
           && ( ( ship->Defenses.Shield.Max - ship->Defenses.Shield.Current ) >= ( 25 + ((int)ship->Class) * 25 ) ) )
        {
          recharge = 25+ship->Class*25;
          recharge = umin(  ship->Defenses.Shield.Max-ship->Defenses.Shield.Current , recharge );
          ship->Defenses.Shield.Current += recharge;
          ship->Thrusters.Energy.Current -= ( recharge*2 + recharge * ship->Class );
        }

      if (ship->Defenses.Shield.Current > 0)
        {
          if (ship->Thrusters.Energy.Current < 200)
            {
              ship->Defenses.Shield.Current = 0;
              EchoToCockpit( AT_RED, ship,"The ships shields fizzle and die.");
              ship->AutoRecharge = false;
            }
        }

      if ( ship->Spaceobject && ship->Thrusters.Speed.Current > 0 )
        {
          sprintf( buf, "%d", ship->Thrusters.Speed.Current );
          EchoToRoomNoNewline( AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "Speed: " );
          EchoToRoomNoNewline( AT_LBLUE, GetRoom(ship->Rooms.Pilotseat), buf );
          sprintf( buf, "%.0f %.0f %.0f", ship->Position.x, ship->Position.y, ship->Position.z );
          EchoToRoomNoNewline( AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "  Coords: " );
          EchoToRoom( AT_LBLUE, GetRoom(ship->Rooms.Pilotseat),  buf );

          if ( ship->Rooms.Pilotseat != ship->Rooms.Coseat )
            {
              sprintf( buf, "%d", ship->Thrusters.Speed.Current);
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Rooms.Coseat),  "Speed: " );
              EchoToRoomNoNewline( AT_LBLUE , GetRoom(ship->Rooms.Coseat),  buf );
              sprintf( buf, "%.0f %.0f %.0f", ship->Position.x , ship->Position.y, ship->Position.z );
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Rooms.Coseat),  "  Coords: " );
              EchoToRoom( AT_LBLUE , GetRoom(ship->Rooms.Coseat),  buf );
	    }
        }

      if ( ship->Spaceobject )
        {
          ListIterator *innerIter = NULL;

          too_close = ship->Thrusters.Speed.Current + 50;

          for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
	    {
	      if( spaceobj->Name &&  StrCmp(spaceobj->Name,"")
		  && GetShipDistanceToSpaceobject( ship, spaceobj ) < too_close )
		{
		  sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f", spaceobj->Name,
			   spaceobj->Position.x, spaceobj->Position.y, spaceobj->Position.z);
		  EchoToRoom( AT_RED , GetRoom(ship->Rooms.Pilotseat),  buf );
		}
	    }

          innerIter = AllocateListIterator(GetEntities(ShipRepository));

          while(ListHasMoreElements(innerIter))
            {
              Ship *target = (Ship*)GetListData(innerIter);
              MoveToNextListElement(innerIter);

              if( (target->Docked && target->Docked == ship) || (ship->Docked &&  ship->Docked == target ) )
		{
		  continue;
		}

              if ( ship->Docked && target->Docked
                   && target->Docked == ship->Docked )
		{
		  continue;
		}

              target_too_close = too_close + target->Thrusters.Speed.Current;

              if( target->Spaceobject )
                {
                  if( target != ship
                      && GetShipDistanceToShip( ship, target ) < target_too_close
                      && ship->Docked != target && target->Docked != ship )
                    {
                      sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f",
                               target->Name,
                               target->Position.x - ship->Position.x,
                               target->Position.y - ship->Position.y,
                               target->Position.z - ship->Position.z );
                      EchoToRoom( AT_RED, GetRoom(ship->Rooms.Pilotseat),
                                    buf );
                    }
                }
            }

          FreeListIterator(innerIter);
	  too_close = ship->Thrusters.Speed.Current + 100;
        }

      if (ship->WeaponSystems.Target && ship->Class <= SHIP_PLATFORM)
        {
          sprintf( buf, "%s   %.0f %.0f %.0f", ship->WeaponSystems.Target->Name,
                   ship->WeaponSystems.Target->Position.x, ship->WeaponSystems.Target->Position.y,
                   ship->WeaponSystems.Target->Position.z );
          EchoToRoomNoNewline( AT_BLUE, GetRoom(ship->Rooms.Gunseat),"Target: ");
          EchoToRoom( AT_LBLUE , GetRoom(ship->Rooms.Gunseat),  buf );

          if (!IsShipInCombatRange( ship, ship->WeaponSystems.Target ) )
            {
              EchoToRoom( AT_LBLUE , GetRoom(ship->Rooms.Gunseat),  "Your target seems to have left.");
              ship->WeaponSystems.Target = NULL;
            }
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];

	  if ( TurretHasTarget( turret ) && ship->Class <= SHIP_PLATFORM)
	    {
	      const  Ship *turret_target = GetTurretTarget( turret );

	      sprintf( buf, "%s   %.0f %.0f %.0f", turret_target->Name,
		       turret_target->Position.x, turret_target->Position.y,
		       turret_target->Position.z );
	      EchoToRoomNoNewline( AT_BLUE , GetRoom(GetTurretRoom( turret ) ), "Target: " );
	      EchoToRoom( AT_LBLUE , GetRoom(GetTurretRoom( turret ) ),  buf );

	      if (!IsShipInCombatRange( ship, turret_target ) )
		{
		  ClearTurretTarget( turret );
		}
	    }
	}

      if (ship->Thrusters.Energy.Current < 100 && ship->Spaceobject )
        {
          EchoToCockpit( AT_RED , ship,  "Warning: Ship fuel low." );
	}

      ship->Thrusters.Energy.Current = urange( 0 , ship->Thrusters.Energy.Current, ship->Thrusters.Energy.Max );
    }

  FreeListIterator(iterator);
}

void UpdateSpaceCombat(void)
{
  char buf[MAX_STRING_LENGTH];
  int too_close = 0, target_too_close = 0;
  ListIterator *iterator = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(iterator))
    {
      Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( ship->WeaponSystems.Target && IsShipAutoflying(ship) )
	{
	  if( !IsShipInCombatRange( ship->WeaponSystems.Target, ship ) )
	    {
	      EchoToRoom( AT_BLUE , GetRoom(ship->Rooms.Pilotseat), "Target left, returning to NORMAL condition.\r\n" );
	      ship->Thrusters.Speed.Current = 0;
	      ship->WeaponSystems.Target = NULL;
	    }
	}

      if (ship->AutoTrack
	  && ship->Docking == SHIP_READY
	  && ship->WeaponSystems.Target
	  && ship->Class < SHIP_PLATFORM )
        {
          Ship *target = ship->WeaponSystems.Target;
          too_close = ship->Thrusters.Speed.Current + 10;
          target_too_close = too_close + target->Thrusters.Speed.Current;

          if ( target != ship && ship->State == SHIP_READY
               && ship->Docked == NULL && ship->State != SHIP_DOCKED
               && GetShipDistanceToShip( ship, target ) < target_too_close )
            {
              SetShipCourseTowardsShip( ship, ship->WeaponSystems.Target );
              TurnShip180( ship );
              ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
              EchoToRoom( AT_RED , GetRoom(ship->Rooms.Pilotseat), "Autotrack: Evading to avoid collision!\r\n" );

              if ( ship->Class == FIGHTER_SHIP
		   || ( ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50 ) )
		{
		  ship->State = SHIP_BUSY_3;
		}
              else if ( ship->Class == MIDSIZE_SHIP || ( ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50 ) )
		{
		  ship->State = SHIP_BUSY_2;
		}
              else
		{
		  ship->State = SHIP_BUSY;
		}
            }
          else if ( !IsShipFacingShip(ship, ship->WeaponSystems.Target )
                    && ship->Docked == NULL && ship->State != SHIP_DOCKED )
            {
              SetShipCourseTowardsShip( ship, ship->WeaponSystems.Target );
              ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
              EchoToRoom( AT_BLUE , GetRoom(ship->Rooms.Pilotseat), "Autotracking target... setting new course.\r\n" );

	      if ( ship->Class == FIGHTER_SHIP
		   || ( ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50 ) )
		{
		  ship->State = SHIP_BUSY_3;
		}
              else if ( ship->Class == MIDSIZE_SHIP || ( ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50 ) )
		{
		  ship->State = SHIP_BUSY_2;
		}
              else
		{
		  ship->State = SHIP_BUSY;
		}
            }
        }

      if ( IsShipAutoflying(ship) && ship->Class != SHIP_DEBRIS )
        {
          if ( ship->Spaceobject )
            {
              CheckHostile( ship );

              if (ship->WeaponSystems.Target )
                {
                  int the_chance = 50;
                  MissileType projectiles = INVALID_MISSILE_TYPE;
                  ListIterator *assistIter = NULL;
                  Ship *target = NULL;

                  if ( !ship->WeaponSystems.Target->WeaponSystems.Target
		       && IsShipAutoflying(ship->WeaponSystems.Target))
		    {
		      ship->WeaponSystems.Target->WeaponSystems.Target = ship;
		    }

                  /* auto assist ships */
                  assistIter = AllocateListIterator(GetEntities(ShipRepository));

                  while(ListHasMoreElements(assistIter))
                    {
                      Ship *assistingShip = (Ship*)GetListData(assistIter);
                      MoveToNextListElement(assistIter);

                      if( IsShipInCombatRange( ship, assistingShip ) )
			{
			  if ( IsShipAutoflying(assistingShip)
			       && assistingShip->Docked == NULL
			       && assistingShip->State != SHIP_DOCKED )
			    {
			      if ( !StrCmp(assistingShip->Owner, ship->Owner )
                                   && assistingShip != ship )
				{
				  if ( assistingShip->WeaponSystems.Target == NULL
				       && ship->WeaponSystems.Target != assistingShip )
				    {
				      assistingShip->WeaponSystems.Target = ship->WeaponSystems.Target;
				      sprintf( buf, "You are being targetted by %s.",
					       assistingShip->Name);
				      EchoToCockpit( AT_BLOOD, assistingShip->WeaponSystems.Target,
                                                     buf );
				      break;
				    }
				}
			    }
			}
                    }

                  FreeListIterator(assistIter);
                  target = ship->WeaponSystems.Target;
                  ship->AutoTrack = true;

                  if( ship->Class != SHIP_PLATFORM && !ship->Guard
                      && ship->Docked == NULL && ship->State != SHIP_DOCKED )
		    {
		      ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;
		    }

                  if ( ship->Thrusters.Energy.Current > 200  )
		    {
		      ship->AutoRecharge=true;
		    }

                  if ( !IsShipInHyperspace( ship )
		      && ship->Thrusters.Energy.Current > 25
                      && ship->WeaponSystems.Tube.State == MISSILE_READY
                      && IsShipInCombatRange( ship, target )
                      && GetShipDistanceToShip( target, ship ) <= 1200 )
                    {
                      if ( ship->Class > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                        {
                          the_chance -= target->Thrusters.Maneuver / 5;
                          the_chance -= target->Thrusters.Speed.Current / 20;
                          the_chance += target->Class * target->Class * 25;
                          the_chance -= ( GetShipDistanceToShip( ship, target ) * 3 ) / 100;
                          the_chance += 30;
                          the_chance = urange( 10 , the_chance , 90 );

                          if( ( target->Class == SHIP_PLATFORM
				|| ( target->Class == CAPITAL_SHIP
				     && target->Thrusters.Speed.Current < 50 ))
			      && ship->WeaponSystems.Tube.Rockets.Current > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ( target->Class == MIDSIZE_SHIP
				      || ( target->Class == CAPITAL_SHIP) )
				    && ship->WeaponSystems.Tube.Torpedoes.Current > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->WeaponSystems.Tube.Missiles.Current < 0
				    && ship->WeaponSystems.Tube.Torpedoes.Current > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->WeaponSystems.Tube.Missiles.Current < 0
				    && ship->WeaponSystems.Tube.Rockets.Current > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ship->WeaponSystems.Tube.Missiles.Current > 0 )
			    {
			      projectiles = CONCUSSION_MISSILE;
			    }
                          else
			    {
			      projectiles = INVALID_MISSILE_TYPE;
			    }

                          if ( GetRandomPercent() > the_chance
			       || projectiles == INVALID_MISSILE_TYPE )
                            {

                            }
                          else
                            {
                              NewMissile( ship , target , NULL , projectiles );

                              if( projectiles == CONCUSSION_MISSILE )
				{
				  ship->WeaponSystems.Tube.Missiles.Current--;
				}

                              if( projectiles == PROTON_TORPEDO )
				{
				  ship->WeaponSystems.Tube.Torpedoes.Current--;
				}

                              if( projectiles == HEAVY_ROCKET )
				{
				  ship->WeaponSystems.Tube.Rockets.Current--;
				}

                              sprintf( buf , "Incoming projectile from %s." , ship->Name);
                              EchoToCockpit( AT_BLOOD , target , buf );
                              sprintf( buf, "%s fires a projectile towards %s.",
				       ship->Name, target->Name );
                              EchoToNearbyShips( AT_ORANGE , target , buf , NULL );

			      if ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
				{
				  ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
				}
                              else
				{
				  ship->WeaponSystems.Tube.State = MISSILE_FIRED;
				}
                            }
                        }
                    }

                  if( ship->WeaponSystems.Tube.State == MISSILE_DAMAGED )
		    {
		      ship->WeaponSystems.Tube.State = MISSILE_READY;
		    }

                  if( ship->WeaponSystems.Laser.State == LASER_DAMAGED )
		    {
		      ship->WeaponSystems.Laser.State = LASER_READY;
		    }

                  if( ship->WeaponSystems.IonCannon.State == LASER_DAMAGED )
		    {
		      ship->WeaponSystems.IonCannon.State = LASER_READY;
		    }

                  if( IsShipDisabled( ship ) )
		    {
		      ship->State =  SHIP_READY;
		    }
                }
              else
		{
		  ship->Thrusters.Speed.Current = 0;
		}
            }
          else
            {
              if ( GetRandomNumberFromRange(1, 25) == 25 )
                {
                  ShipToSpaceobject(ship, GetSpaceobject(ship->Home));
                  InitializeVector( &ship->Position );
                  SetVector( &ship->Heading, 1, 1, 1 );

                  if( ship->Spaceobject )
                    {
                      CopyVector( &ship->Position, &ship->Spaceobject->Position );
                    }

                  RandomizeVector( &ship->Position, -5000, 5000 );
                }
            }
        }

      if ( ( ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM )
           && ship->WeaponSystems.Target == NULL )
        {
          if( ship->WeaponSystems.Tube.Missiles.Current < ship->WeaponSystems.Tube.Missiles.Max )
	    {
	      ship->WeaponSystems.Tube.Missiles.Current++;
	    }

	  if( ship->WeaponSystems.Tube.Torpedoes.Current < ship->WeaponSystems.Tube.Torpedoes.Max )
	    {
	      ship->WeaponSystems.Tube.Torpedoes.Current++;
	    }

          if( ship->WeaponSystems.Tube.Rockets.Current < ship->WeaponSystems.Tube.Rockets.Max )
	    {
	      ship->WeaponSystems.Tube.Rockets.Current++;
	    }

          if( ship->Defenses.Chaff.Current < ship->Defenses.Chaff.Max )
	    {
	      ship->Defenses.Chaff.Current++;
	    }
        }

      SaveShip( ship );
    }

  FreeListIterator(iterator);
}

void EchoToDockedShip( int color, const Ship *ship, const char *argument )
{
  ListIterator *iterator = AllocateListIterator(GetEntities(ShipRepository));
  
  while(ListHasMoreElements(iterator))
    {
      const Ship *dockedShip = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( dockedShip->Docked == ship)
        {
          EchoToCockpit( color, dockedShip, argument );
        }
    }

  FreeListIterator(iterator);
}

void EchoToCockpit( int color, const Ship *ship, const char *argument )
{
  vnum_t room = INVALID_VNUM;

  for ( room = ship->Rooms.First; room <= ship->Rooms.Last;room++ )
    {
      if ( room == ship->Rooms.Cockpit || room == ship->Rooms.Navseat
           || room == ship->Rooms.Pilotseat || room == ship->Rooms.Coseat
           || room == ship->Rooms.Gunseat || room == ship->Rooms.Engine
           || room == GetTurretRoom( ship->WeaponSystems.Turret[0] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[1] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[2] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[3] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[4] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[5] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[6] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[7] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[8] )
	   || room == GetTurretRoom( ship->WeaponSystems.Turret[9] ) )
	{
	  EchoToRoom( color, GetRoom(room), argument );
	}
    }
}

bool IsShipInCombatRange( const Ship *ship, const Ship *target )
{
  if (target && ship && target != ship )
    {
      if ( target->Spaceobject && ship->Spaceobject
           && target->State != SHIP_LANDED
           && GetShipDistanceToShip( ship, target ) < 100 * ( ship->Instruments.Sensor + 10 ) * ( ( target->Class == SHIP_DEBRIS ? 2 : target->Class ) + 3 ) )
	{
	  return true;
	}
    }

  return false;
}

bool IsMissileInRange( const Ship *ship, const Missile *missile )
{
  return missile && ship && ship->Spaceobject
    && GetMissileDistanceToShip( missile, ship ) < 5000;
}

bool IsSpaceobjectInRange( const Ship *ship, const Spaceobject *object )
{
  return object && ship && ship->Spaceobject
    && GetShipDistanceToSpaceobject( ship, object ) < 100000;
}

bool IsSpaceobjectInCaptureRange( const Ship *ship, const Spaceobject *object )
{
  return object && ship
    && GetShipDistanceToSpaceobject( ship, object ) < 10000;
}

static bool CaughtInGravity( const Ship *ship, const Spaceobject *object )
{
  return object && ship
    && GetDistanceBetweenVectors( &object->Position, &ship->HyperPosition ) < object->Gravity * 5;
}

long int GetShipValue( const Ship *ship )
{
  long int price = 0;
  int turret_num = 0;

  if (ship->Class == FIGHTER_SHIP)
    {
      price = 5000;
    }
  else if (ship->Class == MIDSIZE_SHIP)
    {
      price = 50000;
    }
  else if (ship->Class == CAPITAL_SHIP)
    {
      price = 500000;
    }
  else
    {
      price = 2000;
    }

  if ( ship->Class <= CAPITAL_SHIP )
    {
      price += ship->Thrusters.Maneuver * 100 * ( 1 + ship->Class );
    }

  price += ship->WeaponSystems.TractorBeam.Strength * 100;
  price += ship->Thrusters.Speed.Max * 10;
  price += ship->Instruments.AstroArray * 5;
  price += 5 * ship->Defenses.Hull.Max;
  price += 2 * ship->Thrusters.Energy.Max;

  if (ship->Thrusters.Energy.Max > 5000 )
    {
      price += (ship->Thrusters.Energy.Max - 5000) * 20;
    }

  if (ship->Thrusters.Energy.Max > 10000 )
    {
      price += (ship->Thrusters.Energy.Max - 10000) * 50;
    }

  if (ship->Defenses.Hull.Max > 1000)
    {
      price += (ship->Defenses.Hull.Max-1000) * 10;
    }

  if (ship->Defenses.Hull.Max > 10000)
    {
      price += (ship->Defenses.Hull.Max-10000) * 20;
    }

  if (ship->Defenses.Shield.Max > 200)
    {
      price += (ship->Defenses.Shield.Max-200) * 50;
    }

  if (ship->Defenses.Shield.Max > 1000)
    {
      price += (ship->Defenses.Shield.Max-1000) * 100;
    }

  if (ship->Thrusters.Speed.Max > 100 )
    {
      price += (ship->Thrusters.Speed.Max - 100) * 500;
    }

  if (ship->WeaponSystems.Laser.Count > 5 )
    {
      price += (ship->WeaponSystems.Laser.Count - 5) * 500;
    }

  if (ship->Defenses.Shield.Max)
    {
      price += 1000 + 10 * ship->Defenses.Shield.Max;
    }

  if (ship->WeaponSystems.Laser.Count)
    {
      price += 500 + 500 * ship->WeaponSystems.Laser.Count;
    }

  if (ship->WeaponSystems.Tube.Missiles.Current )
    {
      price += 250 * ship->WeaponSystems.Tube.Missiles.Current;
    }
  else if (ship->WeaponSystems.Tube.Torpedoes.Current )
    {
      price += 500 * ship->WeaponSystems.Tube.Torpedoes.Current;
    }
  else if (ship->WeaponSystems.Tube.Rockets.Current )
    {
      price += 1000 * ship->WeaponSystems.Tube.Rockets.Current;
    }

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const Turret *turret = ship->WeaponSystems.Turret[turret_num];

      if( IsTurretInstalled( turret ) )
	{
	  price += 5000;
	}
    }

  if (ship->Hyperdrive.Speed)
    {
      price += 1000 + ship->Hyperdrive.Speed * 10;
    }

  if (ship->Rooms.Hangar)
    {
      price += ship->Class == MIDSIZE_SHIP ? 50000 : 100000;
    }

  price *= 1.5;

  return price;
}

long GetRentalPrice(const Ship *ship)
{
  return GetShipValue(ship) / 100;
}

static void PushInstruments( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Instruments" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "AstroArray", ship->Instruments.AstroArray );
  LuaSetfieldNumber( L, "Comm", ship->Instruments.Comm );
  LuaSetfieldNumber( L, "Sensor", ship->Instruments.Sensor );
 
  lua_settable( L, -3 );
}

static void PushThrusters( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Thrusters" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Maneuver", ship->Thrusters.Maneuver );
  PushCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
  PushCurrentAndMax( L, "Energy", ship->Thrusters.Energy );
    
  lua_settable( L, -3 );
}

static void PushHyperdrive( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Hyperdrive" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Speed", ship->Hyperdrive.Speed );
  
  lua_settable( L, -3 );
}

static void PushTube( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Tube" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Tube.State );
  PushCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
  PushCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
  PushCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );

  lua_settable( L, -3 );
}

static void PushLaser( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Laser" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.Laser.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Laser.State );
  lua_settable( L, -3 );
}

static void PushIonCannon( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "IonCannon" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.IonCannon.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.IonCannon.State );
  lua_settable( L, -3 );
}

static void PushTractorBeam( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "TractorBeam" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Strength", ship->WeaponSystems.TractorBeam.Strength );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.TractorBeam.State );
  lua_settable( L, -3 );
}

static void PushTurrets( lua_State *L, Turret * const turrets[] )
{
  int idx = 0;
  lua_pushstring( L, "Turrets" );
  lua_newtable( L );

  for( idx = 0; idx < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++idx )
    {
      PushTurret( L, turrets[idx], idx );
    }
  
  lua_settable( L, -3 );
}

static void PushWeaponSystems( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "WeaponSystems" );
  lua_newtable( L );

  PushTube( L, ship );  
  PushLaser( L, ship );
  PushIonCannon( L, ship );
  PushTractorBeam( L, ship );  
  PushTurrets( L, ship->WeaponSystems.Turret );

  lua_settable( L, -3 );
}

static void PushDefenses( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Defenses" );
  lua_newtable( L );

  PushCurrentAndMax( L, "Hull", ship->Defenses.Hull );
  PushCurrentAndMax( L, "Shield", ship->Defenses.Shield );
  PushCurrentAndMax( L, "Chaff", ship->Defenses.Chaff );

  lua_settable( L, -3 );
}

static void PushRooms( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Rooms" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "First", ship->Rooms.First );
  LuaSetfieldNumber( L, "Last", ship->Rooms.Last );
  LuaSetfieldNumber( L, "Cockpit", ship->Rooms.Cockpit );
  LuaSetfieldNumber( L, "Entrance", ship->Rooms.Entrance );
  LuaSetfieldNumber( L, "Hangar", ship->Rooms.Hangar );
  LuaSetfieldNumber( L, "Engine", ship->Rooms.Engine );
  LuaSetfieldNumber( L, "Navseat", ship->Rooms.Navseat );
  LuaSetfieldNumber( L, "Pilotseat", ship->Rooms.Pilotseat );
  LuaSetfieldNumber( L, "Coseat", ship->Rooms.Coseat );
  LuaSetfieldNumber( L, "Gunseat", ship->Rooms.Gunseat );

  lua_settable( L, -3 );
}

static void PushShip( lua_State *L, const void *userData )
{
  const Ship *ship = (const Ship*) userData;
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", ship->Name );
  LuaSetfieldString( L, "PersonalName", ship->PersonalName );
  LuaSetfieldString( L, "Description", ship->Description );
  LuaSetfieldString( L, "Owner", ship->Owner );
  LuaSetfieldString( L, "Pilot", ship->Pilot );
  LuaSetfieldString( L, "CoPilot", ship->CoPilot );
  LuaSetfieldString( L, "Class", ShipClasses[ship->Class] );
  LuaSetfieldNumber( L, "Shipyard", ship->Shipyard );
  LuaSetfieldNumber( L, "Location", ship->Location );
  LuaSetfieldNumber( L, "LastDock", ship->LastDock );
  LuaSetfieldString( L, "Type", ShipTypes[ship->Type] );
  LuaSetfieldNumber( L, "State", ship->State );
  LuaSetfieldBoolean( L, "Alarm", ship->Alarm );
  LuaSetfieldNumber( L, "DockingPorts", ship->DockingPorts );
  LuaSetfieldBoolean( L, "Guard", ship->Guard );
  LuaSetfieldString( L, "Home", ship->Home );

  LuaPushVector3( L, &ship->Position, "Position" );
  PushInstruments( L, ship );
  PushThrusters( L, ship );
  PushHyperdrive( L, ship );
  PushWeaponSystems( L, ship );
  PushDefenses( L, ship );
  PushRooms( L, ship );

  LuaPushFlags( L, ship->Flags, ShipFlags, "Flags" );
  
  lua_setglobal( L, "ship" );
}

const char *GetShipFilename( const Ship *ship )
{
  static char buffer[MAX_STRING_LENGTH];
  char fullName[MAX_STRING_LENGTH];
  
  if( IsNullOrEmpty( ship->PersonalName )
      || !StrCmp( ship->Name, ship->PersonalName ) )
    {
      sprintf( fullName, "%s", ship->Name );
    }
  else
    {
      sprintf( fullName, "%s %s", ship->Name, ship->PersonalName );
    }

  sprintf( buffer, "%s%s", SHIP_DIR, ConvertToLuaFilename( fullName ) );

  return buffer;
}

void SaveShip( const Ship *ship )
{
  if( ship->Class == SHIP_DEBRIS )
    {
      return;
    }

  LuaSaveDataFile( GetShipFilename( ship ), PushShip, "ship", ship );
}

static void LoadInstruments( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Instruments" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "AstroArray" );
      lua_getfield( L, sub_idx, "Comm" );
      lua_getfield( L, sub_idx, "Sensor" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.AstroArray = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.Comm = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.Sensor = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadThrusters( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Thrusters" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Maneuver" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Thrusters.Maneuver = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );

      LoadCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
      ship->Thrusters.Speed.Current = 0;

      LoadCurrentAndMax( L, "Energy", ship->Thrusters.Energy );
    }

  lua_pop( L, 1 );
}

static void LoadHyperdrive( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Hyperdrive" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Speed" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Hyperdrive.Speed = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTube( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Tube" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Tube.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );

      LoadCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
      LoadCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );
      LoadCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
    }

  lua_pop( L, 1 );
}

static void LoadLaser( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Laser" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Count" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Laser.Count = lua_tointeger( L, sub_idx );
        }
      
      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Laser.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadIonCannon( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "IonCannon" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Count" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.IonCannon.Count = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.IonCannon.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTractorBeam( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "TractorBeam" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Strength" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.TractorBeam.Strength = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.TractorBeam.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTurrets( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Turrets" );

  if( !lua_isnil(L, ++idx))
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
	  size_t arraySubscript = lua_tointeger( L, -2 );
          LoadTurret( L, ship->WeaponSystems.Turret[arraySubscript] );
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

static void LoadWeaponSystems( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "WeaponSystems" );

  if( !lua_isnil( L, ++idx ) )
    {
      LoadTube( L, ship );
      LoadLaser( L, ship );
      LoadIonCannon( L, ship );
      LoadTractorBeam( L, ship );
      LoadTurrets( L, ship );
    }

  lua_pop( L, 1 );
}

static void LoadDefenses( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Defenses" );

  if( !lua_isnil( L, ++idx ) )
    {
      LoadCurrentAndMax( L, "Hull", ship->Defenses.Hull );
      LoadCurrentAndMax( L, "Shield", ship->Defenses.Shield );
      LoadCurrentAndMax( L, "Chaff", ship->Defenses.Chaff );
    }

  lua_pop( L, 1 );
}

static void LoadRooms( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "First" );
      lua_getfield( L, sub_idx, "Last" );
      lua_getfield( L, sub_idx, "Cockpit" );
      lua_getfield( L, sub_idx, "Entrance" );
      lua_getfield( L, sub_idx, "Hangar" );
      lua_getfield( L, sub_idx, "Engine" );
      lua_getfield( L, sub_idx, "Navseat" );
      lua_getfield( L, sub_idx, "Pilotseat" );
      lua_getfield( L, sub_idx, "Coseat" );
      lua_getfield( L, sub_idx, "Gunseat" );
      
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.First = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Last = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Cockpit = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Entrance = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Hangar = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Engine = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Navseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Pilotseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Coseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Gunseat = lua_tointeger( L, sub_idx );
        }
      
      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static int L_ShipEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  Ship *ship = NULL;
  size_t turretNum = 0;
  luaL_checktype( L, 1, LUA_TTABLE );

  AllocateMemory( ship, Ship, 1 );

  for( turretNum = 0; turretNum < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turretNum )
    {
      ship->WeaponSystems.Turret[turretNum] = AllocateTurret( ship );
    }

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "PersonalName" );
  lua_getfield( L, idx, "Description" );
  lua_getfield( L, idx, "Owner" );
  lua_getfield( L, idx, "Pilot" );
  lua_getfield( L, idx, "CoPilot" );
  lua_getfield( L, idx, "Class" );
  lua_getfield( L, idx, "Shipyard" );
  lua_getfield( L, idx, "Location" );
  lua_getfield( L, idx, "LastDock" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "State" );
  lua_getfield( L, idx, "Alarm" );
  lua_getfield( L, idx, "DockingPorts" );
  lua_getfield( L, idx, "Guard" );
  lua_getfield( L, idx, "Home" );
  
  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->PersonalName = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Description = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Owner = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Pilot = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->CoPilot = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Class = GetShipClass( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Shipyard = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Location = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->LastDock = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Type = GetShipType( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->State = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Alarm = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->DockingPorts = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Guard = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Home = CopyString( lua_tostring( L, idx ) );
    }

  lua_pop( L, elementsToPop );

  LuaLoadVector3( L, &ship->Position, "Position" );
  LoadInstruments( L, ship );
  LoadThrusters( L, ship );
  LoadHyperdrive( L, ship );
  LoadWeaponSystems( L, ship );
  LoadDefenses( L, ship );
  LoadRooms( L, ship );
  ship->Flags = LuaLoadFlags( L, "Flags" );
  ReadyShipAfterLoad( ship );
  return 0;
}

static void ReadyShipAfterLoad( Ship *ship )
{
  Clan *clan = NULL;
  Room *room = NULL;
  
  if (!ship->Home)
    {
      ship->Home = CopyString( "" );
    }

  if (!ship->Name)
    {
      ship->Name = CopyString( "" );
    }

  if (!ship->Owner)
    {
      ship->Owner = CopyString( "" );
    }

  if (!ship->Description)
    {
      ship->Description = CopyString( "" );
    }
  
  if (!ship->CoPilot)
    {
      ship->CoPilot = CopyString( "" );
    }

  if (!ship->Pilot)
    {
      ship->Pilot = CopyString( "" );
    }

  if (!IsShipDisabled( ship ))
    {
      ship->State = SHIP_LANDED;
    }

  if (ship->WeaponSystems.Laser.State != LASER_DAMAGED)
    {
      ship->WeaponSystems.Laser.State = LASER_READY;
    }

  if (ship->WeaponSystems.IonCannon.State != LASER_DAMAGED)
    {
      ship->WeaponSystems.IonCannon.State = LASER_READY;
    }

  if (ship->WeaponSystems.Tube.State != MISSILE_DAMAGED)
    {
      ship->WeaponSystems.Tube.State = MISSILE_READY;
    }

  if (ship->Shipyard <= 0)
    {
      ship->Shipyard = ROOM_LIMBO_SHIPYARD;
    }

  if (ship->LastDock <= 0)
    {
      ship->LastDock = ship->Shipyard;
    }

  if (ship->Rooms.Navseat <= 0)
    {
      ship->Rooms.Navseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Gunseat <= 0)
    {
      ship->Rooms.Gunseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Coseat <= 0)
    {
      ship->Rooms.Coseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Pilotseat <= 0)
    {
      ship->Rooms.Pilotseat = ship->Rooms.Cockpit;
    }

  if (ship->Type == 1)
    {
      ship->WeaponSystems.Tube.Torpedoes.Current = ship->WeaponSystems.Tube.Missiles.Current;    /* for back compatibility */
      ship->WeaponSystems.Tube.Missiles.Current = 0;
    }

  if( ship->Class < SHIP_PLATFORM )
    {
      ship->BayOpen = false;
    }

  AddShip(ship);

  ship->Docking = SHIP_READY;

  if ( ( !StrCmp("Trainer", ship->Owner)
	 || !StrCmp("Public",ship->Owner)
	 || ship->Type == MOB_SHIP ) )
    {
      if ( ship->Class != SHIP_PLATFORM && ship->Type != MOB_SHIP
	   && ship->Class != CAPITAL_SHIP )
	{
	  ExtractShip( ship );
	  ShipToRoom( ship , ship->Shipyard );

	  ship->Location = ship->Shipyard;
	  ship->LastDock = ship->Shipyard;
	  ship->State = SHIP_LANDED;
	  ship->Docking = SHIP_READY;
	}

      if( !ship->PersonalName )
	{
	  ship->PersonalName = CopyString(ship->Name);
	}

      ship->Thrusters.Speed.Current = 0;
      ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
      ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;
      ship->Defenses.Shield.Current = 0;

      ship->WeaponSystems.Laser.State = LASER_READY;
      ship->WeaponSystems.Tube.State = MISSILE_READY;
      ship->WeaponSystems.TractorBeam.State = SHIP_READY;
      ship->DockingState = SHIP_READY;
      ship->Docking = SHIP_READY;
      
      ship->CurrentJump = NULL;
      ship->WeaponSystems.Target = NULL;

      ship->HatchOpen = false;
      ship->BayOpen = false;

      ship->AutoRecharge = false;
      ship->AutoTrack = false;
      ship->AutoSpeed = false;
    }
  else if ( ( room = GetRoom( ship->LastDock ) ) != NULL
	    && ship->Class != CAPITAL_SHIP && ship->Class != SHIP_PLATFORM )
    {
      LINK( ship, room->FirstShip, room->LastShip, NextInRoom, PreviousInRoom );
      ship->InRoom = room;
      ship->Location = ship->LastDock;
    }

  if ( ship->Class == SHIP_PLATFORM
       || ship->Type == MOB_SHIP
       || ship->Class == CAPITAL_SHIP )
    {
      ShipToSpaceobject(ship, GetSpaceobject(ship->Home) );
      SetVector( &ship->Heading, 1, 1, 1 );

      if( ship->Position.x == 0 && ship->Position.y == 0 && ship->Position.z == 0 )
	{
	  if ( ship->Home )
	    {
	      ShipToSpaceobject(ship, GetSpaceobject(ship->Home));
	      InitializeVector( &ship->Position );

	      if( ship->Spaceobject )
		{
		  CopyVector( &ship->Position, &ship->Spaceobject->Position );
		}

	      RandomizeVector( &ship->Position, -5000, 5000 );
	      ship->State = SHIP_READY;
	      ship->Autopilot = true;
	      ship->AutoRecharge = true;
	      ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
	    }
	}

      ship->State = SHIP_READY;
      ship->Docking = SHIP_READY;
      ship->Autopilot = true;
      ship->AutoRecharge = true;
      ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
    }

  if ( ship->Type != MOB_SHIP
       && ( clan = GetClan( ship->Owner ) ) != NULL )
    {
      if ( ship->Class <= SHIP_PLATFORM )
	{
	  clan->Spacecraft++;
	}
      else
	{
	  clan->Vehicles++;
	}
    }
  
  ship->Docking = SHIP_READY;
}

static void ExecuteShipFile( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ShipEntry, "ShipEntry" );
}

void ResetShip( Ship *ship )
{
  int turret_num = 0;

  ship->State = SHIP_READY;
  ship->Docking = SHIP_READY;
  ship->Docked = NULL;

  if ( ship->Class != SHIP_PLATFORM
       && ship->Class != CAPITAL_SHIP
       && ship->Type != MOB_SHIP )
    {
      ExtractShip( ship );
      ShipToRoom( ship , ship->Shipyard );

      ship->Location = ship->Shipyard;
      ship->LastDock = ship->Shipyard;
      ship->State = SHIP_LANDED;
    }

  if (ship->Spaceobject)
    {
      ShipFromSpaceobject( ship, ship->Spaceobject );
    }

  ship->Thrusters.Speed.Current = 0;
  ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
  ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;
  ship->Defenses.Shield.Current = 0;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->WeaponSystems.Turret[turret_num];
      ResetTurret( turret );
    }

  ship->WeaponSystems.Laser.State = LASER_READY;
  ship->WeaponSystems.Tube.State = MISSILE_READY;

  ship->CurrentJump=NULL;
  ship->WeaponSystems.Target = NULL;

  ship->HatchOpen = false;
  ship->BayOpen = false;

  ship->AutoRecharge = false;
  ship->AutoTrack = false;
  ship->AutoSpeed = false;

#ifndef NODEATH
#ifndef NODEATHSHIP
  if ( StrCmp("Trainer", ship->Owner) && StrCmp("Public",ship->Owner) && ship->Type != MOB_SHIP )
    {
      Clan *clan = NULL;

      if ( ship->Type != MOB_SHIP && (clan = GetClan( ship->Owner )) != NULL )
        {
          if ( ship->Class <= SHIP_PLATFORM )
            clan->Spacecraft--;
          else
            clan->Vehicles--;
        }

      FreeMemory( ship->Owner );
      ship->Owner = CopyString( "" );
      FreeMemory( ship->Pilot );
      ship->Pilot = CopyString( "" );
      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( "" );
    }
#endif
#endif
  if ( IsNullOrEmpty( ship->Home ) )
    {
      if ( ship->Type == SHIP_REBEL
	   || ( ship->Type == MOB_SHIP && !StrCmp( ship->Owner , GOODGUY_CLAN ) ) )
        {
          FreeMemory( ship->Home );
          ship->Home = CopyString( "Hoth" );
        }
      else if ( ship->Type == SHIP_IMPERIAL
		|| ( ship->Type == MOB_SHIP && !StrCmp(ship->Owner, BADGUY_CLAN ) ) )
        {
          FreeMemory( ship->Home );
	  ship->Home = CopyString( "Coruscant" );
        }
      else if ( ship->Type == SHIP_CIVILIAN)
        {
          FreeMemory( ship->Home );
          ship->Home = CopyString( "Tatooine" );
        }
    }

  SaveShip(ship);
}

void EchoToNearbyShips( int color, const Ship *ship, const char *argument,
			const Ship *ignore )
{
  ListIterator *iterator = NULL;

  if (!ship->Spaceobject)
    {
      return;
    }

  iterator = AllocateListIterator(GetEntities(ShipRepository));

  while(ListHasMoreElements(iterator))
    {
      const Ship *target = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( !IsShipInCombatRange( ship, target ) )
        {
          continue;
        }

      if (target != ship && target != ignore
          && GetShipDistanceToShip( ship, target ) < 100 * (target->Instruments.Sensor + 10) * ((ship->Class == SHIP_DEBRIS ? 2 : ship->Class) + 1))
        {
          EchoToCockpit( color , target , argument );
        }
    }

  FreeListIterator(iterator);
}

Ship *GetShipInRoom( const Room *room, const char *name )
{
  Ship *ship = NULL;

  if ( !room )
    {
      return NULL;
    }

  for ( ship = room->FirstShip ; ship ; ship = ship->NextInRoom )
    {
      if( ship->PersonalName && !StrCmp( name, ship->PersonalName ) )
        {
          return ship;
        }

      if ( !StrCmp( name, ship->Name ) )
        {
          return ship;
        }
    }

  for ( ship = room->FirstShip ; ship ; ship = ship->NextInRoom )
    {
      if( ship->PersonalName && NiftyIsNamePrefix( name, ship->PersonalName ) )
        {
          return ship;
        }

      if ( NiftyIsNamePrefix( name, ship->Name ) )
        {
          return ship;
        }
    }

  return NULL;
}

/*
 * Get pointer to ship structure from ship name.
 */
Ship *GetShipAnywhere( const char *name )
{
  ListIterator *iterator = AllocateListIterator(GetEntities(ShipRepository));
  Ship *foundShip = NULL;

  while(ListHasMoreElements(iterator))
    {
      Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( ship->PersonalName && !StrCmp( name, ship->PersonalName ) )
	{
          foundShip = ship;
          break;
	}

      if ( !StrCmp( name, ship->Name ) )
	{
          foundShip = ship;
          break;
	}

      if( ship->PersonalName && NiftyIsNamePrefix( name, ship->PersonalName ) )
	{
          foundShip = ship;
          break;
	}

      if ( NiftyIsNamePrefix( name, ship->Name ) )
	{
          foundShip = ship;
          break;
	}
    }

  FreeListIterator(iterator);

  return foundShip;
}

/*
 * Checks if ship is in a spaceobject and returns pointer if it is.
 */
Ship *GetShipInRange( const char *name, const Ship *eShip)
{
  char arg[MAX_INPUT_LENGTH];
  int number = NumberArgument( name, arg );
  int count = 0;
  const List *shipList = GetEntities(ShipRepository);
  ListIterator *iterator = NULL;
  Ship *foundShip = NULL;

  if ( eShip == NULL )
    {
      return NULL;
    }

  iterator = AllocateListIterator(shipList);

  while(ListHasMoreElements(iterator))
    {
      Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if( !IsShipInCombatRange( eShip, ship ) )
	{
	  continue;
	}

      if( !ship->Spaceobject )
	{
	  continue;
	}

      if( ship->PersonalName && !StrCmp( arg, ship->PersonalName ) )
        {
          count++;

          if( !number || count == number )
	    {
              foundShip = ship;
              break;
	    }
        }

      if ( !StrCmp( arg, ship->Name ) )
        {
          count++;

          if( !number || count == number )
	    {
              foundShip = ship;
              break;
	    }
        }
    }

  FreeListIterator(iterator);

  if(foundShip == NULL)
    {
      iterator = AllocateListIterator(shipList);
      count = 0;

      while(ListHasMoreElements(iterator))
        {
          Ship *ship = (Ship*)GetListData(iterator);
          MoveToNextListElement(iterator);

          if( !IsShipInCombatRange( eShip, ship ) )
            {
              continue;
            }

          if( ship->PersonalName && NiftyIsNamePrefix( arg, ship->PersonalName ) )
            {
              count++;

              if( !number || count == number )
                {
                  foundShip = ship;
                  break;
                }
            }

          if ( NiftyIsNamePrefix( arg, ship->Name ) )
            {
              count++;

              if( !number || count == number )
                {
                  foundShip = ship;
                  break;
                }
            }
        }

      FreeListIterator(iterator);
    }

  return foundShip;
}

static bool _ShipFromCockpit(const Ship *ship, const void *userData)
{
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Cockpit
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[0] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[1] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[2] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[3] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[4] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[5] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[6] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[7] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[8] )
       || vnum == GetTurretRoom( ship->WeaponSystems.Turret[9] )
       || vnum == ship->Rooms.Hangar
       || vnum == ship->Rooms.Pilotseat
       || vnum == ship->Rooms.Coseat
       || vnum == ship->Rooms.Navseat
       || vnum == ship->Rooms.Gunseat
       || vnum == ship->Rooms.Engine )
    {
      return true;
    }
  else
    {
      return false;
    }
}

/*
 * Get pointer to ship structure from cockpit, turret, or entrance ramp vnum.
 */
Ship *GetShipFromCockpit( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, (Predicate*)_ShipFromCockpit, &vnum);
}

static bool _ShipFromPilotSeat(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Pilotseat )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromPilotSeat( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromPilotSeat, &vnum);
}

static bool _ShipFromCoSeat(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Coseat )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromCoSeat( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromCoSeat, &vnum);
}

static bool _ShipFromNavSeat(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Navseat )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromNavSeat( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromNavSeat, &vnum);
}

static bool _ShipFromGunSeat(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Gunseat )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromGunSeat( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromGunSeat, &vnum);
}

static bool _ShipFromEngine(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Engine || vnum == ship->Rooms.Cockpit )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromEngine( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromEngine, &vnum);
}

static bool _ShipFromTurret(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);
  int i = 0;
  
  for(i = 0; i < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++i)
    {
      if(vnum == GetTurretRoom(ship->WeaponSystems.Turret[i]))
        {
          return true;
        }
      else
        {
          continue;
        }
    }

  return false;
}

Ship *GetShipFromTurret( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromTurret, &vnum);
}

static bool _ShipFromEntrance(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Entrance )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromEntrance( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromEntrance, &vnum);
}

static bool _ShipFromHangar(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  vnum_t vnum = *((vnum_t*)userData);

  if ( vnum == ship->Rooms.Hangar )
    {
      return true;
    }
  else
    {
      return false;
    }
}

Ship *GetShipFromHangar( vnum_t vnum )
{
  const List *shipList = GetEntities(ShipRepository);
  return (Ship*) FindIfInList(shipList, _ShipFromHangar, &vnum);
}

void ShipToSpaceobject( Ship *ship, Spaceobject *spaceobject )
{
  if( ship && spaceobject )
    {
      ship->Spaceobject = spaceobject;
    }
}

void ShipFromSpaceobject( Ship *ship, Spaceobject *spaceobject )
{
  if ( spaceobject == NULL )
    {
      return;
    }

  if ( ship == NULL )
    {
      return;
    }

  ship->Spaceobject = NULL;
}

bool IsShipRental( const Character *ch, const Ship *ship )
{
  if ( !StrCmp("Public",ship->Owner) )
    {
      return true;
    }

  if ( !StrCmp("Trainer",ship->Owner) )
    {
      return true;
    }

  if ( ship->Class == SHIP_TRAINER )
    {
      return true;
    }

  return false;
}

static bool _ShipIsDockedToMe(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)userData;
  const Ship *dockedShip = (const Ship*)element;

  return dockedShip->Docked == ship;
}

bool CanDock( const Ship *ship )
{
  size_t count = 0;
  size_t ports = 0;
  const List *shipList = GetEntities(ShipRepository);

  if ( !ship )
    {
      return false;
    }

  if ( ship->Docked )
    {
      count++;
    }

  count = CountIfInList(shipList, _ShipIsDockedToMe, ship);

  if ( ship->DockingPorts && count >= (size_t)ship->DockingPorts )
    {
      return false;
    }

  if ( ship->Class < SHIP_PLATFORM )
    {
      ports = ship->Class + 1;
    }

  if ( ship->Class != SHIP_PLATFORM && count >= ports )
    {
      return false;
    }

  return true;
}

bool CheckPilot( const Character *ch, const Ship *ship )
{
  if ( !StrCmp(ch->Name,ship->Owner)
       || !StrCmp(ch->Name,ship->Pilot)
       || !StrCmp(ch->Name,ship->CoPilot)
       || !StrCmp("Public",ship->Owner)
       || !StrCmp("Trainer", ship->Owner) )
    {
      return true;
    }

  if ( !IsNpc(ch) && ch->PCData && ch->PCData->ClanInfo.Clan )
    {
      if ( !StrCmp(ch->PCData->ClanInfo.Clan->Name,ship->Owner) )
        {
          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2,ch->Name) )
	    {
	      return true;
	    }

          if ( ch->PCData->Bestowments && IsName( "pilot", ch->PCData->Bestowments) )
	    {
	      return true;
	    }
        }

      if ( !StrCmp(ch->PCData->ClanInfo.Clan->Name,ship->Pilot) )
        {
          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2,ch->Name) )
	    {
	      return true;
	    }

          if ( ch->PCData->Bestowments && IsName( "pilot", ch->PCData->Bestowments) )
	    {
	      return true;
	    }
        }

      if ( !StrCmp(ch->PCData->ClanInfo.Clan->Name,ship->CoPilot) )
        {
          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1,ch->Name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2,ch->Name) )
	    {
	      return true;
	    }

          if ( ch->PCData->Bestowments && IsName( "pilot", ch->PCData->Bestowments) )
	    {
	      return true;
	    }
        }
    }

  return false;
}

bool ExtractShip( Ship *ship )
{
  Room *room = ship->InRoom;

  if ( room )
    {
      UNLINK( ship, room->FirstShip, room->LastShip, NextInRoom, PreviousInRoom );
      ship->InRoom = NULL;
    }

  return true;
}

void DamageShip( Ship *ship, int min, int max, Character *ch, const Ship *assaulter )
{
  short ionFactor = 1;
  int dmg = 0;
  int shield_dmg = 0;
  long xp = 0;
  bool ions = false;

  if ( min < 0 && max < 0 )
    {
      ions = true;
      dmg = GetRandomNumberFromRange( max*(-1), min*(-1) );
    }
  else
    {
      dmg = GetRandomNumberFromRange( min , max );
    }

  if ( ions == true )
    {
      ionFactor = 2;
    }

  if( ch )
    {
      xp = ( GetRequiredXpForLevel( GetAbilityLevel(ch, PILOTING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, PILOTING_ABILITY ) ) ) / 25;
      xp = umin( GetShipValue( ship ) / 100, xp ) ;
      GainXP( ch, PILOTING_ABILITY, xp );
    }

  if ( ship->Defenses.Shield.Current > 0 )
    {
      shield_dmg = umin( ship->Defenses.Shield.Current, dmg );
      dmg -= shield_dmg;
      ship->Defenses.Shield.Current -= shield_dmg;

      if ( ship->Defenses.Shield.Current == 0 )
	{
	  EchoToCockpit( AT_BLOOD , ship , "Shields down..." );
	}
    }

  if ( dmg > 0 )
    {
      int turret_num = 0;

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor && !IsShipDisabled( ship ) )
        {
          EchoToCockpit( AT_BLOOD + AT_BLINK, ship, "Ships Drive DAMAGED!" );
          ship->State = SHIP_DISABLED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor
	   && ship->WeaponSystems.Tube.State != MISSILE_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Rooms.Gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->WeaponSystems.Tube.State = MISSILE_DAMAGED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 2*ionFactor
	   && ship->WeaponSystems.Laser.State != LASER_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Rooms.Gunseat) , "Lasers DAMAGED!" );
          ship->WeaponSystems.Laser.State = LASER_DAMAGED;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];

	  if ( GetRandomNumberFromRange(1, 100) <= 5 * ionFactor && !IsTurretDamaged( turret ) )
	    {
	      EchoToRoom( AT_BLOOD + AT_BLINK, GetRoom( GetTurretRoom( turret ) ),
			    "Turret DAMAGED!" );
	      SetTurretDamaged( turret );
	    }
	}

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor
	   && ship->WeaponSystems.TractorBeam.State != LASER_DAMAGED
	   && ship->WeaponSystems.TractorBeam.Strength )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Rooms.Pilotseat) , "Tractorbeam DAMAGED!" );
          ship->WeaponSystems.TractorBeam.State = LASER_DAMAGED;
        }

      if ( ions == false )
	{
          ship->Defenses.Hull.Current -= dmg * 5;
        }
    }

  if ( ship->Defenses.Hull.Current <= 0 )
    {
      DestroyShip( ship , ch );

      if( ch )
	{
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      ship->Name, ship->PersonalName, ch->Name );

	  xp =  ( GetRequiredXpForLevel( GetAbilityLevel( ch, PILOTING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, PILOTING_ABILITY ) ) );
	  xp = umin( GetShipValue( ship ) , xp );
	  GainXP( ch, PILOTING_ABILITY, xp);
	  Echo( ch, "&WYou gain %ld piloting experience!\r\n", xp );
	}
      else
	{
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      ship->Name, ship->PersonalName, (assaulter ? assaulter->PersonalName : "a collision" ) );
	}

      return;
    }

  if ( ship->Defenses.Hull.Current <= ship->Defenses.Hull.Max/20 )
    {
      EchoToCockpit( AT_BLOOD+ AT_BLINK , ship , "WARNING! Ship hull severely damaged!" );
    }
}

void DestroyShip( Ship *ship, Character *killer )
{
  char buf[MAX_STRING_LENGTH];
  vnum_t roomnum = INVALID_VNUM;
  Room *room = NULL;
  Object *robj = NULL;
  Character *rch = NULL;
  const List *shipList = NULL;
  ListIterator *iterator = NULL;

  if (!ship)
    {
      return;
    }

  sprintf( buf , "%s explodes in a blinding flash of light!", ship->Name );
  EchoToNearbyShips( AT_WHITE + AT_BLINK, ship, buf, NULL );
  EchoToShip( AT_WHITE + AT_BLINK, ship, "A blinding flash of light burns your eyes...");
  EchoToShip( AT_WHITE, ship, "But before you have a chance to scream...\r\nYou are ripped apart as your spacecraft explodes...");

#ifdef NODEATH
  ResetShip(ship);
  MakeDebris(ship);
  return;
#endif
#ifdef NODEATHSHIP
  ResetShip(ship);
  MakeDebris(ship);
  return;
#endif

  if ( !StrCmp("Trainer", ship->Owner))
    {
      ResetShip(ship);
      return;
    }

  MakeDebris(ship);

  for ( roomnum = ship->Rooms.First; roomnum <= ship->Rooms.Last; roomnum++ )
    {
      room = GetRoom(roomnum);

      if (room != NULL)
        {
          rch = room->FirstPerson;

          while ( rch )
            {
              if ( IsImmortal(rch) )
                {
                  CharacterFromRoom(rch);
                  CharacterToRoom( rch, GetRoom(WhereHome(rch)) );
                }
              else
                {
                  if ( killer )
		    {
		      RawKill( killer, rch );
		    }
                  else
		    {
		      RawKill( rch , rch );
		    }
                }

              rch = room->FirstPerson;
            }

          for ( robj = room->FirstContent ; robj ; robj = robj->NextContent )
            {
              SeparateOneObjectFromGroup( robj );
              ExtractObject( robj );
            }
        }
    }

  shipList = GetEntities(ShipRepository);
  iterator = AllocateListIterator(shipList);

  while(ListHasMoreElements(iterator))
    {
      Ship *lship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);

      if ( ship->Rooms.Hangar == INVALID_VNUM
           || lship->Location != ship->Rooms.Hangar)
	{
	  continue;
	}

      if ( lship->Docked && lship->Docked == ship )
        {
          lship->Docked = NULL;
          ship->Docking = SHIP_READY;
        }

      if ( killer )
        {
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      lship->Name, lship->PersonalName, killer->Name );
        }
      else
        {
	  LogPrintf( "%s(%s) was just destroyed by a mob ship.",
		      lship->Name, lship->PersonalName );
        }

      DestroyShip( lship, killer );
    }

  FreeListIterator(iterator);
  ResetShip(ship);
}

bool ShipToRoom(Ship *ship, vnum_t vnum )
{
  Room *shipto = NULL;

  if ( (shipto = GetRoom(vnum)) == NULL )
    {
      return false;
    }

  LINK( ship, shipto->FirstShip, shipto->LastShip, NextInRoom, PreviousInRoom );
  ship->InRoom = shipto;
  return true;
}

bool RentShip( Character *ch, const Ship *ship )
{
  long price = 0;

  if ( IsNpc ( ch ) )
    {
      return false;
    }

  price = GetShipValue( ship ) / 100;

  if ( ch->Gold < price )
    {
      Echo(ch, "&RRenting this ship costs %ld. You don't have enough credits!\r\n" , price );
      return false;
    }

  ch->Gold -= price;
  Echo(ch, "&GYou pay %ld credits to rent the ship.\r\n" , price );
  return true;
}

struct UniqueNameData
{
  const char *Name;
  const char *PersonalName;
};

static bool _ShipWithNameCombo(const void *element, const void *userData)
{
  const Ship *ship = (const Ship*)element;
  const struct UniqueNameData *data = (struct UniqueNameData*)userData;

  if( !StrCmp( ship->Name, data->Name )
      && !StrCmp( ship->PersonalName, data->PersonalName ) )
    {
      return true;
    }
  else
    {
      return false;
    }
}

bool ShipNameAndPersonalnameComboIsUnique( const char *name, const char *personalname )
{
  struct UniqueNameData userData;
  const List *shipList = GetEntities(ShipRepository);
  bool found = false;
  bool nameIsUnique = false;

  userData.Name = name;
  userData.PersonalName = personalname;
  found = FindIfInList(shipList, _ShipWithNameCombo, &userData) != NULL;

  if(!found)
    {
      nameIsUnique = true;
    }

  return nameIsUnique;
}

void AddShip(Ship *ship)
{
  AddEntity(ShipRepository, ship);
}

void RemoveShip(Ship *ship)
{
  RemoveEntity(ShipRepository, ship);
}

void ForEachShip(bool (*callback)(Ship *ship, void *ud), void *userData)
{
  const List *shipList = GetEntities(ShipRepository);
  ListIterator *iterator = AllocateListIterator(shipList);

  while(ListHasMoreElements(iterator))
    {
      Ship *ship = (Ship*)GetListData(iterator);
      bool keepGoing = false;

      MoveToNextListElement(iterator);
      keepGoing = callback(ship, userData);

      if(!keepGoing)
        {
          break;
        }
    }

  FreeListIterator(iterator);
}

void LoadShips(void)
{
  assert(ShipRepository != NULL);
  LoadEntities(ShipRepository);
}

/**********************************************
 ShipRepository
 **********************************************/

struct ShipRepository
{
  struct RepositoryBase Base;
};

static void _LoadShips(Repository *repo)
{
  ForEachLuaFileInDir( SHIP_DIR, ExecuteShipFile, NULL );
}

static void _SaveShips(const Repository *repo)
{
  ListIterator *iterator = AllocateListIterator(GetEntities(repo));

  while(ListHasMoreElements(iterator))
    {
      const Ship *ship = (Ship*)GetListData(iterator);
      MoveToNextListElement(iterator);
      SaveShip(ship);
    }

  FreeListIterator(iterator);
}

Repository *NewShipRepository(void)
{
  struct ShipRepository *repo = (struct ShipRepository*)calloc(1, sizeof(struct ShipRepository));
  InitRepositoryBase(&repo->Base, _LoadShips, _SaveShips);

  return (Repository*)repo;
}
