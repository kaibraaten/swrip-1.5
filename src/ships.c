/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                                Ships                                     *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include "ships.h"
#include "mud.h"
#include "vector3_aux.h"

SHIP_DATA *first_ship = NULL;
SHIP_DATA *last_ship = NULL;

static int baycount = 0;

void fread_ship( SHIP_DATA *ship, FILE *fp );
bool load_ship_file( const char *shipfile );
void approachland( SHIP_DATA *ship, const char *arg );
void landship( SHIP_DATA *ship, const char *arg );
void launchship( SHIP_DATA *ship );
void makedebris( SHIP_DATA *ship );
bool space_in_range_h( SHIP_DATA *ship, SPACE_DATA *space);
void echo_to_room_dnr( int ecolor, ROOM_INDEX_DATA *room,
		       const char *argument );

static bool will_collide_with_sun( const SHIP_DATA *ship,
				   const SPACE_DATA *sun )
{
  if ( sun->name
       && str_cmp( sun->name, "" )
       && ship_distance_to_spaceobject( ship, sun ) < 10 )
    {
      return TRUE;
    }

  return FALSE;
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
  echo_to_room( AT_RED , get_room_index(ship->pilotseat), "Automatic Override: Evading to avoid collision with sun!\r\n" );

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
  SHIP_DATA *target = NULL;
  SPACE_DATA *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];

  for ( ship = first_ship; ship; ship = ship->next )
    {

      if ( !ship->spaceobject )
        continue;

      if( ship->shipstate == SHIP_LANDED && ship->spaceobject )
        ship->shipstate = SHIP_READY;

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

      if ( autofly(ship) )
        continue;

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
                  sprintf( buf , "You begin orbitting %s.", spaceobj->name);
                  echo_to_cockpit( AT_YELLOW, ship, buf);
                  sprintf( buf , "%s begins orbiting %s.", ship->name, spaceobj->name);
                  echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );
                  ship->inorbitof = spaceobj;
                  ship->currspeed = 0;
                }

            }
        }

    }

  target = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship_is_in_hyperspace( ship ) )
        {
          Vector3 tmp;
          float dist = 0, origdist = 0;

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

		  echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat),
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

          if( target )
            {
              echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat),
			    "Hyperjump complete.");
              echo_to_ship( AT_YELLOW, ship, "The ship slams to a halt as it comes out of hyperspace. An artificial gravity well surrounds you!");
	      sprintf( buf, "%s enters the starsystem at %.0f %.0f %.0f",
		       ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
              vector_copy( &ship->pos, &ship->hyperpos );
              ship_to_spaceobject( ship, ship->currjump );
              ship->currjump = NULL;
              echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
              ship->shipstate = SHIP_READY;
              STRFREE( ship->home );
              ship->home = STRALLOC( ship->spaceobject->name );
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
                  echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
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
		    && ship->tracking == TRUE )
            {
              ship_to_spaceobject (ship, ship->currjump);

              if (ship->spaceobject == NULL)
		{
                  echo_to_cockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
              else
                {

                  echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
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
              echo_to_room_dnr( AT_YELLOW , get_room_index(ship->pilotseat), "Remaining jump distance: " );
              echo_to_room( AT_WHITE , get_room_index(ship->pilotseat), buf );
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

void landship( SHIP_DATA *ship, const char *arg )
{
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];
  int destination;
  CHAR_DATA *ch;

  if ( !str_prefix(arg,ship->spaceobject->locationa) )
    destination = ship->spaceobject->doca;

  if ( !str_prefix(arg,ship->spaceobject->locationb) )
    destination = ship->spaceobject->docb;

  if ( !str_prefix(arg,ship->spaceobject->locationc) )
    destination = ship->spaceobject->docc;

  target = get_ship_here( arg , ship );

  if ( target != ship && target != NULL && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    destination = target->hanger;

  if ( !ship_to_room( ship , destination ) )
    {
      echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat), "Could not complete approach. Landing aborted.");
      echo_to_ship( AT_YELLOW , ship , "The ship pulls back up out of its landing sequence.");

      if ( !ship_is_disabled( ship ))
        ship->shipstate = SHIP_READY;

      return;
    }

  echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat), "Landing sequence complete.");
  echo_to_ship( AT_YELLOW , ship , "You feel a slight thud as the ship sets down on the ground.");
  sprintf( buf ,"%s disapears from your scanner." , ship->name  );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );

  if( ship->ch && ship->ch->desc )
    {
      int xp;

      ch = ship->ch;
      xp =  (exp_level( get_level(ch, PILOTING_ABILITY ) + 1) - exp_level( get_level(ch, PILOTING_ABILITY)));
      xp = UMIN( get_ship_value( ship ) , xp );
      gain_exp( ch, PILOTING_ABILITY, xp );
      ch_printf( ch, "&WYou gain %ld points of flight experience!\r\n",
		 UMIN( get_ship_value( ship ) , xp ) );
      ship->ch = NULL;
    }

  ship->location = destination;
  ship->lastdoc = ship->location;

  if (!ship_is_disabled( ship ))
    ship->shipstate = SHIP_LANDED;

  ship_from_spaceobject(ship, ship->spaceobject);

  if (ship->tractored)
    {
      if (ship->tractored->tractoredby == ship)
        ship->tractored->tractoredby = NULL;

      ship->tractored = NULL;
    }

  sprintf( buf, "%s lands on the platform.", ship->name );
  echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );

  ship->energy = ship->energy - 25 - 25*ship->sclass;

  if ( !str_cmp("Public",ship->owner) || !str_cmp("trainer",ship->owner) || ship->sclass == SHIP_TRAINER )
    {
      ship->energy = ship->maxenergy;
      ship->shield = 0;
      ship->autorecharge = FALSE;
      ship->autotrack = FALSE;
      ship->autospeed = FALSE;
      ship->hull = ship->maxhull;

      ship->missilestate = MISSILE_READY;
      ship->statet0 = LASER_READY;
      ship->statet1 = LASER_READY;
      ship->statet2 = LASER_READY;
      ship->shipstate = SHIP_LANDED;

      echo_to_cockpit( AT_YELLOW , ship , "Repairing and refueling ship..." );
    }

  save_ship(ship);
}

void approachland( SHIP_DATA *ship, const char *arg)
{
  SPACE_DATA *spaceobj;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  bool found = FALSE;
  SHIP_DATA *target;

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if( space_in_range( ship, spaceobj ) )
      if ( !str_prefix(arg,spaceobj->locationa) ||
           !str_prefix(arg,spaceobj->locationb) ||
           !str_prefix(arg,spaceobj->locationc))
        {
          found = TRUE;
          break;
        }

  if( found )
    {
      if ( !str_prefix(arg, spaceobj->locationa) )
        strcpy( buf2, spaceobj->locationa);
      else if ( !str_prefix(arg, spaceobj->locationb) )
        strcpy( buf2, spaceobj->locationb);
      else if ( !str_prefix(arg, spaceobj->locationc) )
        strcpy( buf2, spaceobj->locationc);
    }

  target = get_ship_here( arg , ship );
  if ( target != ship && target != NULL && target->bayopen
       && ( ship->sclass != MIDSIZE_SHIP || target->sclass != MIDSIZE_SHIP ) )
    strcpy( buf2, target->name);

  if ( !found && !target )
    {
      echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat), "ERROR");
      return;
    }

  sprintf( buf, "Approaching %s.", buf2 );
  echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat), buf);
  sprintf( buf, "%s begins its approach to %s.", ship->name, buf2 );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void launchship( SHIP_DATA *ship )
{
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *target;
  int plusminus;

  ship_to_spaceobject( ship, spaceobject_from_vnum( ship->location ) );

  if ( ship->spaceobject == NULL )
    {
      echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat) , "Launch path blocked... Launch aborted.");
      echo_to_ship( AT_YELLOW , ship , "The ship slowly sets back back down on the landing pad.");
      sprintf( buf ,  "%s slowly sets back down." ,ship->name );
      echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
      ship->shipstate = SHIP_LANDED;
      return;
    }

  if (ship->sclass == MIDSIZE_SHIP)
    {
      sound_to_room( get_room_index(ship->location) , "!!SOUND(falcon)" );
      sound_to_ship(ship , "!!SOUND(falcon)" );
    }
  else if (ship->type == SHIP_IMPERIAL )
    {
      sound_to_ship(ship , "!!SOUND(tie)" );
      sound_to_room( get_room_index(ship->location) , "!!SOUND(tie)" );
    }
  else
    {
      sound_to_ship(ship , "!!SOUND(xwing)" );
      sound_to_room( get_room_index(ship->location) , "!!SOUND(xwing)" );
    }

  extract_ship(ship);

  ship->location = 0;

  if (!ship_is_disabled( ship ))
    ship->shipstate = SHIP_READY;

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    ship->head.x = 1;
  else
    ship->head.x = -1;

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    ship->head.y = 1;
  else
    ship->head.y = -1;

  plusminus = number_range ( -1 , 2 );

  if (plusminus > 0 )
    ship->head.z = 1;
  else
    ship->head.z = -1;

  if (ship->spaceobject &&
      ( ship->lastdoc == ship->spaceobject->doca  ||
        ship->lastdoc == ship->spaceobject->docb ||
        ship->lastdoc == ship->spaceobject->docc ) )
    {
      vector_copy( &ship->pos, &ship->spaceobject->pos );
    }
  else
    {
      for ( target = first_ship; target; target = target->next )
        {
          if (ship->lastdoc == target->hanger)
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

void makedebris( SHIP_DATA *ship )
{
  SHIP_DATA *debris;
  char buf[MAX_STRING_LENGTH];

  if ( ship->sclass == SHIP_DEBRIS )
    return;

  CREATE( debris, SHIP_DATA, 1 );

  LINK( debris, first_ship, last_ship, next, prev );

  debris->owner         = STRALLOC( "" );
  debris->copilot       = STRALLOC( "" );
  debris->pilot         = STRALLOC( "" );
  debris->home          = STRALLOC( "" );
  debris->type          = SHIP_CIVILIAN;

  if( ship->type != MOB_SHIP )
    debris->type          = ship->type;

  debris->sclass         = SHIP_DEBRIS;
  debris->lasers        = ship->lasers  ;
  debris->missiles   = ship->missiles  ;
  debris->rockets        = ship->rockets  ;
  debris->torpedos        = ship->torpedos  ;
  debris->maxshield        = ship->maxshield  ;
  debris->maxhull        = ship->maxhull  ;
  debris->maxenergy        = ship->maxenergy  ;
  debris->hyperspeed        = ship->hyperspeed  ;
  debris->chaff        = ship->chaff  ;
  debris->realspeed        = ship->realspeed  ;
  debris->currspeed        = ship->currspeed  ;
  debris->manuever        = ship->manuever  ;

  debris->spaceobject = NULL;
  debris->energy = 0;
  debris->hull = ship->maxhull;
  debris->in_room=NULL;
  debris->next_in_room=NULL;
  debris->prev_in_room=NULL;
  debris->currjump=NULL;
  debris->target0=NULL;
  debris->target1=NULL;
  debris->target2=NULL;
  debris->autopilot = FALSE;

  strcpy( buf, "Debris of a " );
  strcat( buf, ship->name );
  debris->name          = STRALLOC( "Debris" );
  debris->personalname          = STRALLOC( "Debris" );
  debris->description   = STRALLOC( buf );

  ship_to_spaceobject( debris, ship->spaceobject );
  vector_copy( &debris->pos, &ship->pos );
  vector_copy( &debris->head, &ship->head );
}

bool ship_was_in_range( SHIP_DATA *ship, SHIP_DATA *target )
{
  return target && ship && target != ship
    && ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3);
}

bool candock( SHIP_DATA *ship )
{
  int count = 0;
  SHIP_DATA *dship;
  int ports;

  if ( !ship )
    return FALSE;

  if ( ship->docked )
    count++;

  for( dship = first_ship; dship; dship = dship->next )
    if( dship->docked && dship->docked == ship )
      count++;

  if ( ship->dockingports && count >= ship->dockingports )
    return FALSE;

  if ( ship->sclass < SHIP_PLATFORM )
    ports = ship->sclass + 1;

  if ( ship->sclass != SHIP_PLATFORM && count >= ports )
    return FALSE;

  return TRUE;
}

void dockship( CHAR_DATA *ch, SHIP_DATA *ship )
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

void transship(SHIP_DATA *ship, int destination)
{
  int origShipyard;


  if ( !ship )
    return;

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
    ship_from_spaceobject( ship, ship->spaceobject );

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
  long distance = -1, tempdistance;
  SHIP_DATA *target;
  SHIP_DATA *enemy = NULL;
  char buf[MAX_STRING_LENGTH];

  if ( !autofly(ship) || ship->sclass == SHIP_DEBRIS )
    return FALSE;

  for( target = first_ship; target; target = target->next )
    {
      if( !ship_in_range( ship, target ) )
        continue;

      if ( !str_cmp( ship->owner , "The Empire" ) )
        {
          if ( !str_cmp( target->owner , "The Rebel Alliance" ) || !str_cmp( target->owner , "The New Republic"))
            {
              tempdistance = ship_distance_to_ship( ship, target );

              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }

      if ( (!str_cmp( ship->owner , "The Rebel Alliance" )) || (!str_cmp( ship->owner , "The New Republic" )))
        {
          if ( !str_cmp( target->owner , "The Empire" ) )
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

      if ( !str_cmp( ship->owner , "Zsinj" ) )
        {
          if ( str_cmp(target->owner, "Zsinj") )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  enemy = target;
                }
            }
        }
      if ( !str_cmp( ship->owner , "Empire SpecOps" ) )
        {
          if ( str_cmp(target->owner, "Empire SpecOps") &&
               str_cmp(target->owner, "The Empire") &&
               target->type != SHIP_IMPERIAL )
            {
              tempdistance = ship_distance_to_ship( ship, target );
              if( distance == -1 || distance > tempdistance )
                {
                  distance = tempdistance;
                  sprintf( buf, "%ld %ld %s %s", distance, tempdistance, ship->name, target->name );
                  bug( buf );
                  enemy = target;
                }
            }
        }

    }

  if ( enemy )
    {
      target_ship( ship, enemy );
      return TRUE;
    }
  return FALSE;
}

ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *pexit, int fall )
{
  ROOM_INDEX_DATA *in_room;
  ROOM_INDEX_DATA *to_room;
  ROOM_INDEX_DATA *original;
  char buf[MAX_STRING_LENGTH];
  char *txt;
  char *dtxt;
  ch_ret retcode;
  short door, the_chance;
  bool drunk = FALSE;
  CHAR_DATA * rch;
  CHAR_DATA * next_rch;

  if ( !IS_NPC( ch ) )
    if ( IS_DRUNK( ch, 2 ) && ( ch->position != POS_SHOVE )
         && ( ch->position != POS_DRAG ) )
      drunk = TRUE;

  if ( drunk && !fall )
    {
      door = number_door();
      pexit = get_exit( get_room_index(ship->location), door );
    }

#ifdef DEBUG
  if ( pexit )
    {
      sprintf( buf, "drive_ship: %s to door %d", ch->name, pexit->vdir );
      log_string( buf );
    }
#endif

  retcode = rNONE;
  txt = NULL;

  in_room = get_room_index(ship->location);

  if ( !pexit || (to_room = pexit->to_room) == NULL )
    {
      if ( drunk )
        send_to_char( "You drive into a wall in your drunken state.\r\n", ch );
      else
        send_to_char( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  door = pexit->vdir;

  if ( IS_SET( pexit->exit_info, EX_WINDOW )
       &&  !IS_SET( pexit->exit_info, EX_ISDOOR ) )
    {
      send_to_char( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if (  IS_SET(pexit->exit_info, EX_PORTAL)
        && IS_NPC(ch) )
    {
      act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_NOMOB)
       && IS_NPC(ch) )
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
            act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
        }
      else
        {
          if ( drunk )
            send_to_char( "You hit a wall in your drunken state.\r\n", ch );
          else
            send_to_char( "Alas, you cannot go that way.\r\n", ch );
        }

      return rNONE;
    }

  if ( room_is_private( ch, to_room ) )
    {
      send_to_char( "That room is private right now.\r\n", ch );
      return rNONE;
    }

  if ( !IS_IMMORTAL(ch)
       &&  !IS_NPC(ch)
       &&  ch->in_room->area != to_room->area )
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
      else
        if ( ch->top_level > to_room->area->hi_hard_range )
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
           ||   to_room->sector_type == SECT_AIR
           ||   IS_SET( pexit->exit_info, EX_FLY ) )
        {
          if ( ship->sclass > CLOUD_CAR )
            {
              send_to_char( "You'd need to fly to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( in_room->sector_type == SECT_WATER_NOSWIM
           ||   to_room->sector_type == SECT_WATER_NOSWIM
	   ||   to_room->sector_type == SECT_WATER_SWIM
           ||   to_room->sector_type == SECT_UNDERWATER
           ||   to_room->sector_type == SECT_OCEANFLOOR )
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
      CHAR_DATA *ctmp;
      int count = 0;

      for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
        if ( ++count >= to_room->tunnel )
          {
            send_to_char( "There is no room for you in there.\r\n", ch );
            return rNONE;
          }
    }

  if ( fall )
    txt = "falls";
  else
    if ( !txt )
      {
        if (  ship->sclass < OCEAN_SHIP )
	  txt = "fly";
        else
          if ( ship->sclass == OCEAN_SHIP  )
            {
              txt = "float";
            }
          else
            if ( ship->sclass > OCEAN_SHIP  )
              {
                txt = "drive";
              }
      }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_speeders]) ;
  if ( number_percent( ) > the_chance )
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
    txt = "falls";
  else
    if (  ship->sclass < OCEAN_SHIP )
      txt = "flys in";
    else
      if ( ship->sclass == OCEAN_SHIP  )
        {
          txt = "floats in";
	}
      else
        if ( ship->sclass > OCEAN_SHIP  )
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
  int room = 0;

  for ( room = ship->firstroom ; room <= ship->lastroom ;room++ )
    {
      echo_to_room( color , get_room_index(room) , argument );
    }
}

void sound_to_ship( SHIP_DATA *ship, const char *argument )
{
  int roomnum = 0;

  for ( roomnum = ship->firstroom ; roomnum <= ship->lastroom ;roomnum++ )
    {
      ROOM_INDEX_DATA *room = get_room_index( roomnum );
      CHAR_DATA *vic = NULL;

      if ( room == NULL )
        continue;

      for ( vic = room->first_person; vic; vic = vic->next_in_room )
        {
          if ( !IS_NPC(vic) && IS_SET( vic->act, PLR_SOUND ) )
            send_to_char( argument, vic );
        }
    }
}

bool autofly( SHIP_DATA *ship )
{

  if (!ship)
    return FALSE;

  if ( ship->type == MOB_SHIP )
    return TRUE;

  if ( ship->autopilot )
    return TRUE;

  return FALSE;

}

void recharge_ships()
{
  SHIP_DATA *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  bool closeem = FALSE;
  int origthe_chance = 100;
  baycount++;

  if ( baycount >= 60 )
    {
      closeem = TRUE;
      baycount = 0;
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->sclass == SHIP_PLATFORM )
        if ( closeem && ship->guard )
          ship->bayopen = FALSE;

      if (ship->statet0 > 0)
        {
          ship->energy -= ship->statet0;
          ship->statet0 = 0;
        }
      if (ship->statei0 > 0)
        {
          ship->energy -= 10*ship->statei0;
          ship->statei0 = 0;
        }
      if (ship->statet1 > 0)
        {
	  ship->energy -= ship->statet1;
          ship->statet1 = 0;
        }
      if (ship->statet2 > 0)
        {
          ship->energy -= ship->statet2;
          ship->statet2 = 0;
        }
      if (ship->statet3 > 0)
        {
          ship->energy -= ship->statet3;
          ship->statet3 = 0;
        }
      if (ship->statet4 > 0)
        {
          ship->energy -= ship->statet4;
          ship->statet4 = 0;
        }
      if (ship->statet5 > 0)
        {
          ship->energy -= ship->statet5;
          ship->statet5 = 0;
        }
      if (ship->statet6 > 0)
        {
          ship->energy -= ship->statet6;
          ship->statet6 = 0;
        }
      if (ship->statet7 > 0)
        {
          ship->energy -= ship->statet7;
          ship->statet7 = 0;
        }
      if (ship->statet8 > 0)
        {
          ship->energy -= ship->statet8;
          ship->statet8 = 0;
        }
      if (ship->statet9 > 0)
        {
          ship->energy -= ship->statet9;
          ship->statet9 = 0;
        }
      if (ship->statet10 > 0)
        {
	  ship->energy -= ship->statet10;
          ship->statet10 = 0;
        }

      if( ship->docked && ship->docked->sclass == SHIP_PLATFORM )
        {
          if( ship->maxenergy - ship->energy > 500 )
            ship->energy += 500;
          else
            ship->energy = ship->maxenergy;
        }

      if (ship->missilestate == MISSILE_RELOAD_2)
        {
          ship->missilestate = MISSILE_READY;
          if ( ship->missiles > 0 )
            echo_to_room( AT_YELLOW, get_room_index(ship->gunseat), "Missile launcher reloaded.");
        }

      if (ship->missilestate == MISSILE_RELOAD )
        {
          ship->missilestate = MISSILE_RELOAD_2;
        }

      if (ship->missilestate == MISSILE_FIRED )
        ship->missilestate = MISSILE_RELOAD;

      if ( autofly(ship) )
        {
          if ( ship->spaceobject && ship->sclass != SHIP_DEBRIS )
            {
              if (ship->target0 && ship->statet0 != LASER_DAMAGED )
                {
                  int the_chance = 75;
                  SHIP_DATA * target = ship->target0;
                  int shots, guns;
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
                    guns = ship->lasers;

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
                                        damage_ship( target, ship, 100, 250 );
                                      else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
                                        damage_ship( target, ship, 50, 200 );
                                      else
					damage_ship( target, ship , 5 , 10 );
                                    }
                                  else if( whichguns == 1 )
                                    {
                                      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->name, target->name );
                                      echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->name);
                                      echo_to_cockpit( AT_BLOOD , target , buf );
                                      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                      if( ship->sclass == SHIP_PLATFORM )
                                        damage_ship( target, ship, -250, -100 );
                                      else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
                                        damage_ship( target, ship, -200, -50 );
                                      else
                                        damage_ship( target, ship , -10, -5 );
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
                                            damage_ship( target, ship, 100, 250 );
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
                                            damage_ship( target, ship, 50, 200 );
                                          else
                                            damage_ship( target, ship , 5 , 10 );
                                        }
                                      else
                                        {
                                          sprintf( buf, "Ion energy from %s hits %s." , ship->name, target->name );
                                          echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );
                                          sprintf( buf , "You are hit by an ion cannon from %s!" , ship->name);
                                          echo_to_cockpit( AT_BLOOD , target , buf );
                                          echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
                                          if( ship->sclass == SHIP_PLATFORM )
                                            damage_ship( target, ship, -250, -100 );
                                          else if( ship->sclass == CAPITAL_SHIP && target->sclass != CAPITAL_SHIP )
                                            damage_ship( target, ship, -200, -50 );
                                          else
                                            damage_ship( target, ship , -10, -5 );
					}
                                    }
                                }

                              ship->statet0++;

                              if ( autofly(target) && !target->target0)
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
      if ( ship->spaceobject && ship->energy > 0 && ship_is_disabled( ship ) && ship->sclass != SHIP_PLATFORM )
        ship->energy -= 100;
      else if ( ship->energy > 0 )
        ship->energy += ( 5 + ship->sclass*5 );
      else
        ship->energy = 0;

      if ( ship->chaff_released > 0 )
        ship->chaff_released = !ship->chaff_released;

      /* following was originaly to fix ships that lost their pilot
         in the middle of a manuever and are stuck in a busy state
         but now used for timed manouevers such as turning */

      if( ship->shipstate == SHIP_READY && ship->tracking == TRUE )
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
          echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Manuever complete.");
          ship->shipstate = SHIP_READY;
        }

      if (ship->shipstate == SHIP_BUSY_2)
        ship->shipstate = SHIP_BUSY_3;

      if (ship->shipstate == SHIP_BUSY)
        ship->shipstate = SHIP_BUSY_2;

      if (ship->shipstate == SHIP_LAND_2)
        landship( ship , ship->dest );

      if (ship->shipstate == SHIP_LAND)
        {
          approachland( ship, ship->dest );
          ship->shipstate = SHIP_LAND_2;
        }

      if (ship->shipstate == SHIP_LAUNCH_2)
        launchship( ship );

      if (ship->shipstate == SHIP_LAUNCH)
        ship->shipstate = SHIP_LAUNCH_2;

      if (ship->docking == SHIP_DOCK_2)
        dockship( ship->ch , ship );

      if (ship->docking == SHIP_DOCK)
        ship->docking = SHIP_DOCK_2;


      ship->shield = UMAX( 0 , ship->shield-1-ship->sclass);

      if (ship->autorecharge && ship->maxshield > ship->shield && ship->energy > 100)
        {
          recharge = UMIN( ship->maxshield-ship->shield, 10 + ship->sclass*10 );
          recharge = UMIN( recharge , ship->energy/2 -100 );
	  recharge = UMAX( 1, recharge );
          ship->shield += recharge;
          ship->energy -= recharge;
        }

      if ( autofly(ship) && ( ship->energy >= ((25+ship->sclass*25)*(2+ship->sclass) ) )
           && ((ship->maxshield - ship->shield) >= ( 25+ship->sclass*25 ) ) )
        {
          recharge  = 25+ship->sclass*25;
          recharge  = UMIN(  ship->maxshield-ship->shield , recharge );
          ship->shield += recharge;
          ship->energy -= ( recharge*2 + recharge * ship->sclass );
        }

      if (ship->shield > 0)
        {
          if (ship->energy < 200)
            {
              ship->shield = 0;
              echo_to_cockpit( AT_RED, ship,"The ships shields fizzle and die.");
              ship->autorecharge = FALSE;
            }
        }

      if ( ship->spaceobject && ship->currspeed > 0 )
        {
          sprintf( buf, "%d",
                   ship->currspeed );
          echo_to_room_dnr( AT_BLUE , get_room_index(ship->pilotseat),  "Speed: " );
          echo_to_room_dnr( AT_LBLUE , get_room_index(ship->pilotseat),  buf );
          sprintf( buf, "%.0f %.0f %.0f",
                   ship->pos.x , ship->pos.y, ship->pos.z );
          echo_to_room_dnr( AT_BLUE , get_room_index(ship->pilotseat),  "  Coords: " );
          echo_to_room( AT_LBLUE , get_room_index(ship->pilotseat),  buf );

          if ( ship->pilotseat != ship->coseat )
            {
              sprintf( buf, "%d",
                       ship->currspeed );
              echo_to_room_dnr( AT_BLUE , get_room_index(ship->coseat),  "Speed: " );
              echo_to_room_dnr( AT_LBLUE , get_room_index(ship->coseat),  buf );
              sprintf( buf, "%.0f %.0f %.0f",
                       ship->pos.x , ship->pos.y, ship->pos.z );
              echo_to_room_dnr( AT_BLUE , get_room_index(ship->coseat),  "  Coords: " );
              echo_to_room( AT_LBLUE , get_room_index(ship->coseat),  buf );
	    }
        }

      if ( ship->spaceobject )
        {
          too_close = ship->currspeed + 50;
          too_close = ship->currspeed + 50;

          for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
            if( spaceobj->name &&  str_cmp(spaceobj->name,"")
                && ship_distance_to_spaceobject( ship, spaceobj ) < too_close )
              {
                sprintf( buf, "Proximity alert: %s  %.0f %.0f %.0f", spaceobj->name,
                         spaceobj->pos.x, spaceobj->pos.y, spaceobj->pos.z);
                echo_to_room( AT_RED , get_room_index(ship->pilotseat),  buf );
              }

          for ( target = first_ship; target; target = target->next )
            {
              if( (target->docked && target->docked == ship) || (ship->docked &&  ship->docked == target ) )
                continue;

              if ( ship->docked && target->docked &&
                   target->docked == ship->docked )
                continue;

              target_too_close = too_close+target->currspeed;

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
                      echo_to_room( AT_RED, get_room_index(ship->pilotseat),
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
          echo_to_room_dnr( AT_BLUE, get_room_index(ship->gunseat),"Target: ");
          echo_to_room( AT_LBLUE , get_room_index(ship->gunseat),  buf );

          if (!ship_in_range( ship, ship->target0 ) )
            {
              echo_to_room( AT_LBLUE , get_room_index(ship->gunseat),  "Your target seems to have left.");
              ship->target0 = NULL;
            }
        }

      if (ship->target1 && ship->sclass <= SHIP_PLATFORM)
        {
          sprintf( buf, "%s   %.0f %.0f %.0f", ship->target1->name,
                   ship->target1->pos.x, ship->target1->pos.y,
                   ship->target1->pos.z );
          echo_to_room_dnr( AT_BLUE , get_room_index(ship->turret1), "Target: " );
          echo_to_room( AT_LBLUE , get_room_index(ship->turret1),  buf );

          if (!ship_in_range( ship, ship->target1 ) )
            ship->target1 = NULL;
        }

      if (ship->target2 && ship->sclass <= SHIP_PLATFORM)
        {
          sprintf( buf, "%s   %.0f %.0f %.0f", ship->target2->name,
                   ship->target2->pos.x, ship->target2->pos.y,
                   ship->target2->pos.z );
          echo_to_room_dnr( AT_BLUE, get_room_index(ship->turret2), "Target: " );
          echo_to_room( AT_LBLUE , get_room_index(ship->turret2),  buf );

          if (!ship_in_range( ship, ship->target2 ) )
            ship->target2 = NULL;
        }

      if (ship->energy < 100 && ship->spaceobject )
        {
          echo_to_cockpit( AT_RED , ship,  "Warning: Ship fuel low." );
	}

      ship->energy = URANGE( 0 , ship->energy, ship->maxenergy );
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->target0 && autofly(ship) )
        if( !ship_in_range( ship->target0, ship ) )
          {
            echo_to_room( AT_BLUE , get_room_index(ship->pilotseat), "Target left, returning to NORMAL condition.\r\n" );
            ship->currspeed = 0;
            ship->target0 = NULL;
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
              echo_to_room( AT_RED , get_room_index(ship->pilotseat), "Autotrack: Evading to avoid collision!\r\n" );

              if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
                ship->shipstate = SHIP_BUSY_3;
              else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
                ship->shipstate = SHIP_BUSY_2;
              else
                ship->shipstate = SHIP_BUSY;
            }
          else if ( !ship_is_facing_ship(ship, ship->target0)
                    && ship->docked == NULL && ship->shipstate != SHIP_DOCKED )
            {
              ship_set_course_to_ship( ship, ship->target0 );
              ship->energy -= ship->currspeed / 10;
              echo_to_room( AT_BLUE , get_room_index(ship->pilotseat), "Autotracking target... setting new course.\r\n" );

	      if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
                ship->shipstate = SHIP_BUSY_3;
              else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
                ship->shipstate = SHIP_BUSY_2;
              else
                ship->shipstate = SHIP_BUSY;
            }
        }

      if ( autofly(ship) && ship->sclass != SHIP_DEBRIS )
        {
          if ( ship->spaceobject )
            {
              check_hostile( ship );
              if (ship->target0 )
                {
                  int the_chance = 50;
                  int projectiles = -1;

                  if ( !ship->target0->target0 && autofly(ship->target0))
                    ship->target0->target0 = ship;

                  /* auto assist ships */

                  for ( target = first_ship; target; target = target->next)
                    {
                      if( ship_in_range( ship, target ) )
                        if ( autofly(target) && target->docked == NULL && target->shipstate != SHIP_DOCKED )
                          if ( !str_cmp ( target->owner , ship->owner ) && target != ship )
                            if ( target->target0 == NULL && ship->target0 != target )
                              {
                                target->target0 = ship->target0;
                                sprintf( buf , "You are being targetted by %s." , target->name);
                                echo_to_cockpit( AT_BLOOD , target->target0 , buf );
                                break;
                              }
                    }

                  target = ship->target0;
                  ship->autotrack = TRUE;
                  if( ship->sclass != SHIP_PLATFORM && !ship->guard
                      && ship->docked == NULL && ship->shipstate != SHIP_DOCKED )
                    ship->currspeed = ship->realspeed;
                  if ( ship->energy >200  )
		    ship->autorecharge=TRUE;


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

                          if( ( target->sclass == SHIP_PLATFORM || ( target->sclass == CAPITAL_SHIP && target->currspeed < 50 )) \
			      && ship->rockets > 0 )
                            projectiles = HEAVY_ROCKET;
                          else if ( ( target->sclass == MIDSIZE_SHIP || ( target->sclass == CAPITAL_SHIP) ) && ship->torpedos > 0\
				    )
                            projectiles = PROTON_TORPEDO;
                          else if ( ship->missiles < 0 && ship->torpedos > 0 )
                            projectiles = PROTON_TORPEDO;
                          else if ( ship->missiles < 0 && ship->rockets > 0 )
                            projectiles = HEAVY_ROCKET;
                          else if ( ship->missiles > 0 )
                            projectiles = CONCUSSION_MISSILE;
                          else
                            projectiles = -1;

                          if ( number_percent( ) > the_chance || projectiles == -1 )
                            {
                            }
                          else
                            {
                              new_missile( ship , target , NULL , projectiles );
                              if( projectiles == CONCUSSION_MISSILE ) ship->missiles--;
                              if( projectiles == PROTON_TORPEDO ) ship->torpedos--;
                              if( projectiles == HEAVY_ROCKET ) ship->rockets--;
                              sprintf( buf , "Incoming projectile from %s." , ship->name);
                              echo_to_cockpit( AT_BLOOD , target , buf );
                              sprintf( buf, "%s fires a projectile towards %s." , ship->name, target->name );
                              echo_to_nearby_ships( AT_ORANGE , target , buf , NULL );

			      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
                                ship->missilestate = MISSILE_RELOAD_2;
                              else
                                ship->missilestate = MISSILE_FIRED;
                            }
                        }
                    }

                  if( ship->missilestate ==  MISSILE_DAMAGED )
                    ship->missilestate =  MISSILE_READY;

                  if( ship->statet0 ==  LASER_DAMAGED )
                    ship->statet0 =  LASER_READY;

                  if( ship->statei0 ==  LASER_DAMAGED )
                    ship->statei0 =  LASER_READY;

                  if( ship_is_disabled( ship ) )
                    ship->shipstate =  SHIP_READY;
                }
              else
                ship->currspeed = 0;
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
            ship->missiles++;
	  if( ship->torpedos < ship->maxtorpedos )
            ship->torpedos++;
          if( ship->rockets < ship->maxrockets )
            ship->rockets++;
          if( ship->chaff < ship->maxchaff )
            ship->chaff++;
        }

      save_ship( ship );
    }
}

void echo_to_docked( int color, SHIP_DATA *ship, const char *argument )
{
  SHIP_DATA *dship = NULL;

  for( dship = first_ship; dship; dship = dship->next )
    if( dship->docked && dship->docked == ship)
      echo_to_cockpit( color, dship, argument );
}

void echo_to_cockpit( int color, SHIP_DATA *ship, const char *argument )
{
  int room = 0;

  for ( room = ship->firstroom ; room <= ship->lastroom ;room++ )
    {
      if ( room == ship->cockpit || room == ship->navseat
           || room == ship->pilotseat || room == ship->coseat
           || room == ship->gunseat || room == ship->engineroom
           || room == ship->turret1 || room == ship->turret2
           || room == ship->turret3 || room == ship->turret4
           || room == ship->turret5 || room == ship->turret6
           || room == ship->turret7 || room == ship->turret8
           || room == ship->turret9 || room == ship->turret0)
        echo_to_room( color , get_room_index(room) , argument );
    }
}

bool ship_in_range( SHIP_DATA *ship, SHIP_DATA *target )
{
  if (target && ship && target != ship )
    {
      if ( target->spaceobject && ship->spaceobject
           && target->shipstate != SHIP_LANDED
           && ship_distance_to_ship( ship, target ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 3 ) )
	{
	  return TRUE;
	}
    }

  return FALSE;
}

bool missile_in_range( SHIP_DATA *ship, MISSILE_DATA *missile )
{
  return missile && ship && ship->spaceobject
    && missile_distance_to_ship( missile, ship ) < 5000;
}

bool space_in_range( SHIP_DATA *ship, SPACE_DATA *object )
{
  return object && ship && ship->spaceobject
    && ship_distance_to_spaceobject( ship, object ) < 100000;
}

bool space_in_range_c( SHIP_DATA *ship, SPACE_DATA *object )
{
  return object && ship
    && ship_distance_to_spaceobject( ship, object ) < 10000;
}

bool space_in_range_h( SHIP_DATA *ship, SPACE_DATA *object )
{
  return object && ship
    && vector_distance( &object->pos, &ship->hyperpos ) < object->gravity * 5;
}

long int get_ship_value( SHIP_DATA *ship )
{
  long int price = 0;

  if (ship->sclass == FIGHTER_SHIP)
    price = 5000;
  else if (ship->sclass == MIDSIZE_SHIP)
    price = 50000;
  else if (ship->sclass == CAPITAL_SHIP)
    price = 500000;
  else
    price = 2000;

  if ( ship->sclass <= CAPITAL_SHIP )
    price += ship->manuever * 100 * ( 1 + ship->sclass );

  price += ship->tractorbeam * 100;
  price += ship->realspeed * 10;
  price += ship->astro_array * 5;
  price += 5 * ship->maxhull;
  price += 2 * ship->maxenergy;

  if (ship->maxenergy > 5000 )
    price += (ship->maxenergy-5000) * 20;

  if (ship->maxenergy > 10000 )
    price += (ship->maxenergy-10000) * 50;

  if (ship->maxhull > 1000)
    price += (ship->maxhull-1000) * 10;

  if (ship->maxhull > 10000)
    price += (ship->maxhull-10000) * 20;

  if (ship->maxshield > 200)
    price += (ship->maxshield-200) * 50;

  if (ship->maxshield > 1000)
    price += (ship->maxshield-1000) * 100;

  if (ship->realspeed > 100 )
    price += (ship->realspeed-100) * 500;

  if (ship->lasers > 5 )
    price += (ship->lasers-5) * 500;

  if (ship->maxshield)
    price += 1000 + 10 * ship->maxshield;

  if (ship->lasers)
    price += 500 + 500 * ship->lasers;

  if (ship->missiles )
    price += 250 * ship->missiles;
  else if (ship->torpedos )
    price += 500 * ship->torpedos;
  else if (ship->rockets )
    price += 1000 * ship->rockets;

  if (ship->turret1)
    price += 5000;

  if (ship->turret2)
    price += 5000;

  if (ship->hyperspeed)
    price += 1000 + ship->hyperspeed * 10;

  if (ship->hanger)
    price += ship->sclass == MIDSIZE_SHIP ? 50000 : 100000;

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
        fprintf( fpout, "%s\n", tship->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void save_ship( SHIP_DATA *ship )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !ship )
    {
      bug( "%s: null ship pointer!", __FUNCTION__ );
      return;
    }

  if ( ship->sclass == SHIP_DEBRIS )
    return;

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
      fprintf( fp, "Name         %s~\n",         ship->name         );
      fprintf( fp, "PersonalName         %s~\n", ship->personalname );
      fprintf( fp, "Filename     %s~\n",         ship->filename     );
      fprintf( fp, "Description  %s~\n",         ship->description  );
      fprintf( fp, "Owner        %s~\n",         ship->owner        );
      fprintf( fp, "Pilot        %s~\n",         ship->pilot        );
      fprintf( fp, "Copilot      %s~\n",         ship->copilot      );
      fprintf( fp, "Class        %d\n", ship->sclass             );
      fprintf( fp, "Tractorbeam  %d\n", ship->tractorbeam       );
      fprintf( fp, "Shipyard     %d\n", ship->shipyard          );
      fprintf( fp, "Hanger       %d\n", ship->hanger            );
      fprintf( fp, "Vx           %.0f\n",       ship->pos.x                );
      fprintf( fp, "Vy           %.0f\n",       ship->pos.y                );
      fprintf( fp, "Vz           %.0f\n",       ship->pos.z                );
      fprintf( fp, "Turret1      %d\n", ship->turret1           );
      fprintf( fp, "Turret2      %d\n", ship->turret2           );
      fprintf( fp, "Turret3      %d\n", ship->turret3           );
      fprintf( fp, "Turret4      %d\n", ship->turret4           );
      fprintf( fp, "Turret5      %d\n", ship->turret5           );
      fprintf( fp, "Turret6      %d\n", ship->turret6           );
      fprintf( fp, "Turret7      %d\n", ship->turret7           );
      fprintf( fp, "Turret8      %d\n", ship->turret8           );
      fprintf( fp, "Turret9      %d\n", ship->turret9           );
      fprintf( fp, "Turret0      %d\n", ship->turret0           );
      fprintf( fp, "Statet0      %d\n", ship->statet0           );
      fprintf( fp, "Statei0      %d\n", ship->statei0           );
      fprintf( fp, "Statet1      %d\n", ship->statet1           );
      fprintf( fp, "Statet2      %d\n", ship->statet2           );
      fprintf( fp, "Lasers       %d\n", ship->lasers            );
      fprintf( fp, "Missiles     %d\n", ship->missiles          );
      fprintf( fp, "Maxmissiles  %d\n", ship->maxmissiles       );
      fprintf( fp, "Rockets     %d\n",  ship->rockets           );
      fprintf( fp, "Maxrockets  %d\n",  ship->maxrockets        );
      fprintf( fp, "Torpedos     %d\n", ship->torpedos          );
      fprintf( fp, "Maxtorpedos  %d\n", ship->maxtorpedos       );
      fprintf( fp, "Lastdoc      %d\n", ship->lastdoc           );
      fprintf( fp, "Firstroom    %d\n", ship->firstroom         );
      fprintf( fp, "Lastroom     %d\n", ship->lastroom          );
      fprintf( fp, "Shield       %d\n", ship->shield            );
      fprintf( fp, "Maxshield    %d\n", ship->maxshield         );
      fprintf( fp, "Hull         %d\n", ship->hull              );
      fprintf( fp, "Maxhull      %d\n", ship->maxhull           );
      fprintf( fp, "Maxenergy    %d\n", ship->maxenergy         );
      fprintf( fp, "Hyperspeed   %d\n", ship->hyperspeed        );
      fprintf( fp, "Comm         %d\n", ship->comm              );
      fprintf( fp, "Chaff        %d\n", ship->chaff             );
      fprintf( fp, "Maxchaff     %d\n", ship->maxchaff          );
      fprintf( fp, "Sensor       %d\n", ship->sensor            );
      fprintf( fp, "Astro_array  %d\n", ship->astro_array       );
      fprintf( fp, "Realspeed    %d\n", ship->realspeed         );
      fprintf( fp, "Type         %d\n", ship->type              );
      fprintf( fp, "Cockpit      %d\n", ship->cockpit           );
      fprintf( fp, "Coseat       %d\n", ship->coseat            );
      fprintf( fp, "Pilotseat    %d\n", ship->pilotseat         );
      fprintf( fp, "Gunseat      %d\n", ship->gunseat           );
      fprintf( fp, "Navseat      %d\n", ship->navseat           );
      fprintf( fp, "Engineroom   %d\n",       ship->engineroom        );
      fprintf( fp, "Entrance     %d\n",       ship->entrance          );
      fprintf( fp, "Shipstate    %d\n", ship->shipstate         );
      fprintf( fp, "Missilestate %d\n", ship->missilestate      );
      fprintf( fp, "Energy       %d\n", ship->energy            );
      fprintf( fp, "Manuever     %d\n",       ship->manuever          );
      fprintf( fp, "Alarm        %d\n",       ship->alarm             );
      fprintf( fp, "Ions         %d\n",       ship->ions              );
      fprintf( fp, "Dockingports   %d\n",       ship->dockingports        );
      fprintf( fp, "Guard   %d\n",                   ship->guard        );
      fprintf( fp, "Home         %s~\n",      ship->home              );
      fprintf( fp, "End\n"                                              );
    }

  fclose( fp );
}

void fread_ship( SHIP_DATA *ship, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'A':
          KEY( "Astro_array",      ship->astro_array,       fread_number( fp ) );
          KEY( "Alarm",            ship->alarm,             fread_number( fp ) );
          break;

        case 'C':
          KEY( "Cockpit",     ship->cockpit,          fread_number( fp ) );
          KEY( "Coseat",     ship->coseat,          fread_number( fp ) );
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
          KEY( "Engineroom",    ship->engineroom,      fread_number( fp ) );
          KEY( "Entrance",      ship->entrance,         fread_number( fp ) );
          KEY( "Energy",      ship->energy,        fread_number( fp ) );

          if ( !str_cmp( word, "End" ) )
            {
              if (!ship->home)
                ship->home              = STRALLOC( "" );

              if (!ship->name)
                ship->name              = STRALLOC( "" );

	      if (!ship->owner)
                ship->owner             = STRALLOC( "" );

              if (!ship->description)
                ship->description       = STRALLOC( "" );

              if (!ship->copilot)
                ship->copilot   = STRALLOC( "" );

              if (!ship->pilot)
                ship->pilot     = STRALLOC( "" );

              if (!ship_is_disabled( ship ))
                ship->shipstate = SHIP_LANDED;

              if (ship->statet0 != LASER_DAMAGED)
                ship->statet0 = LASER_READY;

              if (ship->statei0 != LASER_DAMAGED)
                ship->statei0 = LASER_READY;

              if (ship->statet1 != LASER_DAMAGED)
                ship->statet1 = LASER_READY;

              if (ship->statet2 != LASER_DAMAGED)
                ship->statet2 = LASER_READY;

              if (ship->statet3 != LASER_DAMAGED)
                ship->statet3 = LASER_READY;

              if (ship->statet4 != LASER_DAMAGED)
                ship->statet4 = LASER_READY;

              if (ship->statet5 != LASER_DAMAGED)
                ship->statet5 = LASER_READY;

              if (ship->statet6 != LASER_DAMAGED)
                ship->statet6 = LASER_READY;

              if (ship->statet7 != LASER_DAMAGED)
                ship->statet7 = LASER_READY;

              if (ship->statet8 != LASER_DAMAGED)
                ship->statet8 = LASER_READY;

	      if (ship->statet9 != LASER_DAMAGED)
                ship->statet9 = LASER_READY;

              if (ship->statet10 != LASER_DAMAGED)
                ship->statet10 = LASER_READY;

              if (ship->missilestate != MISSILE_DAMAGED)
                ship->missilestate = MISSILE_READY;

              if (ship->shipyard <= 0)
                ship->shipyard = ROOM_LIMBO_SHIPYARD;

              if (ship->lastdoc <= 0)
                ship->lastdoc = ship->shipyard;

              ship->bayopen     = FALSE;
              ship->autopilot   = FALSE;
              ship->hatchopen = FALSE;
              ship->tractored    = NULL;
              ship->tractoredby = NULL;

              if (ship->navseat <= 0)
                ship->navseat = ship->cockpit;

              if (ship->gunseat <= 0)
                ship->gunseat = ship->cockpit;

              if (ship->coseat <= 0)
                ship->coseat = ship->cockpit;

              if (ship->pilotseat <= 0)
                ship->pilotseat = ship->cockpit;

              if (ship->missiletype == 1)
                {
                  ship->torpedos = ship->missiles;    /* for back compatability */
                  ship->missiles = 0;
                }

              ship->spaceobject = NULL;
              ship->in_room=NULL;
              ship->next_in_room=NULL;
              ship->prev_in_room=NULL;
              ship->tcount = 0;

	      if( ship->sclass < SHIP_PLATFORM )
                ship->bayopen = FALSE;

              return;
            }
          break;

        case 'F':
          KEY( "Filename",      ship->filename,         fread_string_nohash( fp ) );
          KEY( "Firstroom",   ship->firstroom,        fread_number( fp ) );
          break;

        case 'G':
          KEY( "Guard",     ship->guard,          fread_number( fp ) );
          KEY( "Gunseat",     ship->gunseat,          fread_number( fp ) );
          break;

        case 'H':
          KEY( "Home" , ship->home, fread_string( fp ) );
          KEY( "Hyperspeed",   ship->hyperspeed,      fread_number( fp ) );
          KEY( "Hull",      ship->hull,        fread_number( fp ) );
          KEY( "Hanger",  ship->hanger,      fread_number( fp ) );
          break;

        case 'I':
          KEY( "Ions" , ship->ions, fread_number( fp ) );
          break;

        case 'L':
          KEY( "Laserstr",   ship->lasers,   (short)  ( fread_number( fp )/10 ) );
          KEY( "Lasers",   ship->lasers,      fread_number( fp ) );
          KEY( "Lastdoc",    ship->lastdoc,       fread_number( fp ) );
          KEY( "Lastroom",   ship->lastroom,        fread_number( fp ) );
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
          KEY( "Navseat",     ship->navseat,          fread_number( fp ) );
          break;

        case 'O':
          KEY( "Owner",            ship->owner,            fread_string( fp ) );
          break;

        case 'P':
          KEY( "PersonalName",  ship->personalname,             fread_string( fp ) );
          KEY( "Pilot",            ship->pilot,            fread_string( fp ) );
          KEY( "Pilotseat",     ship->pilotseat,          fread_number( fp ) );
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
          KEY( "Statei0",   ship->statet0,        fread_number( fp ) );
          KEY( "Statet0",   ship->statet0,        fread_number( fp ) );
          KEY( "Statet1",   ship->statet1,        fread_number( fp ) );
          KEY( "Statet2",   ship->statet2,        fread_number( fp ) );
          KEY( "Statet3",   ship->statet3,        fread_number( fp ) );
          KEY( "Statet4",   ship->statet4,        fread_number( fp ) );
          KEY( "Statet5",   ship->statet5,        fread_number( fp ) );
          KEY( "Statet6",   ship->statet6,        fread_number( fp ) );
          KEY( "Statet7",   ship->statet7,        fread_number( fp ) );
          KEY( "Statet8",   ship->statet8,        fread_number( fp ) );
          KEY( "Statet9",   ship->statet9,        fread_number( fp ) );
          KEY( "Statet10",   ship->statet10,        fread_number( fp ) );
          break;

        case 'T':
          KEY( "Type",  ship->type,     fread_number( fp ) );
	  KEY( "Tractorbeam", ship->tractorbeam,      fread_number( fp ) );
          KEY( "Turret1",       ship->turret1,  fread_number( fp ) );
          KEY( "Turret2",       ship->turret2,  fread_number( fp ) );
          KEY( "Turret3",  ship->turret3, fread_number( fp ) );
          KEY( "Turret4",  ship->turret4, fread_number( fp ) );
          KEY( "Turret5",  ship->turret5, fread_number( fp ) );
          KEY( "Turret6",  ship->turret6, fread_number( fp ) );
          KEY( "Turret7",  ship->turret7, fread_number( fp ) );
          KEY( "Turret8",  ship->turret8, fread_number( fp ) );
          KEY( "Turret9",  ship->turret9, fread_number( fp ) );
          KEY( "Turret0",  ship->turret0, fread_number( fp ) );
          KEY( "Torpedos",      ship->torpedos, fread_number( fp ) );
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

bool load_ship_file( const char *shipfile )
{
  char filename[256];
  SHIP_DATA *ship = NULL;
  FILE *fp = NULL;
  bool found = FALSE;

#if 0
  bool found, isbus = FALSE;
  int bus;
#endif

  ROOM_INDEX_DATA *pRoomIndex = NULL;
  CLAN_DATA *clan = NULL;

  CREATE( ship, SHIP_DATA, 1 );

  sprintf( filename, "%s%s", SHIP_DIR, shipfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = TRUE;

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
      DISPOSE( ship );
    }
  else
    {
      LINK( ship, first_ship, last_ship, next, prev );

      ship->docking = SHIP_READY;

      if( !(ship->dockingports) )
        ship->dockingports = 0;

#if 0
      for( bus = 0; bus < MAX_BUS; bus++ )
        if( ship->cockpit == serin[bus].cockpitvnum )
          isbus = TRUE;
#endif

      if ( ( !str_cmp("Trainer", ship->owner)
             || !str_cmp("Public",ship->owner)
             || ship->type == MOB_SHIP ) ) /*&& !isbus ) */
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

          if( ship->personalname == NULL )
            ship->personalname = STRALLOC(ship->name);

          ship->currspeed=0;
          ship->energy=ship->maxenergy;
          ship->hull=ship->maxhull;
          ship->shield=0;

          ship->statet1 = LASER_READY;
          ship->statet2 = LASER_READY;
          ship->statet0 = LASER_READY;
          ship->statet3 = LASER_READY;
          ship->statet4 = LASER_READY;
          ship->statet5 = LASER_READY;
          ship->statet6 = LASER_READY;
          ship->statet7 = LASER_READY;
          ship->statet8 = LASER_READY;
          ship->statet9 = LASER_READY;
          ship->statet10 = LASER_READY;
          ship->missilestate = LASER_READY;
          ship->statettractor = SHIP_READY;
          ship->statetdocking = SHIP_READY;
          ship->docking = SHIP_READY;

          ship->currjump=NULL;
          ship->target0=NULL;
          ship->target1=NULL;
          ship->target2=NULL;
          ship->target3=NULL;
          ship->target4=NULL;
          ship->target5=NULL;
          ship->target6=NULL;
          ship->target7=NULL;
          ship->target8=NULL;
          ship->target9=NULL;
          ship->target10=NULL;

          ship->hatchopen = FALSE;
	  ship->bayopen = FALSE;

          ship->autorecharge = FALSE;
          ship->autotrack = FALSE;
          ship->autospeed = FALSE;
        }
      else if ( ( pRoomIndex = get_room_index( ship->lastdoc ) ) != NULL
                && ship->sclass != CAPITAL_SHIP && ship->sclass != SHIP_PLATFORM )
        {
          LINK( ship, pRoomIndex->first_ship, pRoomIndex->last_ship, next_in_room, prev_in_room );
          ship->in_room = pRoomIndex;
          ship->location = ship->lastdoc;
        }


      if ( ship->sclass == SHIP_PLATFORM || ship->type == MOB_SHIP || ship->sclass == CAPITAL_SHIP )
        {

          ship_to_spaceobject(ship, spaceobject_from_name(ship->home) );
          vector_set( &ship->head, 1, 1, 1 );

          if( ship->pos.x == 0 && ship->pos.y == 0 && ship->pos.z == 0 )
            {
              if ( ( ship->sclass == SHIP_PLATFORM
                     || ship->type == MOB_SHIP
                     || ship->sclass == CAPITAL_SHIP )
                   && ship->home )
                {
                  ship_to_spaceobject(ship, spaceobject_from_name(ship->home));
                  vector_init( &ship->pos );

                  if( ship->spaceobject )
                    {
                      vector_copy( &ship->pos, &ship->spaceobject->pos );
                    }

                  vector_randomize( &ship->pos, -5000, 5000 );
                  ship->shipstate = SHIP_READY;
                  ship->autopilot = TRUE;
                  ship->autorecharge = TRUE;
                  ship->shield = ship->maxshield;
                }
            }

          ship->shipstate = SHIP_READY;
	  ship->docking = SHIP_READY;
          ship->autopilot = TRUE;
          ship->autorecharge = TRUE;
          ship->shield = ship->maxshield;
        }

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft++;
          else
            clan->vehicles++;
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
  const char *filename = NULL;
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
      filename = feof( fpList ) ? "$" : fread_word( fpList );

      if ( filename[0] == '$' )
        break;

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
  ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->docked = NULL;

  if ( (ship->sclass != SHIP_PLATFORM && ship->sclass != CAPITAL_SHIP) && ship->type != MOB_SHIP )
    {
      extract_ship( ship );
      ship_to_room( ship , ship->shipyard );

      ship->location = ship->shipyard;
      ship->lastdoc = ship->shipyard;
      ship->shipstate = SHIP_LANDED;
    }

  if (ship->spaceobject)
    ship_from_spaceobject( ship, ship->spaceobject );

  ship->currspeed=0;
  ship->energy=ship->maxenergy;
  ship->hull=ship->maxhull;
  ship->shield=0;

  ship->statet1 = LASER_READY;
  ship->statet2 = LASER_READY;
  ship->statet0 = LASER_READY;
  ship->statet3 = LASER_READY;
  ship->statet4 = LASER_READY;
  ship->statet5 = LASER_READY;
  ship->statet6 = LASER_READY;
  ship->statet7 = LASER_READY;
  ship->statet8 = LASER_READY;
  ship->statet9 = LASER_READY;
  ship->statet10 = LASER_READY;
  ship->missilestate = LASER_READY;

  ship->currjump=NULL;
  ship->target0=NULL;
  ship->target1=NULL;
  ship->target2=NULL;
  ship->target3=NULL;
  ship->target4=NULL;
  ship->target5=NULL;
  ship->target6=NULL;
  ship->target7=NULL;
  ship->target8=NULL;
  ship->target9=NULL;
  ship->target10=NULL;

  ship->hatchopen = FALSE;
  ship->bayopen = FALSE;

  ship->autorecharge = FALSE;
  ship->autotrack = FALSE;
  ship->autospeed = FALSE;

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
          ship->home = STRALLOC( "Mon Calamari" );
        }
      else if ( ship->type == SHIP_IMPERIAL || ( ship->type == MOB_SHIP && !str_cmp(ship->owner, "the empire") ))
        {
          STRFREE( ship->home );
	  ship->home = STRALLOC( "coruscant" );
        }
      else if ( ship->type == SHIP_CIVILIAN)
        {
          STRFREE( ship->home );
          ship->home = STRALLOC( "corperate" );
        }
    }

  save_ship(ship);
}

void echo_to_nearby_ships( int color, SHIP_DATA *ship, const char *argument,
			   SHIP_DATA *ignore )
{
  SHIP_DATA *target = NULL;

  if (!ship->spaceobject)
    return;

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
    return NULL;

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
	return ship;

      if ( !str_cmp( name, ship->name ) )
        return ship;

      if( ship->personalname && nifty_is_name_prefix( name, ship->personalname ) )
	return ship;

      if ( nifty_is_name_prefix( name, ship->name ) )
        return ship;
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
  int  count = 0;

  if ( eShip == NULL )
    return NULL;

  for ( ship = first_ship ; ship; ship = ship->next )
    {
      if( !ship_in_range( eShip, ship ) )
        continue;

      if( !ship->spaceobject )
        continue;

      if( ship->personalname && !str_cmp( arg, ship->personalname ) )
        {
          count++;

          if( !number || count == number )
            return ship;
        }

      if ( !str_cmp( arg, ship->name ) )
        {
          count++;

          if( !number ||  count == number )
            return ship;
        }
    }

  count = 0;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( !ship_in_range( eShip, ship ) )
        continue;

      if( ship->personalname && nifty_is_name_prefix( arg, ship->personalname ) )
	{
	  count++;

	  if(  !number || count == number )
	    return ship;
	}

      if ( nifty_is_name_prefix( arg, ship->name ) )
        {
          count++;

          if(  !number || count == number )
            return ship;
        }
    }

  return NULL;
}

/*
 * Get pointer to ship structure from cockpit, turret, or entrance ramp vnum.
 */
SHIP_DATA *ship_from_cockpit( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->cockpit
           || vnum == ship->turret1
           || vnum == ship->turret2
           || vnum == ship->turret3
           || vnum == ship->turret4
           || vnum == ship->turret5
           || vnum == ship->turret6
           || vnum == ship->turret7
           || vnum == ship->turret8
           || vnum == ship->turret9
           || vnum == ship->turret0
           || vnum == ship->hanger
           || vnum == ship->pilotseat
           || vnum == ship->coseat
           || vnum == ship->navseat
           || vnum == ship->gunseat
           || vnum == ship->engineroom )
        {
          return ship;
        }
    }

  return NULL;
}

SHIP_DATA *ship_from_pilotseat( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->pilotseat )
      return ship;

  return NULL;
}

SHIP_DATA *ship_from_coseat( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->coseat )
      return ship;

  return NULL;
}

SHIP_DATA *ship_from_navseat( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->navseat )
      return ship;

  return NULL;
}

SHIP_DATA *ship_from_gunseat( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->gunseat )
      return ship;

  return NULL;
}

SHIP_DATA *ship_from_engine( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if (ship->engineroom)
        {
          if ( vnum == ship->engineroom )
            return ship;
        }
      else
        {
          if ( vnum == ship->cockpit )
            return ship;
        }
    }

  return NULL;
}

SHIP_DATA *ship_from_turret( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->gunseat
           || vnum == ship->turret1
           || vnum == ship->turret2
           || vnum == ship->turret3
           || vnum == ship->turret4
           || vnum == ship->turret5
           || vnum == ship->turret6
           || vnum == ship->turret7
           || vnum == ship->turret8
           || vnum == ship->turret9
           || vnum == ship->turret0 )
        {
          return ship;
        }
    }

  return NULL;
}

SHIP_DATA *ship_from_entrance( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->entrance )
      return ship;

  return NULL;
}

SHIP_DATA *ship_from_hanger( int vnum )
{
  SHIP_DATA *ship = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    if ( vnum == ship->hanger )
      return ship;

  return NULL;
}

void ship_to_spaceobject( SHIP_DATA *ship , SPACE_DATA *spaceobject )
{
  if( ship && spaceobject )
    {
      ship->spaceobject = spaceobject;
    }
}

void ship_from_spaceobject( SHIP_DATA *ship , SPACE_DATA *spaceobject )
{
  if ( spaceobject == NULL )
    return;

  if ( ship == NULL )
    return;

  ship->spaceobject = NULL;
}

bool is_rental( CHAR_DATA *ch , SHIP_DATA *ship )
{
  if ( !str_cmp("Public",ship->owner) )
    return TRUE;
  if ( !str_cmp("Trainer",ship->owner) )
    return TRUE;
  if ( ship->sclass == SHIP_TRAINER )
    return TRUE;

  return FALSE;
}

bool check_pilot( CHAR_DATA *ch , SHIP_DATA *ship )
{
  if ( !str_cmp(ch->name,ship->owner) || !str_cmp(ch->name,ship->pilot)
       || !str_cmp(ch->name,ship->copilot) || !str_cmp("Public",ship->owner)
       || !str_cmp("Trainer", ship->owner) )
    return TRUE;

  if ( !IS_NPC(ch) && ch->pcdata && ch->pcdata->clan )
    {
      if ( !str_cmp(ch->pcdata->clan->name,ship->owner) )
        {
          if ( !str_cmp(ch->pcdata->clan->leader,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number1,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number2,ch->name) )
            return TRUE;
          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
            return TRUE;
        }

      if ( !str_cmp(ch->pcdata->clan->name,ship->pilot) )
        {
          if ( !str_cmp(ch->pcdata->clan->leader,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number1,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number2,ch->name) )
            return TRUE;
          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
            return TRUE;
        }

      if ( !str_cmp(ch->pcdata->clan->name,ship->copilot) )
        {
          if ( !str_cmp(ch->pcdata->clan->leader,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number1,ch->name) )
            return TRUE;
          if ( !str_cmp(ch->pcdata->clan->number2,ch->name) )
            return TRUE;
          if ( ch->pcdata->bestowments && is_name( "pilot", ch->pcdata->bestowments) )
            return TRUE;
        }

    }

  return FALSE;
}

bool extract_ship( SHIP_DATA *ship )
{
  ROOM_INDEX_DATA *room;

  if ( ( room = ship->in_room ) != NULL )
    {
      UNLINK( ship, room->first_ship, room->last_ship, next_in_room, prev_in_room );
      ship->in_room = NULL;
    }

  return TRUE;
}

void damage_ship_ch( SHIP_DATA *ship , int min , int max , CHAR_DATA *ch )
{
  short ionFactor = 1;
  int dmg , shield_dmg;
  long xp;
  bool ions = FALSE;
  char  logbuf[MAX_STRING_LENGTH];
  char  buf[MAX_STRING_LENGTH];

  if ( min < 0 && max < 0 )
    {
      ions = TRUE;
      dmg = number_range( max*(-1), min*(-1) );
    }
  else
    dmg = number_range( min , max );

  if ( ions == TRUE )
    ionFactor = 2;

  xp = ( exp_level( get_level(ch, PILOTING_ABILITY ) + 1) - exp_level( get_level( ch, PILOTING_ABILITY ) ) ) / 25;
  xp = UMIN( get_ship_value( ship ) /100 , xp ) ;
  gain_exp( ch, PILOTING_ABILITY, xp );

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield , dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;
      if ( ship->shield == 0 )
        echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
    }

  if ( dmg > 0 )
    {
      if ( number_range(1, 100) <= 5*ionFactor && !ship_is_disabled( ship ) )
        {
          echo_to_cockpit( AT_BLOOD + AT_BLINK , ship , "Ships Drive DAMAGED!" );
          ship->shipstate = SHIP_DISABLED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->missilestate != MISSILE_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->missilestate = MISSILE_DAMAGED;
        }
      if ( number_range(1, 100) <= 2*ionFactor && ship->statet0 != LASER_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->gunseat) , "Lasers DAMAGED!" );
          ship->statet1 = LASER_DAMAGED;
        }
      if ( number_range(1, 100) <= 5*ionFactor && ship->statet1 != LASER_DAMAGED && ship->turret1 )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->turret1) , "Turret DAMAGED!" );
          ship->statet1 = LASER_DAMAGED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->statet2 != LASER_DAMAGED && ship->turret2 )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->turret2) , "Turret DAMAGED!" );
          ship->statet2 = LASER_DAMAGED;
        }
      if ( number_range(1, 100) <= 5*ionFactor && ship->statettractor != LASER_DAMAGED && ship->tractorbeam )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->pilotseat) , "Tractorbeam DAMAGED!" );
          ship->statettractor = LASER_DAMAGED;
        }
      if ( ions == FALSE )
	{
          ship->hull -= dmg * 5;
        }
    }

  if ( ship->hull <= 0 )
    {
      destroy_ship( ship , ch );
      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      sprintf( logbuf , "%s was just destroyed by %s." , buf, ch->name );
      log_string( logbuf );


      xp =  ( exp_level( get_level( ch, PILOTING_ABILITY ) + 1) - exp_level( get_level( ch, PILOTING_ABILITY ) ) );
      xp = UMIN( get_ship_value( ship ) , xp );
      gain_exp( ch, PILOTING_ABILITY, xp);
      ch_printf( ch, "&WYou gain %ld piloting experience!\r\n", xp );
      return;
    }

  if ( ship->hull <= ship->maxhull/20 )
    echo_to_cockpit( AT_BLOOD+ AT_BLINK , ship , "WARNING! Ship hull severely damaged!" );
}

void damage_ship( SHIP_DATA *ship , SHIP_DATA *assaulter, int min , int max )
{
  int dmg , shield_dmg;
  char buf[MAX_STRING_LENGTH];
  char logbuf[MAX_STRING_LENGTH];
  short ionFactor = 1;
  bool ions = FALSE;

  if ( min < 0 && max < 0 )
    {
      ions = TRUE;
      dmg = number_range( max*(-1), min*(-1) );
    }
  else
    dmg = number_range( min , max );

  if ( ions == TRUE )
    ionFactor = 2;

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield , dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;
      if ( ship->shield == 0 )
        echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
    }

  if ( ship->shield > 0 )
    {
      shield_dmg = UMIN( ship->shield , dmg );
      dmg -= shield_dmg;
      ship->shield -= shield_dmg;
      if ( ship->shield == 0 )
        echo_to_cockpit( AT_BLOOD , ship , "Shields down..." );
    }

  if ( dmg > 0 )
    {
      if ( number_range(1, 100) <= 5*ionFactor && !ship_is_disabled( ship ) )
        {
          echo_to_cockpit( AT_BLOOD + AT_BLINK , ship , "Ships Drive DAMAGED!" );
	  ship->shipstate = SHIP_DISABLED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->missilestate != MISSILE_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->gunseat) , "Ships Missile Launcher DAMAGED!" );
          ship->missilestate = MISSILE_DAMAGED;
        }
      if ( number_range(1, 100) <= 2*ionFactor && ship->statet0 != LASER_DAMAGED )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->gunseat) , "Lasers DAMAGED!" );
          ship->statet1 = LASER_DAMAGED;
        }
      if ( number_range(1, 100) <= 5*ionFactor && ship->statet1 != LASER_DAMAGED && ship->turret1 )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->turret1) , "Turret DAMAGED!" );
          ship->statet1 = LASER_DAMAGED;
        }

      if ( number_range(1, 100) <= 5*ionFactor && ship->statet2 != LASER_DAMAGED && ship->turret2 )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->turret2) , "Turret DAMAGED!" );
          ship->statet2 = LASER_DAMAGED;
        }
      if ( number_range(1, 100) <= 5*ionFactor && ship->statettractor != LASER_DAMAGED && ship->tractorbeam )
        {
          echo_to_room( AT_BLOOD + AT_BLINK , get_room_index(ship->pilotseat) , "Tractorbeam DAMAGED!" );
          ship->statettractor = LASER_DAMAGED;
        }
      if ( ions == FALSE )
        {
          ship->hull -= dmg * 5;
        }
    }

  ship->hull -= dmg * 5;

  if ( ship->hull <= 0 )
    {
      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      sprintf( logbuf , "%s was just destroyed by %s." , ship->name, (assaulter ? assaulter->personalname : "a collision" ));
      log_string( logbuf );
      destroy_ship( ship , NULL );
      return;
    }

  if ( ship->hull <= ship->maxhull/20 )
    echo_to_cockpit( AT_BLOOD+ AT_BLINK , ship , "WARNING! Ship hull severely damaged!" );
}

void destroy_ship( SHIP_DATA *ship , CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char logbuf[MAX_STRING_LENGTH];
  int  roomnum;
  ROOM_INDEX_DATA *room;
  OBJ_DATA *robj;
  CHAR_DATA *rch;
  SHIP_DATA *lship;

  if (!ship)
    return;

  sprintf( buf , "%s explodes in a blinding flash of light!", ship->name );
  echo_to_nearby_ships( AT_WHITE + AT_BLINK , ship , buf , NULL );

  if ( ship->sclass == FIGHTER_SHIP )

    echo_to_ship( AT_WHITE + AT_BLINK , ship , "A blinding flahs of light burns your eyes...");
  echo_to_ship( AT_WHITE , ship , "But before you have a the_chance to scream...\r\nYou are ripped apart as your spacecraft explo\
des...");

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

  for ( roomnum = ship->firstroom ; roomnum <= ship->lastroom ; roomnum++ )
    {
      room = get_room_index(roomnum);

      if (room != NULL)
        {
          rch = room->first_person;
          while ( rch )
            {
              if ( IS_IMMORTAL(rch) )
                {
                  char_from_room(rch);
                  char_to_room( rch, get_room_index(wherehome(rch)) );
                }
              else
                {
                  if ( ch )
                    raw_kill( ch , rch );
                  else
                    raw_kill( rch , rch );
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
      if ( !(ship->hanger) || (lship->location != ship->hanger) )
        continue;
      if ( lship->docked && lship->docked == ship )
        {
          lship->docked = NULL;
          ship->docking = SHIP_READY;
        }

      if ( ch )
        {
          sprintf( buf2, "%s(%s)", lship->name, lship->personalname );
          sprintf( logbuf , "%s was just destroyed by %s." , buf, ch->name );
          log_string( logbuf );
        }
      else
        {
          sprintf( buf2, "%s(%s)", lship->name, lship->personalname );
          sprintf( logbuf , "%s was just destroyed by a mob ship." , buf2);
          log_string( logbuf );
        }

      destroy_ship( lship, ch );
    }

  resetship(ship);
}

bool ship_to_room(SHIP_DATA *ship , int vnum )
{
  ROOM_INDEX_DATA *shipto;

  if ( (shipto=get_room_index(vnum)) == NULL )
    return FALSE;
  LINK( ship, shipto->first_ship, shipto->last_ship, next_in_room, prev_in_room );
  ship->in_room = shipto;
  return TRUE;
}

bool rent_ship( CHAR_DATA *ch , SHIP_DATA *ship )
{
  long price = 0;

  if ( IS_NPC ( ch ) )
    return FALSE;

  price = get_ship_value( ship )/100;

  if ( ch->gold < price )
    {
      ch_printf(ch, "&RRenting this ship costs %ld. You don't have enough credits!\r\n" , price );
      return FALSE;
    }

  ch->gold -= price;
  ch_printf(ch, "&GYou pay %ld credits to rent the ship.\r\n" , price );
  return TRUE;
}

void do_jumpvector( CHAR_DATA *ch, char *argument )
{
  int the_chance, num;
  float randnum;
  Vector3 projected;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  num = number_range( 1, 16 );
  randnum = 1.0/(float) num;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou have to be in realspace to do that!\r\n", ch);
      return;
    }

  target = get_ship( argument );
  if ( !target )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  if ( target == ship )
    {
      send_to_char( "You can figure out where you are going on your own.\r\n", ch );
      return;
    }

  if (!ship_was_in_range( ship, target ))
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }
  if (target->shipstate == SHIP_LANDED)
    {
      send_to_char( "No log for that ship.\r\n", ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_jumpvector]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant figure out the course vectors correctly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  if( ship_is_in_hyperspace( ship ) )
    {
      projected.x = (target->pos.x - target->originpos.x)*randnum;
      projected.y = (target->pos.y - target->originpos.y)*randnum;
      projected.z = (target->pos.z - target->originpos.z)*randnum;

      send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
      sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
	      target->name, projected.x, projected.y, projected.z );
      echo_to_cockpit( AT_BLOOD, ship , buf );
      learn_from_success( ch, gsn_jumpvector );
      return;
    }

  projected.x = (target->hyperpos.x - target->originpos.x)*randnum;
  projected.y = (target->hyperpos.y - target->originpos.y)*randnum;
  projected.z = (target->hyperpos.z - target->originpos.z)*randnum;

  send_to_char("After some deliberation, you figure out its projected course.\r\n", ch);
  sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
	  target->name, projected.x, projected.y, projected.z  );
  echo_to_cockpit( AT_BLOOD, ship , buf );
  learn_from_success( ch, gsn_jumpvector );
}

void do_reload( CHAR_DATA *ch, char *argument )
{
  /* Reload code added by Darrik Vequir */
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship;
  short price = 0;

  strcpy( arg, argument );

  if (arg[0] == '\0')
    {
      send_to_char("&RYou need to specify a target!\r\n",ch);
      return;
    }

  if ( ( ship = ship_in_room( ch->in_room , argument ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if (ship_is_disabled( ship ) )
    price += 200;
  if ( ship->missilestate == MISSILE_DAMAGED )
    price += 100;
  if ( ship->statet0 == LASER_DAMAGED )
    price += 50;
  if ( ship->statet1 == LASER_DAMAGED )
    price += 50;
  if ( ship->statet2 == LASER_DAMAGED )
    price += 50;

  if ( ch->pcdata && ch->pcdata->clan && !str_cmp(ch->pcdata->clan->name,ship->owner) )
    {
      if ( ch->pcdata->clan->funds < price )
        {
          ch_printf(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->pcdata->clan->name );
          return;
        }

      ch->pcdata->clan->funds -= price;
      ch_printf(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->clan->name, price );
    }
  else if ( str_cmp( ship->owner , "Public" ) )
    {
      if ( ch->gold < price )
        {
          ch_printf(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
          return;
        }

      ch->gold -= price;
      ch_printf(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
    }

  ship->energy = ship->maxenergy;
  ship->shield = 0;
  ship->autorecharge = FALSE;
  ship->autotrack = FALSE;
  ship->autospeed = FALSE;
  ship->hull = ship->maxhull;

  ship->missilestate = MISSILE_READY;
  ship->statet0 = LASER_READY;
  ship->statet1 = LASER_READY;
  ship->statet2 = LASER_READY;
  ship->shipstate = SHIP_LANDED;

  return;

}

void do_openbay( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( ship_from_pilotseat(ch->in_room->vnum) == NULL
       && ship_from_hanger(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( ship_from_pilotseat(ch->in_room->vnum) )
    ship = ship_from_pilotseat(ch->in_room->vnum);
  else
    ship = ship_from_hanger(ch->in_room->vnum);

  if ( ship->hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == TRUE)
    {
      send_to_char("Bay doors are already open!",ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = TRUE;

  echo_to_cockpit( AT_YELLOW , ship, "Bay Doors Open");
  send_to_char("You open the bay doors", ch);
  sprintf( buf ,"%s's bay doors open." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void do_closebay( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  if ( ship_from_pilotseat(ch->in_room->vnum) == NULL
       && ship_from_hanger(ch->in_room->vnum) == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair or hanger of a ship!\r\n",ch);
      return;
    }

  if ( ship_from_pilotseat(ch->in_room->vnum) )
    ship = ship_from_pilotseat(ch->in_room->vnum);
  else
    ship = ship_from_hanger(ch->in_room->vnum);

  if ( ship->hanger == 0 )
    {
      send_to_char("&RThis ship has no hanger!\r\n",ch);
      return;
    }

  if (ship->bayopen == FALSE)
    {
      send_to_char("Bay doors are already closed!", ch);
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  ship->bayopen = FALSE;

  echo_to_cockpit( AT_YELLOW , ship, "Bay Doors close");
  send_to_char("You close the bay doors.", ch);
  sprintf( buf ,"%s's bay doors close." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void do_tractorbeam(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->sclass > SHIP_PLATFORM )
        {
          send_to_char("&RThis isn't a spacecraft!\r\n",ch);
          return;
        }
      if ( !ship->tractorbeam )
        {
          send_to_char("&RThis craft does not have a tractorbeam!\r\n",ch);
          return;
        }



      if ( ship_is_in_hyperspace( ship ) || !ship->spaceobject )
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if (ship->docking != SHIP_READY )
        {
          send_to_char("&RThe ship structure can not tolerate pressure from both tractorbeam and docking port.\r\n",ch);
          return;
        }
      if (ship->shipstate == SHIP_TRACTORED)
        {
          send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
          return;
        }

      if ( autofly(ship) )
        {
          send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
          return;
        }

      if (arg[0] == '\0')
        {
          send_to_char("&RYou need to specify a target!\r\n",ch);
          return;
        }

      if ( !str_cmp( arg, "none") )
        {
          send_to_char("&GTractorbeam set to no target.\r\n",ch);
          if( ship->tractored && ship->tractored->tractoredby == ship )
            {
              ship->tractored->tractoredby = NULL;
              if( ship->tractored->location )
                ship->tractored->shipstate = SHIP_LANDED;
              else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                        !ship_is_disabled( ship->tractored ) )
                ship->tractored->shipstate = SHIP_READY;

            }
          ship->tractored = NULL;
          return;
        }

      if( ship->tractored )
        {
          send_to_char("&RReleasing previous target.\r\n",ch);
          ship->tractored->tractoredby = NULL;
          if( ship->tractored->location )
            ship->tractored->shipstate = SHIP_LANDED;
          else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                    !ship_is_disabled( ship->tractored ) )
            ship->tractored->shipstate = SHIP_READY;
        }


      target = get_ship_here( arg, ship );


      if (  target == NULL )
        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          send_to_char("&RYou can't tractor your own ship!\r\n",ch);
          return;
        }

      if ( !str_cmp(ship->owner, "Trainer") && str_cmp(target->owner, "Trainer") )
        {
          send_to_char("&RTrainers can only target other trainers!!\r\n",ch);
          return;
        }
      if ( str_cmp(ship->owner, "Trainer") && !str_cmp(target->owner, "Trainer") )
        {
          send_to_char("&ROnly trainers can target other trainers!!\r\n",ch);
          return;
        }

      if ( ship->energy < (25 + 25*target->sclass) )
        {
          send_to_char("&RTheres not enough fuel!\r\n",ch);
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
        {
	  if ( ship_distance_to_ship( ship, target ) > 100+ship->tractorbeam )
            {
              send_to_char("&RThat ship is too far away to tractor.\r\n",ch);
              return;
            }
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_tractorbeam , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_tractorbeams );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
        return;
      send_to_char("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_coseat(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  target = get_ship_here( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

  the_chance += target->sclass - ship->sclass;
  the_chance += ship->currspeed - target->currspeed;
  the_chance += ship->manuever - target->manuever;
  the_chance -= ship_distance_to_ship( ship, target ) /(10*(target->sclass+1));
  the_chance /= 2;
  the_chance = URANGE( 1 , the_chance , 99 );

  if ( number_percent( ) >= the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_tractorbeams );
      return;
    }

  ship->tractored = target;
  target->tractoredby = ship;
  target->shipstate = SHIP_TRACTORED;
  ship->energy -= 25 + 25*target->sclass;

  if ( target->sclass <= ship->sclass )
    {
      target->currspeed = ship->tractorbeam/2;
      ship_set_course_to_ship( target, ship );
    }

  if ( target->sclass > ship->sclass )
    {
      ship->currspeed = ship->tractorbeam/2;
      ship_set_course_to_ship( ship, target );
    }

  send_to_char( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You have been locked in a tractor beam by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );

  sound_to_room( ch->in_room , "!!SOUND(targetlock)" );
  learn_from_success( ch, gsn_tractorbeams );

  if ( autofly(target) && !target->target0 && str_cmp( target->owner, ship->owner ) )
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      echo_to_cockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}

void do_adjusttractorbeam(CHAR_DATA *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship, *eShip;

  strcpy( arg, argument );

  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->tractored || ship->tractored->tractoredby != ship )
    {
      if ( ship->tractored && ship->tractored->tractoredby != ship )
        ship->tractored = NULL;
      send_to_char("&RYour tractor beam is not trained on a ship.\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      sprintf( buf, "&RCurrent tractor beam settings: ");
      if( ship->statettractor == SHIP_DISABLED )
        strcat( buf, "Disabled.\r\n" );
      if( ship->tractored == NULL )
        strcat( buf, "Deactivated.\r\n" );
      if( ship->tractored && ship->tractored->shipstate == SHIP_TRACTORED )
        strcat( buf, "Pulling Target.\r\n" );
      if( ship->tractored && ship->tractored->shipstate >= SHIP_DOCKED )
        strcat( buf, "Docking Port Approach.\r\n" );
      if( ship->tractored && ( ship->tractored->shipstate == SHIP_LAND_2 || ship->tractored->shipstate == SHIP_LAND ) )
        strcat( buf, "Hanger Approach.\r\n" );
      ch_printf(ch, "&RCurrent tractor beam settings: %s\r\n", buf);
      return;
    }

  eShip = ship->tractored;

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if( str_cmp( arg, "undock" ) && eShip->docked && eShip->docked != ship)
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on docked ship. Undock it first.\r\n" );
      return;
    }

  if( eShip->sclass >= ship->sclass )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on ship of a greater or equal mass as our own. It will not move.\r\n" );
      return;
    }

  if ( !eShip->spaceobject )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Target is on the ground. There is no need to adjust the tractor beam.\r\n" );
      return;
    }

  if ( !str_cmp( arg, "pull") || !str_cmp( arg, "none" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to pull target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }
  if ( !str_cmp( arg, "abort" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Manuever aborted. Tractor beam returned to default setting.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }

  if ( !str_cmp( arg, "dock") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to dock target.\r\n",ch);
          return;
        }

      if ( !candock( eShip ) || !candock( ship ) )
        {
          send_to_char("&RYou have no empty docking port.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to dock target.\r\n" );
      eShip->docking = SHIP_DOCK;
      eShip->docked = ship;
      return;
    }

  if ( !str_cmp( arg, "land") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it into your hanger.\r\n",ch);
          return;
        }

      if ( !ship->hanger )
        {
          send_to_char("&RYou have no hanger!\r\n",ch);
          return;
        }

      if( !ship->bayopen )
        {
          send_to_char("&RThe bay is not open.\r\n",ch);
          return;
        }

      if( ship->sclass < eShip->sclass || eShip->sclass == SHIP_PLATFORM || eShip->sclass == CAPITAL_SHIP )
        {
          send_to_char("&RThat ship can not land in your bay.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to land target.\r\n" );
      eShip->shipstate = SHIP_LAND;
      eShip->dest = STRALLOC(ship->name);
      return;
    }

  if ( !str_cmp( arg, "undock" ) )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it off its position.\r\n",ch);
          return;
        }

      if ( !eShip->docked )
        {
          send_to_char("&RYour target is not docked.\r\n",ch);
          return;
        }
      echo_to_cockpit( AT_YELLOW, ship, "Tractor beam set to undock target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked->statettractor = SHIP_DISABLED;
      eShip->statettractor = SHIP_DISABLED;
      echo_to_cockpit( AT_RED, eShip, "As a ship is torn from your docking bay, the clamps are damaged!." );
      echo_to_cockpit( AT_RED, ship, "As your ship is torn from the docking bay, the clamps are damaged!." );
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      return;
    }
}

void do_undock(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->docked && ship->tractoredby &&
       ship->docked != ship->tractoredby )
    {
      send_to_char("&RYou can not do that in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docked == NULL && ship->docking == SHIP_READY)
    {
      send_to_char("&RYou aren't docked!\r\n",ch);
      return;
    }

  eShip = ship->docked;

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_failure( ch, gsn_starfighters );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_failure( ch, gsn_midships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_failure( ch, gsn_capitalships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      return;
    }
  if( ship->docking == SHIP_DOCKED )
    echo_to_ship( AT_YELLOW , ship , "The ship unlocks the clamps and begins to drift away.");
  else
    echo_to_ship( AT_YELLOW , ship , "You abort the docking manuever.");

  if ( ship->location )
    ship->shipstate = SHIP_LANDED;
  else
    ship->shipstate = SHIP_READY;
  ship->docking = SHIP_READY;
  ship->currspeed = 0;
  ship->docked = NULL;

  if( eShip )
    {
      echo_to_ship( AT_YELLOW , eShip , "Ship undocking. Clamps released.");
      eShip->docked = NULL;
      eShip->currspeed = 0;
      if ( eShip->location )
        eShip->shipstate = SHIP_LANDED;
      else
        eShip->shipstate = SHIP_READY;
    }


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

void do_dock(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];

  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (! ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( (ship->autopilot || ship->type == MOB_SHIP)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if (ship->statetdocking == SHIP_DISABLED)
    {
      send_to_char("&RYour docking port is damaged. Get it repaired!\r\n",ch);
      return;
    }

  if (ship->docking == SHIP_DOCKED)
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (!candock(ship))
    {
      send_to_char("&RTry undocking first!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou are already docked!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_TRACTORED && ship->tractoredby && ship->tractoredby->sclass >= ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored )
    {
      send_to_char("&RThe ship structure can not tolerate stresses from both tractorbeam and docking port simultaneously.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->currspeed < 1 )
    {
      send_to_char("&RYou need to speed up a little first!\r\n",ch);
      return;
    }
  if ( ship->currspeed > 120 )
    {
      send_to_char("&RYou need to slow down first!\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      send_to_char("&RDock where?\r\n",ch);
      return;
    }

  eShip = get_ship_here( arg, ship );

  if (  eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }
  if (  eShip == ship )
    {
      send_to_char("&RYou can't dock with your own ship!\r\n",ch);
      return;
    }
  if( ship->sclass > eShip->sclass )
    {
      send_to_char("&RYou can not dock with a ship smaller than yours. Have them dock to you.\r\n",ch);
      return;
    }

  if (!candock(eShip))
    {
      send_to_char("&RYou can not seem to find an open docking port.\r\n",ch);
      return;
    }


  if ( eShip->currspeed >0 )
    {
      send_to_char("&RThey need to be at a dead halt for the docking maneuver to begin.\r\n",ch);
      return;
    }

  if ( autofly(eShip)  )
    {
      send_to_char("&RThe other ship needs to turn their autopilot off.\r\n",ch);
      return;
    }

  if ( ship_distance_to_ship(ship, eShip) > 100 )
    {
      send_to_char("&RYou aren't close enough to dock. Get a little closer first then try again.\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        {
          learn_from_failure( ch, gsn_starfighters );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == MIDSIZE_SHIP )
        {
          learn_from_failure( ch, gsn_midships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      if ( ship->sclass == CAPITAL_SHIP )
        {
          learn_from_failure( ch, gsn_capitalships );
          learn_from_failure( ch, gsn_shipdocking);
        }
      return;
    }
  echo_to_ship( AT_YELLOW , ship , "The ship slowly begins its docking maneveurs.");
  echo_to_ship( AT_YELLOW , eShip , "The ship slowly begins its docking maneveurs.");
  ship->docked = eShip;
  ship->docking= SHIP_DOCK;
  ship->ch = ch;
}

void do_request(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance = 0;
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  strcpy( arg, argument );

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&RRequest the opening of the baydoors of what ship?\r\n",ch);
      return;
    }

  eShip = get_ship_here(arg,ship);

  if ( eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      send_to_char("&RIf you have bay doors, why not open them yourself?\r\n",ch);
      return;
    }

  if ( eShip->hanger == 0 )
    {
      send_to_char("&RThat ship has no hanger!",ch);
      return;
    }

  if ( !autofly(eShip) )
    {
      send_to_char("&RThe other ship needs to have its autopilot turned on.\r\n",ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*(ship->sensor+10)*((eShip->sclass)+1))
    {
      send_to_char("&RThat ship is too far away to remotely open bay doors.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_fake_signal]);
  if ( (eShip->sclass == SHIP_PLATFORM ? 1 : (number_percent( ) >= the_chance)) && !check_pilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( eShip->bayopen == TRUE )
    {
      send_to_char("&RThat ship's bay doors are already open!\r\n",ch);
      return;
    }
  if ( the_chance && !check_pilot(ch, eShip) )
    learn_from_success(ch, gsn_fake_signal);

  send_to_char("&RYou open the bay doors of the remote ship.",ch);
  act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
  eShip->bayopen = TRUE;
  sprintf( buf ,"%s's bay doors open." , eShip->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
}

void do_shiptrack( CHAR_DATA *ch, char *argument)
{
  SHIP_DATA *ship;
  SPACE_DATA *spaceobject;
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument , arg);
  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can only do that in space!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "dist" ) )
    {
      ship->tcount = atoi(arg1);
      send_to_char("&RJump distance set!\r\n",ch);
      return;
    }

  if( !str_cmp( arg, "set" ) )
    {
      Vector3 head;

      if ( ship_is_in_hyperspace( ship ) )
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if( !is_number(arg1) || !is_number(arg2) || !is_number(arg3) )
        {
          send_to_char( "Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n", ch);
          return;
        }

      vector_set( &head, atoi(arg1), atoi(arg2), atoi(arg3) );
      sprintf( buf, "%.0f %.0f %.0f", ship->pos.x + head.x,
	       ship->pos.y + head.y, ship->pos.z + head.z );

      if( head.x < 1000 )
	head.x *= 10000;

      if( head.y < 1000 )
	head.y *= 10000;

      if( head.z < 1000 )
	head.z *= 10000;

      ship->trackvector.x = head.x;
      ship->trackvector.y = head.y;
      ship->trackvector.z = head.z;

      ship->tracking = TRUE;
      ship->ch = ch;
      do_trajectory( ch, buf);

      vector_set( &ship->jump, ship->pos.x + head.x,
		  ship->pos.y + head.y, ship->pos.z + head.z );

      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
        if( space_in_range( ship, spaceobject ) )
          {
            ship->currjump = spaceobject;
            break;
          }
      if( !spaceobject )
        ship->currjump = ship->spaceobject;

      if( ship->jump.x > MAX_COORD || ship->jump.y > MAX_COORD || ship->jump.z > MAX_COORD
	  || ship->jump.x < -MAX_COORD || ship->jump.y < -MAX_COORD || ship->jump.z < -MAX_COORD
	  || ship->pos.x > MAX_COORD || ship->pos.y > MAX_COORD || ship->pos.z > MAX_COORD
	  || ship->pos.x < -MAX_COORD || ship->pos.y < -MAX_COORD || ship->pos.z < -MAX_COORD
	  || ship->head.x > MAX_COORD || ship->head.y > MAX_COORD || ship->head.z > MAX_COORD
	  || ship->head.x < -MAX_COORD || ship->head.y < -MAX_COORD || ship->head.z < -MAX_COORD )
        {
          echo_to_cockpit( AT_RED, ship, "WARNING... Jump coordinates outside of the known galaxy.");
          echo_to_cockpit( AT_RED, ship, "WARNING... Hyperjump NOT set.");
          ship->currjump = NULL;
          ship->tracking = FALSE;
          return;
        }

      ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 50;
      ship->orighyperdistance = ship->hyperdistance;

      send_to_char( "Course laid in. Beginning tracking program.\r\n", ch);
      return;
    }

  if( !str_cmp( arg, "stop" ) || !str_cmp( arg, "halt" ))
    {
      ship->tracking = FALSE;
      send_to_char( "Tracking program cancelled.\r\n", ch);

      if( ship_is_in_hyperspace( ship ) )
        do_hyperspace( ch, "off" );
    }
}

void do_transship(CHAR_DATA *ch, char *argument)
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int arg3, origShipyard;
  SHIP_DATA *ship;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  ship = get_ship( arg1 );
  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  arg3 = atoi( arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: transship <ship> <vnum>\r\n", ch );
      return;
    }

  origShipyard = ship->shipyard;

  ship->shipyard = arg3;
  ship->shipstate = SHIP_READY;

  if ( ship->sclass == SHIP_PLATFORM && ship->type != MOB_SHIP )
    {
      send_to_char( "Only nonmob midship/starfighters", ch );
      return;
    }

  extract_ship( ship );
  ship_to_room( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    ship_from_spaceobject( ship, ship->spaceobject );



  save_ship(ship);

  send_to_char( "Ship Transfered.\r\n", ch );
}

void do_override(CHAR_DATA *ch, char *argument)
{

  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&ROverride the controls of what ship?\r\n", ch);
      return;
    }

  eShip = get_ship_here(arg,ship);

  if ( eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      send_to_char("&RYou are in the cockpit, just hit the controls!\r\n", ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if ( !check_pilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( !str_cmp( arg2, "shields" ) )
    {
      if( eShip->shield == 0 )
        {
          eShip->autorecharge=TRUE;
          send_to_char( "&GShields on. Confirmed.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->shield = 0;
          eShip->autorecharge=FALSE;
          send_to_char("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !str_cmp( arg2, "closebay" ) )
    {
      eShip->bayopen=FALSE;
      send_to_char( "&GBays Close. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "stop" ) )
    {
      eShip->currspeed = 0;
      send_to_char( "&GBraking Thrusters. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_GREY , eShip , "Braking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->name );
      echo_to_nearby_ships( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "autopilot" ) )
    {
      if ( ship->autopilot )
        {
          eShip->autopilot=FALSE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->autopilot )
        {
          eShip->autopilot=TRUE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !str_cmp( arg2, "openbay" ) )
    {
      send_to_char("&RYou open the bay doors of the remote ship.",ch);
      act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->bayopen = TRUE;
      sprintf( buf ,"%s's bay doors open." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
      return;
    }

  send_to_char("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  send_to_char("         openbay   closebay  stop  \r\n", ch);
  return;
}

void do_guard( CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;


  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ship->sclass != CAPITAL_SHIP  && ship->sclass != SHIP_PLATFORM )
    {
      send_to_char("&ROnly capital-class vessels and platforms have this feature.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if ( !str_cmp(argument,"on" ) )
    {
      ship->guard=TRUE;
      send_to_char( "&GYou activate the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->currspeed = 0;
    }
  else if ( !str_cmp(argument,"off" ) )
    {
      ship->guard=FALSE;
      send_to_char( "&GYou shutdown the guard system.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->guard == TRUE)
        {
          ship->guard=FALSE;
          send_to_char( "&GYou shutdown the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->guard=TRUE;
          send_to_char( "&GYou activate the guard system.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->currspeed = 0;
        }
    }

  learn_from_success( ch, gsn_shipsystems );
  return;
}

void do_sabotage(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance, change;
  SHIP_DATA *ship;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_engine(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the engine room of a ship to do that!\r\n",ch);
          return;
        }

      if ( str_cmp( argument , "hull" ) && str_cmp( argument , "drive" ) &&
           str_cmp( argument , "launcher" ) && str_cmp( argument , "laser" ) &&
           str_cmp( argument , "docking" ) && str_cmp( argument , "tractor" ) )
        {
          send_to_char("&RYou need to specify something to sabotage:\r\n",ch);
          send_to_char("&rTry: hull, drive, launcher, laser, docking, or tractor.\r\n",ch);
          return;
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_sabotage]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin your work.\r\n", ch);
          act( AT_PLAIN, "$n begins working on the ship's $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !str_cmp(arg,"hull") )
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , 1 );
          else
            add_timer ( ch , TIMER_DO_FUN , 15 , do_sabotage , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to figure out where to start.\r\n",ch);
      learn_from_failure( ch, gsn_sabotage );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
        return;
      send_to_char("&RYou are distracted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = ship_from_engine(ch->in_room->vnum)) == NULL )
    {
      return;
    }

  if ( !str_cmp(arg,"hull") )
    {
      change = URANGE( 0 ,
                       number_range( (int) ( ch->pcdata->learned[gsn_sabotage] / 2 ) , (int) (ch->pcdata->learned[gsn_sabotage]) ),
                       ( ship->hull ) );
      ship->hull -= change;
      ch_printf( ch, "&GSabotage complete.. Hull strength decreased by %d points.\r\n", change );
    }

  if ( !str_cmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_DISABLED;
      else if ( ship_is_in_hyperspace( ship ) )
        send_to_char("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n", ch);
      else
        ship->shipstate = SHIP_DISABLED;
      send_to_char("&GShips drive damaged.\r\n", ch);
    }

  if ( !str_cmp(arg,"docking") )
    {
      ship->statetdocking = SHIP_DISABLED;
      send_to_char("&GDocking bay sabotaged.\r\n", ch);
    }
  if ( !str_cmp(arg,"tractor") )
    {
      ship->statettractor = SHIP_DISABLED;
      send_to_char("&GTractorbeam sabotaged.\r\n", ch);
    }
  if ( !str_cmp(arg,"launcher") )
    {
      ship->missilestate = MISSILE_DAMAGED;
      send_to_char("&GMissile launcher sabotaged.\r\n", ch);
    }

  if ( !str_cmp(arg,"laser") )
    {
      ship->statet0 = LASER_DAMAGED;
      send_to_char("&GMain laser sabotaged.\r\n", ch);
    }

  act( AT_PLAIN, "$n finishes the work.", ch,
       NULL, argument , TO_ROOM );

  sprintf(buf, "%s has sabotaged %s!", ch->name, ship->name );
  bug(buf, 0);

  learn_from_success( ch, gsn_sabotage );

}

void do_fuel(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship, *eShip;
  int amount = 0;
  char arg1[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];


  argument = one_argument( argument, arg1 );

  if (  (ship = ship_from_hanger(ch->in_room->vnum))  == NULL )
    {
      if ( (ship = ship_from_entrance(ch->in_room->vnum)) == NULL )
        {
          send_to_char("&RYou must be in the hanger or the entrance of a ship to do that!\r\n",ch);
          return;
        }
    }

  if( arg1[0] == '\0' || !is_number(arg1) )
    {
      send_to_char( "Syntax: Fuel <amount> <ship>", ch);
      return;
    }

  if( argument[0] == '\0' || !str_cmp(argument, "" ))
    {
      if( !ship->docked )
        {
          for( eShip = first_ship; eShip; eShip = eShip->next )
            if( eShip->docked && eShip->docked == ship )
              break;
        }
      else
        eShip = ship->docked;
    }

  if( !eShip || eShip == NULL )
    {
      send_to_char( "Ship not docked. Fuel what ship?", ch );
      return;
    }

  amount = atoi(arg1);

  if( amount >= ship->energy )
    {
      send_to_char( "&RError: Ordered energy over current stock. Sending everything but 1 unit.\r\n", ch );
      amount = ship->energy - 1;
    }

  if( amount + eShip->energy > eShip->maxenergy )
    {
      send_to_char( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = eShip->maxenergy - eShip->energy;
    }

  if( ship->sclass != SHIP_PLATFORM )
    ship->energy -= amount;

  eShip->energy += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", eShip->name, amount );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", ship->energy );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );

}

void do_renameship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  CLAN_DATA *clan;
  if ( (ship = ship_from_cockpit( ch->in_room->vnum ) ) == NULL)
    {
      send_to_char( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = get_clan(ship->owner)) == NULL ) || str_cmp( clan->leader, ch->name ) )
    if( str_cmp( ship->owner, ch->name ) )
      {
        send_to_char( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( get_ship( argument ) != NULL )
    {
      send_to_char( "&RImperial Database: &WA ship already exists of that name.\r\n", ch);
      return;
    }


  if( ch->gold < 50000 )
    {
      send_to_char( "&RImperial Database: &WYou do not have enough credits for this request.\r\n", ch);
      return;
    }


  ch->gold -= 50000;
  STRFREE( ship->personalname );
  ship->personalname            = STRALLOC( argument );
  save_ship( ship );
  send_to_char( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}
