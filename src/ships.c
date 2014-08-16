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
#include "ships.h"
#include "mud.h"
#include "vector3_aux.h"
#include "character.h"
#include "turret.h"

SHIP_DATA *first_ship = NULL;
SHIP_DATA *last_ship = NULL;

static int baycount = 0;

static void fread_ship( SHIP_DATA *ship, FILE *fp );
static bool load_ship_file( const char *shipfile );
static void approachland( SHIP_DATA *ship, const char *arg );
static void landship( SHIP_DATA *ship, const char *arg );
static void launchship( SHIP_DATA *ship );
static void makedebris( SHIP_DATA *ship );
static bool space_in_range_h( const SHIP_DATA *ship, const SPACE_DATA *space);

static bool will_collide_with_sun( const SHIP_DATA *ship,
				   const SPACE_DATA *sun )
{
  if ( sun->name
       && str_cmp( sun->name, "" )
       && ship_distance_to_spaceobject( ship, sun ) < 10 )
    {
      return true;
    }

  return false;
}

static bool ship_has_state( const SHIP_DATA *ship, short state )
{
  return ship->shipstate == state;
}

bool ship_is_in_hyperspace( const SHIP_DATA *ship )
{
  return ship_has_state( ship, SHIP_HYPERSPACE );
}

bool ship_is_disabled( const SHIP_DATA *ship )
{
  return ship_has_state( ship, SHIP_DISABLED );
}

static void evade_collision_with_sun( SHIP_DATA *ship, const SPACE_DATA *sun )
{
  ship->head.x = 10 * ship->pos.x;
  ship->head.y = 10 * ship->pos.y;
  ship->head.z = 10 * ship->pos.z;
  ship->energy -= ship->currspeed/10;
  ship->currspeed = ship->realspeed;
  echo_to_room( AT_RED , get_room_index(ship->room.pilotseat),
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

void update_shipmovement( void )
{
  SHIP_DATA *ship = NULL;
  SPACE_DATA *spaceobj = NULL;
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
          move_ship( ship );
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
              ship_set_course_to_ship( ship->tractoredby, ship );

	      if( ship_distance_to_ship( ship, ship->tractoredby ) < 10 )
                {
                  vector_copy( &ship->tractoredby->pos, &ship->pos );
                }
            }

          /* Target is smaller and therefore pulled to target */
          if ( ship->tractoredby->sclass > ship->sclass )
            {
              ship->currspeed = ship->tractoredby->tractorbeam/4;
              ship_set_course_to_ship( ship, ship->tractoredby );

              if( ship_distance_to_ship( ship, ship->tractoredby ) < 10 )
                {
                  vector_copy( &ship->pos, &ship->tractoredby->pos );
                }
            }
        }

      if ( is_autoflying(ship) )
	{
	  continue;
	}

      for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
        {

          if ( spaceobj->type == SPACE_SUN
	       && will_collide_with_sun( ship, spaceobj ) )
            {
	      evade_collision_with_sun( ship, spaceobj );
            }

          if ( ship->currspeed > 0 )
            {
              if ( spaceobj->type >= SPACE_PLANET
                   && spaceobj->name && str_cmp(spaceobj->name,"")
                   && ship_distance_to_spaceobject( ship, spaceobj ) < 10 )
                {
                  sprintf( buf, "You begin orbitting %s.", spaceobj->name);
                  echo_to_cockpit( AT_YELLOW, ship, buf);
                  sprintf( buf, "%s begins orbiting %s.", ship->name, spaceobj->name);
                  echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );
                  ship->inorbitof = spaceobj;
                  ship->currspeed = 0;
                }

            }
        }
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship_is_in_hyperspace( ship ) )
        {
          Vector3 tmp;
          float dist = 0;
	  float origdist = 0;

          ship->hyperdistance -= ship->hyperspeed;

          dist = (float) ship->hyperdistance;
          origdist = (float) ship->orighyperdistance;

	  if ( dist == 0)
            dist = -1;

          vector_set( &tmp,
                      ship->pos.x - ship->jump.x,
                      ship->pos.y - ship->jump.y,
                      ship->pos.z - ship->jump.z );
          vector_set( &ship->hyperpos,
                      ship->pos.x - ( tmp.x * ( dist / origdist ) ),
                      ship->pos.y - ( tmp.y * ( dist / origdist ) ),
                      ship->pos.z - ( tmp.z * ( dist / origdist ) ) );

          ship->count++;

          for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
	    {
	      if( space_in_range_h( ship, spaceobj ) )
		{
		  int dmg = 0;

		  echo_to_room( AT_YELLOW, get_room_index(ship->room.pilotseat),
				"Hyperjump complete." );
		  echo_to_ship( AT_YELLOW, ship,
				"The ship slams to a halt as it comes out of hyperspace." );
		  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
		  dmg = 15 * number_range( 1, 4 );
		  ship->hull -= dmg;
		  echo_to_ship( AT_YELLOW, ship,
				"The hull cracks from the pressure." );
		  vector_copy( &ship->pos, &ship->hyperpos );
		  ship_to_spaceobject( ship, ship->currjump );
		  ship->currjump = NULL;
		  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
		  ship->shipstate = SHIP_READY;
		  STRFREE( ship->home );
		  ship->home = STRALLOC( ship->spaceobject->name );
		}
	    }

          if ( ship_is_in_hyperspace( ship )
              && ship->hyperdistance <= 0
              && !ship->tracking)
            {
              ship->count = 0;
              ship_to_spaceobject (ship, ship->currjump);

              if (ship->spaceobject == NULL)
                {
                  echo_to_cockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {
                  echo_to_room( AT_YELLOW, get_room_index(ship->room.pilotseat), "Hyperjump complete.");
                  echo_to_ship( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
                           ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
                  vector_copy( &ship->hyperpos, &ship->pos );
                  ship_to_spaceobject( ship, ship->currjump );
                  ship->currjump = NULL;
                  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  STRFREE( ship->home );
                  ship->home = STRALLOC( ship->spaceobject->name );
                }
            }
          else if ( ( ship->count >= (ship->tcount ? ship->tcount : 10 ) )
		    && ship_is_in_hyperspace( ship )
		    && ship->tracking == true )
            {
              ship_to_spaceobject (ship, ship->currjump);

              if (ship->spaceobject == NULL)
		{
                  echo_to_cockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {

                  echo_to_room( AT_YELLOW, get_room_index(ship->room.pilotseat), "Hyperjump complete.");
                  echo_to_ship( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
			   ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
                  vector_copy( &ship->pos, &ship->hyperpos );
                  ship_to_spaceobject( ship, ship->currjump );
                  ship->currjump = NULL;
                  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  STRFREE( ship->home );
                  ship->home = STRALLOC( ship->spaceobject->name );

                  vector_set( &ship->jump,
                              ship->pos.x + ship->trackvector.x,
                              ship->pos.y + ship->trackvector.y,
                              ship->pos.z + ship->trackvector.z );

                  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
		    {
		      if( space_in_range( ship, spaceobj ) )
			{
			  ship->currjump = spaceobj;
			  break;
			}
		    }

                  if( !spaceobj )
		    {
		      ship->currjump = ship->spaceobject;
		    }

                  ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 50;
                  ship->orighyperdistance = ship->hyperdistance;
                  ship->count = 0;
                  do_radar( ship->ch, "" );
                }
            }
	  else if ( ship->count >= 10 && ship_is_in_hyperspace( ship ) )
            {
              ship->count = 0;
              sprintf( buf, "%d", ship->hyperdistance );
              echo_to_room_dnr( AT_YELLOW , get_room_index(ship->room.pilotseat), "Remaining jump distance: " );
              echo_to_room( AT_WHITE , get_room_index(ship->room.pilotseat), buf );
            }

	  if( ship_is_in_hyperspace( ship ) )
	    {
	      if( ship->count % 2
		  && ship->hyperdistance < 10 * ship->hyperspeed
		  && ship->hyperdistance > 0 )
		{
		  sprintf( buf,"An alarm sounds. Your hyperjump is ending: %d",
			   ship->hyperdistance );
		  echo_to_ship( AT_RED , ship,  buf );
		}
	    }
        }

      if( ship->docked )
        {
          SHIP_DATA *docked = ship->docked;
          vector_copy( &ship->pos, &docked->pos );
          vector_copy( &ship->hyperpos, &docked->hyperpos );
          vector_copy( &ship->originpos, &docked->originpos );
          vector_copy( &ship->jump, &docked->jump );
          vector_copy( &ship->head, &docked->head );

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

static void landship( SHIP_DATA *ship, const char *arg )
{
  SHIP_DATA *target = NULL;
  char buf[MAX_STRING_LENGTH];
  vnum_t destination = INVALID_VNUM;
  Character *ch = NULL;

  if ( !str_prefix(arg,ship->spaceobject->landing_site.locationa) )
    {
      destination = ship->spaceobject->landing_site.doca;
    }

  if ( !str_prefix(arg,ship->spaceobject->landing_site.locationb) )
    {
      destination = ship->spaceobject->landing_site.docb;
    }

  if ( !str_prefix(arg,ship->spaceobject->landing_site.locationc) )
    {
      destination = ship->spaceobject->landing_site.docc;
    }

  target = get_ship_here( arg , ship );

  if ( target != ship && target != NULL && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    {
      destination = target->room.hanger;
    }

  if ( !ship_to_room( ship, destination ) )
    {
      echo_to_room( AT_YELLOW, get_room_index(ship->room.pilotseat), "Could not complete approach. Landing aborted.");
      echo_to_ship( AT_YELLOW, ship , "The ship pulls back up out of its landing sequence.");

      if ( !ship_is_disabled( ship ))
	{
	  ship->shipstate = SHIP_READY;
	}

      return;
    }

  echo_to_room( AT_YELLOW , get_room_index(ship->room.pilotseat), "Landing sequence complete.");
  echo_to_ship( AT_YELLOW , ship , "You feel a slight thud as the ship sets down on the ground.");
  sprintf( buf ,"%s disapears from your scanner." , ship->name  );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );

  if( ship->ch && ship->ch->desc )
    {
      long xp = 0;

      ch = ship->ch;
      xp =  (exp_level( GetAbilityLevel(ch, PILOTING_ABILITY ) + 1) - exp_level( GetAbilityLevel(ch, PILOTING_ABILITY)));
      xp = UMIN( get_ship_value( ship ) , xp );
      gain_exp( ch, PILOTING_ABILITY, xp );
      ch_printf( ch, "&WYou gain %ld points of flight experience!\r\n",
		 UMIN( get_ship_value( ship ) , xp ) );
      ship->ch = NULL;
    }

  ship->location = destination;
  ship->lastdoc = ship->location;

  if (!ship_is_disabled( ship ))
    {
      ship->shipstate = SHIP_LANDED;
    }

  ship_from_spaceobject(ship, ship->spaceobject);

  if (ship->tractored)
    {
      if (ship->tractored->tractoredby == ship)
	{
	  ship->tractored->tractoredby = NULL;
	}

      ship->tractored = NULL;
    }

  sprintf( buf, "%s lands on the platform.", ship->name );
  echo_to_room( AT_YELLOW, get_room_index(ship->location), buf );

  ship->energy = ship->energy - 25 - 25*ship->sclass;

  if ( !str_cmp("Public",ship->owner)
       || !str_cmp("trainer",ship->owner)
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
	  TURRET_DATA *turret = ship->turret[turret_num];
	  reset_turret( turret );
	}

      ship->shipstate = SHIP_LANDED;

      echo_to_cockpit( AT_YELLOW , ship , "Repairing and refueling ship..." );
    }

  save_ship(ship);
}

static void approachland( SHIP_DATA *ship, const char *arg)
{
  SPACE_DATA *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  bool found = false;
  SHIP_DATA *target = NULL;

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if( space_in_range( ship, spaceobj ) )
	{
	  if ( !str_prefix(arg,spaceobj->landing_site.locationa) ||
	       !str_prefix(arg,spaceobj->landing_site.locationb) ||
	       !str_prefix(arg,spaceobj->landing_site.locationc))
	    {
	      found = true;
	      break;
	    }
	}
    }

  if( found )
    {
      if ( !str_prefix(arg, spaceobj->landing_site.locationa) )
	{
	  strcpy( buf2, spaceobj->landing_site.locationa);
	}
      else if ( !str_prefix(arg, spaceobj->landing_site.locationb) )
	{
	  strcpy( buf2, spaceobj->landing_site.locationb);
	}
      else if ( !str_prefix(arg, spaceobj->landing_site.locationc) )
	{
	  strcpy( buf2, spaceobj->landing_site.locationc);
	}
    }

  target = get_ship_here( arg, ship );

  if ( target && target != ship && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    {
      strcpy( buf2, target->name);
    }

  if ( !found && !target )
    {
      echo_to_room( AT_YELLOW , get_room_index(ship->room.pilotseat), "ERROR");
      return;
    }

  sprintf( buf, "Approaching %s.", buf2 );
  echo_to_room( AT_YELLOW , get_room_index(ship->room.pilotseat), buf);
  sprintf( buf, "%s begins its approach to %s.", ship->name, buf2 );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

static void launchship( SHIP_DATA *ship )
{
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *target = NULL;
  int plusminus = 0;

  ship_to_spaceobject( ship, spaceobject_from_vnum( ship->location ) );

  if ( !ship->spaceobject )
    {
      echo_to_room( AT_YELLOW , get_room_index(ship->room.pilotseat) , "Launch path blocked... Launch aborted.");
      echo_to_ship( AT_YELLOW , ship , "The ship slowly sets back back down on the landing pad.");
      sprintf( buf ,  "%s slowly sets back down." ,ship->name );
      echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
      ship->shipstate = SHIP_LANDED;
      return;
    }

  extract_ship(ship);

  ship->location = INVALID_VNUM;

  if (!ship_is_disabled( ship ))
    {
      ship->shipstate = SHIP_READY;
    }

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.x = 1;
    }
  else
    {
      ship->head.x = -1;
    }

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.y = 1;
    }
  else
    {
      ship->head.y = -1;
    }

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    {
      ship->head.z = 1;
    }
  else
    {
      ship->head.z = -1;
    }

  if (ship->spaceobject
      && ( ship->lastdoc == ship->spaceobject->landing_site.doca
	   || ship->lastdoc == ship->spaceobject->landing_site.docb
	   || ship->lastdoc == ship->spaceobject->landing_site.docc ) )
    {
      vector_copy( &ship->pos, &ship->spaceobject->pos );
    }
  else
    {
      for ( target = first_ship; target; target = target->next )
        {
          if (ship->lastdoc == target->room.hanger)
            {
              vector_copy( &ship->pos, &target->pos );
            }
        }
    }

  ship->energy -= (100+100*ship->sclass);

  ship->pos.x += (ship->head.x * ship->currspeed * 2);
  ship->pos.y += (ship->head.y * ship->currspeed * 2);
  ship->pos.z += (ship->head.z * ship->currspeed * 2);

  echo_to_room( AT_GREEN , get_room_index(ship->location) , "Launch complete.\r\n");
  echo_to_ship( AT_YELLOW , ship , "The ship leaves the platform far behind as it flies into space." );
  sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
	   ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
  sprintf( buf, "%s lifts off into space.", ship->name );
  echo_to_room( AT_YELLOW , get_room_index(ship->lastdoc) , buf );
}

static void makedebris( SHIP_DATA *ship )
{
  SHIP_DATA *debris = NULL;
  char buf[MAX_STRING_LENGTH];
  int turret_num = 0;

  if ( ship->sclass == SHIP_DEBRIS )
    {
      return;
    }

  CREATE( debris, SHIP_DATA, 1 );

  LINK( debris, first_ship, last_ship, next, prev );

  debris->owner       = STRALLOC( "" );
  debris->copilot     = STRALLOC( "" );
  debris->pilot       = STRALLOC( "" );
  debris->home        = STRALLOC( "" );
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
      debris->turret[turret_num] = copy_turret( ship->turret[turret_num], debris );
    }

  strcpy( buf, "Debris of a " );
  strcat( buf, ship->name );
  debris->name          = STRALLOC( "Debris" );
  debris->personalname  = STRALLOC( "Debris" );
  debris->description   = STRALLOC( buf );

  ship_to_spaceobject( debris, ship->spaceobject );
  vector_copy( &debris->pos, &ship->pos );
  vector_copy( &debris->head, &ship->head );
}

void dockship( Character *ch, SHIP_DATA *ship )
{
  if ( ship->statetdocking == SHIP_DISABLED )
    {
      echo_to_ship( AT_YELLOW , ship , "Maneuver Aborted. Docking clamps damaged.");
      echo_to_ship( AT_YELLOW , ship->docked, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }

  if ( ship->docked->statetdocking == SHIP_DISABLED )
    {
      echo_to_ship( AT_YELLOW , ship->docked , "Maneuver Aborted. Docking clamps damaged.");
      echo_to_ship( AT_YELLOW , ship, "The ship aborted the docking manuever.");
      ship->docking = SHIP_READY;
      ship->docked = NULL;
      return;
    }

  echo_to_ship( AT_YELLOW , ship , "The ship finishing its docking manuevers.");
  echo_to_ship( AT_YELLOW , ship->docked, "The ship finishes its docking manuevers.");

  ship->docking = SHIP_DOCKED;
  ship->currspeed = 0;
  vector_copy( &ship->pos, &ship->docked->pos );

  if( ch )
    {
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_success( ch, gsn_starfighters );
          learn_from_success( ch, gsn_shipdocking);
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_success( ch, gsn_midships );
          learn_from_success( ch, gsn_shipdocking);
        }

      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_success( ch, gsn_capitalships );
          learn_from_success( ch, gsn_shipdocking);
        }
    }
}

void transship(SHIP_DATA *ship, vnum_t destination)
{
  vnum_t origShipyard = INVALID_VNUM;

  if ( !ship )
    {
      return;
    }

  origShipyard = ship->shipyard;

  ship->shipyard = destination;
  ship->shipstate = SHIP_READY;

  extract_ship( ship );
  ship_to_room( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    {
      ship_from_spaceobject( ship, ship->spaceobject );
    }

  save_ship(ship);
}

void target_ship( SHIP_DATA *ship, SHIP_DATA *target )
{
  char buf[MAX_STRING_LENGTH];

  ship->target0 = target;
  sprintf( buf , "You are being targetted by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );
  sprintf( buf , "The ship targets %s." , target->name);
  echo_to_cockpit( AT_BLOOD , ship , buf );
}

bool check_hostile( SHIP_DATA *ship )
{
  long distance = -1;
  long tempdistance = 0;
  SHIP_DATA *target = NULL;
  SHIP_DATA *enemy = NULL;

  if ( !is_autoflying(ship) || ship->sclass == SHIP_DEBRIS )
    return false;

  for( target = first_ship; target; target = target->next )
    {
      if( !ship_in_range( ship, target ) )
        continue;

      if ( !str_cmp( ship->owner, "The Empire" ) )
        {
          if ( !str_cmp( target->owner , "The Rebel Alliance" )
	       || !str_cmp( target->owner , "The New Republic"))
            {
              tempdistance = ship_distance_to_ship( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!str_cmp( ship->owner, "The Rebel Alliance" ))
	   || (!str_cmp( ship->owner , "The New Republic" )))
        {
          if ( !str_cmp( target->owner, "The Empire" ) )
            {
              tempdistance = ship_distance_to_ship( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( !str_cmp( ship->owner , "Pirates" ) )
        {
          if ( str_cmp(target->owner, "Pirates") )
            {
              tempdistance = ship_distance_to_ship( ship, target );

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
      target_ship( ship, enemy );
      return true;
    }

  return false;
}

ch_ret drive_ship( Character *ch, SHIP_DATA *ship, Exit *pexit, int fall )
{
  ROOM_INDEX_DATA *in_room = NULL;
  ROOM_INDEX_DATA *to_room = NULL;
  ROOM_INDEX_DATA *original = NULL;
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
      if ( is_drunk( ch ) && ( ch->position != POS_SHOVE )
	   && ( ch->position != POS_DRAG ) )
	{
	  drunk = true;
	}
    }

  if ( drunk && !fall )
    {
      door = number_door();
      pexit = get_exit( get_room_index(ship->location), door );
    }

  in_room = get_room_index(ship->location);

  if ( !pexit || (to_room = pexit->to_room) == NULL )
    {
      if ( drunk )
	{
	  send_to_char( "You drive into a wall in your drunken state.\r\n", ch );
	}
      else
	{
	  send_to_char( "Alas, you cannot go that way.\r\n", ch );
	}

      return rNONE;
    }

  door = pexit->vdir;

  if ( IS_SET( pexit->exit_info, EX_WINDOW )
       && !IS_SET( pexit->exit_info, EX_ISDOOR ) )
    {
      send_to_char( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_PORTAL)
       && IsNpc(ch) )
    {
      act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_NOMOB)
       && IsNpc(ch) )
    {
      act( AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_CLOSED)
       && (IS_SET(pexit->exit_info, EX_NOPASSDOOR)) )
    {
      if ( !IS_SET( pexit->exit_info, EX_SECRET )
           &&   !IS_SET( pexit->exit_info, EX_DIG ) )
        {
          if ( drunk )
            {
              act( AT_PLAIN, "$n drives into the $d in $s drunken state.",
		   ch, NULL, pexit->keyword, TO_ROOM );
	      act( AT_PLAIN, "You drive into the $d in your drunken state.",
		   ch, NULL, pexit->keyword, TO_CHAR );
            }
          else
	    {
	      act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
	    }
        }
      else
        {
          if ( drunk )
	    {
	      send_to_char( "You hit a wall in your drunken state.\r\n", ch );
	    }
          else
	    {
	      send_to_char( "Alas, you cannot go that way.\r\n", ch );
	    }
        }

      return rNONE;
    }

  if ( room_is_private( ch, to_room ) )
    {
      send_to_char( "That room is private right now.\r\n", ch );
      return rNONE;
    }

  if ( !IsImmortal(ch)
       && !IsNpc(ch)
       && ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_hard_range )
        {
          set_char_color( AT_TELL, ch );

          switch( to_room->area->low_hard_range - ch->top_level )
            {
            case 1:
              send_to_char( "A voice in your mind says, 'You are nearly ready to go that way...'", ch );
              break;

            case 2:
              send_to_char( "A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'", ch );
              break;

            case 3:
              send_to_char( "A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n", ch);
              break;

	    default:
              send_to_char( "A voice in your mind says, 'You are not ready to go down that path.'.\r\n", ch);
            }

          return rNONE;
        }
      else if ( ch->top_level > to_room->area->hi_hard_range )
	{
	  set_char_color( AT_TELL, ch );
	  send_to_char( "A voice in your mind says, 'There is nothing more for you down that path.'", ch );
	  return rNONE;
	}
    }

  if ( !fall )
    {
      if ( IS_SET( to_room->room_flags, ROOM_INDOORS )
           || IS_SET( to_room->room_flags, ROOM_SPACECRAFT )
           || to_room->sector_type == SECT_INSIDE )
        {
          send_to_char( "You can't drive indoors!\r\n", ch );
          return rNONE;
        }

      if ( IS_SET( to_room->room_flags, ROOM_NO_DRIVING ) )
        {
          send_to_char( "You can't take a vehicle through there!\r\n", ch );
          return rNONE;
        }

      if ( in_room->sector_type == SECT_AIR
           || to_room->sector_type == SECT_AIR
           || IS_SET( pexit->exit_info, EX_FLY ) )
        {
          if ( ship->sclass > CLOUD_CAR )
            {
              send_to_char( "You'd need to fly to go there.\r\n", ch );
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
              send_to_char( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }

        }

      if ( IS_SET( pexit->exit_info, EX_CLIMB ) )
        {
          if ( ship->sclass < CLOUD_CAR )
            {
              send_to_char( "You need to fly or climb to get up there.\r\n", ch );
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
	      send_to_char( "There is no room for you in there.\r\n", ch );
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

  if ( number_percent() > the_chance )
    {
      send_to_char("&RYou can't figure out which switch it is.\r\n",ch);
      learn_from_failure( ch, gsn_speeders );
      return retcode;
    }

  sprintf( buf, "$n %ss the vehicle $T.", txt );
  act( AT_ACTION, buf, ch, NULL, get_dir_name(door), TO_ROOM );
  sprintf( buf, "You %s the vehicle $T.", txt );
  act( AT_ACTION, buf, ch, NULL, get_dir_name(door), TO_CHAR );
  sprintf( buf, "%s %ss %s.", ship->name, txt, get_dir_name(door) );
  echo_to_room( AT_ACTION , get_room_index(ship->location) , buf );

  extract_ship( ship );
  ship_to_room(ship, to_room->vnum );

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
  echo_to_room( AT_ACTION , get_room_index(ship->location) , buf );

  for ( rch = ch->in_room->last_person ; rch ; rch = next_rch )
    {
      next_rch = rch->prev_in_room;
      original = rch->in_room;
      char_from_room( rch );
      char_to_room( rch, to_room );
      do_look( rch, "auto" );
      char_from_room( rch );
      char_to_room( rch, original );
    }

  learn_from_success( ch, gsn_speeders );
  return retcode;
}

void echo_to_ship( int color, SHIP_DATA *ship, const char *argument )
{
  vnum_t room = INVALID_VNUM;

  for ( room = ship->room.first ; room <= ship->room.last ;room++ )
    {
      echo_to_room( color, get_room_index(room), argument );
    }
}

bool is_autoflying( const SHIP_DATA *ship )
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

void recharge_ships( void )
{
  SHIP_DATA *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  bool closeem = false;
  int origthe_chance = 100;

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
	  TURRET_DATA *turret = ship->turret[turret_num];
	  ship->energy -= get_energy_draw( turret );
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
	      echo_to_room( AT_YELLOW, get_room_index(ship->room.gunseat),
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

      if ( is_autoflying(ship) )
        {
          if ( ship->spaceobject && ship->sclass != SHIP_DEBRIS )
            {
              if (ship->target0 && ship->statet0 != LASER_DAMAGED )
                {
                  int the_chance = 75;
                  SHIP_DATA *target = ship->target0;
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
                      if ( !ship_is_in_hyperspace( ship )
                          && ship->energy > 25
                          && ship_in_range( ship, target )
                          && ship_distance_to_ship( target, ship ) <= 1000 )
                        {
                          if ( ship->sclass > MIDSIZE_SHIP || ship_is_facing_ship( ship , target ) )
                            {
                              the_chance += target->sclass - ship->sclass;
                              the_chance += ship->currspeed - target->currspeed;
                              the_chance += ship->manuever - target->manuever;
                              the_chance -= ship_distance_to_ship( ship, target ) / ( 10 * ( target->sclass + 1 ) );
                              the_chance -= origthe_chance;
                              the_chance /= 2;
                              the_chance += origthe_chance;
                              the_chance = URANGE( 1 , the_chance , 99 );

                              if ( number_percent( ) > the_chance )
                                {
                                  sprintf( buf , "%s fires at you but misses." , ship->name);
                                  echo_to_cockpit( AT_ORANGE , target , buf );
                                  sprintf( buf, "Weaponsfire from %s barely misses %s." , ship->name , target->name );
                                  echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                }
                              else
                                {
                                  if( whichguns == 0 )
                                    {
                                      sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
                                      echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are hit by lasers from %s!" , ship->name);
                                      echo_to_cockpit( AT_BLOOD , target , buf );
                                      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->sclass == SHIP_PLATFORM )
					{
					  damage_ship( target, ship, 100, 250 );
					}
                                      else if( ship->sclass == CAPITAL_SHIP
					       && target->sclass != CAPITAL_SHIP )
					{
					  damage_ship( target, ship, 50, 200 );
					}
                                      else
					{
					  damage_ship( target, ship , 5 , 10 );
					}
                                    }
                                  else if( whichguns == 1 )
                                    {
                                      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->name, target->name );
                                      echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->name);
                                      echo_to_cockpit( AT_BLOOD , target , buf );
                                      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->sclass == SHIP_PLATFORM )
					{
					  damage_ship( target, ship, -250, -100 );
					}
                                      else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
					{
					  damage_ship( target, ship, -200, -50 );
					}
                                      else
					{
					  damage_ship( target, ship , -10, -5 );
					}
                                    }
                                  else if( whichguns == 2 )
                                    {
                                      if( shots < ship->lasers )
                                        {
                                          sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
                                          echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by lasers from %s!" , ship->name);
                                          echo_to_cockpit( AT_BLOOD , target , buf );
                                          echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->sclass == SHIP_PLATFORM )
					    {
					      damage_ship( target, ship, 100, 250 );
					    }
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
					    {
					      damage_ship( target, ship, 50, 200 );
					    }
                                          else
					    {
					      damage_ship( target, ship , 5 , 10 );
					    }
                                        }
                                      else
                                        {
                                          sprintf( buf, "Ion energy from %s hits %s." , ship->name, target->name );
                                          echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by an ion cannon from %s!" , ship->name);
                                          echo_to_cockpit( AT_BLOOD , target , buf );
                                          echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->sclass == SHIP_PLATFORM )
					    {
					      damage_ship( target, ship, -250, -100 );
					    }
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
					    {
					      damage_ship( target, ship, -200, -50 );
					    }
                                          else
					    {
					      damage_ship( target, ship , -10, -5 );
					    }
					}
                                    }
                                }

                              ship->statet0++;

                              if ( is_autoflying(target) && !target->target0)
                                {
                                  sprintf( buf , "You are being targetted by %s." , target->name);
                                  echo_to_cockpit( AT_BLOOD , ship , buf );
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

void update_ships( void )
{
  SHIP_DATA *ship = NULL;
  SHIP_DATA *target = NULL;
  char buf[MAX_STRING_LENGTH];
  int too_close = 0, target_too_close = 0;
  SPACE_DATA *spaceobj = NULL;
  int recharge = 0;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      int turret_num = 0;

      if ( ship->spaceobject
	   && ship->energy > 0
	   && ship_is_disabled( ship )
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
          echo_to_room( AT_YELLOW, get_room_index(ship->room.pilotseat), "Manuever complete.");
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
	  landship( ship , ship->dest );
	}

      if (ship->shipstate == SHIP_LAND)
        {
          approachland( ship, ship->dest );
          ship->shipstate = SHIP_LAND_2;
        }

      if (ship->shipstate == SHIP_LAUNCH_2)
	{
	  launchship( ship );
	}

      if (ship->shipstate == SHIP_LAUNCH)
	{
	  ship->shipstate = SHIP_LAUNCH_2;
	}

      if (ship->docking == SHIP_DOCK_2)
	{
	  dockship( ship->ch , ship );
	}

      if (ship->docking == SHIP_DOCK)
	{
	  ship->docking = SHIP_DOCK_2;
	}

      ship->shield = UMAX( 0 , ship->shield-1-ship->sclass);

      if (ship->autorecharge
	  && ship->maxshield > ship->shield
	  && ship->energy > 100)
        {
          recharge = UMIN( ship->maxshield-ship->shield, 10 + ship->sclass*10 );
          recharge = UMIN( recharge , ship->energy/2 -100 );
	  recharge = UMAX( 1, recharge );
          ship->shield += recharge;
          ship->energy -= recharge;
        }

      if ( is_autoflying(ship)
	   && ( ship->energy >= ( ( 25 + ((int)ship->sclass) * 25 ) * ( 2 + ((int)ship->sclass) ) ) )
           && ( ( ship->maxshield - ship->shield ) >= ( 25 + ((int)ship->sclass) * 25 ) ) )
        {
          recharge = 25+ship->sclass*25;
          recharge = UMIN(  ship->maxshield-ship->shield , recharge );
          ship->shield += recharge;
          ship->energy -= ( recharge*2 + recharge * ship->sclass );
        }

      if (ship->shield > 0)
        {
          if (ship->energy < 200)
            {
              ship->shield = 0;
              echo_to_cockpit( AT_RED, ship,"The ships shields fizzle and die.");
              ship->autorecharge = false;
            }
        }

      if ( ship->spaceobject && ship->currspeed > 0 )
        {
          sprintf( buf, "%d", ship->currspeed );
          echo_to_room_dnr( AT_BLUE , get_room_index(ship->room.pilotseat),  "Speed: " );
          echo_to_room_dnr( AT_LBLUE , get_room_index(ship->room.pilotseat),  buf );
          sprintf( buf, "%.0f %.0f %.0f", ship->pos.x , ship->pos.y, ship->pos.z );
          echo_to_room_dnr( AT_BLUE , get_room_index(ship->room.pilotseat),  "  Coords: " );
          echo_to_room( AT_LBLUE , get_room_index(ship->room.pilotseat),  buf );

          if ( ship->room.pilotseat != ship->room.coseat )
            {
              sprintf( buf, "%d", ship->currspeed );
              echo_to_room_dnr( AT_BLUE , get_room_index(ship->room.coseat),  "Speed: " );
              echo_to_room_dnr( AT_LBLUE , get_room_index(ship->room.coseat),  buf );
              sprintf( buf, "%.0f %.0f %.0f", ship->pos.x , ship->pos.y, ship->pos.z );
              echo_to_room_dnr( AT_BLUE , get_room_index(ship->room.coseat),  "  Coords: " );
              echo_to_room( AT_LBLUE , get_room_index(ship->room.coseat),  buf );
	    }
        }

      if ( ship->spaceobject )
        {
          too_close = ship->currspeed + 50;
          too_close = ship->currspeed + 50;

          for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
	    {
	      if( spaceobj->name &&  str_cmp(spaceobj->name,"")
		  && ship_distance_to_spaceobject( ship, spaceobj ) < too_close )
		{
		  sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f", spaceobj->name,
			   spaceobj->pos.x, spaceobj->pos.y, spaceobj->pos.z);
		  echo_to_room( AT_RED , get_room_index(ship->room.pilotseat),  buf );
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
                      && ship_distance_to_ship( ship, target ) < target_too_close
                      && ship->docked != target && target->docked != ship )
                    {
                      sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f",
                               target->name,
                               target->pos.x - ship->pos.x,
                               target->pos.y - ship->pos.y,
                               target->pos.z - ship->pos.z );
                      echo_to_room( AT_RED, get_room_index(ship->room.pilotseat),
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
          echo_to_room_dnr( AT_BLUE, get_room_index(ship->room.gunseat),"Target: ");
          echo_to_room( AT_LBLUE , get_room_index(ship->room.gunseat),  buf );

          if (!ship_in_range( ship, ship->target0 ) )
            {
              echo_to_room( AT_LBLUE , get_room_index(ship->room.gunseat),  "Your target seems to have left.");
              ship->target0 = NULL;
            }
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  TURRET_DATA *turret = ship->turret[turret_num];

	  if ( turret_has_target( turret ) && ship->sclass <= SHIP_PLATFORM)
	    {
	      const  SHIP_DATA *turret_target = get_turret_target( turret );

	      sprintf( buf, "%s   %.0f %.0f %.0f", turret_target->name,
		       turret_target->pos.x, turret_target->pos.y,
		       turret_target->pos.z );
	      echo_to_room_dnr( AT_BLUE , get_room_index(get_turret_room( turret ) ), "Target: " );
	      echo_to_room( AT_LBLUE , get_room_index(get_turret_room( turret ) ),  buf );

	      if (!ship_in_range( ship, turret_target ) )
		{
		  clear_turret_target( turret );
		}
	    }
	}

      if (ship->energy < 100 && ship->spaceobject )
        {
          echo_to_cockpit( AT_RED , ship,  "Warning: Ship fuel low." );
	}

      ship->energy = URANGE( 0 , ship->energy, ship->maxenergy );
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->target0 && is_autoflying(ship) )
	{
	  if( !ship_in_range( ship->target0, ship ) )
	    {
	      echo_to_room( AT_BLUE , get_room_index(ship->room.pilotseat), "Target left, returning to NORMAL condition.\r\n" );
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
               && ship_distance_to_ship( ship, target ) < target_too_close )
            {
              ship_set_course_to_ship( ship, ship->target0 );
              ship_turn_180( ship );
              ship->energy -= ship->currspeed/10;
              echo_to_room( AT_RED , get_room_index(ship->room.pilotseat), "Autotrack: Evading to avoid collision!\r\n" );

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
          else if ( !ship_is_facing_ship(ship, ship->target0)
                    && ship->docked == NULL && ship->shipstate != SHIP_DOCKED )
            {
              ship_set_course_to_ship( ship, ship->target0 );
              ship->energy -= ship->currspeed / 10;
              echo_to_room( AT_BLUE , get_room_index(ship->room.pilotseat), "Autotracking target... setting new course.\r\n" );

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

      if ( is_autoflying(ship) && ship->sclass != SHIP_DEBRIS )
        {
          if ( ship->spaceobject )
            {
              check_hostile( ship );

              if (ship->target0 )
                {
                  int the_chance = 50;
                  int projectiles = -1;

                  if ( !ship->target0->target0 && is_autoflying(ship->target0))
		    {
		      ship->target0->target0 = ship;
		    }

                  /* auto assist ships */

                  for ( target = first_ship; target; target = target->next)
                    {
                      if( ship_in_range( ship, target ) )
			{
			  if ( is_autoflying(target)
			       && target->docked == NULL
			       && target->shipstate != SHIP_DOCKED )
			    {
			      if ( !str_cmp ( target->owner , ship->owner ) && target != ship )
				{
				  if ( target->target0 == NULL && ship->target0 != target )
				    {
				      target->target0 = ship->target0;
				      sprintf( buf, "You are being targetted by %s.",
					       target->name);
				      echo_to_cockpit( AT_BLOOD , target->target0 , buf );
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

                  if ( !ship_is_in_hyperspace( ship )
		      && ship->energy > 25
                      && ship->missilestate == MISSILE_READY
                      && ship_in_range( ship, target )
                      && ship_distance_to_ship( target, ship ) <= 1200 )
                    {
                      if ( ship->sclass > MIDSIZE_SHIP || ship_is_facing_ship( ship , target ) )
                        {
                          the_chance -= target->manuever/5;
                          the_chance -= target->currspeed/20;
                          the_chance += target->sclass*target->sclass*25;
                          the_chance -= ( ship_distance_to_ship( ship, target ) * 3 ) / 100;
                          the_chance += 30;
                          the_chance = URANGE( 10 , the_chance , 90 );

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

                          if ( number_percent() > the_chance || projectiles == -1 )
                            {

                            }
                          else
                            {
                              new_missile( ship , target , NULL , projectiles );

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
                              echo_to_cockpit( AT_BLOOD , target , buf );
                              sprintf( buf, "%s fires a projectile towards %s.",
				       ship->name, target->name );
                              echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );

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

                  if( ship_is_disabled( ship ) )
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
              if ( number_range(1, 25) == 25 )
                {
                  ship_to_spaceobject(ship, spaceobject_from_name(ship->home));
                  vector_init( &ship->pos );
                  vector_set( &ship->head, 1, 1, 1 );

                  if( ship->spaceobject )
                    {
                      vector_copy( &ship->pos, &ship->spaceobject->pos );
                    }

                  vector_randomize( &ship->pos, -5000, 5000 );
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

      save_ship( ship );
    }
}

void echo_to_docked( int color, SHIP_DATA *ship, const char *argument )
{
  SHIP_DATA *dship = NULL;

  for( dship = first_ship; dship; dship = dship->next )
    {
      if( dship->docked && dship->docked == ship)
	{
	  echo_to_cockpit( color, dship, argument );
	}
    }
}

void echo_to_cockpit( int color, SHIP_DATA *ship, const char *argument )
{
  vnum_t room = INVALID_VNUM;

  for ( room = ship->room.first; room <= ship->room.last;room++ )
    {
      if ( room == ship->room.cockpit || room == ship->room.navseat
           || room == ship->room.pilotseat || room == ship->room.coseat
           || room == ship->room.gunseat || room == ship->room.engine
           || room == get_turret_room( ship->turret[0] )
	   || room == get_turret_room( ship->turret[1] )
	   || room == get_turret_room( ship->turret[2] )
	   || room == get_turret_room( ship->turret[3] )
	   || room == get_turret_room( ship->turret[4] )
	   || room == get_turret_room( ship->turret[5] )
	   || room == get_turret_room( ship->turret[6] )
	   || room == get_turret_room( ship->turret[7] )
	   || room == get_turret_room( ship->turret[8] )
	   || room == get_turret_room( ship->turret[9] ) )
	{
	  echo_to_room( color, get_room_index(room), argument );
	}
    }
}

bool ship_in_range( const SHIP_DATA *ship, const SHIP_DATA *target )
{
  if (target && ship && target != ship )
    {
      if ( target->spaceobject && ship->spaceobject
           && target->shipstate != SHIP_LANDED
           && ship_distance_to_ship( ship, target ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 3 ) )
	{
	  return true;
	}
    }

  return false;
}

bool missile_in_range( const SHIP_DATA *ship, const MISSILE_DATA *missile )
{
  return missile && ship && ship->spaceobject
    && missile_distance_to_ship( missile, ship ) < 5000;
}

bool space_in_range( const SHIP_DATA *ship, const SPACE_DATA *object )
{
  return object && ship && ship->spaceobject
    && ship_distance_to_spaceobject( ship, object ) < 100000;
}

bool space_in_range_c( const SHIP_DATA *ship, const SPACE_DATA *object )
{
  return object && ship
    && ship_distance_to_spaceobject( ship, object ) < 10000;
}

static bool space_in_range_h( const SHIP_DATA *ship, const SPACE_DATA *object )
{
  return object && ship
    && vector_distance( &object->pos, &ship->hyperpos ) < object->gravity * 5;
}

long int get_ship_value( SHIP_DATA *ship )
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
      const TURRET_DATA *turret = ship->turret[turret_num];

      if( is_turret_installed( turret ) )
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

void write_ship_list( void )
{
  SHIP_DATA *tship = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SHIP_DIR, SHIP_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open ship.lst for writing!\r\n", 0 );
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

void save_ship( const SHIP_DATA *ship )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !ship )
    {
      bug( "%s: null ship pointer!", __FUNCTION__ );
      return;
    }

  if ( ship->sclass == SHIP_DEBRIS )
    {
      return;
    }

  if ( !ship->filename || ship->filename[0] == '\0' )
    {
      bug( "%s: %s has no filename", __FUNCTION__, ship->name );
      return;
    }

  sprintf( filename, "%s%s", SHIP_DIR, ship->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
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
      fprintf( fp, "Turret1       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret2       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret3       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret4       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret5       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret6       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret7       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret8       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret9       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Turret0       %ld\n",  get_turret_room( ship->turret[0] ));
      fprintf( fp, "Statet0       %d\n",   ship->statet0                     );
      fprintf( fp, "Statei0       %d\n",   ship->statei0                     );

      fprintf( fp, "Statet1       %d\n",
	       is_turret_damaged( ship->turret[0] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet2       %d\n",
               is_turret_damaged( ship->turret[1] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet3       %d\n",
               is_turret_damaged( ship->turret[2] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet4       %d\n",
               is_turret_damaged( ship->turret[3] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet5       %d\n",
               is_turret_damaged( ship->turret[4] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet6       %d\n",
               is_turret_damaged( ship->turret[5] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet7       %d\n",
               is_turret_damaged( ship->turret[6] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet8       %d\n",
               is_turret_damaged( ship->turret[7] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet9       %d\n",
               is_turret_damaged( ship->turret[8] ) ? LASER_DAMAGED : LASER_READY );
      fprintf( fp, "Statet0       %d\n",
               is_turret_damaged( ship->turret[9] ) ? LASER_DAMAGED : LASER_READY );

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

static void fread_ship( SHIP_DATA *ship, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = false;

      struct
      {
	vnum_t room_vnum;
	int weapon_state;
      } turret_placeholder[MAX_NUMBER_OF_TURRETS_IN_SHIP];

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = true;
          fread_to_eol( fp );
          break;

        case 'A':
          KEY( "Astro_array",      ship->astro_array,       fread_number( fp ) );
          KEY( "Alarm",            ship->alarm,             fread_number( fp ) );
          break;

        case 'C':
          KEY( "Cockpit",     ship->room.cockpit,          fread_number( fp ) );
          KEY( "Coseat",     ship->room.coseat,          fread_number( fp ) );
          KEY( "Class",       ship->sclass,            fread_number( fp ) );
          KEY( "Copilot",     ship->copilot,          fread_string( fp ) );
          KEY( "Comm",        ship->comm,      fread_number( fp ) );
          KEY( "Chaff",       ship->chaff,      fread_number( fp ) );
          break;

        case 'D':
          KEY( "Description",   ship->description,      fread_string( fp ) );
          KEY( "DockingPorts",    ship->dockingports,      fread_number( fp ) );
          break;

        case 'E':
          KEY( "Engineroom",    ship->room.engine,      fread_number( fp ) );
          KEY( "Entrance",      ship->room.entrance,         fread_number( fp ) );
          KEY( "Energy",      ship->energy,        fread_number( fp ) );

          if ( !str_cmp( word, "End" ) )
            {
	      int turret_num = 0;

              if (!ship->home)
		{
		  ship->home = STRALLOC( "" );
		}

              if (!ship->name)
		{
		  ship->name = STRALLOC( "" );
		}

	      if (!ship->owner)
		{
		  ship->owner = STRALLOC( "" );
		}

              if (!ship->description)
		{
		  ship->description = STRALLOC( "" );
		}

              if (!ship->copilot)
		{
		  ship->copilot = STRALLOC( "" );
		}

              if (!ship->pilot)
		{
		  ship->pilot = STRALLOC( "" );
		}

              if (!ship_is_disabled( ship ))
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
		  TURRET_DATA *turret = ship->turret[turret_num];

		  set_turret_room( turret, turret_placeholder[turret_num].room_vnum );

		  if( turret_placeholder[turret_num].weapon_state == LASER_DAMAGED )
		    {
		      set_turret_damaged( turret );
		    }
		  else
		    {
		      set_turret_ready( turret );
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
          KEY( "Filename",      ship->filename,         fread_string_nohash( fp ) );
          KEY( "Firstroom",   ship->room.first,        fread_number( fp ) );
          break;

        case 'G':
          KEY( "Guard",     ship->guard,          fread_number( fp ) );
          KEY( "Gunseat",     ship->room.gunseat,          fread_number( fp ) );
          break;

        case 'H':
          KEY( "Home" , ship->home, fread_string( fp ) );
          KEY( "Hyperspeed",   ship->hyperspeed,      fread_number( fp ) );
          KEY( "Hull",      ship->hull,        fread_number( fp ) );
          KEY( "Hanger",  ship->room.hanger,      fread_number( fp ) );
          break;

        case 'I':
          KEY( "Ions" , ship->ions, fread_number( fp ) );
          break;

        case 'L':
          KEY( "Laserstr",   ship->lasers,   (short)  ( fread_number( fp )/10 ) );
          KEY( "Lasers",   ship->lasers,      fread_number( fp ) );
          KEY( "Lastdoc",    ship->lastdoc,       fread_number( fp ) );
          KEY( "Lastroom",   ship->room.last,        fread_number( fp ) );
          break;

        case 'M':
          KEY( "Manuever",   ship->manuever,      fread_number( fp ) );
          KEY( "Maxmissiles",   ship->maxmissiles,      fread_number( fp ) );
          KEY( "Maxtorpedos",   ship->maxtorpedos,      fread_number( fp ) );
          KEY( "Maxrockets",   ship->maxrockets,      fread_number( fp ) );
          KEY( "Missiles",   ship->missiles,      fread_number( fp ) );
          KEY( "Missiletype",   ship->missiletype,      fread_number( fp ) );
          KEY( "Maxshield",      ship->maxshield,        fread_number( fp ) );
          KEY( "Maxenergy",      ship->maxenergy,        fread_number( fp ) );
          KEY( "Missilestate",   ship->missilestate,        fread_number( fp ) );
	  KEY( "Maxhull",      ship->maxhull,        fread_number( fp ) );
          KEY( "Maxchaff",       ship->maxchaff,      fread_number( fp ) );
          break;

        case 'N':
          KEY( "Name",  ship->name,             fread_string( fp ) );
          KEY( "Navseat",     ship->room.navseat,          fread_number( fp ) );
          break;

        case 'O':
          KEY( "Owner",            ship->owner,            fread_string( fp ) );
          break;

        case 'P':
          KEY( "PersonalName",  ship->personalname,             fread_string( fp ) );
          KEY( "Pilot",            ship->pilot,            fread_string( fp ) );
          KEY( "Pilotseat",     ship->room.pilotseat,          fread_number( fp ) );
          break;

        case 'R':
          KEY( "Realspeed",   ship->realspeed,       fread_number( fp ) );
          KEY( "Rockets",     ship->rockets,         fread_number( fp ) );
          break;

        case 'S':
          KEY( "Shipyard",    ship->shipyard,      fread_number( fp ) );
          KEY( "Sensor",      ship->sensor,       fread_number( fp ) );
          KEY( "Shield",      ship->shield,        fread_number( fp ) );
          KEY( "Shipstate",   ship->shipstate,        fread_number( fp ) );
          KEY( "Statei0",   ship->statei0,        fread_number( fp ) );
          KEY( "Statet0",   ship->statet0,        fread_number( fp ) );
          KEY( "Statet1",   turret_placeholder[0].weapon_state,        fread_number( fp ) );
          KEY( "Statet2",   turret_placeholder[1].weapon_state,        fread_number( fp ) );
          KEY( "Statet3",   turret_placeholder[2].weapon_state,        fread_number( fp ) );
          KEY( "Statet4",   turret_placeholder[3].weapon_state,        fread_number( fp ) );
          KEY( "Statet5",   turret_placeholder[4].weapon_state,        fread_number( fp ) );
          KEY( "Statet6",   turret_placeholder[5].weapon_state,        fread_number( fp ) );
          KEY( "Statet7",   turret_placeholder[6].weapon_state,        fread_number( fp ) );
          KEY( "Statet8",   turret_placeholder[7].weapon_state,        fread_number( fp ) );
          KEY( "Statet9",   turret_placeholder[8].weapon_state,        fread_number( fp ) );
          KEY( "Statet10",  turret_placeholder[9].weapon_state,        fread_number( fp ) );
          break;

        case 'T':
          KEY( "Type",  ship->type,     fread_number( fp ) );
	  KEY( "Tractorbeam", ship->tractorbeam,      fread_number( fp ) );
          KEY( "Turret1",     turret_placeholder[0].room_vnum,  fread_number( fp ) );
          KEY( "Turret2",     turret_placeholder[1].room_vnum,  fread_number( fp ) );
          KEY( "Turret3",     turret_placeholder[2].room_vnum, fread_number( fp ) );
          KEY( "Turret4",     turret_placeholder[3].room_vnum, fread_number( fp ) );
          KEY( "Turret5",     turret_placeholder[4].room_vnum, fread_number( fp ) );
          KEY( "Turret6",     turret_placeholder[5].room_vnum, fread_number( fp ) );
          KEY( "Turret7",     turret_placeholder[6].room_vnum, fread_number( fp ) );
          KEY( "Turret8",     turret_placeholder[7].room_vnum, fread_number( fp ) );
          KEY( "Turret9",     turret_placeholder[8].room_vnum, fread_number( fp ) );
          KEY( "Turret0",     turret_placeholder[9].room_vnum, fread_number( fp ) );
          KEY( "Torpedos",    ship->torpedos, fread_number( fp ) );
          break;

        case 'V':
          KEY( "Vx",          ship->pos.x,     fread_number( fp ) );
          KEY( "Vy",          ship->pos.y,     fread_number( fp ) );
          KEY( "Vz",          ship->pos.z,     fread_number( fp ) );
        }

      if ( !fMatch )
        {
          bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

/*
 * Load a ship file
 */

static bool load_ship_file( const char *shipfile )
{
  char filename[256];
  SHIP_DATA *ship = NULL;
  FILE *fp = NULL;
  bool found = false;
  int turret_num = 0;
  ROOM_INDEX_DATA *pRoomIndex = NULL;
  CLAN_DATA *clan = NULL;

  CREATE( ship, SHIP_DATA, 1 );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->turret[turret_num] = create_turret( ship );
    }

  sprintf( filename, "%s%s", SHIP_DIR, shipfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;

      for ( ; ; )
        {
          const char *word = NULL;
          char letter = fread_letter( fp );

          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "%s: # not found.", __FUNCTION__ );
              break;
            }

          word = fread_word( fp );
	  if ( !str_cmp( word, "SHIP"   ) )
            {
              fread_ship( ship, fp );
            }
          else if ( !str_cmp( word, "END"  ) )
            {
              break;
            }
          else
            {
              bug( "%s: bad section: %s.", __FUNCTION__, word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !(found) )
    {
      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  TURRET_DATA *turret = ship->turret[turret_num];
	  destroy_turret( turret );
	}

      DISPOSE( ship );
    }
  else
    {
      LINK( ship, first_ship, last_ship, next, prev );

      ship->docking = SHIP_READY;

      if ( ( !str_cmp("Trainer", ship->owner)
             || !str_cmp("Public",ship->owner)
             || ship->type == MOB_SHIP ) )
        {
          if ( ship->sclass != SHIP_PLATFORM && ship->type != MOB_SHIP && ship->sclass != CAPITAL_SHIP )
            {
              extract_ship( ship );
              ship_to_room( ship , ship->shipyard );

	      ship->location = ship->shipyard;
              ship->lastdoc = ship->shipyard;
              ship->shipstate = SHIP_LANDED;
              ship->docking = SHIP_READY;
            }

          if( !ship->personalname )
	    {
	      ship->personalname = STRALLOC(ship->name);
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
      else if ( ( pRoomIndex = get_room_index( ship->lastdoc ) ) != NULL
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
          ship_to_spaceobject(ship, spaceobject_from_name(ship->home) );
          vector_set( &ship->head, 1, 1, 1 );

          if( ship->pos.x == 0 && ship->pos.y == 0 && ship->pos.z == 0 )
            {
              if ( ship->home )
                {
                  ship_to_spaceobject(ship, spaceobject_from_name(ship->home));
                  vector_init( &ship->pos );

                  if( ship->spaceobject )
                    {
                      vector_copy( &ship->pos, &ship->spaceobject->pos );
                    }

                  vector_randomize( &ship->pos, -5000, 5000 );
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

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
	    {
	      clan->spacecraft++;
	    }
          else
	    {
	      clan->vehicles++;
	    }
        }

      ship->docking = SHIP_READY;
    }

  return found;
}

/*
 * Load in all the ship files.
 */
void load_ships( )
{
  FILE *fpList = NULL;
  char shiplist[256];

  log_string( "Loading ships..." );
  sprintf( shiplist, "%s%s", SHIP_DIR, SHIP_LIST );

  if ( ( fpList = fopen( shiplist, "r" ) ) == NULL )
    {
      perror( shiplist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : fread_word( fpList );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !load_ship_file( filename ) )
        {
          bug( "Cannot load ship file: %s", filename );
        }
    }

  fclose( fpList );
  log_string(" Done ships " );
}

void resetship( SHIP_DATA *ship )
{
  int turret_num = 0;

  ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->docked = NULL;

  if ( ship->sclass != SHIP_PLATFORM
       && ship->sclass != CAPITAL_SHIP
       && ship->type != MOB_SHIP )
    {
      extract_ship( ship );
      ship_to_room( ship , ship->shipyard );

      ship->location = ship->shipyard;
      ship->lastdoc = ship->shipyard;
      ship->shipstate = SHIP_LANDED;
    }

  if (ship->spaceobject)
    {
      ship_from_spaceobject( ship, ship->spaceobject );
    }

  ship->currspeed = 0;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;
  ship->shield = 0;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      TURRET_DATA *turret = ship->turret[turret_num];
      reset_turret( turret );
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
  if ( str_cmp("Trainer", ship->owner) && str_cmp("Public",ship->owner) && ship->type != MOB_SHIP )
    {
      CLAN_DATA *clan = NULL;

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft--;
          else
            clan->vehicles--;
        }

      STRFREE( ship->owner );
      ship->owner = STRALLOC( "" );
      STRFREE( ship->pilot );
      ship->pilot = STRALLOC( "" );
      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( "" );
    }
#endif
#endif
  if (!(ship->home))
    {
      if ( ship->type == SHIP_REBEL || ( ship->type == MOB_SHIP && ((!str_cmp( ship->owner , "The Rebel Alliance" )) || (!str_cmp( ship->owner , "The New Republic" )))))
        {
          STRFREE( ship->home );
          ship->home = STRALLOC( "Coruscant" );
        }
      else if ( ship->type == SHIP_IMPERIAL || ( ship->type == MOB_SHIP && !str_cmp(ship->owner, "the empire") ))
        {
          STRFREE( ship->home );
	  ship->home = STRALLOC( "Byss" );
        }
      else if ( ship->type == SHIP_CIVILIAN)
        {
          STRFREE( ship->home );
          ship->home = STRALLOC( "corporate" );
        }
    }

  save_ship(ship);
}

void echo_to_nearby_ships( int color, SHIP_DATA *ship, const char *argument,
			   SHIP_DATA *ignore )
{
  SHIP_DATA *target = NULL;

  if (!ship->spaceobject)
    {
      return;
    }

  for ( target = first_ship; target; target = target->next )
    {
      if( !ship_in_range( ship, target ) )
        {
          continue;
        }

      if (target != ship && target != ignore
	  && ship_distance_to_ship( ship, target ) < 100*(target->sensor+10)*((ship->sclass == SHIP_DEBRIS ? 2 : ship->sclass)+1))
        {
          echo_to_cockpit( color , target , argument );
        }
    }
}

SHIP_DATA * ship_in_room( ROOM_INDEX_DATA *room, const char *name )
{
  SHIP_DATA *ship = NULL;

  if ( !room )
    {
      return NULL;
    }

  for ( ship = room->first_ship ; ship ; ship = ship->next_in_room )
    {
      if( ship->personalname && !str_cmp( name, ship->personalname ) )
        {
          return ship;
        }

      if ( !str_cmp( name, ship->name ) )
        {
          return ship;
        }
    }

  for ( ship = room->first_ship ; ship ; ship = ship->next_in_room )
    {
      if( ship->personalname && nifty_is_name_prefix( name, ship->personalname ) )
        {
          return ship;
        }

      if ( nifty_is_name_prefix( name, ship->name ) )
        {
          return ship;
        }
    }

  return NULL;
}

/*
 * Get pointer to ship structure from ship name.
 */
SHIP_DATA *get_ship( const char *name )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->personalname && !str_cmp( name, ship->personalname ) )
	{
	  return ship;
	}

      if ( !str_cmp( name, ship->name ) )
	{
	  return ship;
	}

      if( ship->personalname && nifty_is_name_prefix( name, ship->personalname ) )
	{
	  return ship;
	}

      if ( nifty_is_name_prefix( name, ship->name ) )
	{
	  return ship;
	}
    }

  return NULL;
}

/*
 * Checks if ship is in a spaceobject and returns pointer if it is.
 */
SHIP_DATA *get_ship_here( const char *name , SHIP_DATA *eShip)
{
  SHIP_DATA *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int number = number_argument( name, arg );
  int count = 0;

  if ( eShip == NULL )
    {
      return NULL;
    }

  for ( ship = first_ship ; ship; ship = ship->next )
    {
      if( !ship_in_range( eShip, ship ) )
	{
	  continue;
	}

      if( !ship->spaceobject )
	{
	  continue;
	}

      if( ship->personalname && !str_cmp( arg, ship->personalname ) )
        {
          count++;

          if( !number || count == number )
	    {
	      return ship;
	    }
        }

      if ( !str_cmp( arg, ship->name ) )
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
      if( !ship_in_range( eShip, ship ) )
	{
	  continue;
	}

      if( ship->personalname && nifty_is_name_prefix( arg, ship->personalname ) )
	{
	  count++;

	  if( !number || count == number )
	    {
	      return ship;
	    }
	}

      if ( nifty_is_name_prefix( arg, ship->name ) )
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
SHIP_DATA *ship_from_cockpit( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.cockpit
	   || vnum == get_turret_room( ship->turret[0] )
	   || vnum == get_turret_room( ship->turret[1] )
	   || vnum == get_turret_room( ship->turret[2] )
	   || vnum == get_turret_room( ship->turret[3] )
	   || vnum == get_turret_room( ship->turret[4] )
	   || vnum == get_turret_room( ship->turret[5] )
	   || vnum == get_turret_room( ship->turret[6] )
	   || vnum == get_turret_room( ship->turret[7] )
	   || vnum == get_turret_room( ship->turret[8] )
	   || vnum == get_turret_room( ship->turret[9] )
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

SHIP_DATA *ship_from_pilotseat( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.pilotseat )
	{
	  return ship;
	}
    }

  return NULL;
}

SHIP_DATA *ship_from_coseat( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.coseat )
	{
	  return ship;
	}
    }

  return NULL;
}

SHIP_DATA *ship_from_navseat( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.navseat )
	{
	  return ship;
	}
    }

  return NULL;
}

SHIP_DATA *ship_from_gunseat( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.gunseat )
	{
	  return ship;
	}
    }

  return NULL;
}

SHIP_DATA *ship_from_engine( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

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

SHIP_DATA *ship_from_turret( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.gunseat
	   || vnum == get_turret_room( ship->turret[0] )
           || vnum == get_turret_room( ship->turret[1] )
           || vnum == get_turret_room( ship->turret[2] )
           || vnum == get_turret_room( ship->turret[3] )
           || vnum == get_turret_room( ship->turret[4] )
           || vnum == get_turret_room( ship->turret[5] )
           || vnum == get_turret_room( ship->turret[6] )
           || vnum == get_turret_room( ship->turret[7] )
           || vnum == get_turret_room( ship->turret[8] )
           || vnum == get_turret_room( ship->turret[9] ) )
        {
          return ship;
        }
    }

  return NULL;
}

SHIP_DATA *ship_from_entrance( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.entrance )
	{
	  return ship;
	}
    }

  return NULL;
}

SHIP_DATA *ship_from_hanger( vnum_t vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.hanger )
	{
	  return ship;
	}
    }

  return NULL;
}

void ship_to_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject )
{
  if( ship && spaceobject )
    {
      ship->spaceobject = spaceobject;
    }
}

void ship_from_spaceobject( SHIP_DATA *ship, SPACE_DATA *spaceobject )
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

bool is_rental( Character *ch, SHIP_DATA *ship )
{
  if ( !str_cmp("Public",ship->owner) )
    {
      return true;
    }

  if ( !str_cmp("Trainer",ship->owner) )
    {
      return true;
    }

  if ( ship->sclass == SHIP_TRAINER )
    {
      return true;
    }

  return false;
}

bool candock( const SHIP_DATA *ship )
{
  int count = 0;
  SHIP_DATA *dship = NULL;
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

bool check_pilot( Character *ch , SHIP_DATA *ship )
{
  if ( !str_cmp(ch->name,ship->owner)
       || !str_cmp(ch->name,ship->pilot)
       || !str_cmp(ch->name,ship->copilot)
       || !str_cmp("Public",ship->owner)
       || !str_cmp("Trainer", ship->owner) )
    {
      return true;
    }

  if ( !IsNpc(ch) && ch->pcdata && ch->pcdata->clan )
    {
      if ( !str_cmp(ch->pcdata->clan->name,ship->owner) )
        {
          if ( !str_cmp(ch->pcdata->clan->leadership.leader,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number1,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }

      if ( !str_cmp(ch->pcdata->clan->name,ship->pilot) )
        {
          if ( !str_cmp(ch->pcdata->clan->leadership.leader,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number1,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }

      if ( !str_cmp(ch->pcdata->clan->name,ship->copilot) )
        {
          if ( !str_cmp(ch->pcdata->clan->leadership.leader,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number1,ch->name) )
	    {
	      return true;
	    }

          if ( !str_cmp(ch->pcdata->clan->leadership.number2,ch->name) )
	    {
	      return true;
	    }

          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
	    {
	      return true;
	    }
        }
    }

  return false;
}

bool extract_ship( SHIP_DATA *ship )
{
  ROOM_INDEX_DATA *room = ship->in_room;

  if ( room )
    {
      UNLINK( ship, room->first_ship, room->last_ship, next_in_room, prev_in_room );
      ship->in_room = NULL;
    }

  return true;
}

void damage_ship_ch( SHIP_DATA *ship , int min , int max , Character *ch )
{
  short ionFactor = 1;
  int dmg = 0;
  int shield_dmg = 0;
  long xp = 0;
  bool ions = false;

  if ( min < 0 && max < 0 )
    {
      ions = true;
      dmg = number_range( max*(-1), min*(-1) );
    }
  else
    {
      dmg = number_range( min , max );
    }

  if ( ions == true )
    {
      ionFactor = 2;
    }

  xp = ( exp_level( GetAbilityLevel(ch, PILOTING_ABILITY ) + 1) - exp_level( GetAbilityLevel( ch, PILOTING_ABILITY ) ) ) / 25;
  xp = UMIN( get_ship_value( ship ) / 100, xp ) ;
  gain_exp( ch, PILOTING_ABILITY, xp );

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield, dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;

      if ( ship->shield == 0 )
	{
	  echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
	}
    }

  if ( dmg > 0 )
    {
      int turret_num = 0;

      if ( number_range(1, 100) <= 5*ionFactor && !ship_is_disabled( ship ) )
        {
          echo_to_cockpit( AT_BLOOD + AT_BLINK, ship, "Ships Drive DAMAGED!" );
          ship->shipstate = SHIP_DISABLED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->missilestate != MISSILE_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->missilestate = MISSILE_DAMAGED;
        }

      if ( number_range(1, 100) <= 2*ionFactor && ship->statet0 != LASER_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.gunseat) , "Lasers DAMAGED!" );
          ship->statet0 = LASER_DAMAGED;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	{
	  TURRET_DATA *turret = ship->turret[turret_num];

	  if ( number_range(1, 100) <= 5 * ionFactor && !is_turret_damaged( turret ) )
	    {
	      echo_to_room( AT_BLOOD + AT_BLINK, get_room_index( get_turret_room( turret ) ),
			    "Turret DAMAGED!" );
	      set_turret_damaged( turret );
	    }
	}

      if ( number_range(1, 100) <= 5*ionFactor && ship->statettractor != LASER_DAMAGED && ship->tractorbeam )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.pilotseat) , "Tractorbeam DAMAGED!" );
          ship->statettractor = LASER_DAMAGED;
        }

      if ( ions == false )
	{
          ship->hull -= dmg * 5;
        }
    }

  if ( ship->hull <= 0 )
    {
      destroy_ship( ship , ch );
      log_printf( "%s(%s) was just destroyed by %s.",
		  ship->name, ship->personalname, ch->name );

      xp =  ( exp_level( GetAbilityLevel( ch, PILOTING_ABILITY ) + 1) - exp_level( GetAbilityLevel( ch, PILOTING_ABILITY ) ) );
      xp = UMIN( get_ship_value( ship ) , xp );
      gain_exp( ch, PILOTING_ABILITY, xp);
      ch_printf( ch, "&WYou gain %ld piloting experience!\r\n", xp );
      return;
    }

  if ( ship->hull <= ship->maxhull/20 )
    {
      echo_to_cockpit( AT_BLOOD+ AT_BLINK , ship , "WARNING! Ship hull severely damaged!" );
    }
}

void damage_ship( SHIP_DATA *ship , SHIP_DATA *assaulter, int min , int max )
{
  int dmg = 0;
  int shield_dmg = 0;
  short ionFactor = 1;
  bool ions = false;

  if ( min < 0 && max < 0 )
    {
      ions = true;
      dmg = number_range( max*(-1), min*(-1) );
    }
  else
    {
      dmg = number_range( min , max );
    }

  if ( ions == true )
    {
      ionFactor = 2;
    }

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield , dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;

      if ( ship->shield == 0 )
	{
	  echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
	}
    }

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield , dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;

      if ( ship->shield == 0 )
	{
	  echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
	}
    }

  if ( dmg > 0 )
    {
      int turret_num = 0;

      if ( number_range(1, 100) <= 5*ionFactor && !ship_is_disabled( ship ) )
        {
          echo_to_cockpit( AT_BLOOD + AT_BLINK , ship , "Ships Drive DAMAGED!" );
	  ship->shipstate = SHIP_DISABLED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->missilestate != MISSILE_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->missilestate = MISSILE_DAMAGED;
        }

      if ( number_range(1, 100) <= 2*ionFactor && ship->statet0 != LASER_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.gunseat) , "Lasers DAMAGED!" );
          ship->statet0 = LASER_DAMAGED;
        }

      for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
        {
          TURRET_DATA *turret = ship->turret[turret_num];

          if ( number_range(1, 100) <= 5 * ionFactor && !is_turret_damaged( turret ) )
            {
              echo_to_room( AT_BLOOD + AT_BLINK, get_room_index( get_turret_room( turret ) ),
                            "Turret DAMAGED!" );
              set_turret_damaged( turret );
            }
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->statettractor != LASER_DAMAGED && ship->tractorbeam )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->room.pilotseat) , "Tractorbeam DAMAGED!" );
          ship->statettractor = LASER_DAMAGED;
        }

      if ( ions == false )
        {
          ship->hull -= dmg * 5;
        }
    }

  ship->hull -= dmg * 5;

  if ( ship->hull <= 0 )
    {
      log_printf( "%s(%s) was just destroyed by %s.",
		  ship->name, ship->personalname, (assaulter ? assaulter->personalname : "a collision" ) );
      destroy_ship( ship , NULL );
      return;
    }

  if ( ship->hull <= ship->maxhull/20 )
    {
      echo_to_cockpit( AT_BLOOD+ AT_BLINK , ship , "WARNING! Ship hull severely damaged!" );
    }
}

void destroy_ship( SHIP_DATA *ship , Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  vnum_t roomnum = INVALID_VNUM;
  ROOM_INDEX_DATA *room = NULL;
  OBJ_DATA *robj = NULL;
  Character *rch = NULL;
  SHIP_DATA *lship = NULL;

  if (!ship)
    {
      return;
    }

  sprintf( buf , "%s explodes in a blinding flash of light!", ship->name );
  echo_to_nearby_ships( AT_WHITE + AT_BLINK, ship, buf, NULL );
  echo_to_ship( AT_WHITE + AT_BLINK, ship, "A blinding flash of light burns your eyes...");
  echo_to_ship( AT_WHITE, ship, "But before you have a chance to scream...\r\nYou are ripped apart as your spacecraft explodes...");

#ifdef NODEATH
  resetship(ship);
  makedebris(ship);
  return;
#endif
#ifdef NODEATHSHIP
  resetship(ship);
  makedebris(ship);
  return;
#endif

  if ( !str_cmp("Trainer", ship->owner))
    {
      resetship(ship);
      return;
    }

  makedebris(ship);

  for ( roomnum = ship->room.first; roomnum <= ship->room.last; roomnum++ )
    {
      room = get_room_index(roomnum);

      if (room != NULL)
        {
          rch = room->first_person;

          while ( rch )
            {
              if ( IsImmortal(rch) )
                {
                  char_from_room(rch);
                  char_to_room( rch, get_room_index(wherehome(rch)) );
                }
              else
                {
                  if ( ch )
		    {
		      raw_kill( ch , rch );
		    }
                  else
		    {
		      raw_kill( rch , rch );
		    }
                }

              rch = room->first_person;
            }

          for ( robj = room->first_content ; robj ; robj = robj->next_content )
            {
              separate_obj( robj );
              extract_obj( robj );
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

      if ( ch )
        {
	  log_printf( "%s(%s) was just destroyed by %s.",
		      lship->name, lship->personalname, ch->name );
        }
      else
        {
	  log_printf( "%s(%s) was just destroyed by a mob ship.",
		      lship->name, lship->personalname );
        }

      destroy_ship( lship, ch );
    }

  resetship(ship);
}

bool ship_to_room(SHIP_DATA *ship, vnum_t vnum )
{
  ROOM_INDEX_DATA *shipto = NULL;

  if ( (shipto = get_room_index(vnum)) == NULL )
    {
      return false;
    }

  LINK( ship, shipto->first_ship, shipto->last_ship, next_in_room, prev_in_room );
  ship->in_room = shipto;
  return true;
}

bool rent_ship( Character *ch , SHIP_DATA *ship )
{
  long price = 0;

  if ( IsNpc ( ch ) )
    {
      return false;
    }

  price = get_ship_value( ship ) / 100;

  if ( ch->gold < price )
    {
      ch_printf(ch, "&RRenting this ship costs %ld. You don't have enough credits!\r\n" , price );
      return false;
    }

  ch->gold -= price;
  ch_printf(ch, "&GYou pay %ld credits to rent the ship.\r\n" , price );
  return true;
}
