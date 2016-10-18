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

#include <ctype.h>
#include <string.h>
#include "ship.h"
#include "mud.h"
#include "vector3_aux.h"
#include "character.h"
#include "turret.h"
#include "missile.h"
#include "clan.h"
#include "skill.h"
#include "spaceobject.h"

Ship *first_ship = NULL;
Ship *last_ship = NULL;

static int baycount = 0;

static void ReadShip( Ship *ship, FILE *fp );
static bool LoadShipFile( const char *shipfile );
static void ApproachLandingSite( Ship *ship, const char *arg );
static void LandShip( Ship *ship, const char *arg );
static void LaunchShip( Ship *ship );
static void MakeDebris( const Ship *ship );
static bool CaughtInGravity( const Ship *ship, const Spaceobject *space);
static bool WillCollideWithSun( const Ship *ship, const Spaceobject *sun );
static void EvadeCollisionWithSun( Ship *ship, const Spaceobject *sun );
static bool ShipHasState( const Ship *ship, short state );
static void DockShip( Character *ch, Ship *ship );

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

static bool ShipHasState( const Ship *ship, short state )
{
  return ship->ShipState == state;
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
  ship->Energy -= ship->CurrentSpeed/10;
  ship->CurrentSpeed = ship->RealSpeed;
  EchoToRoom( AT_RED , GetRoom(ship->Room.Pilotseat),
		"Automatic Override: Evading to avoid collision with sun!\r\n" );

  if ( ship->ShipClass == FIGHTER_SHIP
       || ( ship->ShipClass == MIDSIZE_SHIP && ship->Maneuver > 50 ) )
    {
      ship->ShipState = SHIP_BUSY_3;
    }
  else if ( ship->ShipClass == MIDSIZE_SHIP
	    || ( ship->ShipClass == CAPITAL_SHIP && ship->Maneuver > 50 ) )
    {
      ship->ShipState = SHIP_BUSY_2;
    }
  else
    {
      ship->ShipState = SHIP_BUSY;
    }
}

void UpdateShipMovement( void )
{
  Ship *ship = NULL;
  Spaceobject *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( !ship->Spaceobject )
	{
	  continue;
	}

      if( ship->ShipState == SHIP_LANDED && ship->Spaceobject )
	{
	  ship->ShipState = SHIP_READY;
	}

      if ( ship->ShipState != SHIP_LAND && ship->ShipState != SHIP_LAND_2)
        {
          MoveShip( ship );
        }

      /*
       * Tractor beam handling
       */
      if ( ship->TractoredBy )
        {
          /* Tractoring ship is smaller and therefore moves towards target */
          if( ship->TractoredBy->ShipClass <= ship->ShipClass )
            {
              ship->TractoredBy->CurrentSpeed = ship->TractoredBy->WeaponSystems.TractorBeam/4;
              SetShipCourseTowardsShip( ship->TractoredBy, ship );

	      if( GetShipDistanceToShip( ship, ship->TractoredBy ) < 10 )
                {
                  CopyVector( &ship->TractoredBy->Position, &ship->Position );
                }
            }

          /* Target is smaller and therefore pulled to target */
          if ( ship->TractoredBy->ShipClass > ship->ShipClass )
            {
              ship->CurrentSpeed = ship->TractoredBy->WeaponSystems.TractorBeam/4;
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

          if ( ship->CurrentSpeed > 0 )
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
                  ship->CurrentSpeed = 0;
                }

            }
        }
    }

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( IsShipInHyperspace( ship ) )
        {
          Vector3 tmp;
          float dist = 0;
	  float origdist = 0;

          ship->Hyperdistance -= ship->Hyperspeed;

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

		  EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Pilotseat),
				"Hyperjump complete." );
		  EchoToShip( AT_YELLOW, ship,
				"The ship slams to a halt as it comes out of hyperspace." );
		  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
		  dmg = 15 * GetRandomNumberFromRange( 1, 4 );
		  ship->Hull -= dmg;
		  EchoToShip( AT_YELLOW, ship,
				"The hull cracks from the pressure." );
		  CopyVector( &ship->Position, &ship->HyperPosition );
		  ShipToSpaceobject( ship, ship->CurrentJump );
		  ship->CurrentJump = NULL;
		  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
		  ship->ShipState = SHIP_READY;
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
                  EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
                           ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
                  CopyVector( &ship->HyperPosition, &ship->Position );
                  ShipToSpaceobject( ship, ship->CurrentJump );
                  ship->CurrentJump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->ShipState = SHIP_READY;
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
                  EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
			   ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
                  CopyVector( &ship->Position, &ship->HyperPosition );
                  ShipToSpaceobject( ship, ship->CurrentJump );
                  ship->CurrentJump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->ShipState = SHIP_READY;
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
              EchoToRoomNoNewline( AT_YELLOW , GetRoom(ship->Room.Pilotseat), "Remaining jump distance: " );
              EchoToRoom( AT_WHITE , GetRoom(ship->Room.Pilotseat), buf );
            }

	  if( IsShipInHyperspace( ship ) )
	    {
	      if( ship->Count % 2
		  && ship->Hyperdistance < 10 * ship->Hyperspeed
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

          ship->ShipState = ship->Docked->ShipState;
          ship->Hyperdistance = ship->Docked->Hyperdistance;
          ship->CurrentSpeed = ship->Docked->CurrentSpeed;
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
       && ( ship->ShipClass != MIDSIZE_SHIP || target->ShipClass != MIDSIZE_SHIP ) )
    {
      destination = target->Room.Hanger;
    }

  if ( !ShipToRoom( ship, destination ) )
    {
      EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Pilotseat), "Could not complete approach. Landing aborted.");
      EchoToShip( AT_YELLOW, ship , "The ship pulls back up out of its landing sequence.");

      if ( !IsShipDisabled( ship ))
	{
	  ship->ShipState = SHIP_READY;
	}

      return;
    }

  EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Pilotseat), "Landing sequence complete.");
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
      ship->ShipState = SHIP_LANDED;
    }

  ShipFromSpaceobject(ship, ship->Spaceobject);

  if (ship->Tractored)
    {
      if (ship->Tractored->TractoredBy == ship)
	{
	  ship->Tractored->TractoredBy = NULL;
	}

      ship->Tractored = NULL;
    }

  sprintf( buf, "%s lands on the platform.", ship->Name );
  EchoToRoom( AT_YELLOW, GetRoom(ship->Location), buf );

  ship->Energy = ship->Energy - 25 - 25*ship->ShipClass;

  if ( !StrCmp("Public",ship->Owner)
       || !StrCmp("trainer",ship->Owner)
       || ship->ShipClass == SHIP_TRAINER )
    {
      int turret_num = 0;

      ship->Energy = ship->MaxEnergy;
      ship->Shield = 0;
      ship->AutoRecharge = false;
      ship->AutoTrack = false;
      ship->AutoSpeed = false;
      ship->Hull = ship->MaxHull;

      ship->WeaponSystems.State.Missile = MISSILE_READY;
      ship->WeaponSystems.State.Laser0 = LASER_READY;

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];
	  ResetTurret( turret );
	}

      ship->ShipState = SHIP_LANDED;

      EchoToCockpit( AT_YELLOW , ship , "Repairing and refueling ship..." );
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
       && ( ship->ShipClass != MIDSIZE_SHIP || target->ShipClass != MIDSIZE_SHIP ) )
    {
      strcpy( buf2, target->Name);
    }

  if ( !found && !target )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Pilotseat), "ERROR");
      return;
    }

  sprintf( buf, "Approaching %s.", buf2 );
  EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Pilotseat), buf);
  sprintf( buf, "%s begins its approach to %s.", ship->Name, buf2 );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}

static void LaunchShip( Ship *ship )
{
  char buf[MAX_STRING_LENGTH];
  Ship *target = NULL;
  int plusminus = 0;

  ShipToSpaceobject( ship, GetSpaceobjectFromDockVnum( ship->Location ) );

  if ( !ship->Spaceobject )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Pilotseat) , "Launch path blocked... Launch aborted.");
      EchoToShip( AT_YELLOW , ship , "The ship slowly sets back back down on the landing pad.");
      sprintf( buf ,  "%s slowly sets back down." ,ship->Name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
      ship->ShipState = SHIP_LANDED;
      return;
    }

  ExtractShip(ship);

  ship->Location = INVALID_VNUM;

  if (!IsShipDisabled( ship ))
    {
      ship->ShipState = SHIP_READY;
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
      for ( target = first_ship; target; target = target->Next )
        {
          if (ship->LastDock == target->Room.Hanger)
            {
              CopyVector( &ship->Position, &target->Position );
            }
        }
    }

  ship->Energy -= (100+100*ship->ShipClass);

  ship->Position.x += (ship->Heading.x * ship->CurrentSpeed * 2);
  ship->Position.y += (ship->Heading.y * ship->CurrentSpeed * 2);
  ship->Position.z += (ship->Heading.z * ship->CurrentSpeed * 2);

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

  if ( ship->ShipClass == SHIP_DEBRIS )
    {
      return;
    }

  AllocateMemory( debris, Ship, 1 );

  LINK( debris, first_ship, last_ship, Next, Previous );

  debris->Owner       = CopyString( "" );
  debris->CoPilot     = CopyString( "" );
  debris->Pilot       = CopyString( "" );
  debris->Home        = CopyString( "" );
  debris->Type        = SHIP_CIVILIAN;

  if( ship->Type != MOB_SHIP )
    {
      debris->Type          = ship->Type;
    }

  debris->ShipClass      = SHIP_DEBRIS;
  debris->WeaponSystems.NumberOfLasers      = ship->WeaponSystems.NumberOfLasers  ;
  debris->WeaponSystems.Projectiles.MissileCount.Current    = ship->WeaponSystems.Projectiles.MissileCount.Current  ;
  debris->WeaponSystems.Projectiles.RocketCount.Current     = ship->WeaponSystems.Projectiles.RocketCount.Current  ;
  debris->WeaponSystems.Projectiles.TorpedoCount.Current    = ship->WeaponSystems.Projectiles.TorpedoCount.Current  ;
  debris->MaxShield   = ship->MaxShield  ;
  debris->MaxHull     = ship->MaxHull  ;
  debris->MaxEnergy   = ship->MaxEnergy  ;
  debris->Hyperspeed  = ship->Hyperspeed  ;
  debris->Chaff       = ship->Chaff  ;
  debris->RealSpeed   = ship->RealSpeed  ;
  debris->CurrentSpeed   = ship->CurrentSpeed  ;
  debris->Maneuver    = ship->Maneuver  ;

  debris->Hull = ship->MaxHull;

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
  ship->CurrentSpeed = 0;
  CopyVector( &ship->Position, &ship->Docked->Position );

  if( ch )
    {
      if ( ship->ShipClass == FIGHTER_SHIP )
        {
          LearnFromSuccess( ch, gsn_starfighters );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->ShipClass == MIDSIZE_SHIP )
        {
          LearnFromSuccess( ch, gsn_midships );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->ShipClass == CAPITAL_SHIP )
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
  ship->ShipState = SHIP_READY;

  ExtractShip( ship );
  ShipToRoom( ship , ship->Shipyard );

  ship->Location = ship->Shipyard;
  ship->LastDock = ship->Shipyard;
  ship->ShipState = SHIP_LANDED;
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

  ship->WeaponSystems.Target0 = target;
  sprintf( buf , "You are being targetted by %s." , ship->Name);
  EchoToCockpit( AT_BLOOD , target , buf );
  sprintf( buf , "The ship targets %s." , target->Name);
  EchoToCockpit( AT_BLOOD , ship , buf );
}

bool CheckHostile( Ship *ship )
{
  long distance = -1;
  long tempdistance = 0;
  Ship *target = NULL;
  Ship *enemy = NULL;

  if ( !IsShipAutoflying(ship) || ship->ShipClass == SHIP_DEBRIS )
    return false;

  for( target = first_ship; target; target = target->Next )
    {
      if( !IsShipInCombatRange( ship, target ) )
        continue;

      if ( !StrCmp( ship->Owner, "The Empire" ) )
        {
          if ( !StrCmp( target->Owner , "The Rebel Alliance" )
	       || !StrCmp( target->Owner , "The New Republic"))
            {
              tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!StrCmp( ship->Owner, "The Rebel Alliance" ))
	   || (!StrCmp( ship->Owner , "The New Republic" )))
        {
          if ( !StrCmp( target->Owner, "The Empire" ) )
            {
              tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
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
              tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }
    }

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
          if ( ship->ShipClass > CLOUD_CAR )
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
          if ( ship->ShipClass != OCEAN_SHIP )
            {
              SendToCharacter( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }

        }

      if ( IsBitSet( pexit->Flags, EX_CLIMB ) )
        {
          if ( ship->ShipClass < CLOUD_CAR )
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
      if (  ship->ShipClass < OCEAN_SHIP )
	{
	  txt = "fly";
	}
      else if ( ship->ShipClass == OCEAN_SHIP  )
	{
	  txt = "float";
	}
      else if ( ship->ShipClass > OCEAN_SHIP  )
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
  else if (  ship->ShipClass < OCEAN_SHIP )
    {
      txt = "flys in";
    }
  else if ( ship->ShipClass == OCEAN_SHIP  )
    {
      txt = "floats in";
    }
  else if ( ship->ShipClass > OCEAN_SHIP  )
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

  for ( roomVnum = ship->Room.First ; roomVnum <= ship->Room.Last ;roomVnum++ )
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
  Ship *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  bool closeem = false;
  int origchance = 100;

  baycount++;

  if ( baycount >= 60 )
    {
      closeem = true;
      baycount = 0;
    }

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      int turret_num = 0;

      if ( ship->ShipClass == SHIP_PLATFORM )
	{
	  if ( closeem && ship->Guard )
	    {
	      ship->BayOpen = false;
	    }
	}

      if (ship->WeaponSystems.State.Laser0 > LASER_READY)
        {
          ship->Energy -= ship->WeaponSystems.State.Laser0;
          ship->WeaponSystems.State.Laser0 = LASER_READY;
        }

      if (ship->WeaponSystems.State.Ion0 > LASER_READY)
        {
          ship->Energy -= 10*ship->WeaponSystems.State.Ion0;
          ship->WeaponSystems.State.Ion0 = LASER_READY;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];
	  ship->Energy -= GetTurretEnergyDraw( turret );
	}

      if( ship->Docked && ship->Docked->ShipClass == SHIP_PLATFORM )
        {
          if( ship->MaxEnergy - ship->Energy > 500 )
	    {
	      ship->Energy += 500;
	    }
          else
	    {
	      ship->Energy = ship->MaxEnergy;
	    }
        }

      if (ship->WeaponSystems.State.Missile == MISSILE_RELOAD_2)
        {
          ship->WeaponSystems.State.Missile = MISSILE_READY;

          if ( ship->WeaponSystems.Projectiles.MissileCount.Current > 0 )
	    {
	      EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Gunseat),
			    "Missile launcher reloaded.");
	    }
        }

      if (ship->WeaponSystems.State.Missile == MISSILE_RELOAD )
        {
          ship->WeaponSystems.State.Missile = MISSILE_RELOAD_2;
        }

      if (ship->WeaponSystems.State.Missile == MISSILE_FIRED )
	{
	  ship->WeaponSystems.State.Missile = MISSILE_RELOAD;
	}

      if ( IsShipAutoflying(ship) )
        {
          if ( ship->Spaceobject && ship->ShipClass != SHIP_DEBRIS )
            {
              if (ship->WeaponSystems.Target0 && ship->WeaponSystems.State.Laser0 != LASER_DAMAGED )
                {
                  int the_chance = 75;
                  Ship *target = ship->WeaponSystems.Target0;
                  int shots = 0, guns = 0;
                  int whichguns = 0;

                  if ( ship->WeaponSystems.NumberOfLasers && ship->WeaponSystems.NumberOfIonCannons && ship->WeaponSystems.NumberOfLasers < 7 && ship->WeaponSystems.NumberOfIonCannons < 7 )
                    {
                      whichguns = 2;
                      guns = ship->WeaponSystems.NumberOfLasers + ship->WeaponSystems.NumberOfIonCannons;
                    }
                  else if ( ship->WeaponSystems.Target0->Shield > 0 && ship->WeaponSystems.NumberOfIonCannons )
                    {
		      whichguns = 1;
                      guns = ship->WeaponSystems.NumberOfIonCannons;
                    }
                  else
		    {
		      guns = ship->WeaponSystems.NumberOfLasers;
		    }

                  for ( shots=0 ; shots < guns; shots++ )
                    {
                      if ( !IsShipInHyperspace( ship )
                          && ship->Energy > 25
                          && IsShipInCombatRange( ship, target )
                          && GetShipDistanceToShip( target, ship ) <= 1000 )
                        {
                          if ( ship->ShipClass > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                            {
                              the_chance += target->ShipClass - ship->ShipClass;
                              the_chance += ship->CurrentSpeed - target->CurrentSpeed;
                              the_chance += ship->Maneuver - target->Maneuver;
                              the_chance -= GetShipDistanceToShip( ship, target ) / ( 10 * ( target->ShipClass + 1 ) );
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
                                      if( ship->ShipClass == SHIP_PLATFORM )
					{
					  DamageShip( target, 100, 250, NULL, ship );
					}
                                      else if( ship->ShipClass == CAPITAL_SHIP
					       && target->ShipClass != CAPITAL_SHIP )
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
                                      if( ship->ShipClass == SHIP_PLATFORM )
					{
					  DamageShip( target, -250, -100, NULL, ship );
					}
                                      else if( ship->ShipClass == CAPITAL_SHIP && target->ShipClass != CAPITAL_SHIP )
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
                                      if( shots < ship->WeaponSystems.NumberOfLasers )
                                        {
                                          sprintf( buf, "Laserfire from %s hits %s." , ship->Name, target->Name );
                                          EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by lasers from %s!" , ship->Name);
                                          EchoToCockpit( AT_BLOOD , target , buf );
                                          EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->ShipClass == SHIP_PLATFORM )
					    {
					      DamageShip( target, 100, 250, NULL, ship );
					    }
                                          else if( ship->ShipClass == CAPITAL_SHIP && target->ShipClass != CAPITAL_SHIP )
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
                                          if( ship->ShipClass == SHIP_PLATFORM )
					    {
					      DamageShip( target, -250, -100, NULL, ship );
					    }
                                          else if( ship->ShipClass == CAPITAL_SHIP && target->ShipClass != CAPITAL_SHIP )
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

                              ship->WeaponSystems.State.Laser0++;

                              if ( IsShipAutoflying(target) && !target->WeaponSystems.Target0)
                                {
                                  sprintf( buf , "You are being targetted by %s." , target->Name);
                                  EchoToCockpit( AT_BLOOD , ship , buf );
                                  target->WeaponSystems.Target0 = ship;
                                }
			    }
                        }
                    }
                }
            }
        }
    }
}

void ShipUpdate( void )
{
  Ship *ship = NULL;
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH];
  int too_close = 0, target_too_close = 0;
  Spaceobject *spaceobj = NULL;
  int recharge = 0;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      int turret_num = 0;

      if ( ship->Spaceobject
	   && ship->Energy > 0
	   && IsShipDisabled( ship )
	   && ship->ShipClass != SHIP_PLATFORM )
	{
	  ship->Energy -= 100;
	}
      else if ( ship->Energy > 0 )
	{
	  ship->Energy += ( 5 + ship->ShipClass*5 );
	}
      else
	{
	  ship->Energy = 0;
	}

      if ( ship->ChaffReleased > 0 )
	{
	  ship->ChaffReleased = !ship->ChaffReleased;
	}

      /* following was originaly to fix ships that lost their pilot
         in the middle of a manuever and are stuck in a busy state
         but now used for timed manouevers such as turning */

      if( ship->ShipState == SHIP_READY && ship->Tracking == true )
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

      if (ship->ShipState == SHIP_BUSY_3)
        {
          EchoToRoom( AT_YELLOW, GetRoom(ship->Room.Pilotseat), "Manuever complete.");
          ship->ShipState = SHIP_READY;
        }

      if (ship->ShipState == SHIP_BUSY_2)
	{
	  ship->ShipState = SHIP_BUSY_3;
	}

      if (ship->ShipState == SHIP_BUSY)
	{
	  ship->ShipState = SHIP_BUSY_2;
	}

      if (ship->ShipState == SHIP_LAND_2)
	{
	  LandShip( ship , ship->LandingDestination );
	}

      if (ship->ShipState == SHIP_LAND)
        {
          ApproachLandingSite( ship, ship->LandingDestination );
          ship->ShipState = SHIP_LAND_2;
        }

      if (ship->ShipState == SHIP_LAUNCH_2)
	{
	  LaunchShip( ship );
	}

      if (ship->ShipState == SHIP_LAUNCH)
	{
	  ship->ShipState = SHIP_LAUNCH_2;
	}

      if (ship->Docking == SHIP_DOCK_2)
	{
	  DockShip( ship->Ch , ship );
	}

      if (ship->Docking == SHIP_DOCK)
	{
	  ship->Docking = SHIP_DOCK_2;
	}

      ship->Shield = umax( 0 , ship->Shield-1-ship->ShipClass);

      if (ship->AutoRecharge
	  && ship->MaxShield > ship->Shield
	  && ship->Energy > 100)
        {
          recharge = umin( ship->MaxShield-ship->Shield, 10 + ship->ShipClass*10 );
          recharge = umin( recharge , ship->Energy/2 -100 );
	  recharge = umax( 1, recharge );
          ship->Shield += recharge;
          ship->Energy -= recharge;
        }

      if ( IsShipAutoflying(ship)
	   && ( ship->Energy >= ( ( 25 + ((int)ship->ShipClass) * 25 ) * ( 2 + ((int)ship->ShipClass) ) ) )
           && ( ( ship->MaxShield - ship->Shield ) >= ( 25 + ((int)ship->ShipClass) * 25 ) ) )
        {
          recharge = 25+ship->ShipClass*25;
          recharge = umin(  ship->MaxShield-ship->Shield , recharge );
          ship->Shield += recharge;
          ship->Energy -= ( recharge*2 + recharge * ship->ShipClass );
        }

      if (ship->Shield > 0)
        {
          if (ship->Energy < 200)
            {
              ship->Shield = 0;
              EchoToCockpit( AT_RED, ship,"The ships shields fizzle and die.");
              ship->AutoRecharge = false;
            }
        }

      if ( ship->Spaceobject && ship->CurrentSpeed > 0 )
        {
          sprintf( buf, "%d", ship->CurrentSpeed );
          EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Room.Pilotseat),  "Speed: " );
          EchoToRoomNoNewline( AT_LBLUE , GetRoom(ship->Room.Pilotseat),  buf );
          sprintf( buf, "%.0f %.0f %.0f", ship->Position.x , ship->Position.y, ship->Position.z );
          EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Room.Pilotseat),  "  Coords: " );
          EchoToRoom( AT_LBLUE , GetRoom(ship->Room.Pilotseat),  buf );

          if ( ship->Room.Pilotseat != ship->Room.Coseat )
            {
              sprintf( buf, "%d", ship->CurrentSpeed );
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Room.Coseat),  "Speed: " );
              EchoToRoomNoNewline( AT_LBLUE , GetRoom(ship->Room.Coseat),  buf );
              sprintf( buf, "%.0f %.0f %.0f", ship->Position.x , ship->Position.y, ship->Position.z );
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->Room.Coseat),  "  Coords: " );
              EchoToRoom( AT_LBLUE , GetRoom(ship->Room.Coseat),  buf );
	    }
        }

      if ( ship->Spaceobject )
        {
          too_close = ship->CurrentSpeed + 50;
          too_close = ship->CurrentSpeed + 50;

          for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
	    {
	      if( spaceobj->Name &&  StrCmp(spaceobj->Name,"")
		  && GetShipDistanceToSpaceobject( ship, spaceobj ) < too_close )
		{
		  sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f", spaceobj->Name,
			   spaceobj->Position.x, spaceobj->Position.y, spaceobj->Position.z);
		  EchoToRoom( AT_RED , GetRoom(ship->Room.Pilotseat),  buf );
		}
	    }

          for ( target = first_ship; target; target = target->Next )
            {
              if( (target->Docked && target->Docked == ship) || (ship->Docked &&  ship->Docked == target ) )
		{
		  continue;
		}

              if ( ship->Docked && target->Docked
                   && target->Docked == ship->Docked )
		{
		  continue;
		}

              target_too_close = too_close + target->CurrentSpeed;

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
                      EchoToRoom( AT_RED, GetRoom(ship->Room.Pilotseat),
                                    buf );
                    }
                }
            }

	  too_close = ship->CurrentSpeed + 100;
        }

      if (ship->WeaponSystems.Target0 && ship->ShipClass <= SHIP_PLATFORM)
        {
          sprintf( buf, "%s   %.0f %.0f %.0f", ship->WeaponSystems.Target0->Name,
                   ship->WeaponSystems.Target0->Position.x, ship->WeaponSystems.Target0->Position.y,
                   ship->WeaponSystems.Target0->Position.z );
          EchoToRoomNoNewline( AT_BLUE, GetRoom(ship->Room.Gunseat),"Target: ");
          EchoToRoom( AT_LBLUE , GetRoom(ship->Room.Gunseat),  buf );

          if (!IsShipInCombatRange( ship, ship->WeaponSystems.Target0 ) )
            {
              EchoToRoom( AT_LBLUE , GetRoom(ship->Room.Gunseat),  "Your target seems to have left.");
              ship->WeaponSystems.Target0 = NULL;
            }
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];

	  if ( TurretHasTarget( turret ) && ship->ShipClass <= SHIP_PLATFORM)
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

      if (ship->Energy < 100 && ship->Spaceobject )
        {
          EchoToCockpit( AT_RED , ship,  "Warning: Ship fuel low." );
	}

      ship->Energy = urange( 0 , ship->Energy, ship->MaxEnergy );
    }

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if( ship->WeaponSystems.Target0 && IsShipAutoflying(ship) )
	{
	  if( !IsShipInCombatRange( ship->WeaponSystems.Target0, ship ) )
	    {
	      EchoToRoom( AT_BLUE , GetRoom(ship->Room.Pilotseat), "Target left, returning to NORMAL condition.\r\n" );
	      ship->CurrentSpeed = 0;
	      ship->WeaponSystems.Target0 = NULL;
	    }
	}

      if (ship->AutoTrack && ship->Docking == SHIP_READY && ship->WeaponSystems.Target0 && ship->ShipClass < SHIP_PLATFORM )
        {

          target = ship->WeaponSystems.Target0;
          too_close = ship->CurrentSpeed + 10;
          target_too_close = too_close+target->CurrentSpeed;

          if ( target != ship && ship->ShipState == SHIP_READY
               && ship->Docked == NULL && ship->ShipState != SHIP_DOCKED
               && GetShipDistanceToShip( ship, target ) < target_too_close )
            {
              SetShipCourseTowardsShip( ship, ship->WeaponSystems.Target0 );
              TurnShip180( ship );
              ship->Energy -= ship->CurrentSpeed/10;
              EchoToRoom( AT_RED , GetRoom(ship->Room.Pilotseat), "Autotrack: Evading to avoid collision!\r\n" );

              if ( ship->ShipClass == FIGHTER_SHIP
		   || ( ship->ShipClass == MIDSIZE_SHIP && ship->Maneuver > 50 ) )
		{
		  ship->ShipState = SHIP_BUSY_3;
		}
              else if ( ship->ShipClass == MIDSIZE_SHIP || ( ship->ShipClass == CAPITAL_SHIP && ship->Maneuver > 50 ) )
		{
		  ship->ShipState = SHIP_BUSY_2;
		}
              else
		{
		  ship->ShipState = SHIP_BUSY;
		}
            }
          else if ( !IsShipFacingShip(ship, ship->WeaponSystems.Target0)
                    && ship->Docked == NULL && ship->ShipState != SHIP_DOCKED )
            {
              SetShipCourseTowardsShip( ship, ship->WeaponSystems.Target0 );
              ship->Energy -= ship->CurrentSpeed / 10;
              EchoToRoom( AT_BLUE , GetRoom(ship->Room.Pilotseat), "Autotracking target... setting new course.\r\n" );

	      if ( ship->ShipClass == FIGHTER_SHIP
		   || ( ship->ShipClass == MIDSIZE_SHIP && ship->Maneuver > 50 ) )
		{
		  ship->ShipState = SHIP_BUSY_3;
		}
              else if ( ship->ShipClass == MIDSIZE_SHIP || ( ship->ShipClass == CAPITAL_SHIP && ship->Maneuver > 50 ) )
		{
		  ship->ShipState = SHIP_BUSY_2;
		}
              else
		{
		  ship->ShipState = SHIP_BUSY;
		}
            }
        }

      if ( IsShipAutoflying(ship) && ship->ShipClass != SHIP_DEBRIS )
        {
          if ( ship->Spaceobject )
            {
              CheckHostile( ship );

              if (ship->WeaponSystems.Target0 )
                {
                  int the_chance = 50;
                  int projectiles = -1;

                  if ( !ship->WeaponSystems.Target0->WeaponSystems.Target0 && IsShipAutoflying(ship->WeaponSystems.Target0))
		    {
		      ship->WeaponSystems.Target0->WeaponSystems.Target0 = ship;
		    }

                  /* auto assist ships */

                  for ( target = first_ship; target; target = target->Next)
                    {
                      if( IsShipInCombatRange( ship, target ) )
			{
			  if ( IsShipAutoflying(target)
			       && target->Docked == NULL
			       && target->ShipState != SHIP_DOCKED )
			    {
			      if ( !StrCmp ( target->Owner , ship->Owner ) && target != ship )
				{
				  if ( target->WeaponSystems.Target0 == NULL && ship->WeaponSystems.Target0 != target )
				    {
				      target->WeaponSystems.Target0 = ship->WeaponSystems.Target0;
				      sprintf( buf, "You are being targetted by %s.",
					       target->Name);
				      EchoToCockpit( AT_BLOOD , target->WeaponSystems.Target0 , buf );
				      break;
				    }
				}
			    }
			}
                    }

                  target = ship->WeaponSystems.Target0;
                  ship->AutoTrack = true;

                  if( ship->ShipClass != SHIP_PLATFORM && !ship->Guard
                      && ship->Docked == NULL && ship->ShipState != SHIP_DOCKED )
		    {
		      ship->CurrentSpeed = ship->RealSpeed;
		    }

                  if ( ship->Energy >200  )
		    {
		      ship->AutoRecharge=true;
		    }

                  if ( !IsShipInHyperspace( ship )
		      && ship->Energy > 25
                      && ship->WeaponSystems.State.Missile == MISSILE_READY
                      && IsShipInCombatRange( ship, target )
                      && GetShipDistanceToShip( target, ship ) <= 1200 )
                    {
                      if ( ship->ShipClass > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                        {
                          the_chance -= target->Maneuver/5;
                          the_chance -= target->CurrentSpeed/20;
                          the_chance += target->ShipClass*target->ShipClass*25;
                          the_chance -= ( GetShipDistanceToShip( ship, target ) * 3 ) / 100;
                          the_chance += 30;
                          the_chance = urange( 10 , the_chance , 90 );

                          if( ( target->ShipClass == SHIP_PLATFORM
				|| ( target->ShipClass == CAPITAL_SHIP
				     && target->CurrentSpeed < 50 ))
			      && ship->WeaponSystems.Projectiles.RocketCount.Current > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ( target->ShipClass == MIDSIZE_SHIP
				      || ( target->ShipClass == CAPITAL_SHIP) )
				    && ship->WeaponSystems.Projectiles.TorpedoCount.Current > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->WeaponSystems.Projectiles.MissileCount.Current < 0 && ship->WeaponSystems.Projectiles.TorpedoCount.Current > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->WeaponSystems.Projectiles.MissileCount.Current < 0 && ship->WeaponSystems.Projectiles.RocketCount.Current > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ship->WeaponSystems.Projectiles.MissileCount.Current > 0 )
			    {
			      projectiles = CONCUSSION_MISSILE;
			    }
                          else
			    {
			      projectiles = -1;
			    }

                          if ( GetRandomPercent() > the_chance || projectiles == -1 )
                            {

                            }
                          else
                            {
                              NewMissile( ship , target , NULL , projectiles );

                              if( projectiles == CONCUSSION_MISSILE )
				{
				  ship->WeaponSystems.Projectiles.MissileCount.Current--;
				}

                              if( projectiles == PROTON_TORPEDO )
				{
				  ship->WeaponSystems.Projectiles.TorpedoCount.Current--;
				}

                              if( projectiles == HEAVY_ROCKET )
				{
				  ship->WeaponSystems.Projectiles.RocketCount.Current--;
				}

                              sprintf( buf , "Incoming projectile from %s." , ship->Name);
                              EchoToCockpit( AT_BLOOD , target , buf );
                              sprintf( buf, "%s fires a projectile towards %s.",
				       ship->Name, target->Name );
                              EchoToNearbyShips( AT_ORANGE , target , buf , NULL );

			      if ( ship->ShipClass == CAPITAL_SHIP || ship->ShipClass == SHIP_PLATFORM )
				{
				  ship->WeaponSystems.State.Missile = MISSILE_RELOAD_2;
				}
                              else
				{
				  ship->WeaponSystems.State.Missile = MISSILE_FIRED;
				}
                            }
                        }
                    }

                  if( ship->WeaponSystems.State.Missile ==  MISSILE_DAMAGED )
		    {
		      ship->WeaponSystems.State.Missile =  MISSILE_READY;
		    }

                  if( ship->WeaponSystems.State.Laser0 ==  LASER_DAMAGED )
		    {
		      ship->WeaponSystems.State.Laser0 =  LASER_READY;
		    }

                  if( ship->WeaponSystems.State.Ion0 ==  LASER_DAMAGED )
		    {
		      ship->WeaponSystems.State.Ion0 =  LASER_READY;
		    }

                  if( IsShipDisabled( ship ) )
		    {
		      ship->ShipState =  SHIP_READY;
		    }
                }
              else
		{
		  ship->CurrentSpeed = 0;
		}
            }
          else
            {
              if ( GetRandomNumberFromRange(1, 25) == 25 )
                {
                  ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->Home));
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

      if ( ( ship->ShipClass == CAPITAL_SHIP || ship->ShipClass == SHIP_PLATFORM )
           && ship->WeaponSystems.Target0 == NULL )
        {
          if( ship->WeaponSystems.Projectiles.MissileCount.Current < ship->WeaponSystems.Projectiles.MissileCount.Max )
	    {
	      ship->WeaponSystems.Projectiles.MissileCount.Current++;
	    }

	  if( ship->WeaponSystems.Projectiles.TorpedoCount.Current < ship->WeaponSystems.Projectiles.TorpedoCount.Max )
	    {
	      ship->WeaponSystems.Projectiles.TorpedoCount.Current++;
	    }

          if( ship->WeaponSystems.Projectiles.RocketCount.Current < ship->WeaponSystems.Projectiles.RocketCount.Max )
	    {
	      ship->WeaponSystems.Projectiles.RocketCount.Current++;
	    }

          if( ship->Chaff < ship->MaxChaff )
	    {
	      ship->Chaff++;
	    }
        }

      SaveShip( ship );
    }
}

void EchoToDockedShip( int color, const Ship *ship, const char *argument )
{
  Ship *dship = NULL;

  for( dship = first_ship; dship; dship = dship->Next )
    {
      if( dship->Docked && dship->Docked == ship)
	{
	  EchoToCockpit( color, dship, argument );
	}
    }
}

void EchoToCockpit( int color, const Ship *ship, const char *argument )
{
  vnum_t room = INVALID_VNUM;

  for ( room = ship->Room.First; room <= ship->Room.Last;room++ )
    {
      if ( room == ship->Room.Cockpit || room == ship->Room.Navseat
           || room == ship->Room.Pilotseat || room == ship->Room.Coseat
           || room == ship->Room.Gunseat || room == ship->Room.Engine
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
           && target->ShipState != SHIP_LANDED
           && GetShipDistanceToShip( ship, target ) < 100 * ( ship->Sensor + 10 ) * ( ( target->ShipClass == SHIP_DEBRIS ? 2 : target->ShipClass ) + 3 ) )
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

  if (ship->ShipClass == FIGHTER_SHIP)
    {
      price = 5000;
    }
  else if (ship->ShipClass == MIDSIZE_SHIP)
    {
      price = 50000;
    }
  else if (ship->ShipClass == CAPITAL_SHIP)
    {
      price = 500000;
    }
  else
    {
      price = 2000;
    }

  if ( ship->ShipClass <= CAPITAL_SHIP )
    {
      price += ship->Maneuver * 100 * ( 1 + ship->ShipClass );
    }

  price += ship->WeaponSystems.TractorBeam * 100;
  price += ship->RealSpeed * 10;
  price += ship->AstroArray * 5;
  price += 5 * ship->MaxHull;
  price += 2 * ship->MaxEnergy;

  if (ship->MaxEnergy > 5000 )
    {
      price += (ship->MaxEnergy-5000) * 20;
    }

  if (ship->MaxEnergy > 10000 )
    {
      price += (ship->MaxEnergy-10000) * 50;
    }

  if (ship->MaxHull > 1000)
    {
      price += (ship->MaxHull-1000) * 10;
    }

  if (ship->MaxHull > 10000)
    {
      price += (ship->MaxHull-10000) * 20;
    }

  if (ship->MaxShield > 200)
    {
      price += (ship->MaxShield-200) * 50;
    }

  if (ship->MaxShield > 1000)
    {
      price += (ship->MaxShield-1000) * 100;
    }

  if (ship->RealSpeed > 100 )
    {
      price += (ship->RealSpeed-100) * 500;
    }

  if (ship->WeaponSystems.NumberOfLasers > 5 )
    {
      price += (ship->WeaponSystems.NumberOfLasers-5) * 500;
    }

  if (ship->MaxShield)
    {
      price += 1000 + 10 * ship->MaxShield;
    }

  if (ship->WeaponSystems.NumberOfLasers)
    {
      price += 500 + 500 * ship->WeaponSystems.NumberOfLasers;
    }

  if (ship->WeaponSystems.Projectiles.MissileCount.Current )
    {
      price += 250 * ship->WeaponSystems.Projectiles.MissileCount.Current;
    }
  else if (ship->WeaponSystems.Projectiles.TorpedoCount.Current )
    {
      price += 500 * ship->WeaponSystems.Projectiles.TorpedoCount.Current;
    }
  else if (ship->WeaponSystems.Projectiles.RocketCount.Current )
    {
      price += 1000 * ship->WeaponSystems.Projectiles.RocketCount.Current;
    }

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const Turret *turret = ship->WeaponSystems.Turret[turret_num];

      if( IsTurretInstalled( turret ) )
	{
	  price += 5000;
	}
    }

  if (ship->Hyperspeed)
    {
      price += 1000 + ship->Hyperspeed * 10;
    }

  if (ship->Room.Hanger)
    {
      price += ship->ShipClass == MIDSIZE_SHIP ? 50000 : 100000;
    }

  price *= 1.5;

  return price;
}

void WriteShipList( void )
{
  Ship *tship = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SHIP_DIR, SHIP_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open ship.lst for writing!\r\n", 0 );
      return;
    }

  for ( tship = first_ship; tship; tship = tship->Next )
    {
      if( tship->ShipClass != SHIP_DEBRIS )
	{
	  fprintf( fpout, "%s\n", tship->Filename );
	}
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void SaveShip( const Ship *ship )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !ship )
    {
      Bug( "%s: null ship pointer!", __FUNCTION__ );
      return;
    }

  if ( ship->ShipClass == SHIP_DEBRIS )
    {
      return;
    }

  if ( IsNullOrEmpty( ship->Filename ) )
    {
      Bug( "%s: %s has no filename", __FUNCTION__, ship->Name );
      return;
    }

  sprintf( filename, "%s%s", SHIP_DIR, ship->Filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#SHIP\n" );
      fprintf( fp, "Name          %s~\n",  ship->Name                        );
      fprintf( fp, "PersonalName  %s~\n",  ship->PersonalName                );
      fprintf( fp, "Filename      %s~\n",  ship->Filename                    );
      fprintf( fp, "Description   %s~\n",  ship->Description                 );
      fprintf( fp, "Owner         %s~\n",  ship->Owner                       );
      fprintf( fp, "Pilot         %s~\n",  ship->Pilot                       );
      fprintf( fp, "Copilot       %s~\n",  ship->CoPilot                     );
      fprintf( fp, "Class         %d\n",   ship->ShipClass                      );
      fprintf( fp, "Tractorbeam   %d\n",   ship->WeaponSystems.TractorBeam                 );
      fprintf( fp, "Shipyard      %ld\n",  ship->Shipyard                    );
      fprintf( fp, "Hanger        %ld\n",  ship->Room.Hanger                 );
      fprintf( fp, "Vx            %.0f\n", ship->Position.x                       );
      fprintf( fp, "Vy            %.0f\n", ship->Position.y                       );
      fprintf( fp, "Vz            %.0f\n", ship->Position.z                       );
      fprintf( fp, "Turret1       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret2       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret3       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret4       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret5       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret6       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret7       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret8       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret9       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Turret0       %ld\n",  GetTurretRoom( ship->WeaponSystems.Turret[0] ));
      fprintf( fp, "Statet0       %d\n",   ship->WeaponSystems.State.Laser0                     );
      fprintf( fp, "Statei0       %d\n",   ship->WeaponSystems.State.Ion0                     );

      fprintf( fp, "Statet1       %d\n",
	       IsTurretDamaged( ship->WeaponSystems.Turret[0] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet2       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[1] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet3       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[2] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet4       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[3] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet5       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[4] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet6       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[5] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet7       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[6] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet8       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[7] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet9       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[8] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet0       %d\n",
               IsTurretDamaged( ship->WeaponSystems.Turret[9] ) ? LASER_DAMAGED : LASER_READY );

      fprintf( fp, "Lasers        %d\n",   ship->WeaponSystems.NumberOfLasers                      );
      fprintf( fp, "Missiles      %d\n",   ship->WeaponSystems.Projectiles.MissileCount.Current                    );
      fprintf( fp, "Maxmissiles   %d\n",   ship->WeaponSystems.Projectiles.MissileCount.Max                 );
      fprintf( fp, "Rockets       %d\n",   ship->WeaponSystems.Projectiles.RocketCount.Current                     );
      fprintf( fp, "Maxrockets    %d\n",   ship->WeaponSystems.Projectiles.RocketCount.Max                  );
      fprintf( fp, "Torpedos      %d\n",   ship->WeaponSystems.Projectiles.TorpedoCount.Current                    );
      fprintf( fp, "Maxtorpedos   %d\n",   ship->WeaponSystems.Projectiles.TorpedoCount.Max                 );
      fprintf( fp, "Lastdoc       %ld\n",  ship->LastDock                     );
      fprintf( fp, "Firstroom     %ld\n",  ship->Room.First                  );
      fprintf( fp, "Lastroom      %ld\n",  ship->Room.Last                   );
      fprintf( fp, "Shield        %d\n",   ship->Shield                      );
      fprintf( fp, "Maxshield     %d\n",   ship->MaxShield                   );
      fprintf( fp, "Hull          %d\n",   ship->Hull                        );
      fprintf( fp, "Maxhull       %d\n",   ship->MaxHull                     );
      fprintf( fp, "Maxenergy     %d\n",   ship->MaxEnergy                   );
      fprintf( fp, "Hyperspeed    %d\n",   ship->Hyperspeed                  );
      fprintf( fp, "Comm          %d\n",   ship->Comm                        );
      fprintf( fp, "Chaff         %d\n",   ship->Chaff                       );
      fprintf( fp, "Maxchaff      %d\n",   ship->MaxChaff                    );
      fprintf( fp, "Sensor        %d\n",   ship->Sensor                      );
      fprintf( fp, "Astro_array   %d\n",   ship->AstroArray                 );
      fprintf( fp, "Realspeed     %d\n",   ship->RealSpeed                   );
      fprintf( fp, "Type          %d\n",   ship->Type                        );
      fprintf( fp, "Cockpit       %ld\n",  ship->Room.Cockpit                );
      fprintf( fp, "Coseat        %ld\n",  ship->Room.Coseat                 );
      fprintf( fp, "Pilotseat     %ld\n",  ship->Room.Pilotseat              );
      fprintf( fp, "Gunseat       %ld\n",  ship->Room.Gunseat                );
      fprintf( fp, "Navseat       %ld\n",  ship->Room.Navseat                );
      fprintf( fp, "Engineroom    %ld\n",  ship->Room.Engine                 );
      fprintf( fp, "Entrance      %ld\n",  ship->Room.Entrance               );
      fprintf( fp, "Shipstate     %d\n",   ship->ShipState                   );
      fprintf( fp, "Missilestate  %d\n",   ship->WeaponSystems.State.Missile                );
      fprintf( fp, "Energy        %d\n",   ship->Energy                      );
      fprintf( fp, "Manuever      %d\n",   ship->Maneuver                    );
      fprintf( fp, "Alarm         %d\n",   ship->Alarm                       );
      fprintf( fp, "Ions          %d\n",   ship->WeaponSystems.NumberOfIonCannons                        );
      fprintf( fp, "Dockingports  %d\n",   ship->DockingPorts                );
      fprintf( fp, "Guard         %d\n",   ship->Guard                       );
      fprintf( fp, "Home          %s~\n",  ship->Home                        );
      fprintf( fp, "End\n"                                                   );
      fprintf( fp, "\n#END\n" );
    }

  fclose( fp );
}

static void ReadShip( Ship *ship, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;
      size_t i = 0;

      struct
      {
	vnum_t room_vnum;
	int weapon_state;
      } turret_placeholder[MAX_NUMBER_OF_TURRETS_IN_SHIP];

      for( i = 0; i < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++i )
	{
	  turret_placeholder[i].room_vnum = INVALID_VNUM;
	  turret_placeholder[i].weapon_state = LASER_READY;
	}

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          KEY( "Astro_array",      ship->AstroArray,       ReadInt( fp ) );
          KEY( "Alarm",            ship->Alarm,             ReadInt( fp ) );
          break;

        case 'C':
          KEY( "Cockpit",     ship->Room.Cockpit,          ReadInt( fp ) );
          KEY( "Coseat",     ship->Room.Coseat,          ReadInt( fp ) );
          KEY( "Class",       ship->ShipClass,            (ShipClass)ReadInt( fp ) );
          KEY( "Copilot",     ship->CoPilot,          ReadStringToTilde( fp ) );
          KEY( "Comm",        ship->Comm,      ReadInt( fp ) );
          KEY( "Chaff",       ship->Chaff,      ReadInt( fp ) );
          break;

        case 'D':
          KEY( "Description",   ship->Description,      ReadStringToTilde( fp ) );
          KEY( "DockingPorts",    ship->DockingPorts,      ReadInt( fp ) );
          break;

        case 'E':
          KEY( "Engineroom",    ship->Room.Engine,      ReadInt( fp ) );
          KEY( "Entrance",      ship->Room.Entrance,         ReadInt( fp ) );
          KEY( "Energy",      ship->Energy,        ReadInt( fp ) );

          if ( !StrCmp( word, "End" ) )
            {
	      int turret_num = 0;

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
		  ship->ShipState = SHIP_LANDED;
		}

              if (ship->WeaponSystems.State.Laser0 != LASER_DAMAGED)
		{
		  ship->WeaponSystems.State.Laser0 = LASER_READY;
		}

              if (ship->WeaponSystems.State.Ion0 != LASER_DAMAGED)
		{
		  ship->WeaponSystems.State.Ion0 = LASER_READY;
		}

	      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
		{
		  Turret *turret = ship->WeaponSystems.Turret[turret_num];

		  SetTurretRoom( turret, turret_placeholder[turret_num].room_vnum );

		  if( turret_placeholder[turret_num].weapon_state == LASER_DAMAGED )
		    {
		      SetTurretDamaged( turret );
		    }
		  else
		    {
		      SetTurretReady( turret );
		    }
		}

              if (ship->WeaponSystems.State.Missile != MISSILE_DAMAGED)
		{
		  ship->WeaponSystems.State.Missile = MISSILE_READY;
		}

              if (ship->Shipyard <= 0)
		{
		  ship->Shipyard = ROOM_LIMBO_SHIPYARD;
		}

              if (ship->LastDock <= 0)
		{
		  ship->LastDock = ship->Shipyard;
		}

              if (ship->Room.Navseat <= 0)
		{
		  ship->Room.Navseat = ship->Room.Cockpit;
		}

              if (ship->Room.Gunseat <= 0)
		{
		  ship->Room.Gunseat = ship->Room.Cockpit;
		}

              if (ship->Room.Coseat <= 0)
		{
		  ship->Room.Coseat = ship->Room.Cockpit;
		}

              if (ship->Room.Pilotseat <= 0)
		{
		  ship->Room.Pilotseat = ship->Room.Cockpit;
		}

              if (ship->Type == 1)
                {
                  ship->WeaponSystems.Projectiles.TorpedoCount.Current = ship->WeaponSystems.Projectiles.MissileCount.Current;    /* for back compatibility */
                  ship->WeaponSystems.Projectiles.MissileCount.Current = 0;
                }

	      if( ship->ShipClass < SHIP_PLATFORM )
		{
		  ship->BayOpen = false;
		}

              return;
            }
          break;

        case 'F':
          KEY( "Filename",      ship->Filename,         ReadStringToTilde( fp ) );
          KEY( "Firstroom",   ship->Room.First,        ReadInt( fp ) );
          break;

        case 'G':
          KEY( "Guard",     ship->Guard,          ReadInt( fp ) );
          KEY( "Gunseat",     ship->Room.Gunseat,          ReadInt( fp ) );
          break;

        case 'H':
          KEY( "Home" , ship->Home, ReadStringToTilde( fp ) );
          KEY( "Hyperspeed",   ship->Hyperspeed,      ReadInt( fp ) );
          KEY( "Hull",      ship->Hull,        ReadInt( fp ) );
          KEY( "Hanger",  ship->Room.Hanger,      ReadInt( fp ) );
          break;

        case 'I':
          KEY( "Ions" , ship->WeaponSystems.NumberOfIonCannons, ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Laserstr",   ship->WeaponSystems.NumberOfLasers,   (short)  ( ReadInt( fp )/10 ) );
          KEY( "Lasers",   ship->WeaponSystems.NumberOfLasers,      ReadInt( fp ) );
          KEY( "Lastdoc",    ship->LastDock,       ReadInt( fp ) );
          KEY( "Lastroom",   ship->Room.Last,        ReadInt( fp ) );
          break;

        case 'M':
          KEY( "Manuever",   ship->Maneuver,      ReadInt( fp ) );
          KEY( "Maxmissiles",   ship->WeaponSystems.Projectiles.MissileCount.Max,      ReadInt( fp ) );
          KEY( "Maxtorpedos",   ship->WeaponSystems.Projectiles.TorpedoCount.Max,      ReadInt( fp ) );
          KEY( "Maxrockets",   ship->WeaponSystems.Projectiles.RocketCount.Max,      ReadInt( fp ) );
          KEY( "Missiles",   ship->WeaponSystems.Projectiles.MissileCount.Current,      ReadInt( fp ) );
          KEY( "Missiletype",   ship->Type,      ReadInt( fp ) );
          KEY( "Maxshield",      ship->MaxShield,        ReadInt( fp ) );
          KEY( "Maxenergy",      ship->MaxEnergy,        ReadInt( fp ) );
          KEY( "Missilestate",   ship->WeaponSystems.State.Missile,        ReadInt( fp ) );
	  KEY( "Maxhull",      ship->MaxHull,        ReadInt( fp ) );
          KEY( "Maxchaff",       ship->MaxChaff,      ReadInt( fp ) );
          break;

        case 'N':
          KEY( "Name",  ship->Name,             ReadStringToTilde( fp ) );
          KEY( "Navseat",     ship->Room.Navseat,          ReadInt( fp ) );
          break;

        case 'O':
          KEY( "Owner",            ship->Owner,            ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PersonalName",  ship->PersonalName,             ReadStringToTilde( fp ) );
          KEY( "Pilot",            ship->Pilot,            ReadStringToTilde( fp ) );
          KEY( "Pilotseat",     ship->Room.Pilotseat,          ReadInt( fp ) );
          break;

        case 'R':
          KEY( "Realspeed",   ship->RealSpeed,       ReadInt( fp ) );
          KEY( "Rockets",     ship->WeaponSystems.Projectiles.RocketCount.Current,         ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Shipyard",    ship->Shipyard,      ReadInt( fp ) );
          KEY( "Sensor",      ship->Sensor,       ReadInt( fp ) );
          KEY( "Shield",      ship->Shield,        ReadInt( fp ) );
          KEY( "Shipstate",   ship->ShipState,        ReadInt( fp ) );
          KEY( "Statei0",   ship->WeaponSystems.State.Ion0,        ReadInt( fp ) );
          KEY( "Statet0",   ship->WeaponSystems.State.Laser0,        ReadInt( fp ) );
          KEY( "Statet1",   turret_placeholder[0].weapon_state,        ReadInt( fp ) );
          KEY( "Statet2",   turret_placeholder[1].weapon_state,        ReadInt( fp ) );
          KEY( "Statet3",   turret_placeholder[2].weapon_state,        ReadInt( fp ) );
          KEY( "Statet4",   turret_placeholder[3].weapon_state,        ReadInt( fp ) );
          KEY( "Statet5",   turret_placeholder[4].weapon_state,        ReadInt( fp ) );
          KEY( "Statet6",   turret_placeholder[5].weapon_state,        ReadInt( fp ) );
          KEY( "Statet7",   turret_placeholder[6].weapon_state,        ReadInt( fp ) );
          KEY( "Statet8",   turret_placeholder[7].weapon_state,        ReadInt( fp ) );
          KEY( "Statet9",   turret_placeholder[8].weapon_state,        ReadInt( fp ) );
          KEY( "Statet10",  turret_placeholder[9].weapon_state,        ReadInt( fp ) );
          break;

        case 'T':
          KEY( "Type",  ship->Type,     ReadInt( fp ) );
	  KEY( "Tractorbeam", ship->WeaponSystems.TractorBeam,      ReadInt( fp ) );
          KEY( "Turret1",     turret_placeholder[0].room_vnum,  ReadInt( fp ) );
          KEY( "Turret2",     turret_placeholder[1].room_vnum,  ReadInt( fp ) );
          KEY( "Turret3",     turret_placeholder[2].room_vnum, ReadInt( fp ) );
          KEY( "Turret4",     turret_placeholder[3].room_vnum, ReadInt( fp ) );
          KEY( "Turret5",     turret_placeholder[4].room_vnum, ReadInt( fp ) );
          KEY( "Turret6",     turret_placeholder[5].room_vnum, ReadInt( fp ) );
          KEY( "Turret7",     turret_placeholder[6].room_vnum, ReadInt( fp ) );
          KEY( "Turret8",     turret_placeholder[7].room_vnum, ReadInt( fp ) );
          KEY( "Turret9",     turret_placeholder[8].room_vnum, ReadInt( fp ) );
          KEY( "Turret0",     turret_placeholder[9].room_vnum, ReadInt( fp ) );
          KEY( "Torpedos",    ship->WeaponSystems.Projectiles.TorpedoCount.Current, ReadInt( fp ) );
          break;

        case 'V':
          KEY( "Vx",          ship->Position.x,     ReadInt( fp ) );
          KEY( "Vy",          ship->Position.y,     ReadInt( fp ) );
          KEY( "Vz",          ship->Position.z,     ReadInt( fp ) );
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

/*
 * Load a ship file
 */

static bool LoadShipFile( const char *shipfile )
{
  char filename[256];
  Ship *ship = NULL;
  FILE *fp = NULL;
  bool found = false;
  int turret_num = 0;
  Room *pRoomIndex = NULL;
  Clan *clan = NULL;

  AllocateMemory( ship, Ship, 1 );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->WeaponSystems.Turret[turret_num] = AllocateTurret( ship );
    }

  sprintf( filename, "%s%s", SHIP_DIR, shipfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;

      for ( ; ; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "%s: # not found.", __FUNCTION__ );
              break;
            }

          word = ReadWord( fp );
	  if ( !StrCmp( word, "SHIP"   ) )
            {
              ReadShip( ship, fp );
            }
          else if ( !StrCmp( word, "END"  ) )
            {
              break;
            }
          else
            {
              Bug( "%s: bad section: %s.", __FUNCTION__, word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !(found) )
    {
      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->WeaponSystems.Turret[turret_num];
	  FreeTurret( turret );
	}

      FreeMemory( ship );
    }
  else
    {
      LINK( ship, first_ship, last_ship, Next, Previous );

      ship->Docking = SHIP_READY;

      if ( ( !StrCmp("Trainer", ship->Owner)
             || !StrCmp("Public",ship->Owner)
             || ship->Type == MOB_SHIP ) )
        {
          if ( ship->ShipClass != SHIP_PLATFORM && ship->Type != MOB_SHIP && ship->ShipClass != CAPITAL_SHIP )
            {
              ExtractShip( ship );
              ShipToRoom( ship , ship->Shipyard );

	      ship->Location = ship->Shipyard;
              ship->LastDock = ship->Shipyard;
              ship->ShipState = SHIP_LANDED;
              ship->Docking = SHIP_READY;
            }

          if( !ship->PersonalName )
	    {
	      ship->PersonalName = CopyString(ship->Name);
	    }

          ship->CurrentSpeed = 0;
          ship->Energy = ship->MaxEnergy;
          ship->Hull = ship->MaxHull;
          ship->Shield = 0;

          ship->WeaponSystems.State.Laser0 = LASER_READY;
          ship->WeaponSystems.State.Missile = LASER_READY;
          ship->WeaponSystems.State.TractorBeam = SHIP_READY;
          ship->DockingState = SHIP_READY;
          ship->Docking = SHIP_READY;

          ship->CurrentJump = NULL;
          ship->WeaponSystems.Target0 = NULL;

          ship->HatchOpen = false;
	  ship->BayOpen = false;

          ship->AutoRecharge = false;
	  ship->AutoTrack = false;
          ship->AutoSpeed = false;
        }
      else if ( ( pRoomIndex = GetRoom( ship->LastDock ) ) != NULL
                && ship->ShipClass != CAPITAL_SHIP && ship->ShipClass != SHIP_PLATFORM )
        {
          LINK( ship, pRoomIndex->FirstShip, pRoomIndex->LastShip, NextInRoom, PreviousInRoom );
          ship->InRoom = pRoomIndex;
          ship->Location = ship->LastDock;
        }

      if ( ship->ShipClass == SHIP_PLATFORM
	   || ship->Type == MOB_SHIP
	   || ship->ShipClass == CAPITAL_SHIP )
        {
          ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->Home) );
          SetVector( &ship->Heading, 1, 1, 1 );

          if( ship->Position.x == 0 && ship->Position.y == 0 && ship->Position.z == 0 )
            {
              if ( ship->Home )
                {
                  ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->Home));
                  InitializeVector( &ship->Position );

                  if( ship->Spaceobject )
                    {
                      CopyVector( &ship->Position, &ship->Spaceobject->Position );
                    }

                  RandomizeVector( &ship->Position, -5000, 5000 );
                  ship->ShipState = SHIP_READY;
                  ship->Autopilot = true;
                  ship->AutoRecharge = true;
                  ship->Shield = ship->MaxShield;
                }
            }

          ship->ShipState = SHIP_READY;
	  ship->Docking = SHIP_READY;
          ship->Autopilot = true;
          ship->AutoRecharge = true;
          ship->Shield = ship->MaxShield;
        }

      if ( ship->Type != MOB_SHIP && (clan = GetClan( ship->Owner )) != NULL )
        {
          if ( ship->ShipClass <= SHIP_PLATFORM )
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

  return found;
}

/*
 * Load in all the ship files.
 */
void LoadShips( void )
{
  FILE *fpList = NULL;
  char shiplist[256];

  LogPrintf( "Loading ships..." );
  sprintf( shiplist, "%s%s", SHIP_DIR, SHIP_LIST );

  if ( ( fpList = fopen( shiplist, "r" ) ) == NULL )
    {
      perror( shiplist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !LoadShipFile( filename ) )
        {
          Bug( "Cannot load ship file: %s", filename );
        }
    }

  fclose( fpList );
  LogPrintf(" Done ships " );
}

void ResetShip( Ship *ship )
{
  int turret_num = 0;

  ship->ShipState = SHIP_READY;
  ship->Docking = SHIP_READY;
  ship->Docked = NULL;

  if ( ship->ShipClass != SHIP_PLATFORM
       && ship->ShipClass != CAPITAL_SHIP
       && ship->Type != MOB_SHIP )
    {
      ExtractShip( ship );
      ShipToRoom( ship , ship->Shipyard );

      ship->Location = ship->Shipyard;
      ship->LastDock = ship->Shipyard;
      ship->ShipState = SHIP_LANDED;
    }

  if (ship->Spaceobject)
    {
      ShipFromSpaceobject( ship, ship->Spaceobject );
    }

  ship->CurrentSpeed = 0;
  ship->Energy = ship->MaxEnergy;
  ship->Hull = ship->MaxHull;
  ship->Shield = 0;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->WeaponSystems.Turret[turret_num];
      ResetTurret( turret );
    }

  ship->WeaponSystems.State.Laser0 = LASER_READY;
  ship->WeaponSystems.State.Missile = LASER_READY;

  ship->CurrentJump=NULL;
  ship->WeaponSystems.Target0=NULL;

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
          if ( ship->ShipClass <= SHIP_PLATFORM )
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
  if (!(ship->Home))
    {
      if ( ship->Type == SHIP_REBEL || ( ship->Type == MOB_SHIP && ((!StrCmp( ship->Owner , "The Rebel Alliance" )) || (!StrCmp( ship->Owner , "The New Republic" )))))
        {
          FreeMemory( ship->Home );
          ship->Home = CopyString( "Coruscant" );
        }
      else if ( ship->Type == SHIP_IMPERIAL || ( ship->Type == MOB_SHIP && !StrCmp(ship->Owner, "the empire") ))
        {
          FreeMemory( ship->Home );
	  ship->Home = CopyString( "Byss" );
        }
      else if ( ship->Type == SHIP_CIVILIAN)
        {
          FreeMemory( ship->Home );
          ship->Home = CopyString( "corporate" );
        }
    }

  SaveShip(ship);
}

void EchoToNearbyShips( int color, const Ship *ship, const char *argument,
			const Ship *ignore )
{
  const Ship *target = NULL;

  if (!ship->Spaceobject)
    {
      return;
    }

  for ( target = first_ship; target; target = target->Next )
    {
      if( !IsShipInCombatRange( ship, target ) )
        {
          continue;
        }

      if (target != ship && target != ignore
	  && GetShipDistanceToShip( ship, target ) < 100*(target->Sensor+10)*((ship->ShipClass == SHIP_DEBRIS ? 2 : ship->ShipClass)+1))
        {
          EchoToCockpit( color , target , argument );
        }
    }
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
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if( ship->PersonalName && !StrCmp( name, ship->PersonalName ) )
	{
	  return ship;
	}

      if ( !StrCmp( name, ship->Name ) )
	{
	  return ship;
	}

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
 * Checks if ship is in a spaceobject and returns pointer if it is.
 */
Ship *GetShipInRange( const char *name, const Ship *eShip)
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int number = NumberArgument( name, arg );
  int count = 0;

  if ( eShip == NULL )
    {
      return NULL;
    }

  for ( ship = first_ship ; ship; ship = ship->Next )
    {
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
	      return ship;
	    }
        }

      if ( !StrCmp( arg, ship->Name ) )
        {
          count++;

          if( !number || count == number )
	    {
	      return ship;
	    }
        }
    }

  count = 0;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if( !IsShipInCombatRange( eShip, ship ) )
	{
	  continue;
	}

      if( ship->PersonalName && NiftyIsNamePrefix( arg, ship->PersonalName ) )
	{
	  count++;

	  if( !number || count == number )
	    {
	      return ship;
	    }
	}

      if ( NiftyIsNamePrefix( arg, ship->Name ) )
        {
          count++;

          if( !number || count == number )
	    {
	      return ship;
	    }
        }
    }

  return NULL;
}

/*
 * Get pointer to ship structure from cockpit, turret, or entrance ramp vnum.
 */
Ship *GetShipFromCockpit( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Cockpit
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
           || vnum == ship->Room.Hanger
           || vnum == ship->Room.Pilotseat
           || vnum == ship->Room.Coseat
           || vnum == ship->Room.Navseat
           || vnum == ship->Room.Gunseat
           || vnum == ship->Room.Engine )
        {
          return ship;
        }
    }

  return NULL;
}

Ship *GetShipFromPilotSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Pilotseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromCoSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Coseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromNavSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Navseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromGunSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Gunseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromEngine( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if (ship->Room.Engine)
        {
          if ( vnum == ship->Room.Engine )
	    {
	      return ship;
	    }
        }
      else
        {
          if ( vnum == ship->Room.Cockpit )
	    {
	      return ship;
	    }
        }
    }

  return NULL;
}

Ship *GetShipFromTurret( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Gunseat
	   || vnum == GetTurretRoom( ship->WeaponSystems.Turret[0] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[1] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[2] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[3] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[4] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[5] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[6] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[7] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[8] )
           || vnum == GetTurretRoom( ship->WeaponSystems.Turret[9] ) )
        {
          return ship;
        }
    }

  return NULL;
}

Ship *GetShipFromEntrance( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Entrance )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromHangar( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Hanger )
	{
	  return ship;
	}
    }

  return NULL;
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

  if ( ship->ShipClass == SHIP_TRAINER )
    {
      return true;
    }

  return false;
}

bool CanDock( const Ship *ship )
{
  int count = 0;
  const Ship *dship = NULL;
  int ports = 0;

  if ( !ship )
    {
      return false;
    }

  if ( ship->Docked )
    {
      count++;
    }

  for( dship = first_ship; dship; dship = dship->Next )
    {
      if( dship->Docked && dship->Docked == ship )
	{
	  count++;
	}
    }

  if ( ship->DockingPorts && count >= ship->DockingPorts )
    {
      return false;
    }

  if ( ship->ShipClass < SHIP_PLATFORM )
    {
      ports = ship->ShipClass + 1;
    }

  if ( ship->ShipClass != SHIP_PLATFORM && count >= ports )
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

  if ( ship->Shield > 0 )
    {
      shield_dmg = umin( ship->Shield, dmg );
      dmg -= shield_dmg;
      ship->Shield -= shield_dmg;

      if ( ship->Shield == 0 )
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
          ship->ShipState = SHIP_DISABLED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor && ship->WeaponSystems.State.Missile != MISSILE_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Room.Gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->WeaponSystems.State.Missile = MISSILE_DAMAGED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 2*ionFactor && ship->WeaponSystems.State.Laser0 != LASER_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Room.Gunseat) , "Lasers DAMAGED!" );
          ship->WeaponSystems.State.Laser0 = LASER_DAMAGED;
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

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor && ship->WeaponSystems.State.TractorBeam != LASER_DAMAGED && ship->WeaponSystems.TractorBeam )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->Room.Pilotseat) , "Tractorbeam DAMAGED!" );
          ship->WeaponSystems.State.TractorBeam = LASER_DAMAGED;
        }

      if ( ions == false )
	{
          ship->Hull -= dmg * 5;
        }
    }

  if ( ship->Hull <= 0 )
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

  if ( ship->Hull <= ship->MaxHull/20 )
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
  Ship *lship = NULL;

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

  for ( roomnum = ship->Room.First; roomnum <= ship->Room.Last; roomnum++ )
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

  for ( lship = first_ship; lship; lship = lship->Next )
    {
      if ( !(ship->Room.Hanger) || (lship->Location != ship->Room.Hanger) )
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
