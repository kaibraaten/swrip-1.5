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
  return ship->shipstate == state;
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
  ship->head.x = 10 * ship->pos.x;
  ship->head.y = 10 * ship->pos.y;
  ship->head.z = 10 * ship->pos.z;
  ship->energy -= ship->currspeed/10;
  ship->currspeed = ship->realspeed;
  EchoToRoom( AT_RED , GetRoom(ship->room.pilotseat),
		"Automatic Override: Evading to avoid collision with sun!\r\n" );

  if ( ship->sclass == FIGHTER_SHIP
       || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
    {
      ship->shipstate = SHIP_BUSY_3;
    }
  else if ( ship->sclass == MIDSIZE_SHIP
	    || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
    {
      ship->shipstate = SHIP_BUSY_2;
    }
  else
    {
      ship->shipstate = SHIP_BUSY;
    }
}

void UpdateShipMovement( void )
{
  Ship *ship = NULL;
  Spaceobject *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( !ship->spaceobject )
	{
	  continue;
	}

      if( ship->shipstate == SHIP_LANDED && ship->spaceobject )
	{
	  ship->shipstate = SHIP_READY;
	}

      if ( ship->shipstate != SHIP_LAND && ship->shipstate != SHIP_LAND_2)
        {
          MoveShip( ship );
        }

      /*
       * Tractor beam handling
       */
      if ( ship->tractoredby )
        {
          /* Tractoring ship is smaller and therefore moves towards target */
          if( ship->tractoredby->sclass <= ship->sclass )
            {
              ship->tractoredby->currspeed = ship->tractoredby->tractorbeam/4;
              SetShipCourseTowardsShip( ship->tractoredby, ship );

	      if( GetShipDistanceToShip( ship, ship->tractoredby ) < 10 )
                {
                  CopyVector( &ship->tractoredby->pos, &ship->pos );
                }
            }

          /* Target is smaller and therefore pulled to target */
          if ( ship->tractoredby->sclass > ship->sclass )
            {
              ship->currspeed = ship->tractoredby->tractorbeam/4;
              SetShipCourseTowardsShip( ship, ship->tractoredby );

              if( GetShipDistanceToShip( ship, ship->tractoredby ) < 10 )
                {
                  CopyVector( &ship->pos, &ship->tractoredby->pos );
                }
            }
        }

      if ( IsShipAutoflying(ship) )
	{
	  continue;
	}

      for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
        {

          if ( spaceobj->Type == SPACE_SUN
	       && WillCollideWithSun( ship, spaceobj ) )
            {
	      EvadeCollisionWithSun( ship, spaceobj );
            }

          if ( ship->currspeed > 0 )
            {
              if ( spaceobj->Type >= SPACE_PLANET
                   && spaceobj->Name && StrCmp(spaceobj->Name,"")
                   && GetShipDistanceToSpaceobject( ship, spaceobj ) < 10 )
                {
                  sprintf( buf, "You begin orbitting %s.", spaceobj->Name);
                  EchoToCockpit( AT_YELLOW, ship, buf);
                  sprintf( buf, "%s begins orbiting %s.", ship->name, spaceobj->Name);
                  EchoToNearbyShips( AT_ORANGE , ship , buf , NULL );
                  ship->inorbitof = spaceobj;
                  ship->currspeed = 0;
                }

            }
        }
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( IsShipInHyperspace( ship ) )
        {
          Vector3 tmp;
          float dist = 0;
	  float origdist = 0;

          ship->hyperdistance -= ship->hyperspeed;

          dist = (float) ship->hyperdistance;
          origdist = (float) ship->orighyperdistance;

	  if ( dist == 0)
            dist = -1;

          SetVector( &tmp,
                      ship->pos.x - ship->jump.x,
                      ship->pos.y - ship->jump.y,
                      ship->pos.z - ship->jump.z );
          SetVector( &ship->hyperpos,
                      ship->pos.x - ( tmp.x * ( dist / origdist ) ),
                      ship->pos.y - ( tmp.y * ( dist / origdist ) ),
                      ship->pos.z - ( tmp.z * ( dist / origdist ) ) );

          ship->count++;

          for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
	    {
	      if( CaughtInGravity( ship, spaceobj ) )
		{
		  int dmg = 0;

		  EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat),
				"Hyperjump complete." );
		  EchoToShip( AT_YELLOW, ship,
				"The ship slams to a halt as it comes out of hyperspace." );
		  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
		  dmg = 15 * GetRandomNumberFromRange( 1, 4 );
		  ship->hull -= dmg;
		  EchoToShip( AT_YELLOW, ship,
				"The hull cracks from the pressure." );
		  CopyVector( &ship->pos, &ship->hyperpos );
		  ShipToSpaceobject( ship, ship->currjump );
		  ship->currjump = NULL;
		  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
		  ship->shipstate = SHIP_READY;
		  FreeMemory( ship->home );
		  ship->home = CopyString( ship->spaceobject->Name );
		}
	    }

          if ( IsShipInHyperspace( ship )
              && ship->hyperdistance <= 0
              && !ship->tracking)
            {
              ship->count = 0;
              ShipToSpaceobject (ship, ship->currjump);

              if (ship->spaceobject == NULL)
                {
                  EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {
                  EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
                           ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
                  CopyVector( &ship->hyperpos, &ship->pos );
                  ShipToSpaceobject( ship, ship->currjump );
                  ship->currjump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  FreeMemory( ship->home );
                  ship->home = CopyString( ship->spaceobject->Name );
                }
            }
          else if ( ( ship->count >= (ship->tcount ? ship->tcount : 10 ) )
		    && IsShipInHyperspace( ship )
		    && ship->tracking == true )
            {
              ShipToSpaceobject(ship, ship->currjump);

              if (ship->spaceobject == NULL)
		{
                  EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {
                  EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat), "Hyperjump complete.");
                  EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
			   ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
                  CopyVector( &ship->pos, &ship->hyperpos );
                  ShipToSpaceobject( ship, ship->currjump );
                  ship->currjump = NULL;
                  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  FreeMemory( ship->home );
                  ship->home = CopyString( ship->spaceobject->Name );

                  SetVector( &ship->jump,
                              ship->pos.x + ship->trackvector.x,
                              ship->pos.y + ship->trackvector.y,
                              ship->pos.z + ship->trackvector.z );

                  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
		    {
		      if( IsSpaceobjectInRange( ship, spaceobj ) )
			{
			  ship->currjump = spaceobj;
			  break;
			}
		    }

                  if( !spaceobj )
		    {
		      ship->currjump = ship->spaceobject;
		    }

                  ship->hyperdistance = GetDistanceBetweenVectors( &ship->pos, &ship->jump ) / 50;
                  ship->orighyperdistance = ship->hyperdistance;
                  ship->count = 0;
                  do_radar( ship->ch, "" );
                }
            }
	  else if ( ship->count >= 10 && IsShipInHyperspace( ship ) )
            {
              ship->count = 0;
              sprintf( buf, "%d", ship->hyperdistance );
              EchoToRoomNoNewline( AT_YELLOW , GetRoom(ship->room.pilotseat), "Remaining jump distance: " );
              EchoToRoom( AT_WHITE , GetRoom(ship->room.pilotseat), buf );
            }

	  if( IsShipInHyperspace( ship ) )
	    {
	      if( ship->count % 2
		  && ship->hyperdistance < 10 * ship->hyperspeed
		  && ship->hyperdistance > 0 )
		{
		  sprintf( buf,"An alarm sounds. Your hyperjump is ending: %d",
			   ship->hyperdistance );
		  EchoToShip( AT_RED , ship,  buf );
		}
	    }
        }

      if( ship->docked )
        {
          Ship *docked = ship->docked;
          CopyVector( &ship->pos, &docked->pos );
          CopyVector( &ship->hyperpos, &docked->hyperpos );
          CopyVector( &ship->originpos, &docked->originpos );
          CopyVector( &ship->jump, &docked->jump );
          CopyVector( &ship->head, &docked->head );

          ship->shipstate = ship->docked->shipstate;
          ship->hyperdistance = ship->docked->hyperdistance;
          ship->currspeed = ship->docked->currspeed;
          ship->orighyperdistance = ship->docked->orighyperdistance;
          ship->location = ship->docked->location;
          ship->dest = ship->docked->dest;
          ship->spaceobject = ship->docked->spaceobject;
          ship->currjump = ship->docked->currjump;
        }

      if( ship->pos.x > MAX_COORD)
        ship->pos.x = -MAX_COORD_S;

      if( ship->pos.y > MAX_COORD)
        ship->pos.y = -MAX_COORD_S;

      if( ship->pos.z > MAX_COORD)
        ship->pos.z = -MAX_COORD_S;

      if( ship->pos.x > MAX_COORD)
        ship->pos.x = MAX_COORD_S;

      if( ship->pos.y > MAX_COORD)
        ship->pos.y = MAX_COORD_S;

      if( ship->pos.z > MAX_COORD)
        ship->pos.z = MAX_COORD_S;
    }
}

static void LandShip( Ship *ship, const char *arg )
{
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH];
  vnum_t destination = INVALID_VNUM;
  Character *ch = NULL;

  if ( !StringPrefix(arg,ship->spaceobject->LandingSites.LocationAName) )
    {
      destination = ship->spaceobject->LandingSites.DocA;
    }

  if ( !StringPrefix(arg,ship->spaceobject->LandingSites.LocationBName) )
    {
      destination = ship->spaceobject->LandingSites.DocB;
    }

  if ( !StringPrefix(arg,ship->spaceobject->LandingSites.LocationCName) )
    {
      destination = ship->spaceobject->LandingSites.DocC;
    }

  target = GetShipInRange( arg , ship );

  if ( target != ship && target != NULL && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    {
      destination = target->room.hanger;
    }

  if ( !ShipToRoom( ship, destination ) )
    {
      EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat), "Could not complete approach. Landing aborted.");
      EchoToShip( AT_YELLOW, ship , "The ship pulls back up out of its landing sequence.");

      if ( !IsShipDisabled( ship ))
	{
	  ship->shipstate = SHIP_READY;
	}

      return;
    }

  EchoToRoom( AT_YELLOW , GetRoom(ship->room.pilotseat), "Landing sequence complete.");
  EchoToShip( AT_YELLOW , ship , "You feel a slight thud as the ship sets down on the ground.");
  sprintf( buf ,"%s disapears from your scanner." , ship->name  );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );

  if( ship->ch && ship->ch->desc )
    {
      long xp = 0;

      ch = ship->ch;
      xp =  (GetRequiredXpForLevel( GetAbilityLevel(ch, PILOTING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel(ch, PILOTING_ABILITY)));
      xp = umin( GetShipValue( ship ) , xp );
      GainXP( ch, PILOTING_ABILITY, xp );
      Echo( ch, "&WYou gain %ld points of flight experience!\r\n",
		 umin( GetShipValue( ship ) , xp ) );
      ship->ch = NULL;
    }

  ship->location = destination;
  ship->lastdoc = ship->location;

  if (!IsShipDisabled( ship ))
    {
      ship->shipstate = SHIP_LANDED;
    }

  ShipFromSpaceobject(ship, ship->spaceobject);

  if (ship->tractored)
    {
      if (ship->tractored->tractoredby == ship)
	{
	  ship->tractored->tractoredby = NULL;
	}

      ship->tractored = NULL;
    }

  sprintf( buf, "%s lands on the platform.", ship->name );
  EchoToRoom( AT_YELLOW, GetRoom(ship->location), buf );

  ship->energy = ship->energy - 25 - 25*ship->sclass;

  if ( !StrCmp("Public",ship->owner)
       || !StrCmp("trainer",ship->owner)
       || ship->sclass == SHIP_TRAINER )
    {
      int turret_num = 0;

      ship->energy = ship->maxenergy;
      ship->shield = 0;
      ship->autorecharge = false;
      ship->autotrack = false;
      ship->autospeed = false;
      ship->hull = ship->maxhull;

      ship->missilestate = MISSILE_READY;
      ship->statet0 = LASER_READY;

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->turret[turret_num];
	  ResetTurret( turret );
	}

      ship->shipstate = SHIP_LANDED;

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

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if( IsSpaceobjectInRange( ship, spaceobj ) )
	{
	  if ( !StringPrefix(arg,spaceobj->LandingSites.LocationAName) ||
	       !StringPrefix(arg,spaceobj->LandingSites.LocationBName) ||
	       !StringPrefix(arg,spaceobj->LandingSites.LocationCName))
	    {
	      found = true;
	      break;
	    }
	}
    }

  if( found )
    {
      if ( !StringPrefix(arg, spaceobj->LandingSites.LocationAName) )
	{
	  strcpy( buf2, spaceobj->LandingSites.LocationAName);
	}
      else if ( !StringPrefix(arg, spaceobj->LandingSites.LocationBName) )
	{
	  strcpy( buf2, spaceobj->LandingSites.LocationBName);
	}
      else if ( !StringPrefix(arg, spaceobj->LandingSites.LocationCName) )
	{
	  strcpy( buf2, spaceobj->LandingSites.LocationCName);
	}
    }

  target = GetShipInRange( arg, ship );

  if ( target && target != ship && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    {
      strcpy( buf2, target->name);
    }

  if ( !found && !target )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->room.pilotseat), "ERROR");
      return;
    }

  sprintf( buf, "Approaching %s.", buf2 );
  EchoToRoom( AT_YELLOW , GetRoom(ship->room.pilotseat), buf);
  sprintf( buf, "%s begins its approach to %s.", ship->name, buf2 );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}

static void LaunchShip( Ship *ship )
{
  char buf[MAX_STRING_LENGTH];
  Ship *target = NULL;
  int plusminus = 0;

  ShipToSpaceobject( ship, GetSpaceobjectFromVnum( ship->location ) );

  if ( !ship->spaceobject )
    {
      EchoToRoom( AT_YELLOW , GetRoom(ship->room.pilotseat) , "Launch path blocked... Launch aborted.");
      EchoToShip( AT_YELLOW , ship , "The ship slowly sets back back down on the landing pad.");
      sprintf( buf ,  "%s slowly sets back down." ,ship->name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->location) , buf );
      ship->shipstate = SHIP_LANDED;
      return;
    }

  ExtractShip(ship);

  ship->location = INVALID_VNUM;

  if (!IsShipDisabled( ship ))
    {
      ship->shipstate = SHIP_READY;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.x = 1;
    }
  else
    {
      ship->head.x = -1;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.y = 1;
    }
  else
    {
      ship->head.y = -1;
    }

  plusminus = GetRandomNumberFromRange ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.z = 1;
    }
  else
    {
      ship->head.z = -1;
    }

  if (ship->spaceobject
      && ( ship->lastdoc == ship->spaceobject->LandingSites.DocA
	   || ship->lastdoc == ship->spaceobject->LandingSites.DocB
	   || ship->lastdoc == ship->spaceobject->LandingSites.DocC ) )
    {
      CopyVector( &ship->pos, &ship->spaceobject->Position );
    }
  else
    {
      for ( target = first_ship; target; target = target->next )
        {
          if (ship->lastdoc == target->room.hanger)
            {
              CopyVector( &ship->pos, &target->pos );
            }
        }
    }

  ship->energy -= (100+100*ship->sclass);

  ship->pos.x += (ship->head.x * ship->currspeed * 2);
  ship->pos.y += (ship->head.y * ship->currspeed * 2);
  ship->pos.z += (ship->head.z * ship->currspeed * 2);

  EchoToRoom( AT_GREEN , GetRoom(ship->location) , "Launch complete.\r\n");
  EchoToShip( AT_YELLOW , ship , "The ship leaves the platform far behind as it flies into space." );
  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
	   ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
  sprintf( buf, "%s lifts off into space.", ship->name );
  EchoToRoom( AT_YELLOW , GetRoom(ship->lastdoc) , buf );
}

static void MakeDebris( const Ship *ship )
{
  Ship *debris = NULL;
  char buf[MAX_STRING_LENGTH];
  int turret_num = 0;

  if ( ship->sclass == SHIP_DEBRIS )
    {
      return;
    }

  AllocateMemory( debris, Ship, 1 );

  LINK( debris, first_ship, last_ship, next, prev );

  debris->owner       = CopyString( "" );
  debris->copilot     = CopyString( "" );
  debris->pilot       = CopyString( "" );
  debris->home        = CopyString( "" );
  debris->type        = SHIP_CIVILIAN;

  if( ship->type != MOB_SHIP )
    {
      debris->type          = ship->type;
    }

  debris->sclass      = SHIP_DEBRIS;
  debris->lasers      = ship->lasers  ;
  debris->missiles    = ship->missiles  ;
  debris->rockets     = ship->rockets  ;
  debris->torpedos    = ship->torpedos  ;
  debris->maxshield   = ship->maxshield  ;
  debris->maxhull     = ship->maxhull  ;
  debris->maxenergy   = ship->maxenergy  ;
  debris->hyperspeed  = ship->hyperspeed  ;
  debris->chaff       = ship->chaff  ;
  debris->realspeed   = ship->realspeed  ;
  debris->currspeed   = ship->currspeed  ;
  debris->manuever    = ship->manuever  ;

  debris->hull = ship->maxhull;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      debris->turret[turret_num] = CopyTurret( ship->turret[turret_num], debris );
    }

  strcpy( buf, "Debris of a " );
  strcat( buf, ship->name );
  debris->name          = CopyString( "Debris" );
  debris->personalname  = CopyString( "Debris" );
  debris->description   = CopyString( buf );

  ShipToSpaceobject( debris, ship->spaceobject );
  CopyVector( &debris->pos, &ship->pos );
  CopyVector( &debris->head, &ship->head );
}

static void DockShip( Character *ch, Ship *ship )
{
  if ( ship->statetdocking == SHIP_DISABLED )
    {
      EchoToShip( AT_YELLOW , ship , "Maneuver Aborted. Docking clamps damaged.");
      EchoToShip( AT_YELLOW , ship->docked, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }

  if ( ship->docked->statetdocking == SHIP_DISABLED )
    {
      EchoToShip( AT_YELLOW , ship->docked , "Maneuver Aborted. Docking clamps damaged.");
      EchoToShip( AT_YELLOW , ship, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }

  EchoToShip( AT_YELLOW , ship , "The ship finishing its docking manuevers.");
  EchoToShip( AT_YELLOW , ship->docked, "The ship finishes its docking manuevers.");

  ship->docking = SHIP_DOCKED;
  ship->currspeed = 0;
  CopyVector( &ship->pos, &ship->docked->pos );

  if( ch )
    {
      if ( ship->sclass == FIGHTER_SHIP )
        {
          LearnFromSuccess( ch, gsn_starfighters );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          LearnFromSuccess( ch, gsn_midships );
          LearnFromSuccess( ch, gsn_shipdocking);
        }

      if ( ship->sclass == CAPITAL_SHIP )
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

  origShipyard = ship->shipyard;

  ship->shipyard = destination;
  ship->shipstate = SHIP_READY;

  ExtractShip( ship );
  ShipToRoom( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    {
      ShipFromSpaceobject( ship, ship->spaceobject );
    }

  SaveShip(ship);
}

void TargetShip( Ship *ship, Ship *target )
{
  char buf[MAX_STRING_LENGTH];

  ship->target0 = target;
  sprintf( buf , "You are being targetted by %s." , ship->name);
  EchoToCockpit( AT_BLOOD , target , buf );
  sprintf( buf , "The ship targets %s." , target->name);
  EchoToCockpit( AT_BLOOD , ship , buf );
}

bool CheckHostile( Ship *ship )
{
  long distance = -1;
  long tempdistance = 0;
  Ship *target = NULL;
  Ship *enemy = NULL;

  if ( !IsShipAutoflying(ship) || ship->sclass == SHIP_DEBRIS )
    return false;

  for( target = first_ship; target; target = target->next )
    {
      if( !IsShipInCombatRange( ship, target ) )
        continue;

      if ( !StrCmp( ship->owner, "The Empire" ) )
        {
          if ( !StrCmp( target->owner , "The Rebel Alliance" )
	       || !StrCmp( target->owner , "The New Republic"))
            {
              tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!StrCmp( ship->owner, "The Rebel Alliance" ))
	   || (!StrCmp( ship->owner , "The New Republic" )))
        {
          if ( !StrCmp( target->owner, "The Empire" ) )
            {
              tempdistance = GetShipDistanceToShip( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( !StrCmp( ship->owner , "Pirates" ) )
        {
          if ( StrCmp(target->owner, "Pirates") )
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
      if ( IsDrunk( ch ) && ( ch->position != POS_SHOVE )
	   && ( ch->position != POS_DRAG ) )
	{
	  drunk = true;
	}
    }

  if ( drunk && !fall )
    {
      door = (DirectionType)GetRandomDoor();
      pexit = GetExit( GetRoom(ship->location), door );
    }

  in_room = GetRoom(ship->location);

  if ( !pexit || (to_room = pexit->to_room) == NULL )
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

  door = pexit->vdir;

  if ( IsBitSet( pexit->exit_info, EX_WINDOW )
       && !IsBitSet( pexit->exit_info, EX_ISDOOR ) )
    {
      SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if ( IsBitSet(pexit->exit_info, EX_PORTAL)
       && IsNpc(ch) )
    {
      Act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->exit_info, EX_NOMOB)
       && IsNpc(ch) )
    {
      Act( AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->exit_info, EX_CLOSED)
       && (IsBitSet(pexit->exit_info, EX_NOPASSDOOR)) )
    {
      if ( !IsBitSet( pexit->exit_info, EX_SECRET )
           &&   !IsBitSet( pexit->exit_info, EX_DIG ) )
        {
          if ( drunk )
            {
              Act( AT_PLAIN, "$n drives into the $d in $s drunken state.",
		   ch, NULL, pexit->keyword, TO_ROOM );
	      Act( AT_PLAIN, "You drive into the $d in your drunken state.",
		   ch, NULL, pexit->keyword, TO_CHAR );
            }
          else
	    {
	      Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
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
       && ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_hard_range )
        {
          SetCharacterColor( AT_TELL, ch );

          switch( to_room->area->low_hard_range - ch->top_level )
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
      else if ( ch->top_level > to_room->area->hi_hard_range )
	{
	  SetCharacterColor( AT_TELL, ch );
	  SendToCharacter( "A voice in your mind says, 'There is nothing more for you down that path.'", ch );
	  return rNONE;
	}
    }

  if ( !fall )
    {
      if ( IsBitSet( to_room->room_flags, ROOM_INDOORS )
           || IsBitSet( to_room->room_flags, ROOM_SPACECRAFT )
           || to_room->sector_type == SECT_INSIDE )
        {
          SendToCharacter( "You can't drive indoors!\r\n", ch );
          return rNONE;
        }

      if ( IsBitSet( to_room->room_flags, ROOM_NO_DRIVING ) )
        {
          SendToCharacter( "You can't take a vehicle through there!\r\n", ch );
          return rNONE;
        }

      if ( in_room->sector_type == SECT_AIR
           || to_room->sector_type == SECT_AIR
           || IsBitSet( pexit->exit_info, EX_FLY ) )
        {
          if ( ship->sclass > CLOUD_CAR )
            {
              SendToCharacter( "You'd need to fly to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( in_room->sector_type == SECT_WATER_NOSWIM
           || to_room->sector_type == SECT_WATER_NOSWIM
	   || to_room->sector_type == SECT_WATER_SWIM
           || to_room->sector_type == SECT_UNDERWATER
           || to_room->sector_type == SECT_OCEANFLOOR )
        {
          if ( ship->sclass != OCEAN_SHIP )
            {
              SendToCharacter( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }

        }

      if ( IsBitSet( pexit->exit_info, EX_CLIMB ) )
        {
          if ( ship->sclass < CLOUD_CAR )
            {
              SendToCharacter( "You need to fly or climb to get up there.\r\n", ch );
              return rNONE;
            }
        }
    }

  if ( to_room->tunnel > 0 )
    {
      Character *ctmp = NULL;
      int count = 0;

      for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
	{
	  if ( ++count >= to_room->tunnel )
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
      if (  ship->sclass < OCEAN_SHIP )
	{
	  txt = "fly";
	}
      else if ( ship->sclass == OCEAN_SHIP  )
	{
	  txt = "float";
	}
      else if ( ship->sclass > OCEAN_SHIP  )
	{
	  txt = "drive";
	}
    }

  the_chance = IsNpc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_speeders]) ;

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
  sprintf( buf, "%s %ss %s.", ship->name, txt, GetDirectionName(door) );
  EchoToRoom( AT_ACTION , GetRoom(ship->location) , buf );

  ExtractShip( ship );
  ShipToRoom(ship, to_room->vnum );

  ship->location = to_room->vnum;
  ship->lastdoc = ship->location;

  if ( fall )
    {
      txt = "falls";
    }
  else if (  ship->sclass < OCEAN_SHIP )
    {
      txt = "flys in";
    }
  else if ( ship->sclass == OCEAN_SHIP  )
    {
      txt = "floats in";
    }
  else if ( ship->sclass > OCEAN_SHIP  )
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

  sprintf( buf, "%s %s from %s.", ship->name, txt, dtxt );
  EchoToRoom( AT_ACTION , GetRoom(ship->location) , buf );

  for ( rch = ch->in_room->last_person ; rch ; rch = next_rch )
    {
      next_rch = rch->prev_in_room;
      original = rch->in_room;
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

  for ( roomVnum = ship->room.first ; roomVnum <= ship->room.last ;roomVnum++ )
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
	       ship->name, ship->personalname, roomVnum );
	}
    }
}

bool IsShipAutoflying( const Ship *ship )
{
  if (!ship)
    {
      return false;
    }

  if ( ship->type == MOB_SHIP )
    {
      return true;
    }

  if ( ship->autopilot )
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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      int turret_num = 0;

      if ( ship->sclass == SHIP_PLATFORM )
	{
	  if ( closeem && ship->guard )
	    {
	      ship->bayopen = false;
	    }
	}

      if (ship->statet0 > LASER_READY)
        {
          ship->energy -= ship->statet0;
          ship->statet0 = LASER_READY;
        }

      if (ship->statei0 > LASER_READY)
        {
          ship->energy -= 10*ship->statei0;
          ship->statei0 = LASER_READY;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->turret[turret_num];
	  ship->energy -= GetTurretEnergyDraw( turret );
	}

      if( ship->docked && ship->docked->sclass == SHIP_PLATFORM )
        {
          if( ship->maxenergy - ship->energy > 500 )
	    {
	      ship->energy += 500;
	    }
          else
	    {
	      ship->energy = ship->maxenergy;
	    }
        }

      if (ship->missilestate == MISSILE_RELOAD_2)
        {
          ship->missilestate = MISSILE_READY;

          if ( ship->missiles > 0 )
	    {
	      EchoToRoom( AT_YELLOW, GetRoom(ship->room.gunseat),
			    "Missile launcher reloaded.");
	    }
        }

      if (ship->missilestate == MISSILE_RELOAD )
        {
          ship->missilestate = MISSILE_RELOAD_2;
        }

      if (ship->missilestate == MISSILE_FIRED )
	{
	  ship->missilestate = MISSILE_RELOAD;
	}

      if ( IsShipAutoflying(ship) )
        {
          if ( ship->spaceobject && ship->sclass != SHIP_DEBRIS )
            {
              if (ship->target0 && ship->statet0 != LASER_DAMAGED )
                {
                  int the_chance = 75;
                  Ship *target = ship->target0;
                  int shots = 0, guns = 0;
                  int whichguns = 0;

                  if ( ship->lasers && ship->ions && ship->lasers < 7 && ship->ions < 7 )
                    {
                      whichguns = 2;
                      guns = ship->lasers + ship->ions;
                    }
                  else if ( ship->target0->shield > 0 && ship->ions )
                    {
		      whichguns = 1;
                      guns = ship->ions;
                    }
                  else
		    {
		      guns = ship->lasers;
		    }

                  for ( shots=0 ; shots < guns; shots++ )
                    {
                      if ( !IsShipInHyperspace( ship )
                          && ship->energy > 25
                          && IsShipInCombatRange( ship, target )
                          && GetShipDistanceToShip( target, ship ) <= 1000 )
                        {
                          if ( ship->sclass > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                            {
                              the_chance += target->sclass - ship->sclass;
                              the_chance += ship->currspeed - target->currspeed;
                              the_chance += ship->manuever - target->manuever;
                              the_chance -= GetShipDistanceToShip( ship, target ) / ( 10 * ( target->sclass + 1 ) );
                              the_chance -= origchance;
                              the_chance /= 2;
                              the_chance += origchance;
                              the_chance = urange( 1 , the_chance , 99 );

                              if ( GetRandomPercent() > the_chance )
                                {
                                  sprintf( buf , "%s fires at you but misses." , ship->name);
                                  EchoToCockpit( AT_ORANGE , target , buf );
                                  sprintf( buf, "Weaponsfire from %s barely misses %s." , ship->name , target->name );
                                  EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                }
                              else
                                {
                                  if( whichguns == 0 )
                                    {
                                      sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
                                      EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are hit by lasers from %s!" , ship->name);
                                      EchoToCockpit( AT_BLOOD , target , buf );
                                      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->sclass == SHIP_PLATFORM )
					{
					  DamageShip( target, 100, 250, NULL, ship );
					}
                                      else if( ship->sclass == CAPITAL_SHIP
					       && target->sclass != CAPITAL_SHIP )
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
                                      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->name, target->name );
                                      EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->name);
                                      EchoToCockpit( AT_BLOOD , target , buf );
                                      EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->sclass == SHIP_PLATFORM )
					{
					  DamageShip( target, -250, -100, NULL, ship );
					}
                                      else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
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
                                      if( shots < ship->lasers )
                                        {
                                          sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
                                          EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by lasers from %s!" , ship->name);
                                          EchoToCockpit( AT_BLOOD , target , buf );
                                          EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->sclass == SHIP_PLATFORM )
					    {
					      DamageShip( target, 100, 250, NULL, ship );
					    }
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
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
                                          sprintf( buf, "Ion energy from %s hits %s." , ship->name, target->name );
                                          EchoToNearbyShips( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by an ion cannon from %s!" , ship->name);
                                          EchoToCockpit( AT_BLOOD , target , buf );
                                          EchoToShip( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->sclass == SHIP_PLATFORM )
					    {
					      DamageShip( target, -250, -100, NULL, ship );
					    }
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
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

                              ship->statet0++;

                              if ( IsShipAutoflying(target) && !target->target0)
                                {
                                  sprintf( buf , "You are being targetted by %s." , target->name);
                                  EchoToCockpit( AT_BLOOD , ship , buf );
                                  target->target0 = ship;
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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      int turret_num = 0;

      if ( ship->spaceobject
	   && ship->energy > 0
	   && IsShipDisabled( ship )
	   && ship->sclass != SHIP_PLATFORM )
	{
	  ship->energy -= 100;
	}
      else if ( ship->energy > 0 )
	{
	  ship->energy += ( 5 + ship->sclass*5 );
	}
      else
	{
	  ship->energy = 0;
	}

      if ( ship->chaff_released > 0 )
	{
	  ship->chaff_released = !ship->chaff_released;
	}

      /* following was originaly to fix ships that lost their pilot
         in the middle of a manuever and are stuck in a busy state
         but now used for timed manouevers such as turning */

      if( ship->shipstate == SHIP_READY && ship->tracking == true )
        {
          if( ship->count == 0 )
            {
              ship->count++;
            }
          else
            {
	      do_hyperspace( ship->ch, "" );
              ship->count = 0;
            }
        }

      if (ship->shipstate == SHIP_BUSY_3)
        {
          EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat), "Manuever complete.");
          ship->shipstate = SHIP_READY;
        }

      if (ship->shipstate == SHIP_BUSY_2)
	{
	  ship->shipstate = SHIP_BUSY_3;
	}

      if (ship->shipstate == SHIP_BUSY)
	{
	  ship->shipstate = SHIP_BUSY_2;
	}

      if (ship->shipstate == SHIP_LAND_2)
	{
	  LandShip( ship , ship->dest );
	}

      if (ship->shipstate == SHIP_LAND)
        {
          ApproachLandingSite( ship, ship->dest );
          ship->shipstate = SHIP_LAND_2;
        }

      if (ship->shipstate == SHIP_LAUNCH_2)
	{
	  LaunchShip( ship );
	}

      if (ship->shipstate == SHIP_LAUNCH)
	{
	  ship->shipstate = SHIP_LAUNCH_2;
	}

      if (ship->docking == SHIP_DOCK_2)
	{
	  DockShip( ship->ch , ship );
	}

      if (ship->docking == SHIP_DOCK)
	{
	  ship->docking = SHIP_DOCK_2;
	}

      ship->shield = umax( 0 , ship->shield-1-ship->sclass);

      if (ship->autorecharge
	  && ship->maxshield > ship->shield
	  && ship->energy > 100)
        {
          recharge = umin( ship->maxshield-ship->shield, 10 + ship->sclass*10 );
          recharge = umin( recharge , ship->energy/2 -100 );
	  recharge = umax( 1, recharge );
          ship->shield += recharge;
          ship->energy -= recharge;
        }

      if ( IsShipAutoflying(ship)
	   && ( ship->energy >= ( ( 25 + ((int)ship->sclass) * 25 ) * ( 2 + ((int)ship->sclass) ) ) )
           && ( ( ship->maxshield - ship->shield ) >= ( 25 + ((int)ship->sclass) * 25 ) ) )
        {
          recharge = 25+ship->sclass*25;
          recharge = umin(  ship->maxshield-ship->shield , recharge );
          ship->shield += recharge;
          ship->energy -= ( recharge*2 + recharge * ship->sclass );
        }

      if (ship->shield > 0)
        {
          if (ship->energy < 200)
            {
              ship->shield = 0;
              EchoToCockpit( AT_RED, ship,"The ships shields fizzle and die.");
              ship->autorecharge = false;
            }
        }

      if ( ship->spaceobject && ship->currspeed > 0 )
        {
          sprintf( buf, "%d", ship->currspeed );
          EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->room.pilotseat),  "Speed: " );
          EchoToRoomNoNewline( AT_LBLUE , GetRoom(ship->room.pilotseat),  buf );
          sprintf( buf, "%.0f %.0f %.0f", ship->pos.x , ship->pos.y, ship->pos.z );
          EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->room.pilotseat),  "  Coords: " );
          EchoToRoom( AT_LBLUE , GetRoom(ship->room.pilotseat),  buf );

          if ( ship->room.pilotseat != ship->room.coseat )
            {
              sprintf( buf, "%d", ship->currspeed );
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->room.coseat),  "Speed: " );
              EchoToRoomNoNewline( AT_LBLUE , GetRoom(ship->room.coseat),  buf );
              sprintf( buf, "%.0f %.0f %.0f", ship->pos.x , ship->pos.y, ship->pos.z );
              EchoToRoomNoNewline( AT_BLUE , GetRoom(ship->room.coseat),  "  Coords: " );
              EchoToRoom( AT_LBLUE , GetRoom(ship->room.coseat),  buf );
	    }
        }

      if ( ship->spaceobject )
        {
          too_close = ship->currspeed + 50;
          too_close = ship->currspeed + 50;

          for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
	    {
	      if( spaceobj->Name &&  StrCmp(spaceobj->Name,"")
		  && GetShipDistanceToSpaceobject( ship, spaceobj ) < too_close )
		{
		  sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f", spaceobj->Name,
			   spaceobj->Position.x, spaceobj->Position.y, spaceobj->Position.z);
		  EchoToRoom( AT_RED , GetRoom(ship->room.pilotseat),  buf );
		}
	    }

          for ( target = first_ship; target; target = target->next )
            {
              if( (target->docked && target->docked == ship) || (ship->docked &&  ship->docked == target ) )
		{
		  continue;
		}

              if ( ship->docked && target->docked
                   && target->docked == ship->docked )
		{
		  continue;
		}

              target_too_close = too_close + target->currspeed;

              if( target->spaceobject )
                {
                  if( target != ship
                      && GetShipDistanceToShip( ship, target ) < target_too_close
                      && ship->docked != target && target->docked != ship )
                    {
                      sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f",
                               target->name,
                               target->pos.x - ship->pos.x,
                               target->pos.y - ship->pos.y,
                               target->pos.z - ship->pos.z );
                      EchoToRoom( AT_RED, GetRoom(ship->room.pilotseat),
                                    buf );
                    }
                }
            }

	  too_close = ship->currspeed + 100;
        }

      if (ship->target0 && ship->sclass <= SHIP_PLATFORM)
        {
          sprintf( buf, "%s   %.0f %.0f %.0f", ship->target0->name,
                   ship->target0->pos.x, ship->target0->pos.y,
                   ship->target0->pos.z );
          EchoToRoomNoNewline( AT_BLUE, GetRoom(ship->room.gunseat),"Target: ");
          EchoToRoom( AT_LBLUE , GetRoom(ship->room.gunseat),  buf );

          if (!IsShipInCombatRange( ship, ship->target0 ) )
            {
              EchoToRoom( AT_LBLUE , GetRoom(ship->room.gunseat),  "Your target seems to have left.");
              ship->target0 = NULL;
            }
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->turret[turret_num];

	  if ( TurretHasTarget( turret ) && ship->sclass <= SHIP_PLATFORM)
	    {
	      const  Ship *turret_target = GetTurretTarget( turret );

	      sprintf( buf, "%s   %.0f %.0f %.0f", turret_target->name,
		       turret_target->pos.x, turret_target->pos.y,
		       turret_target->pos.z );
	      EchoToRoomNoNewline( AT_BLUE , GetRoom(GetTurretRoom( turret ) ), "Target: " );
	      EchoToRoom( AT_LBLUE , GetRoom(GetTurretRoom( turret ) ),  buf );

	      if (!IsShipInCombatRange( ship, turret_target ) )
		{
		  ClearTurretTarget( turret );
		}
	    }
	}

      if (ship->energy < 100 && ship->spaceobject )
        {
          EchoToCockpit( AT_RED , ship,  "Warning: Ship fuel low." );
	}

      ship->energy = urange( 0 , ship->energy, ship->maxenergy );
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->target0 && IsShipAutoflying(ship) )
	{
	  if( !IsShipInCombatRange( ship->target0, ship ) )
	    {
	      EchoToRoom( AT_BLUE , GetRoom(ship->room.pilotseat), "Target left, returning to NORMAL condition.\r\n" );
	      ship->currspeed = 0;
	      ship->target0 = NULL;
	    }
	}

      if (ship->autotrack && ship->docking == SHIP_READY && ship->target0 && ship->sclass < SHIP_PLATFORM )
        {

          target = ship->target0;
          too_close = ship->currspeed + 10;
          target_too_close = too_close+target->currspeed;

          if ( target != ship && ship->shipstate == SHIP_READY
               && ship->docked == NULL && ship->shipstate != SHIP_DOCKED
               && GetShipDistanceToShip( ship, target ) < target_too_close )
            {
              SetShipCourseTowardsShip( ship, ship->target0 );
              TurnShip180( ship );
              ship->energy -= ship->currspeed/10;
              EchoToRoom( AT_RED , GetRoom(ship->room.pilotseat), "Autotrack: Evading to avoid collision!\r\n" );

              if ( ship->sclass == FIGHTER_SHIP
		   || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
		{
		  ship->shipstate = SHIP_BUSY_3;
		}
              else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
		{
		  ship->shipstate = SHIP_BUSY_2;
		}
              else
		{
		  ship->shipstate = SHIP_BUSY;
		}
            }
          else if ( !IsShipFacingShip(ship, ship->target0)
                    && ship->docked == NULL && ship->shipstate != SHIP_DOCKED )
            {
              SetShipCourseTowardsShip( ship, ship->target0 );
              ship->energy -= ship->currspeed / 10;
              EchoToRoom( AT_BLUE , GetRoom(ship->room.pilotseat), "Autotracking target... setting new course.\r\n" );

	      if ( ship->sclass == FIGHTER_SHIP
		   || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
		{
		  ship->shipstate = SHIP_BUSY_3;
		}
              else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
		{
		  ship->shipstate = SHIP_BUSY_2;
		}
              else
		{
		  ship->shipstate = SHIP_BUSY;
		}
            }
        }

      if ( IsShipAutoflying(ship) && ship->sclass != SHIP_DEBRIS )
        {
          if ( ship->spaceobject )
            {
              CheckHostile( ship );

              if (ship->target0 )
                {
                  int the_chance = 50;
                  int projectiles = -1;

                  if ( !ship->target0->target0 && IsShipAutoflying(ship->target0))
		    {
		      ship->target0->target0 = ship;
		    }

                  /* auto assist ships */

                  for ( target = first_ship; target; target = target->next)
                    {
                      if( IsShipInCombatRange( ship, target ) )
			{
			  if ( IsShipAutoflying(target)
			       && target->docked == NULL
			       && target->shipstate != SHIP_DOCKED )
			    {
			      if ( !StrCmp ( target->owner , ship->owner ) && target != ship )
				{
				  if ( target->target0 == NULL && ship->target0 != target )
				    {
				      target->target0 = ship->target0;
				      sprintf( buf, "You are being targetted by %s.",
					       target->name);
				      EchoToCockpit( AT_BLOOD , target->target0 , buf );
				      break;
				    }
				}
			    }
			}
                    }

                  target = ship->target0;
                  ship->autotrack = true;

                  if( ship->sclass != SHIP_PLATFORM && !ship->guard
                      && ship->docked == NULL && ship->shipstate != SHIP_DOCKED )
		    {
		      ship->currspeed = ship->realspeed;
		    }

                  if ( ship->energy >200  )
		    {
		      ship->autorecharge=true;
		    }

                  if ( !IsShipInHyperspace( ship )
		      && ship->energy > 25
                      && ship->missilestate == MISSILE_READY
                      && IsShipInCombatRange( ship, target )
                      && GetShipDistanceToShip( target, ship ) <= 1200 )
                    {
                      if ( ship->sclass > MIDSIZE_SHIP || IsShipFacingShip( ship , target ) )
                        {
                          the_chance -= target->manuever/5;
                          the_chance -= target->currspeed/20;
                          the_chance += target->sclass*target->sclass*25;
                          the_chance -= ( GetShipDistanceToShip( ship, target ) * 3 ) / 100;
                          the_chance += 30;
                          the_chance = urange( 10 , the_chance , 90 );

                          if( ( target->sclass == SHIP_PLATFORM
				|| ( target->sclass == CAPITAL_SHIP
				     && target->currspeed < 50 ))
			      && ship->rockets > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ( target->sclass == MIDSIZE_SHIP
				      || ( target->sclass == CAPITAL_SHIP) )
				    && ship->torpedos > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->missiles < 0 && ship->torpedos > 0 )
			    {
			      projectiles = PROTON_TORPEDO;
			    }
                          else if ( ship->missiles < 0 && ship->rockets > 0 )
			    {
			      projectiles = HEAVY_ROCKET;
			    }
                          else if ( ship->missiles > 0 )
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
				  ship->missiles--;
				}

                              if( projectiles == PROTON_TORPEDO )
				{
				  ship->torpedos--;
				}

                              if( projectiles == HEAVY_ROCKET )
				{
				  ship->rockets--;
				}

                              sprintf( buf , "Incoming projectile from %s." , ship->name);
                              EchoToCockpit( AT_BLOOD , target , buf );
                              sprintf( buf, "%s fires a projectile towards %s.",
				       ship->name, target->name );
                              EchoToNearbyShips( AT_ORANGE , target , buf , NULL );

			      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
				{
				  ship->missilestate = MISSILE_RELOAD_2;
				}
                              else
				{
				  ship->missilestate = MISSILE_FIRED;
				}
                            }
                        }
                    }

                  if( ship->missilestate ==  MISSILE_DAMAGED )
		    {
		      ship->missilestate =  MISSILE_READY;
		    }

                  if( ship->statet0 ==  LASER_DAMAGED )
		    {
		      ship->statet0 =  LASER_READY;
		    }

                  if( ship->statei0 ==  LASER_DAMAGED )
		    {
		      ship->statei0 =  LASER_READY;
		    }

                  if( IsShipDisabled( ship ) )
		    {
		      ship->shipstate =  SHIP_READY;
		    }
                }
              else
		{
		  ship->currspeed = 0;
		}
            }
          else
            {
              if ( GetRandomNumberFromRange(1, 25) == 25 )
                {
                  ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->home));
                  InitializeVector( &ship->pos );
                  SetVector( &ship->head, 1, 1, 1 );

                  if( ship->spaceobject )
                    {
                      CopyVector( &ship->pos, &ship->spaceobject->Position );
                    }

                  RandomizeVector( &ship->pos, -5000, 5000 );
                }
            }
        }

      if ( ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
           && ship->target0 == NULL )
        {
          if( ship->missiles < ship->maxmissiles )
	    {
	      ship->missiles++;
	    }

	  if( ship->torpedos < ship->maxtorpedos )
	    {
	      ship->torpedos++;
	    }

          if( ship->rockets < ship->maxrockets )
	    {
	      ship->rockets++;
	    }

          if( ship->chaff < ship->maxchaff )
	    {
	      ship->chaff++;
	    }
        }

      SaveShip( ship );
    }
}

void EchoToDockedShip( int color, const Ship *ship, const char *argument )
{
  Ship *dship = NULL;

  for( dship = first_ship; dship; dship = dship->next )
    {
      if( dship->docked && dship->docked == ship)
	{
	  EchoToCockpit( color, dship, argument );
	}
    }
}

void EchoToCockpit( int color, const Ship *ship, const char *argument )
{
  vnum_t room = INVALID_VNUM;

  for ( room = ship->room.first; room <= ship->room.last;room++ )
    {
      if ( room == ship->room.cockpit || room == ship->room.navseat
           || room == ship->room.pilotseat || room == ship->room.coseat
           || room == ship->room.gunseat || room == ship->room.engine
           || room == GetTurretRoom( ship->turret[0] )
	   || room == GetTurretRoom( ship->turret[1] )
	   || room == GetTurretRoom( ship->turret[2] )
	   || room == GetTurretRoom( ship->turret[3] )
	   || room == GetTurretRoom( ship->turret[4] )
	   || room == GetTurretRoom( ship->turret[5] )
	   || room == GetTurretRoom( ship->turret[6] )
	   || room == GetTurretRoom( ship->turret[7] )
	   || room == GetTurretRoom( ship->turret[8] )
	   || room == GetTurretRoom( ship->turret[9] ) )
	{
	  EchoToRoom( color, GetRoom(room), argument );
	}
    }
}

bool IsShipInCombatRange( const Ship *ship, const Ship *target )
{
  if (target && ship && target != ship )
    {
      if ( target->spaceobject && ship->spaceobject
           && target->shipstate != SHIP_LANDED
           && GetShipDistanceToShip( ship, target ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 3 ) )
	{
	  return true;
	}
    }

  return false;
}

bool IsMissileInRange( const Ship *ship, const Missile *missile )
{
  return missile && ship && ship->spaceobject
    && GetMissileDistanceToShip( missile, ship ) < 5000;
}

bool IsSpaceobjectInRange( const Ship *ship, const Spaceobject *object )
{
  return object && ship && ship->spaceobject
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
    && GetDistanceBetweenVectors( &object->Position, &ship->hyperpos ) < object->Gravity * 5;
}

long int GetShipValue( const Ship *ship )
{
  long int price = 0;
  int turret_num = 0;

  if (ship->sclass == FIGHTER_SHIP)
    {
      price = 5000;
    }
  else if (ship->sclass == MIDSIZE_SHIP)
    {
      price = 50000;
    }
  else if (ship->sclass == CAPITAL_SHIP)
    {
      price = 500000;
    }
  else
    {
      price = 2000;
    }

  if ( ship->sclass <= CAPITAL_SHIP )
    {
      price += ship->manuever * 100 * ( 1 + ship->sclass );
    }

  price += ship->tractorbeam * 100;
  price += ship->realspeed * 10;
  price += ship->astro_array * 5;
  price += 5 * ship->maxhull;
  price += 2 * ship->maxenergy;

  if (ship->maxenergy > 5000 )
    {
      price += (ship->maxenergy-5000) * 20;
    }

  if (ship->maxenergy > 10000 )
    {
      price += (ship->maxenergy-10000) * 50;
    }

  if (ship->maxhull > 1000)
    {
      price += (ship->maxhull-1000) * 10;
    }

  if (ship->maxhull > 10000)
    {
      price += (ship->maxhull-10000) * 20;
    }

  if (ship->maxshield > 200)
    {
      price += (ship->maxshield-200) * 50;
    }

  if (ship->maxshield > 1000)
    {
      price += (ship->maxshield-1000) * 100;
    }

  if (ship->realspeed > 100 )
    {
      price += (ship->realspeed-100) * 500;
    }

  if (ship->lasers > 5 )
    {
      price += (ship->lasers-5) * 500;
    }

  if (ship->maxshield)
    {
      price += 1000 + 10 * ship->maxshield;
    }

  if (ship->lasers)
    {
      price += 500 + 500 * ship->lasers;
    }

  if (ship->missiles )
    {
      price += 250 * ship->missiles;
    }
  else if (ship->torpedos )
    {
      price += 500 * ship->torpedos;
    }
  else if (ship->rockets )
    {
      price += 1000 * ship->rockets;
    }

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      const Turret *turret = ship->turret[turret_num];

      if( IsTurretInstalled( turret ) )
	{
	  price += 5000;
	}
    }

  if (ship->hyperspeed)
    {
      price += 1000 + ship->hyperspeed * 10;
    }

  if (ship->room.hanger)
    {
      price += ship->sclass == MIDSIZE_SHIP ? 50000 : 100000;
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

  for ( tship = first_ship; tship; tship = tship->next )
    {
      if( tship->sclass != SHIP_DEBRIS )
	{
	  fprintf( fpout, "%s\n", tship->filename );
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

  if ( ship->sclass == SHIP_DEBRIS )
    {
      return;
    }

  if ( !ship->filename || ship->filename[0] == '\0' )
    {
      Bug( "%s: %s has no filename", __FUNCTION__, ship->name );
      return;
    }

  sprintf( filename, "%s%s", SHIP_DIR, ship->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#SHIP\n" );
      fprintf( fp, "Name          %s~\n",  ship->name                        );
      fprintf( fp, "PersonalName  %s~\n",  ship->personalname                );
      fprintf( fp, "Filename      %s~\n",  ship->filename                    );
      fprintf( fp, "Description   %s~\n",  ship->description                 );
      fprintf( fp, "Owner         %s~\n",  ship->owner                       );
      fprintf( fp, "Pilot         %s~\n",  ship->pilot                       );
      fprintf( fp, "Copilot       %s~\n",  ship->copilot                     );
      fprintf( fp, "Class         %d\n",   ship->sclass                      );
      fprintf( fp, "Tractorbeam   %d\n",   ship->tractorbeam                 );
      fprintf( fp, "Shipyard      %ld\n",  ship->shipyard                    );
      fprintf( fp, "Hanger        %ld\n",  ship->room.hanger                 );
      fprintf( fp, "Vx            %.0f\n", ship->pos.x                       );
      fprintf( fp, "Vy            %.0f\n", ship->pos.y                       );
      fprintf( fp, "Vz            %.0f\n", ship->pos.z                       );
      fprintf( fp, "Turret1       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret2       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret3       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret4       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret5       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret6       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret7       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret8       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret9       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Turret0       %ld\n",  GetTurretRoom( ship->turret[0] ));
      fprintf( fp, "Statet0       %d\n",   ship->statet0                     );
      fprintf( fp, "Statei0       %d\n",   ship->statei0                     );

      fprintf( fp, "Statet1       %d\n",
	       IsTurretDamaged( ship->turret[0] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet2       %d\n",
               IsTurretDamaged( ship->turret[1] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet3       %d\n",
               IsTurretDamaged( ship->turret[2] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet4       %d\n",
               IsTurretDamaged( ship->turret[3] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet5       %d\n",
               IsTurretDamaged( ship->turret[4] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet6       %d\n",
               IsTurretDamaged( ship->turret[5] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet7       %d\n",
               IsTurretDamaged( ship->turret[6] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet8       %d\n",
               IsTurretDamaged( ship->turret[7] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet9       %d\n",
               IsTurretDamaged( ship->turret[8] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet0       %d\n",
               IsTurretDamaged( ship->turret[9] ) ? LASER_DAMAGED : LASER_READY );

      fprintf( fp, "Lasers        %d\n",   ship->lasers                      );
      fprintf( fp, "Missiles      %d\n",   ship->missiles                    );
      fprintf( fp, "Maxmissiles   %d\n",   ship->maxmissiles                 );
      fprintf( fp, "Rockets       %d\n",   ship->rockets                     );
      fprintf( fp, "Maxrockets    %d\n",   ship->maxrockets                  );
      fprintf( fp, "Torpedos      %d\n",   ship->torpedos                    );
      fprintf( fp, "Maxtorpedos   %d\n",   ship->maxtorpedos                 );
      fprintf( fp, "Lastdoc       %ld\n",  ship->lastdoc                     );
      fprintf( fp, "Firstroom     %ld\n",  ship->room.first                  );
      fprintf( fp, "Lastroom      %ld\n",  ship->room.last                   );
      fprintf( fp, "Shield        %d\n",   ship->shield                      );
      fprintf( fp, "Maxshield     %d\n",   ship->maxshield                   );
      fprintf( fp, "Hull          %d\n",   ship->hull                        );
      fprintf( fp, "Maxhull       %d\n",   ship->maxhull                     );
      fprintf( fp, "Maxenergy     %d\n",   ship->maxenergy                   );
      fprintf( fp, "Hyperspeed    %d\n",   ship->hyperspeed                  );
      fprintf( fp, "Comm          %d\n",   ship->comm                        );
      fprintf( fp, "Chaff         %d\n",   ship->chaff                       );
      fprintf( fp, "Maxchaff      %d\n",   ship->maxchaff                    );
      fprintf( fp, "Sensor        %d\n",   ship->sensor                      );
      fprintf( fp, "Astro_array   %d\n",   ship->astro_array                 );
      fprintf( fp, "Realspeed     %d\n",   ship->realspeed                   );
      fprintf( fp, "Type          %d\n",   ship->type                        );
      fprintf( fp, "Cockpit       %ld\n",  ship->room.cockpit                );
      fprintf( fp, "Coseat        %ld\n",  ship->room.coseat                 );
      fprintf( fp, "Pilotseat     %ld\n",  ship->room.pilotseat              );
      fprintf( fp, "Gunseat       %ld\n",  ship->room.gunseat                );
      fprintf( fp, "Navseat       %ld\n",  ship->room.navseat                );
      fprintf( fp, "Engineroom    %ld\n",  ship->room.engine                 );
      fprintf( fp, "Entrance      %ld\n",  ship->room.entrance               );
      fprintf( fp, "Shipstate     %d\n",   ship->shipstate                   );
      fprintf( fp, "Missilestate  %d\n",   ship->missilestate                );
      fprintf( fp, "Energy        %d\n",   ship->energy                      );
      fprintf( fp, "Manuever      %d\n",   ship->manuever                    );
      fprintf( fp, "Alarm         %d\n",   ship->alarm                       );
      fprintf( fp, "Ions          %d\n",   ship->ions                        );
      fprintf( fp, "Dockingports  %d\n",   ship->dockingports                );
      fprintf( fp, "Guard         %d\n",   ship->guard                       );
      fprintf( fp, "Home          %s~\n",  ship->home                        );
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
          KEY( "Astro_array",      ship->astro_array,       ReadInt( fp ) );
          KEY( "Alarm",            ship->alarm,             ReadInt( fp ) );
          break;

        case 'C':
          KEY( "Cockpit",     ship->room.cockpit,          ReadInt( fp ) );
          KEY( "Coseat",     ship->room.coseat,          ReadInt( fp ) );
          KEY( "Class",       ship->sclass,            (ShipClass)ReadInt( fp ) );
          KEY( "Copilot",     ship->copilot,          ReadStringToTilde( fp ) );
          KEY( "Comm",        ship->comm,      ReadInt( fp ) );
          KEY( "Chaff",       ship->chaff,      ReadInt( fp ) );
          break;

        case 'D':
          KEY( "Description",   ship->description,      ReadStringToTilde( fp ) );
          KEY( "DockingPorts",    ship->dockingports,      ReadInt( fp ) );
          break;

        case 'E':
          KEY( "Engineroom",    ship->room.engine,      ReadInt( fp ) );
          KEY( "Entrance",      ship->room.entrance,         ReadInt( fp ) );
          KEY( "Energy",      ship->energy,        ReadInt( fp ) );

          if ( !StrCmp( word, "End" ) )
            {
	      int turret_num = 0;

              if (!ship->home)
		{
		  ship->home = CopyString( "" );
		}

              if (!ship->name)
		{
		  ship->name = CopyString( "" );
		}

	      if (!ship->owner)
		{
		  ship->owner = CopyString( "" );
		}

              if (!ship->description)
		{
		  ship->description = CopyString( "" );
		}

              if (!ship->copilot)
		{
		  ship->copilot = CopyString( "" );
		}

              if (!ship->pilot)
		{
		  ship->pilot = CopyString( "" );
		}

              if (!IsShipDisabled( ship ))
		{
		  ship->shipstate = SHIP_LANDED;
		}

              if (ship->statet0 != LASER_DAMAGED)
		{
		  ship->statet0 = LASER_READY;
		}

              if (ship->statei0 != LASER_DAMAGED)
		{
		  ship->statei0 = LASER_READY;
		}

	      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
		{
		  Turret *turret = ship->turret[turret_num];

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

              if (ship->missilestate != MISSILE_DAMAGED)
		{
		  ship->missilestate = MISSILE_READY;
		}

              if (ship->shipyard <= 0)
		{
		  ship->shipyard = ROOM_LIMBO_SHIPYARD;
		}

              if (ship->lastdoc <= 0)
		{
		  ship->lastdoc = ship->shipyard;
		}

              if (ship->room.navseat <= 0)
		{
		  ship->room.navseat = ship->room.cockpit;
		}

              if (ship->room.gunseat <= 0)
		{
		  ship->room.gunseat = ship->room.cockpit;
		}

              if (ship->room.coseat <= 0)
		{
		  ship->room.coseat = ship->room.cockpit;
		}

              if (ship->room.pilotseat <= 0)
		{
		  ship->room.pilotseat = ship->room.cockpit;
		}

              if (ship->missiletype == 1)
                {
                  ship->torpedos = ship->missiles;    /* for back compatibility */
                  ship->missiles = 0;
                }

	      if( ship->sclass < SHIP_PLATFORM )
		{
		  ship->bayopen = false;
		}

              return;
            }
          break;

        case 'F':
          KEY( "Filename",      ship->filename,         ReadStringToTilde( fp ) );
          KEY( "Firstroom",   ship->room.first,        ReadInt( fp ) );
          break;

        case 'G':
          KEY( "Guard",     ship->guard,          ReadInt( fp ) );
          KEY( "Gunseat",     ship->room.gunseat,          ReadInt( fp ) );
          break;

        case 'H':
          KEY( "Home" , ship->home, ReadStringToTilde( fp ) );
          KEY( "Hyperspeed",   ship->hyperspeed,      ReadInt( fp ) );
          KEY( "Hull",      ship->hull,        ReadInt( fp ) );
          KEY( "Hanger",  ship->room.hanger,      ReadInt( fp ) );
          break;

        case 'I':
          KEY( "Ions" , ship->ions, ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Laserstr",   ship->lasers,   (short)  ( ReadInt( fp )/10 ) );
          KEY( "Lasers",   ship->lasers,      ReadInt( fp ) );
          KEY( "Lastdoc",    ship->lastdoc,       ReadInt( fp ) );
          KEY( "Lastroom",   ship->room.last,        ReadInt( fp ) );
          break;

        case 'M':
          KEY( "Manuever",   ship->manuever,      ReadInt( fp ) );
          KEY( "Maxmissiles",   ship->maxmissiles,      ReadInt( fp ) );
          KEY( "Maxtorpedos",   ship->maxtorpedos,      ReadInt( fp ) );
          KEY( "Maxrockets",   ship->maxrockets,      ReadInt( fp ) );
          KEY( "Missiles",   ship->missiles,      ReadInt( fp ) );
          KEY( "Missiletype",   ship->missiletype,      ReadInt( fp ) );
          KEY( "Maxshield",      ship->maxshield,        ReadInt( fp ) );
          KEY( "Maxenergy",      ship->maxenergy,        ReadInt( fp ) );
          KEY( "Missilestate",   ship->missilestate,        ReadInt( fp ) );
	  KEY( "Maxhull",      ship->maxhull,        ReadInt( fp ) );
          KEY( "Maxchaff",       ship->maxchaff,      ReadInt( fp ) );
          break;

        case 'N':
          KEY( "Name",  ship->name,             ReadStringToTilde( fp ) );
          KEY( "Navseat",     ship->room.navseat,          ReadInt( fp ) );
          break;

        case 'O':
          KEY( "Owner",            ship->owner,            ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PersonalName",  ship->personalname,             ReadStringToTilde( fp ) );
          KEY( "Pilot",            ship->pilot,            ReadStringToTilde( fp ) );
          KEY( "Pilotseat",     ship->room.pilotseat,          ReadInt( fp ) );
          break;

        case 'R':
          KEY( "Realspeed",   ship->realspeed,       ReadInt( fp ) );
          KEY( "Rockets",     ship->rockets,         ReadInt( fp ) );
          break;

        case 'S':
          KEY( "Shipyard",    ship->shipyard,      ReadInt( fp ) );
          KEY( "Sensor",      ship->sensor,       ReadInt( fp ) );
          KEY( "Shield",      ship->shield,        ReadInt( fp ) );
          KEY( "Shipstate",   ship->shipstate,        ReadInt( fp ) );
          KEY( "Statei0",   ship->statei0,        ReadInt( fp ) );
          KEY( "Statet0",   ship->statet0,        ReadInt( fp ) );
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
          KEY( "Type",  ship->type,     ReadInt( fp ) );
	  KEY( "Tractorbeam", ship->tractorbeam,      ReadInt( fp ) );
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
          KEY( "Torpedos",    ship->torpedos, ReadInt( fp ) );
          break;

        case 'V':
          KEY( "Vx",          ship->pos.x,     ReadInt( fp ) );
          KEY( "Vy",          ship->pos.y,     ReadInt( fp ) );
          KEY( "Vz",          ship->pos.z,     ReadInt( fp ) );
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
      ship->turret[turret_num] = AllocateTurret( ship );
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
	  Turret *turret = ship->turret[turret_num];
	  FreeTurret( turret );
	}

      FreeMemory( ship );
    }
  else
    {
      LINK( ship, first_ship, last_ship, next, prev );

      ship->docking = SHIP_READY;

      if ( ( !StrCmp("Trainer", ship->owner)
             || !StrCmp("Public",ship->owner)
             || ship->type == MOB_SHIP ) )
        {
          if ( ship->sclass != SHIP_PLATFORM && ship->type != MOB_SHIP && ship->sclass != CAPITAL_SHIP )
            {
              ExtractShip( ship );
              ShipToRoom( ship , ship->shipyard );

	      ship->location = ship->shipyard;
              ship->lastdoc = ship->shipyard;
              ship->shipstate = SHIP_LANDED;
              ship->docking = SHIP_READY;
            }

          if( !ship->personalname )
	    {
	      ship->personalname = CopyString(ship->name);
	    }

          ship->currspeed = 0;
          ship->energy = ship->maxenergy;
          ship->hull = ship->maxhull;
          ship->shield = 0;

          ship->statet0 = LASER_READY;
          ship->missilestate = LASER_READY;
          ship->statettractor = SHIP_READY;
          ship->statetdocking = SHIP_READY;
          ship->docking = SHIP_READY;

          ship->currjump = NULL;
          ship->target0 = NULL;

          ship->hatchopen = false;
	  ship->bayopen = false;

          ship->autorecharge = false;
	  ship->autotrack = false;
          ship->autospeed = false;
        }
      else if ( ( pRoomIndex = GetRoom( ship->lastdoc ) ) != NULL
                && ship->sclass != CAPITAL_SHIP && ship->sclass != SHIP_PLATFORM )
        {
          LINK( ship, pRoomIndex->first_ship, pRoomIndex->last_ship, next_in_room, prev_in_room );
          ship->in_room = pRoomIndex;
          ship->location = ship->lastdoc;
        }

      if ( ship->sclass == SHIP_PLATFORM
	   || ship->type == MOB_SHIP
	   || ship->sclass == CAPITAL_SHIP )
        {
          ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->home) );
          SetVector( &ship->head, 1, 1, 1 );

          if( ship->pos.x == 0 && ship->pos.y == 0 && ship->pos.z == 0 )
            {
              if ( ship->home )
                {
                  ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->home));
                  InitializeVector( &ship->pos );

                  if( ship->spaceobject )
                    {
                      CopyVector( &ship->pos, &ship->spaceobject->Position );
                    }

                  RandomizeVector( &ship->pos, -5000, 5000 );
                  ship->shipstate = SHIP_READY;
                  ship->autopilot = true;
                  ship->autorecharge = true;
                  ship->shield = ship->maxshield;
                }
            }

          ship->shipstate = SHIP_READY;
	  ship->docking = SHIP_READY;
          ship->autopilot = true;
          ship->autorecharge = true;
          ship->shield = ship->maxshield;
        }

      if ( ship->type != MOB_SHIP && (clan = GetClan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
	    {
	      clan->Spacecraft++;
	    }
          else
	    {
	      clan->Vehicles++;
	    }
        }

      ship->docking = SHIP_READY;
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

  ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->docked = NULL;

  if ( ship->sclass != SHIP_PLATFORM
       && ship->sclass != CAPITAL_SHIP
       && ship->type != MOB_SHIP )
    {
      ExtractShip( ship );
      ShipToRoom( ship , ship->shipyard );

      ship->location = ship->shipyard;
      ship->lastdoc = ship->shipyard;
      ship->shipstate = SHIP_LANDED;
    }

  if (ship->spaceobject)
    {
      ShipFromSpaceobject( ship, ship->spaceobject );
    }

  ship->currspeed = 0;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;
  ship->shield = 0;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->turret[turret_num];
      ResetTurret( turret );
    }

  ship->statet0 = LASER_READY;
  ship->missilestate = LASER_READY;

  ship->currjump=NULL;
  ship->target0=NULL;

  ship->hatchopen = false;
  ship->bayopen = false;

  ship->autorecharge = false;
  ship->autotrack = false;
  ship->autospeed = false;

#ifndef NODEATH
#ifndef NODEATHSHIP
  if ( StrCmp("Trainer", ship->owner) && StrCmp("Public",ship->owner) && ship->type != MOB_SHIP )
    {
      Clan *clan = NULL;

      if ( ship->type != MOB_SHIP && (clan = GetClan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->Spacecraft--;
          else
            clan->Vehicles--;
        }

      FreeMemory( ship->owner );
      ship->owner = CopyString( "" );
      FreeMemory( ship->pilot );
      ship->pilot = CopyString( "" );
      FreeMemory( ship->copilot );
      ship->copilot = CopyString( "" );
    }
#endif
#endif
  if (!(ship->home))
    {
      if ( ship->type == SHIP_REBEL || ( ship->type == MOB_SHIP && ((!StrCmp( ship->owner , "The Rebel Alliance" )) || (!StrCmp( ship->owner , "The New Republic" )))))
        {
          FreeMemory( ship->home );
          ship->home = CopyString( "Coruscant" );
        }
      else if ( ship->type == SHIP_IMPERIAL || ( ship->type == MOB_SHIP && !StrCmp(ship->owner, "the empire") ))
        {
          FreeMemory( ship->home );
	  ship->home = CopyString( "Byss" );
        }
      else if ( ship->type == SHIP_CIVILIAN)
        {
          FreeMemory( ship->home );
          ship->home = CopyString( "corporate" );
        }
    }

  SaveShip(ship);
}

void EchoToNearbyShips( int color, const Ship *ship, const char *argument,
			const Ship *ignore )
{
  const Ship *target = NULL;

  if (!ship->spaceobject)
    {
      return;
    }

  for ( target = first_ship; target; target = target->next )
    {
      if( !IsShipInCombatRange( ship, target ) )
        {
          continue;
        }

      if (target != ship && target != ignore
	  && GetShipDistanceToShip( ship, target ) < 100*(target->sensor+10)*((ship->sclass == SHIP_DEBRIS ? 2 : ship->sclass)+1))
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

  for ( ship = room->first_ship ; ship ; ship = ship->next_in_room )
    {
      if( ship->personalname && !StrCmp( name, ship->personalname ) )
        {
          return ship;
        }

      if ( !StrCmp( name, ship->name ) )
        {
          return ship;
        }
    }

  for ( ship = room->first_ship ; ship ; ship = ship->next_in_room )
    {
      if( ship->personalname && NiftyIsNamePrefix( name, ship->personalname ) )
        {
          return ship;
        }

      if ( NiftyIsNamePrefix( name, ship->name ) )
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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->personalname && !StrCmp( name, ship->personalname ) )
	{
	  return ship;
	}

      if ( !StrCmp( name, ship->name ) )
	{
	  return ship;
	}

      if( ship->personalname && NiftyIsNamePrefix( name, ship->personalname ) )
	{
	  return ship;
	}

      if ( NiftyIsNamePrefix( name, ship->name ) )
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

  for ( ship = first_ship ; ship; ship = ship->next )
    {
      if( !IsShipInCombatRange( eShip, ship ) )
	{
	  continue;
	}

      if( !ship->spaceobject )
	{
	  continue;
	}

      if( ship->personalname && !StrCmp( arg, ship->personalname ) )
        {
          count++;

          if( !number || count == number )
	    {
	      return ship;
	    }
        }

      if ( !StrCmp( arg, ship->name ) )
        {
          count++;

          if( !number || count == number )
	    {
	      return ship;
	    }
        }
    }

  count = 0;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( !IsShipInCombatRange( eShip, ship ) )
	{
	  continue;
	}

      if( ship->personalname && NiftyIsNamePrefix( arg, ship->personalname ) )
	{
	  count++;

	  if( !number || count == number )
	    {
	      return ship;
	    }
	}

      if ( NiftyIsNamePrefix( arg, ship->name ) )
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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.cockpit
	   || vnum == GetTurretRoom( ship->turret[0] )
	   || vnum == GetTurretRoom( ship->turret[1] )
	   || vnum == GetTurretRoom( ship->turret[2] )
	   || vnum == GetTurretRoom( ship->turret[3] )
	   || vnum == GetTurretRoom( ship->turret[4] )
	   || vnum == GetTurretRoom( ship->turret[5] )
	   || vnum == GetTurretRoom( ship->turret[6] )
	   || vnum == GetTurretRoom( ship->turret[7] )
	   || vnum == GetTurretRoom( ship->turret[8] )
	   || vnum == GetTurretRoom( ship->turret[9] )
           || vnum == ship->room.hanger
           || vnum == ship->room.pilotseat
           || vnum == ship->room.coseat
           || vnum == ship->room.navseat
           || vnum == ship->room.gunseat
           || vnum == ship->room.engine )
        {
          return ship;
        }
    }

  return NULL;
}

Ship *GetShipFromPilotSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.pilotseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromCoSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.coseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromNavSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.navseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromGunSeat( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.gunseat )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromEngine( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if (ship->room.engine)
        {
          if ( vnum == ship->room.engine )
	    {
	      return ship;
	    }
        }
      else
        {
          if ( vnum == ship->room.cockpit )
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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.gunseat
	   || vnum == GetTurretRoom( ship->turret[0] )
           || vnum == GetTurretRoom( ship->turret[1] )
           || vnum == GetTurretRoom( ship->turret[2] )
           || vnum == GetTurretRoom( ship->turret[3] )
           || vnum == GetTurretRoom( ship->turret[4] )
           || vnum == GetTurretRoom( ship->turret[5] )
           || vnum == GetTurretRoom( ship->turret[6] )
           || vnum == GetTurretRoom( ship->turret[7] )
           || vnum == GetTurretRoom( ship->turret[8] )
           || vnum == GetTurretRoom( ship->turret[9] ) )
        {
          return ship;
        }
    }

  return NULL;
}

Ship *GetShipFromEntrance( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.entrance )
	{
	  return ship;
	}
    }

  return NULL;
}

Ship *GetShipFromHangar( vnum_t vnum )
{
  Ship *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.hanger )
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
      ship->spaceobject = spaceobject;
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

  ship->spaceobject = NULL;
}

bool IsShipRental( const Character *ch, const Ship *ship )
{
  if ( !StrCmp("Public",ship->owner) )
    {
      return true;
    }

  if ( !StrCmp("Trainer",ship->owner) )
    {
      return true;
    }

  if ( ship->sclass == SHIP_TRAINER )
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

  if ( ship->docked )
    {
      count++;
    }

  for( dship = first_ship; dship; dship = dship->next )
    {
      if( dship->docked && dship->docked == ship )
	{
	  count++;
	}
    }

  if ( ship->dockingports && count >= ship->dockingports )
    {
      return false;
    }

  if ( ship->sclass < SHIP_PLATFORM )
    {
      ports = ship->sclass + 1;
    }

  if ( ship->sclass != SHIP_PLATFORM && count >= ports )
    {
      return false;
    }

  return true;
}

bool CheckPilot( const Character *ch, const Ship *ship )
{
  if ( !StrCmp(ch->name,ship->owner)
       || !StrCmp(ch->name,ship->pilot)
       || !StrCmp(ch->name,ship->copilot)
       || !StrCmp("Public",ship->owner)
       || !StrCmp("Trainer", ship->owner) )
    {
      return true;
    }

  if ( !IsNpc(ch) && ch->pcdata && ch->pcdata->ClanInfo.Clan )
    {
      if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Name,ship->owner) )
        {
          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Leader,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number1,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && IsName( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }

      if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Name,ship->pilot) )
        {
          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Leader,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number1,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && IsName( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }

      if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Name,ship->copilot) )
        {
          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Leader,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number1,ch->name) )
	    {
	      return true;
	    }

          if ( !StrCmp(ch->pcdata->ClanInfo.Clan->Leadership.Number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && IsName( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }
    }

  return false;
}

bool ExtractShip( Ship *ship )
{
  Room *room = ship->in_room;

  if ( room )
    {
      UNLINK( ship, room->first_ship, room->last_ship, next_in_room, prev_in_room );
      ship->in_room = NULL;
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

  if ( ship->shield > 0 )
    {
      shield_dmg = umin( ship->shield, dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;

      if ( ship->shield == 0 )
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
          ship->shipstate = SHIP_DISABLED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor && ship->missilestate != MISSILE_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->room.gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->missilestate = MISSILE_DAMAGED;
        }

      if ( GetRandomNumberFromRange(1, 100) <= 2*ionFactor && ship->statet0 != LASER_DAMAGED )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->room.gunseat) , "Lasers DAMAGED!" );
          ship->statet0 = LASER_DAMAGED;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  Turret *turret = ship->turret[turret_num];

	  if ( GetRandomNumberFromRange(1, 100) <= 5 * ionFactor && !IsTurretDamaged( turret ) )
	    {
	      EchoToRoom( AT_BLOOD + AT_BLINK, GetRoom( GetTurretRoom( turret ) ),
			    "Turret DAMAGED!" );
	      SetTurretDamaged( turret );
	    }
	}

      if ( GetRandomNumberFromRange(1, 100) <= 5*ionFactor && ship->statettractor != LASER_DAMAGED && ship->tractorbeam )
        {
          EchoToRoom( AT_BLOOD + AT_BLINK , GetRoom(ship->room.pilotseat) , "Tractorbeam DAMAGED!" );
          ship->statettractor = LASER_DAMAGED;
        }

      if ( ions == false )
	{
          ship->hull -= dmg * 5;
        }
    }

  if ( ship->hull <= 0 )
    {
      DestroyShip( ship , ch );

      if( ch )
	{
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      ship->name, ship->personalname, ch->name );

	  xp =  ( GetRequiredXpForLevel( GetAbilityLevel( ch, PILOTING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, PILOTING_ABILITY ) ) );
	  xp = umin( GetShipValue( ship ) , xp );
	  GainXP( ch, PILOTING_ABILITY, xp);
	  Echo( ch, "&WYou gain %ld piloting experience!\r\n", xp );
	}
      else
	{
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      ship->name, ship->personalname, (assaulter ? assaulter->personalname : "a collision" ) );
	}

      return;
    }

  if ( ship->hull <= ship->maxhull/20 )
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

  sprintf( buf , "%s explodes in a blinding flash of light!", ship->name );
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

  if ( !StrCmp("Trainer", ship->owner))
    {
      ResetShip(ship);
      return;
    }

  MakeDebris(ship);

  for ( roomnum = ship->room.first; roomnum <= ship->room.last; roomnum++ )
    {
      room = GetRoom(roomnum);

      if (room != NULL)
        {
          rch = room->first_person;

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

              rch = room->first_person;
            }

          for ( robj = room->first_content ; robj ; robj = robj->next_content )
            {
              SeparateOneObjectFromGroup( robj );
              ExtractObject( robj );
            }
        }

    }

  for ( lship = first_ship; lship; lship = lship->next )
    {
      if ( !(ship->room.hanger) || (lship->location != ship->room.hanger) )
	{
	  continue;
	}

      if ( lship->docked && lship->docked == ship )
        {
          lship->docked = NULL;
          ship->docking = SHIP_READY;
        }

      if ( killer )
        {
	  LogPrintf( "%s(%s) was just destroyed by %s.",
		      lship->name, lship->personalname, killer->name );
        }
      else
        {
	  LogPrintf( "%s(%s) was just destroyed by a mob ship.",
		      lship->name, lship->personalname );
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

  LINK( ship, shipto->first_ship, shipto->last_ship, next_in_room, prev_in_room );
  ship->in_room = shipto;
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

  if ( ch->gold < price )
    {
      Echo(ch, "&RRenting this ship costs %ld. You don't have enough credits!\r\n" , price );
      return false;
    }

  ch->gold -= price;
  Echo(ch, "&GYou pay %ld credits to rent the ship.\r\n" , price );
  return true;
}
