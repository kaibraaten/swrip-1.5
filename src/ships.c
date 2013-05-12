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
#include "mud.h"
#include "vector3_aux.h"

SHIP_DATA *first_ship = NULL;
SHIP_DATA *last_ship = NULL;

static int baycount = 0;

void fread_ship( SHIP_DATA *ship, FILE *fp );
bool load_ship_file( const char *shipfile );
void write_ship_list( void );
void resetship( SHIP_DATA *ship );
void approachland( SHIP_DATA *ship, const char *arg );
void landship( SHIP_DATA *ship, const char *arg );
void launchship( SHIP_DATA *ship );
ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *exit, int fall );
void sound_to_ship( SHIP_DATA *ship , const char *argument );
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
      xp =  (exp_level( ch->skill_level[PILOTING_ABILITY]+1) - exp_level( ch->skill_level[PILOTING_ABILITY])) ;
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

/* do_ commands follows */

void do_resetship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = get_ship( argument );

  if (ship == NULL)
    {
      send_to_char("&RNo such ship!",ch);
      return;
    }

  resetship( ship );

  if ( ( ship->sclass == SHIP_PLATFORM || ship->type == MOB_SHIP || ship->sclass == CAPITAL_SHIP )
       && ship->home )
    {
      vector_init( &ship->pos );
      ship_to_spaceobject(ship, spaceobject_from_name(ship->home) );

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

void do_setship( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  SHIP_DATA *ship = NULL;
  int tempnum = 0;
  ROOM_INDEX_DATA *roomindex = NULL;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: setship <ship> <field> <values>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "filename name personalname owner copilot pilot description home\r\n", ch );
      send_to_char( "cockpit entrance turret1 turret2 hanger\r\n", ch );
      send_to_char( "engineroom firstroom lastroom shipyard\r\n", ch );
      send_to_char( "manuever speed hyperspeed tractorbeam\r\n", ch );
      send_to_char( "lasers missiles shield hull energy chaff\r\n", ch );
      send_to_char( "comm sensor astroarray class torpedos\r\n", ch );
      send_to_char( "pilotseat coseat gunseat navseat rockets alarm\r\n", ch );
      send_to_char( "ions dockingports guard (0-1)\r\n", ch );
      return;
    }

  ship = get_ship( arg1 );

  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "owner" ) )
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
      ship->owner = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );

      if ( ship->type != MOB_SHIP && (clan = get_clan( ship->owner )) != NULL )
        {
          if ( ship->sclass <= SHIP_PLATFORM )
            clan->spacecraft++;
          else
            clan->vehicles++;
        }

      return;
    }

  if ( !str_cmp( arg2, "home" ) )
    {
      STRFREE( ship->home );
      ship->home = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "pilot" ) )
    {
      STRFREE( ship->pilot );
      ship->pilot = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "copilot" ) )
    {
      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "firstroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      ship->firstroom = tempnum;
      ship->lastroom = tempnum;
      ship->cockpit = tempnum;
      ship->coseat = tempnum;
      ship->pilotseat = tempnum;
      ship->gunseat = tempnum;
      ship->navseat = tempnum;
      ship->entrance = tempnum;
      ship->turret1 = 0;
      ship->turret2 = 0;
      ship->hanger = 0;
      send_to_char( "You will now need to set the other rooms in the ship.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "lastroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom )
        {
          send_to_char("The last room on a ship must be greater than or equal to the first room.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP && (tempnum - ship->firstroom) > 5 )
        {
          send_to_char("Starfighters may have up to 5 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP && (tempnum - ship->firstroom) > 25 )
        {
          send_to_char("Midships may have up to 25 rooms only.\r\n",ch);
          return;
        }

      if ( ship->sclass == CAPITAL_SHIP && (tempnum - ship->firstroom) > 100 )
        {
          send_to_char("Capital Ships may have up to 100 rooms only.\r\n",ch);
          return;
        }

      ship->lastroom = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "cockpit" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->cockpit = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "pilotseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
	}

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->pilotseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "coseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->coseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "navseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->navseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "gunseat" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
	{
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->gunseat = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "entrance" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      ship->entrance = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret1" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret2 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret1 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret2" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
	  return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }
      ship->turret2 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret3" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
	{
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret3 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret4" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
	}

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret4 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }


  if ( !str_cmp( arg2, "turret5" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
	  return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret5 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret6" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
	  send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret6 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret7" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret7 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret8" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret8 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret9" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }
      ship->turret9 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "turret0" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters can't have extra laser turrets.\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP )
        {
          send_to_char("Midships can't have more than 2 laser turrets.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->hanger || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->turret0 = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hanger" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL && atoi(argument) != 0 )
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if (( tempnum < ship->firstroom || tempnum > ship->lastroom ) && (atoi(argument) != 0 ))
        {
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->engineroom )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      if ( ship->sclass == FIGHTER_SHIP )
        {
          send_to_char("Starfighters are to small to have hangers for other ships!\r\n",ch);
          return;
        }

      ship->hanger = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "engineroom" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.\r\n",ch);
          return;
        }

      if ( tempnum < ship->firstroom || tempnum > ship->lastroom )
	{
          send_to_char("That room number is not in that ship .. \r\nIt must be between Firstroom and Lastroom.\r\n",ch);
          return;
        }

      if ( tempnum == ship->cockpit || tempnum == ship->entrance ||
           tempnum == ship->turret1 || tempnum == ship->turret2 || tempnum == ship->hanger )
        {
          send_to_char("That room is already being used by another part of the ship\r\n",ch);
          return;
        }

      ship->engineroom = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "shipyard" ) )
    {
      tempnum = atoi(argument);
      roomindex = get_room_index(tempnum);

      if (roomindex == NULL)
        {
          send_to_char("That room doesn't exist.",ch);
          return;
        }

      ship->shipyard = tempnum;
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( !str_cmp( argument, "rebel" ) )
        ship->type = SHIP_REBEL;
      else if ( !str_cmp( argument, "imperial" ) )
        ship->type = SHIP_IMPERIAL;
      else if ( !str_cmp( argument, "civilian" ) )
        ship->type = SHIP_CIVILIAN;
      else if ( !str_cmp( argument, "mob" ) )
        ship->type = MOB_SHIP;
      else
        {
          send_to_char( "Ship type must be either: rebel, imperial, civilian or mob.\r\n", ch );
          return;
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( ship->name );
      ship->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "personalname" ) )
    {
      if ( ship->personalname )
        STRFREE( ship->personalname );

      ship->personalname = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( ship->filename );
      ship->filename = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      write_ship_list( );
      return;
    }

  if ( !str_cmp( arg2, "desc" ) )
    {
      STRFREE( ship->description );
      ship->description = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "dockingports" ) )
    {
      ship->dockingports = URANGE( -1, atoi(argument) , 20 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "guard" ) )
    {
      ship->guard = URANGE( -1, atoi(argument) , 1 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "manuever" ) )
    {
      ship->manuever = URANGE( 0, atoi(argument) , 250 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "lasers" ) )
    {
      if ( ch->top_level == 105 )
        ship->lasers = URANGE( 0, atoi(argument) , 20 );
      else
        ship->lasers = URANGE( 0, atoi(argument) , 10 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "ions" ) )
    {
      if ( ch->top_level == 105 )
        ship->ions = URANGE( 0, atoi(argument) , 20 );
      else
        ship->ions = URANGE( 0, atoi(argument) , 10 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "class" ) )
    {
      ship->sclass = URANGE( 0, atoi(argument) , WALKER );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "missiles" ) )
    {
      ship->missiles = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "torpedos" ) )
    {
      ship->torpedos = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "rockets" ) )
    {
      ship->rockets = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "speed" ) )
    {
      if ( ch->top_level == 105 )
        ship->realspeed = URANGE( 0, atoi(argument) , 255 );
      else
	ship->realspeed = URANGE( 0, atoi(argument) , 150 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "tractorbeam" ) )
    {
      ship->tractorbeam = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hyperspeed" ) )
    {
      ship->hyperspeed = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "shield" ) )
    {
      if ( ch->top_level == 105 )
        ship->maxshield = URANGE( 0, atoi(argument) , 30000 );
      else
        ship->maxshield = URANGE( 0, atoi(argument) , 1000 );

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "hull" ) )
    {
      if ( ch->top_level == 105 )
        {
          ship->hull = URANGE( 1, atoi(argument) , 30000 );
          ship->maxhull = URANGE( 1, atoi(argument) , 30000 );
        }
      else
        {
          ship->hull = URANGE( 1, atoi(argument) , 20000 );
	  ship->maxhull = URANGE( 1, atoi(argument) , 20000 );
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "energy" ) )
    {
      ship->energy = URANGE( 1, atoi(argument) , 30000 );
      ship->maxenergy = URANGE( 1, atoi(argument) , 30000 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "sensor" ) )
    {
      ship->sensor = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "astroarray" ) )
    {
      ship->astro_array = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "comm" ) )
    {
      ship->comm = URANGE( 0, atoi(argument) , 255 );
      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( arg2, "chaff" ) )
    {
      if ( ch->top_level == 105 )
        {
	  ship->chaff = URANGE( 0, atoi(argument) , 255 );
        }
      else
        {
          ship->chaff = URANGE( 0, atoi(argument) , 25 );
        }

      send_to_char( "Done.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp(arg2,"alarm") )
    {
      ship->alarm = URANGE(0,atoi(argument),5);
      send_to_char("Done.\r\n",ch);
      save_ship(ship);
      return;
    }

  do_setship( ch, "" );
}

void do_showship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showship <ship>\r\n", ch );
      return;
    }

  ship = get_ship( argument );

  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  set_char_color( AT_YELLOW, ch );
  ch_printf( ch, "%s %s : %s (%s)\r\nFilename: %s\r\n",
             ship->type == SHIP_REBEL ? "Rebel Alliance" :
             (ship->type == SHIP_IMPERIAL ? "Imperial" :
              (ship->type == SHIP_CIVILIAN ? "Civilian" : "Mob" ) ),
             ship->sclass == FIGHTER_SHIP ? "Starfighter" :
             (ship->sclass == MIDSIZE_SHIP ? "Midship" :
              (ship->sclass == CAPITAL_SHIP ? "Capital Ship" :
               (ship->sclass == SHIP_PLATFORM ? "Platform" :
                (ship->sclass == CLOUD_CAR ? "Cloudcar" :
                 (ship->sclass == OCEAN_SHIP ? "Boat" :
                  (ship->sclass == LAND_SPEEDER ? "Speeder" :
                   (ship->sclass == WHEELED ? "Wheeled Transport" :
                    (ship->sclass == LAND_CRAWLER ? "Crawler" :
                     (ship->sclass == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             ship->name,
             ship->personalname,
             ship->filename);
  ch_printf( ch, "Home: %s   Description: %s\r\nOwner: %s   Pilot: %s   Copilot: %s\r\n",
             ship->home,  ship->description,
             ship->owner, ship->pilot,  ship->copilot );
  ch_printf( ch, "Current Jump Destination: %s  Jump Point: %s\r\n", (ship->currjump ? ship->currjump->name : "(null)"), (ship->lastsystem ? ship->lastsystem->name : "(null)" ));
  ch_printf( ch, "Firstroom: %d   Lastroom: %d",
             ship->firstroom,
             ship->lastroom);
  ch_printf( ch, "Cockpit: %d   Entrance: %d   Hanger: %d   Engineroom: %d\r\n",
             ship->cockpit,
             ship->entrance,
             ship->hanger,
             ship->engineroom);
  ch_printf( ch, "Pilotseat: %d   Coseat: %d   Navseat: %d  Gunseat: %d\r\n",
             ship->pilotseat,
             ship->coseat,
             ship->navseat,
             ship->gunseat);
  ch_printf( ch, "Location: %d   Lastdoc: %d   Shipyard: %d\r\n",
             ship->location,
             ship->lastdoc,
             ship->shipyard);
  ch_printf( ch, "Tractor Beam: %d   Comm: %d   Sensor: %d   Astro Array: %d\r\n",
             ship->tractorbeam,
             ship->comm,
	     ship->sensor,
             ship->astro_array);
  ch_printf( ch, "Lasers: %d  Ions: %d   Laser Condition: %s\r\n",
             ship->lasers, ship->ions,
             ship->statet0 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret1 )
    ch_printf( ch, "Turret One: %d  Condition: %s\r\n",
               ship->turret1,
               ship->statet1 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret2 )
    ch_printf( ch, "Turret Two: %d  Condition: %s\r\n",
               ship->turret2,
               ship->statet2 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret3 )
    ch_printf( ch, "Turret Three: %d  Condition: %s\r\n",
               ship->turret3,
               ship->statet3 == LASER_DAMAGED ? "Damaged" : "Good");

  if ( ship->turret4 )
    ch_printf( ch, "Turret Four: %d  Condition: %s\r\n",
               ship->turret4,
               ship->statet4 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret5 )
    ch_printf( ch, "Turret Five: %d  Condition: %s\r\n",
               ship->turret5,
               ship->statet5 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret6 )
    ch_printf( ch, "Turret Six: %d  Condition: %s\r\n",
               ship->turret6,
               ship->statet6 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret7 )
    ch_printf( ch, "Turret Seven: %d  Condition: %s\r\n",
               ship->turret7,
               ship->statet7 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret8 )
    ch_printf( ch, "Turret Eight: %d  Condition: %s\r\n",
               ship->turret8,
               ship->statet8 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret9 )
    ch_printf( ch, "Turret Nine: %d  Condition: %s\r\n",
               ship->turret9,
               ship->statet9 == LASER_DAMAGED ? "Damaged" : "Good");
  if ( ship->turret0 )
    ch_printf( ch, "Turret Ten: %d  Condition: %s\r\n",
               ship->turret0,
	       ship->statet10 == LASER_DAMAGED ? "Damaged" : "Good");

  ch_printf( ch, "Missiles: %d  Torpedos: %d  Rockets: %d  Condition: %s\r\n",
             ship->missiles,
             ship->torpedos,
             ship->rockets,
             ship->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");
  ch_printf( ch, "Hull: %d/%d  Ship Condition: %s\r\n",
             ship->hull,
             ship->maxhull,
             ship_is_disabled( ship ) ? "Disabled" : "Running");

  ch_printf( ch, "Shields: %d/%d   Energy(fuel): %d/%d   Chaff: %d \r\n",
             ship->shield,
             ship->maxshield,
             ship->energy,
             ship->maxenergy,
             ship->chaff );
  ch_printf( ch, "Current Coordinates: %.0f %.0f %.0f\r\n",
             ship->pos.x, ship->pos.y, ship->pos.z );
  ch_printf( ch, "Current Heading: %.0f %.0f %.0f\r\n",
             ship->head.x, ship->head.y, ship->head.z );
  ch_printf( ch, "Speed: %d/%d   Hyperspeed: %d   Manueverability: %d\r\n",
             ship->currspeed, ship->realspeed, ship->hyperspeed , ship->manuever );
  ch_printf( ch, "Docked: ");
  if ((ship->docked) != NULL)
    {
      ch_printf( ch, "with %s",ship->docked->name);
    }
  else
    {
      ch_printf( ch, "NO");
    }
  ch_printf(ch, "  Docking Ports: %d", ship->dockingports );
  ch_printf(ch, "  Alarm: %d   ",ship->alarm);
}

void do_makeship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeship <filename> <ship name>\r\n", ch );
      return;
    }

  CREATE( ship, SHIP_DATA, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  ship->name            = STRALLOC( argument );
  ship->personalname            = STRALLOC( argument );
  ship->description     = STRALLOC( "" );
  ship->owner   = STRALLOC( "" );
  ship->copilot       = STRALLOC( "" );
  ship->pilot         = STRALLOC( "" );
  ship->home          = STRALLOC( "" );
  ship->type          = SHIP_CIVILIAN;
  ship->spaceobject = NULL;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;
  ship->in_room=NULL;
  ship->next_in_room=NULL;
  ship->prev_in_room=NULL;
  ship->currjump=NULL;
  ship->target0=NULL;
  ship->target1=NULL;
  ship->target2=NULL;

  ship->filename = str_dup( arg );
  save_ship( ship );
  write_ship_list();
}

void do_copyship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  SHIP_DATA *old = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: copyship <oldshipname> <filename> <newshipname>\r\n", ch );
      return;
    }

  old = get_ship ( arg );

  if (!old)
    {
      send_to_char( "Thats not a ship!\r\n", ch );
      return;
    }

  CREATE( ship, SHIP_DATA, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  ship->name            = STRALLOC( argument );
  ship->description     = STRALLOC( "" );
  ship->owner   = STRALLOC( "" );
  ship->copilot       = STRALLOC( "" );
  ship->pilot         = STRALLOC( "" );
  ship->home          = STRALLOC( "" );
  ship->type          = old->type;
  ship->sclass         = old->sclass;
  ship->lasers        = old->lasers;
  ship->maxshield        = old->maxshield;
  ship->maxhull        = old->maxhull;
  ship->maxenergy        = old->maxenergy  ;
  ship->hyperspeed        = old->hyperspeed  ;
  ship->realspeed        = old->realspeed  ;
  ship->manuever        = old->manuever  ;
  ship->in_room=NULL;
  ship->next_in_room=NULL;
  ship->prev_in_room=NULL;
  ship->currjump=NULL;
  ship->target0=NULL;
  ship->target1=NULL;
  ship->target2=NULL;

  ship->filename         = str_dup(arg2);
  save_ship( ship );
  write_ship_list();
}

void do_ships( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  char pilottype[MAX_STRING_LENGTH];
  char pilottype2[MAX_STRING_LENGTH];
  int count = 0;
  bool owned = FALSE, set = FALSE;

  if ( !IS_NPC(ch) )
    {
      count = 0;
      send_to_pager( "&YThe following ships you have pilot access to:\r\n", ch );
      send_to_pager( "\r\n&WShip                                                   Owner\r\n",ch);
      for ( ship = first_ship; ship; ship = ship->next )
        {
          owned = FALSE, set = FALSE;
          if ( str_cmp(ship->owner, ch->name) )
            {
              if ( !check_pilot( ch, ship ) || !str_cmp(ship->owner, "public") || !str_cmp(ship->owner, "trainer") )
                continue;
            }

          if( ship->sclass > SHIP_PLATFORM )
            continue;

          if (ship->type == MOB_SHIP)
            continue;
          else if (ship->type == SHIP_REBEL)
            set_pager_color( AT_BLOOD, ch );
          else if (ship->type == SHIP_IMPERIAL)
            set_pager_color( AT_DGREEN, ch );
          else
            set_pager_color( AT_BLUE, ch );

          if( !str_cmp(ship->owner, ch->name ) )
            {
              strcpy( pilottype2, "Owner" );
	      owned = TRUE;
              set = TRUE;
            }

          if( !set && !str_cmp( ship->pilot, ch->name ) )
            {
              strcpy( pilottype2, "Pilot" );
              set = TRUE;
            }

          if( !set && !str_cmp( ship->pilot, ch->name ) )
            {
              strcpy( pilottype2, "Co-Pilot" );
              set = TRUE;
            }

          if( !set )
            {
              strcpy( pilottype2, "Clan-Pilot" );
              set = TRUE;
            }

          if( !owned )
            sprintf( pilottype, "(%s) - %s", pilottype2, ship->owner );
          else
            sprintf( pilottype, "(%s)", pilottype2 );

          sprintf( buf, "%s (%s)", ship->name, ship->personalname );

          if  ( ship->in_room )
            pager_printf( ch, "%-35s (%s) \n&R&W- %-24s&R&w \r\n", buf, ship->in_room->name, pilottype );
          else
            pager_printf( ch, "%-35s (%.0f %.0f %.0f) \r\n&R&W- %-35s&R&w\r\n", buf, ship->pos.x, ship->pos.y, ship->pos.z, pilottype );

          count++;
        }

      if ( !count )
        {
          send_to_pager( "There are no ships owned by you.\r\n", ch );
        }
    }

  count = 0;
  send_to_pager( "&Y\r\nThe following ships are docked here:\r\n", ch );
  send_to_pager( "\r\n&WShip                               Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->location != ch->in_room->vnum || ship->sclass > SHIP_PLATFORM)
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s (%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s %-15s", buf, ship->owner );

      if (ship->type == MOB_SHIP || ship->sclass == SHIP_PLATFORM )
        {
          pager_printf( ch, "\r\n");
          continue;
        }

      if ( !str_cmp(ship->owner, "Public") )
        {
          pager_printf( ch, "%ld to rent.\r\n", get_ship_value(ship)/100 );
        }
      else if ( str_cmp(ship->owner, "") )
        pager_printf( ch, "%s", "\r\n" );
      else
        pager_printf( ch, "%ld to buy.\r\n", get_ship_value(ship) );

      count++;
    }

  if ( !count )
    {
      send_to_pager( "There are no ships docked here.\r\n", ch );
    }
}

void do_speeders( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int count;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_NPC(ch) )
    {
      count = 0;
      send_to_pager( "&YThe following are owned by you or by your organization:\r\n", ch );
      send_to_pager( "\r\n&WVehicle                            Owner\r\n",ch);

      for ( ship = first_ship; ship; ship = ship->next )
        {
          if ( str_cmp(ship->owner, ch->name) )
            {
              if ( !ch->pcdata || !ch->pcdata->clan || str_cmp(ship->owner,ch->pcdata->clan->name) || ship->sclass <= SHIP_PLATFORM )
                continue;
            }

          if ( ship->location != ch->in_room->vnum || ship->sclass <= SHIP_PLATFORM)
            continue;

          if (ship->type == MOB_SHIP)
            continue;
          else if (ship->type == SHIP_REBEL)
            set_pager_color( AT_BLOOD, ch );
          else if (ship->type == SHIP_IMPERIAL)
            set_pager_color( AT_DGREEN, ch );
          else
            set_pager_color( AT_BLUE, ch );

          sprintf( buf, "%s(%s)", ship->name, ship->personalname );
          pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

          count++;
        }

      if ( !count )
        {
          send_to_pager( "There are no land or air vehicles owned by you.\r\n", ch );
        }
    }

  count =0;
  send_to_pager( "&Y\r\nThe following vehicles are parked here:\r\n", ch );
  send_to_pager( "\r\n&WVehicle                            Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->location != ch->in_room->vnum || ship->sclass <= SHIP_PLATFORM)
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

      if ( !str_cmp(ship->owner, "Public") )
        {
          pager_printf( ch, "%ld to rent.\r\n", get_ship_value(ship)/100 );
        }
      else if ( str_cmp(ship->owner, "") )
        pager_printf( ch, "%s", "\r\n" );
      else
        pager_printf( ch, "%ld to buy.\r\n", get_ship_value(ship) );

      count++;
    }

  if ( !count )
    {
      send_to_pager( "There are no sea air or land vehicles here.\r\n", ch );
    }
}

void do_allspeeders( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int count = 0;
  char buf[MAX_STRING_LENGTH];

  count = 0;
  send_to_pager( "&Y\r\nThe following sea/land/air vehicles are currently formed:\r\n", ch );

  send_to_pager( "\r\n&WVehicle                            Owner\r\n", ch );
  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->sclass <= SHIP_PLATFORM )
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

      if ( !str_cmp(ship->owner, "Public") )
        {
          pager_printf( ch, "%ld to rent.\r\n", get_ship_value(ship)/100 );
        }
      else if ( str_cmp(ship->owner, "") )
        pager_printf( ch, "%s", "\r\n" );
      else
	pager_printf( ch, "%ld to buy.\r\n", get_ship_value(ship) );

      count++;
    }

  if ( !count )
    {
      send_to_pager( "There are none currently formed.\r\n", ch );
      return;
    }
}

void do_allships( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  int count = 0;
  bool unowned = FALSE, mobship = FALSE, checkowner = FALSE;
  int type = -1;

  if ( !str_cmp( argument, "unowned" ) )
    unowned = TRUE;
  else if ( !str_cmp( argument, "imperial" ) )
    type = SHIP_IMPERIAL;
  else if ( !str_cmp( argument, "rebel" ) )
    type = SHIP_REBEL;
  else if ( !str_cmp( argument, "civilian" ) )
    type = SHIP_CIVILIAN;
  else if ( !str_cmp( argument, "mob" ) )
    mobship = TRUE;
  else if ( !argument || argument[0] == '\0' || !str_cmp( argument, "" ) )
    ;
  else
    checkowner = TRUE;

  count = 0;
  send_to_pager( "&Y\r\nThe following ships are currently formed:\r\n", ch );

  send_to_pager( "\r\n&WShip                               Owner\r\n", ch );

  if ( IS_IMMORTAL( ch ) && !unowned && !checkowner && type < 0)
    for ( ship = first_ship; ship; ship = ship->next )
      if (ship->type == MOB_SHIP && ship->sclass != SHIP_DEBRIS )
        {
          sprintf( buf, "%s(%s)", ship->name, ship->personalname );
          pager_printf( ch, "&w%-35s %-10s\r\n", buf, ship->owner );
	  pager_printf( ch, "&w%-35s %-10s\r\n", buf, ship->owner );
        }

  if( !mobship )
    for ( ship = first_ship; ship; ship = ship->next )
      {
        if ( ship->sclass > SHIP_PLATFORM )
          continue;

        if( unowned && str_cmp(ship->owner, "") )
          continue;
        if( checkowner && str_cmp(ship->owner, argument) )
          continue;

        if( type >= 0 && ship->type != type )
          continue;

        if (ship->type == MOB_SHIP)
          continue;
        else if (ship->type == SHIP_REBEL)
          set_pager_color( AT_BLOOD, ch );
        else if (ship->type == SHIP_IMPERIAL)
          set_pager_color( AT_DGREEN, ch );
        else
          set_pager_color( AT_BLUE, ch );
        sprintf( buf, "%-10s(%-10s)", ship->name, ship->personalname );
        pager_printf( ch, "&w%-35s %-15s\r\n", buf, ship->owner );
        if (ship->type == MOB_SHIP || ship->sclass == SHIP_PLATFORM )
          {
            pager_printf( ch, "\r\n");
            continue;
          }
        if ( !str_cmp(ship->owner, "Public") )
          {
            pager_printf( ch, "%ld to rent.\r\n", get_ship_value(ship)/100 );
          }
        else if ( str_cmp(ship->owner, "") )
          pager_printf( ch, "%s", "\r\n" );
        else
          pager_printf( ch, "&W%-10s%ld to buy.&R&w\r\n", "", get_ship_value(ship) );

        count++;
      }

  if ( !count )
    {
      send_to_pager( "There are no ships currently formed.\r\n", ch );
      return;
    }
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

  xp = ( exp_level( ch->skill_level[PILOTING_ABILITY]+1) - exp_level( ch->skill_level[PILOTING_ABILITY]) ) / 25 ;
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


      xp =  ( exp_level( ch->skill_level[PILOTING_ABILITY]+1) - exp_level( ch->skill_level[PILOTING_ABILITY]) );
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

void do_launch( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  int the_chance, sclass;
  long price = 0;
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  ROOM_INDEX_DATA *room;

  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);

  if( arg1[0] != '\0' )
    {
      sclass = atoi(arg2);
    }


  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = ship_from_pilotseat(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou don't seem to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( autofly(ship) )
    {
      send_to_char("&RThe ship is set on autopilot, you'll have to turn it off first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( !check_pilot( ch , ship ) )
    {
      send_to_char("&RHey, thats not your ship! Try renting a public one.\r\n",ch);
      return;
    }

  if ( ship->lastdoc != ship->location )
    {
      send_to_char("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->tractoredby )
    {
      send_to_char("&rYou are still locked in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char("The ship is not docked right now.\r\n",ch);
      return;
    }

  if (ship->energy == 0)
    {
      send_to_char("&RThis ship has no fuel.\r\n",ch);
      return;
    }

  if ( ship->sclass <= FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) < the_chance )
    {
      if ( is_rental(ch,ship) )
        if( !rent_ship(ch,ship) )
          return;

      if ( !is_rental(ch,ship) )
        {
          if ( ship->sclass == FIGHTER_SHIP )
            price=2000;
          if ( ship->sclass == MIDSIZE_SHIP )
            price=5000;
          if ( ship->sclass == CAPITAL_SHIP )
            price=50000;

          price += ( ship->maxhull-ship->hull );

          if (ship_is_disabled( ship ) )
            price += 10000;
          if ( ship->missilestate == MISSILE_DAMAGED )
            price += 5000;
          if ( ship->statet0 == LASER_DAMAGED )
            price += 2500;
          if ( ship->statet1 == LASER_DAMAGED )
            price += 2500;
          if ( ship->statet2 == LASER_DAMAGED )
            price += 2500;
        }

      if( IS_SET( ch->act, PLR_DONTAUTOFUEL ) )
        {
          if( ship_is_disabled( ship ) )
            {
              ch_printf(ch, "Your ship is disabled. You must repair it.\r\n");
              return;
            }

          price = 100;
	}

      if ( ch->pcdata && ch->pcdata->clan && !str_cmp(ch->pcdata->clan->name,ship->owner) )
        {
          if ( ch->pcdata->clan->funds < price )
            {
              ch_printf(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->pcdata->clan->name );
              return;
            }

          ch->pcdata->clan->funds -= price;
          room = get_room_index( ship->location );
          if( room != NULL && room->area )
            boost_economy( room->area, price );
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
          room = get_room_index( ship->location );
          if( room != NULL && room->area )
            boost_economy( room->area, price );
          ch_printf(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );

        }

      if( !IS_SET( ch->act, PLR_DONTAUTOFUEL ) )
        {
          if(  ship_from_hanger(ship->in_room->vnum) == NULL || ship->sclass == SHIP_PLATFORM )
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
        }

      if (ship->hatchopen)
        {
          ship->hatchopen = FALSE;
          sprintf( buf , "The hatch on %s closes." , ship->name);
          echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
          echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch slides shut." );
          sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
          sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
        }
      set_char_color( AT_GREEN, ch );
      send_to_char( "Launch sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      echo_to_ship( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->name );
      echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
      echo_to_docked( AT_YELLOW , ship, "The ship shudders as it lifts off the ground." );
      ship->shipstate = SHIP_LAUNCH;
      ship->currspeed = ship->realspeed;
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_success( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_success( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_success( ch, gsn_capitalships );
      sound_to_ship(ship , "!!SOUND(xwing)" );
      return;
    }
  set_char_color( AT_RED, ch );
  send_to_char("You fail to work the controls properly!\r\n",ch);
  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_failure( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_failure( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_failure( ch, gsn_capitalships );
}

void do_land( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];
  SPACE_DATA *spaceobj;
  bool found = FALSE;

  strcpy( arg, argument );

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = ship_from_pilotseat(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou need to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( autofly(ship) )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RYou can't land platforms\r\n" , ch );
      return;
    }

  if (ship->sclass == CAPITAL_SHIP)
    {
      send_to_char("&RCapital ships are to big to land. You'll have to take a shuttle.\r\n",ch);
      return;
    }
  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to land.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      if ( ship->docked == NULL )
        {
          send_to_char("&RThe ship is already docked!\r\n",ch);
          return;
        }
    }
  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->energy < (25 + 25*ship->sclass) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      set_char_color(  AT_CYAN, ch );
      ch_printf(ch, "%s" , "Land where?\r\n\r\nChoices: ");
      for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
        {
          if( space_in_range( ship, spaceobj ) )
            {
              if ( spaceobj->doca && !spaceobj->seca)
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->locationa,
                          spaceobj->name,
                          spaceobj->pos.x,
                          spaceobj->pos.y,
                          spaceobj->pos.z );
              if ( spaceobj->docb && !spaceobj->secb )
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->locationb,
                          spaceobj->name,
                          spaceobj->pos.x,
                          spaceobj->pos.y,
                          spaceobj->pos.z );
              if ( spaceobj->docc && !spaceobj->secc )
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->locationc,
                          spaceobj->name,
                          spaceobj->pos.x,
                          spaceobj->pos.y,
                          spaceobj->pos.z );
            }
        }
      ch_printf(ch, "\r\nYour Coordinates: %.0f %.0f %.0f\r\n" ,
                ship->pos.x , ship->pos.y, ship->pos.z);
      return;
    }

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if( space_in_range( ship, spaceobj ) )
      if ( !str_prefix(argument,spaceobj->locationa) ||
           !str_prefix(argument,spaceobj->locationb) ||
           !str_prefix(argument,spaceobj->locationc))
        {
          found = TRUE;
          break;
        }

  if( !found )
    {
      target = get_ship_here( argument , ship );
      if ( target == NULL )
        {
          send_to_char("&RI don't see that here. Type land by itself for a list\r\n",ch);
          return;
        }
      if ( target == ship )
        {
          send_to_char("&RYou can't land your ship inside itself!\r\n",ch);
          return;
        }
      if ( ! target->hanger )
        {
          send_to_char("&RThat ship has no hanger for you to land in!\r\n",ch);
          return;
        }
      if ( ship->sclass == MIDSIZE_SHIP && target->sclass == MIDSIZE_SHIP )
        {
          send_to_char("&RThat ship is not big enough for your ship to land in!\r\n",ch);
          return;
        }
      if ( ! target->bayopen )
        {
          send_to_char("&RTheir hanger is closed. You'll have to ask them to open it for you\r\n",ch);
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 200 )
        {
          send_to_char("&R That ship is too far away! You'll have to fly a litlle closer.\r\n",ch);
          return;
        }
    }
  else
    {
      ship->spaceobject = spaceobj;

      if( ship_distance_to_spaceobject( ship, spaceobj ) > 500 )
        {
          send_to_char("&R That platform is too far away! You'll have to fly a little closer.\r\n",ch);
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( number_percent( ) < the_chance )
    {
      set_char_color( AT_GREEN, ch );
      send_to_char( "Landing sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n begins the landing sequence.", ch,
           NULL, argument , TO_ROOM );
      sprintf( buf ,"%s begins its landing sequence." , ship->name );
      echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
      echo_to_docked( AT_YELLOW , ship, "The ship begins to enter the atmosphere." );

      echo_to_ship( AT_YELLOW , ship , "The ship slowly begins its landing approach.");
      ship->dest = STRALLOC(arg);
      ship->shipstate = SHIP_LAND;
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_success( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_success( ch, gsn_midships );
      if ( spaceobject_from_vnum(ship->lastdoc) != ship->spaceobject )
        {
          ship->ch = ch;
        }

      return;
    }

  send_to_char("You fail to work the controls properly.\r\n",ch);

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_failure( ch, gsn_starfighters );
  else
    learn_from_failure( ch, gsn_midships );
}

void do_accelerate( CHAR_DATA *ch, char *argument )
{
  int the_chance;
  int change;
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

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
      send_to_char("&RThe controls must be at the pilots chair...\r\n",ch);
      return;
    }

  if ( autofly(ship) )
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
      send_to_char("&RThe ships drive is disabled. Unable to accelerate.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if ( ship->energy < abs((atoi(argument)-abs(ship->currspeed))/10) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) >= the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }

  change = atoi(argument);

  act( AT_PLAIN, "$n manipulates the ships controls.", ch,
       NULL, argument , TO_ROOM );

  if ( change > ship->currspeed )
    {
      ship->inorbitof = NULL;
      send_to_char( "&GAccelerating\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "The ship begins to accelerate.");
      echo_to_docked( AT_YELLOW , ship, "The hull groans at an increase in speed." );
      sprintf( buf, "%s begins to speed up." , ship->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );
    }

  if ( change < ship->currspeed )
    {
      send_to_char( "&GDecelerating\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "The ship begins to slow down.");
      echo_to_docked( AT_YELLOW , ship, "The hull groans as the ship slows." );
      sprintf( buf, "%s begins to slow down." , ship->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );
    }

  ship->energy -= abs((change-abs(ship->currspeed))/10);

  ship->currspeed = URANGE( 0 , change , ship->realspeed );

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}

void do_trajectory_actual( CHAR_DATA *ch, char *argument )
{
  char  buf[MAX_STRING_LENGTH];
  char  arg2[MAX_INPUT_LENGTH];
  char  arg3[MAX_INPUT_LENGTH];
  int the_chance;
  Vector3 argvec;
  SHIP_DATA *ship;

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
      send_to_char("&RYour not in the pilots seat.\r\n",ch);
      return;
    }

  if ( autofly(ship))
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_DOCKED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }
  if ( ship->energy < (ship->currspeed/10) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }

  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  vector_set( &argvec, atof( arg2 ), atof( arg3 ), atof( argument ) );

  if ( argvec.x == ship->pos.x
       && argvec.y == ship->pos.y
       && argvec.z == ship->pos.z )
    {
      ch_printf( ch , "The ship is already at %.0f %.0f %.0f!",
                 argvec.x, argvec.y, argvec.z );
      return;
    }

  if( argvec.x == 0 && argvec.y == 0 && argvec.z == 0 )
    argvec.z = ship->pos.z + 1;

  ship_set_course( ship, &argvec );
  ship->energy -= (ship->currspeed/10);

  ch_printf( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
             argvec.x, argvec.y, argvec.z );
  act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  echo_to_cockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->name );
  echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );

  if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_3;
  else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_2;
  else
    ship->shipstate = SHIP_BUSY;

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}

void do_trajectory( CHAR_DATA *ch, char *argument )
{
  char  buf[MAX_STRING_LENGTH];
  char  arg2[MAX_INPUT_LENGTH];
  char  arg3[MAX_INPUT_LENGTH];
  int the_chance;
  Vector3 argvec;
  SHIP_DATA *ship;

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
      send_to_char("&RYour not in the pilots seat.\r\n",ch);
      return;
    }

  if ( autofly(ship))
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }
  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't turn!\r\n" , ch );
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY && ship->shipstate != SHIP_TRACTORED)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }
  if ( ship->energy < (ship->currspeed/10) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }

  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  vector_init( &argvec );

  if( arg2[0] != '\0' )
    argvec.x = atof( arg2 );

  if( arg3[0] != '\0' )
    argvec.y = atof( arg3 );

  if( argument && argument[0] != '\0' )
    argvec.z = atof( argument );
  else if ( argvec.x != ship->pos.x && argvec.y != ship->pos.y )
    argvec.z = 0;
  else
    argvec.z = 1;

  vector_copy( &ship->head, &argvec );
  ship->energy -= (ship->currspeed/10);

  ch_printf( ch ,"&GNew course set, approaching %.0f %.0f %.0f.\r\n",
             argvec.x, argvec.y, argvec.z );
  act( AT_PLAIN, "$n manipulates the ships controls.", ch, NULL, argument , TO_ROOM );

  echo_to_cockpit( AT_YELLOW ,ship, "The ship begins to turn.\r\n" );
  sprintf( buf, "%s turns altering its present course." , ship->name );
  echo_to_nearby_ships( AT_ORANGE , ship , buf , NULL );

  if ( ship->sclass == FIGHTER_SHIP || ( ship->sclass == MIDSIZE_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_3;
  else if ( ship->sclass == MIDSIZE_SHIP || ( ship->sclass == CAPITAL_SHIP && ship->manuever > 50 ) )
    ship->shipstate = SHIP_BUSY_2;
  else
    ship->shipstate = SHIP_BUSY;

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}

void do_buyship(CHAR_DATA *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "&ROnly players can do that!\r\n" ,ch );
      return;
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      ship = ship_from_cockpit( ch->in_room->vnum );

      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( str_cmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship isn't for sale!" ,ch );
      return;
    }


  if ( ship->type == SHIP_IMPERIAL )
    {
      if ( !ch->pcdata->clan || str_cmp( ch->pcdata->clan->name , "the empire" ) )
        {
          if ( !ch->pcdata->clan || !ch->pcdata->clan->mainclan || str_cmp( ch->pcdata->clan->mainclan->name , "The Empire" ) )
            {
              send_to_char( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
              return;
            }
        }
    }
  else if ( ship->type == SHIP_REBEL )
    {
      if ( !ch->pcdata->clan || (str_cmp( ch->pcdata->clan->name , "the rebel alliance" ) && str_cmp( ch->pcdata->clan->name , "T\
he New Republic")))
        {
          if ( !ch->pcdata->clan ||  !ch->pcdata->clan->mainclan || str_cmp( ch->pcdata->clan->mainclan->name , "The Rebel Allian\
ce" ) )
            {
              send_to_char( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
              return;
            }
        }
    }

  price = get_ship_value( ship );

  if ( ch->gold < price )
    {
      ch_printf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  ch->gold -= price;
  ch_printf(ch, "&GYou pay %ld credits to purchace the ship.\r\n" , price );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( ch->name );
  save_ship( ship );
}

void do_sellship(CHAR_DATA *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( str_cmp( ship->owner , ch->name ) )
    {
      send_to_char( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = get_ship_value( ship );

  ch->gold += ( price - price/10 );
  ch_printf(ch, "&GYou receive %ld credits from selling your ship.\r\n" , price - price/10 );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( "" );
  ship->pilot = STRALLOC( "" );
  ship->copilot = STRALLOC( "" );
  save_ship( ship );
}

void do_clanbuyship(CHAR_DATA *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;
  CLAN_DATA   *clan;
  CLAN_DATA   *mainclan;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "&ROnly players can do that!\r\n" ,ch );
      return;
    }
  if ( !ch->pcdata->clan )
    {
      send_to_char( "&RYou aren't a member of any organizations!\r\n" ,ch );
      return;
    }

  clan = ch->pcdata->clan;
  mainclan = ch->pcdata->clan->mainclan ? ch->pcdata->clan->mainclan : clan;

  if ( ( ch->pcdata->bestowments
         &&    is_name("clanbuyship", ch->pcdata->bestowments))
       ||   !str_cmp( ch->name, clan->leader  ))
    ;
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      ship = ship_from_cockpit( ch->in_room->vnum );

      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( str_cmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship isn't for sale!\r\n" ,ch );
      return;
    }

  if ( str_cmp( mainclan->name , "The Empire" )  && ship->type == SHIP_IMPERIAL )
    {
      send_to_char( "&RThat ship may only be purchaced by the Empire!\r\n" ,ch );
      return;
    }

  if ( (str_cmp( mainclan->name , "The Rebel Alliance" ) && str_cmp( mainclan->name , "The New Republic" ) )  && ship->type == SHIP_REBEL )
    {
      send_to_char( "&RThat ship may only be purchaced by The Rebel Alliance!\r\n" ,ch );
      return;
    }

  if ( !str_cmp( clan->name , "The Empire" )  && ship->type != SHIP_IMPERIAL )
    {
      send_to_char( "&RDue to contractual agreements that ship may not be purchaced by the empire!\r\n" ,ch );
      return;
    }

  price = get_ship_value( ship );

  if ( ch->pcdata->clan->funds < price )
    {
      ch_printf(ch, "&RThis ship costs %ld. You don't have enough credits!\r\n" , price );
      return;
    }

  clan->funds -= price;
  ch_printf(ch, "&G%s pays %ld credits to purchace the ship.\r\n", clan->name , price );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( clan->name );
  save_ship( ship );

  if ( ship->sclass <= SHIP_PLATFORM )
    clan->spacecraft++;
  else
    clan->vehicles++;
}

void do_clansellship(CHAR_DATA *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;
  CLAN_DATA   *clan;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "&ROnly players can do that!\r\n" ,ch );
      return;
    }
  if ( !ch->pcdata->clan )
    {
      send_to_char( "&RYou aren't a member of any organizations!\r\n" ,ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( ( ch->pcdata->bestowments
         &&    is_name("clanbuyship", ch->pcdata->bestowments))
       ||   !str_cmp( ch->name, clan->leader  ))
    ;
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability.\r\n" ,ch );
      return;
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      ship = ship_from_cockpit( ch->in_room->vnum );

      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
    }

  if ( !str_cmp( ship->owner , "" )  || ship->type == MOB_SHIP )
    {
      send_to_char( "&RThat ship is not owned!\r\n" ,ch );
      return;
    }

  if ( str_cmp( ship->owner , ch->pcdata->clan->name ) )
    {
      send_to_char( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = get_ship_value( ship );

  ch->pcdata->clan->funds += ( price - price/10 );
  ch_printf(ch, "&GYour clan receives %ld credits from selling your ship.\r\n" , price - price/10 );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( "" );
  ship->pilot = STRALLOC( "" );
  ship->copilot = STRALLOC( "" );
  save_ship( ship );
}

void do_info(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  SHIP_DATA *target;
  bool fromafar = TRUE;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      if ( argument[0] == '\0' )
        {
          act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = ship_in_room( ch->in_room , argument );
      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
      target = ship;
    }
  else if ( ship->hanger == ch->in_room->vnum )
    {
      if ( argument[0] == '\0' )
        {
          act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = ship_in_room( ch->in_room , argument );
      if ( !ship )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      target = ship;
    }
  else if (argument[0] == '\0')
    {
      target = ship;
      fromafar = FALSE;
    }
  else
    target = get_ship_here( argument , ship );

  if ( target == NULL )
    {
      send_to_char("&RI don't see that here.\r\nTry the radar, or type info by itself for info on this ship.\r\n",ch);
      return;
    }

  if ( check_pilot( ch , target ) )
    fromafar = FALSE;

  if( ship_distance_to_ship( ship, target ) > 500 + ship->sensor * 2 )
    {
      send_to_char("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  ch_printf( ch, "&Y%s %s : %s (%s)\r\n&B",
             target->type == SHIP_REBEL ? "Rebel" :
             (target->type == SHIP_IMPERIAL ? "Imperial" : "Civilian" ),
             target->sclass == FIGHTER_SHIP ? "Starfighter" :
             (target->sclass == MIDSIZE_SHIP ? "Midtarget" :
              (target->sclass == CAPITAL_SHIP ? "Capital Ship" :
               (ship->sclass == SHIP_PLATFORM ? "Platform" :
                (ship->sclass == CLOUD_CAR ? "Cloudcar" :
                 (ship->sclass == OCEAN_SHIP ? "Boat" :
                  (ship->sclass == LAND_SPEEDER ? "Speeder" :
                   (ship->sclass == WHEELED ? "Wheeled Transport" :
                    (ship->sclass == LAND_CRAWLER ? "Crawler" :
                     (ship->sclass == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             target->name,
             target->personalname,
             target->filename);
  ch_printf( ch, "Description: %s\r\nOwner: %s",
             target->description,
             target->owner );
  if( fromafar == FALSE )
    ch_printf( ch, "   Pilot: %s   Copilot: %s", target->pilot,  target->copilot );
  ch_printf( ch, "\r\nLaser cannons: %d  Ion cannons: %d\r\n",
             target->lasers, target->ions);
  ch_printf( ch, "Max Hull: %d  ", target->maxhull);
  ch_printf( ch, "Max Shields: %d   Max Energy(fuel): %d\r\n",
             target->maxshield, target->maxenergy);
  ch_printf( ch, "Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
             target->realspeed, target->hyperspeed, get_ship_value( target ));

  act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument , TO_ROOM );
}

void do_autorecharge(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;
  int recharge;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the co-pilots seat!\r\n",ch);
      return;
    }

  if ( autofly(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
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
      ship->autorecharge=TRUE;
      send_to_char( "&GYou power up the shields.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON.");
    }
  else if ( !str_cmp(argument,"off" ) )
    {
      ship->autorecharge=FALSE;
      send_to_char( "&GYou shutdown the shields.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Shields OFF. Shield strength set to 0. Autorecharge OFF.");
      ship->shield = 0;
    }
  else if ( !str_cmp(argument,"idle" ) )
    {
      ship->autorecharge=FALSE;
      send_to_char( "&GYou let the shields idle.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
    }
  else
    {
      if (ship->autorecharge == TRUE)
        {
          ship->autorecharge=FALSE;
          send_to_char( "&GYou toggle the shields.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
        }
      else
        {
          ship->autorecharge=TRUE;
          send_to_char( "&GYou toggle the shields.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON");
        }
    }

  if (ship->autorecharge)
    {
      recharge  = URANGE( 1, ship->maxshield-ship->shield, 25+ship->sclass*25 );
      recharge  = UMIN( recharge, ship->energy*5 + 100 );
      ship->shield += recharge;
      ship->energy -= ( recharge*2 + recharge * ship->sclass );
    }

  learn_from_success( ch, gsn_shipsystems );
}

void do_autopilot(CHAR_DATA *ch, char *argument )
{
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

  if ( ! check_pilot(ch,ship) )
    {
      send_to_char("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( ship->shipstate == SHIP_DOCKED )
    {
      if(ship->docked == NULL || ( ship->docked->sclass > MIDSIZE_SHIP && ship->sclass > MIDSIZE_SHIP ))
        {
          send_to_char("&RNot until after you've launched!\r\n",ch);
          return;
        }
      send_to_char("&RNot while you are docked!\r\n",ch);
      return;
    }

  if ( ship->target0 )
    {
      ship->autotrack = FALSE;
    }


  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( ( ship->autopilot == TRUE && str_cmp(argument,"on") )
       || !str_cmp(argument,"off") )
    {
      ship->autopilot=FALSE;
      send_to_char( "&GYou toggle the autopilot.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Autopilot OFF.");
    }
  else
    {
      if( ship->shipstate == SHIP_LANDED )
        {
          send_to_char("&RNot while you are docked!\r\n",ch);
          return;
        }
      ship->autopilot=TRUE;
      ship->autorecharge = TRUE;
      send_to_char( "&GYou toggle the autopilot.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Autopilot ON.");
    }
}

void do_openhatch(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( !argument || argument[0] == '\0' || !str_cmp(argument,"hatch") )
    {
      ship = ship_from_entrance( ch->in_room->vnum );
      if( ship == NULL)
        {
          send_to_char( "&ROpen what?\r\n", ch );
          return;
        }
      else
        {
          if ( !ship->hatchopen)
            {

              if  ( ship->sclass == SHIP_PLATFORM )
                {
                  send_to_char( "&RTry one of the docking bays!\r\n" , ch );
                  return;
                }
              if ( ship->location != ship->lastdoc ||
                   ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) ) )
                {
                  send_to_char("&RPlease wait till the ship lands!\r\n",ch);
                  return;
                }
              ship->hatchopen = TRUE;
              send_to_char("&GYou open the hatch.\r\n",ch);
              act( AT_PLAIN, "$n opens the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s opens." , ship->name);
              echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
              sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
              sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
              return;
            }
          else
            {
              send_to_char("&RIt's already open.\r\n",ch);
              return;
            }
	}
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char( "&RThat ship has already started to launch",ch);
      return;
    }

  if ( ! check_pilot(ch,ship) )
    {
      send_to_char("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( !ship->hatchopen)
    {
      ship->hatchopen = TRUE;
      act( AT_PLAIN, "You open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
      act( AT_PLAIN, "$n opens the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
      echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch opens from the outside." );
      sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
      sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
      return;
    }

  send_to_char("&GIts already open!\r\n",ch);
}

void do_closehatch(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( !argument || argument[0] == '\0' || !str_cmp(argument,"hatch") )
    {
      ship = ship_from_entrance( ch->in_room->vnum );
      if( ship == NULL)
        {
          send_to_char( "&RClose what?\r\n", ch );
          return;
        }
      else
        {

          if  ( ship->sclass == SHIP_PLATFORM )
            {
              send_to_char( "&RTry one of the docking bays!\r\n" , ch );
              return;
            }
          if ( ship->hatchopen)
            {
              ship->hatchopen = FALSE;
              send_to_char("&GYou close the hatch.\r\n",ch);
              act( AT_PLAIN, "$n closes the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s closes." , ship->name);
              echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
              sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
              sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
              return;
            }
          else
            {
              send_to_char("&RIt's already closed.\r\n",ch);
              return;
            }
        }
    }

  ship = ship_in_room( ch->in_room , argument );

  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char( "&RThat ship has already started to launch",ch);
      return;
    }
  else
    {
      if(ship->hatchopen)
        {
          ship->hatchopen = FALSE;
          act( AT_PLAIN, "You close the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
          act( AT_PLAIN, "$n closes the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
          echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch is closed from outside.");
          sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
          sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );

          return;
        }
      else
        {
          send_to_char("&RIts already closed.\r\n",ch);
          return;
        }
    }
}

void do_status(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if (argument[0] == '\0')
    target = ship;
  else
    target = get_ship_here( argument , ship );

  if ( target == NULL )
    {
      send_to_char("&RI don't see that here.\r\nTry the radar, or type status by itself for your ships status.\r\n",ch);
      return;
    }

  if( ship_distance_to_ship( ship, target ) > 500+ship->sensor*2 )
    {
      send_to_char("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant figure out what the readout means.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n checks various gages and displays on the control panel.", ch,
       NULL, argument , TO_ROOM );

  ch_printf( ch, "&W%s:\r\n",target->name);
  ch_printf( ch, "&OCurrent Coordinates:&Y %.0f %.0f %.0f\r\n",
	     target->pos.x, target->pos.y, target->pos.z );
  ch_printf( ch, "&OCurrent Heading:&Y %.0f %.0f %.0f\r\n",
             target->head.x, target->head.y, target->head.z );
  ch_printf( ch, "&OCurrent Speed:&Y %d&O/%d\r\n",
             target->currspeed , target->realspeed );
  ch_printf( ch, "&OHull:&Y %d&O/%d  Ship Condition:&Y %s\r\n",
             target->hull,
             target->maxhull,
             ship_is_disabled( target ) ? "Disabled" : "Running");
  ch_printf( ch, "&OShields:&Y %d&O/%d   Energy(fuel):&Y %d&O/%d\r\n",
             target->shield,
             target->maxshield,
             target->energy,
             target->maxenergy);
  ch_printf( ch, "&OLaser Condition:&Y %s  &OCurrent Target:&Y %s\r\n",
             target->statet0 == LASER_DAMAGED ? "Damaged" : "Good" , target->target0 ? target->target0->name : "none");
  if (target->turret1)
    ch_printf( ch, "&OTurret One:  &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet1 == LASER_DAMAGED ? "Damaged" : "Good" , target->target1 ? target->target1->name : "none");
  if (target->turret2)
    ch_printf( ch, "&OTurret Two:  &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet2 == LASER_DAMAGED ? "Damaged" : "Good" , target->target2 ? target->target2->name : "none");
  if (target->turret3)
    ch_printf( ch, "&OTurret Three:&Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet3 == LASER_DAMAGED ? "Damaged" : "Good" , target->target3 ? target->target3->name : "none");
  if (target->turret4)
    ch_printf( ch, "&OTurret Four: &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet4 == LASER_DAMAGED ? "Damaged" : "Good" , target->target4 ? target->target4->name : "none");
  if (target->turret5)
    ch_printf( ch, "&OTurret Five: &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet5 == LASER_DAMAGED ? "Damaged" : "Good" , target->target5 ? target->target5->name : "none");
  if (target->turret6)
    ch_printf( ch, "&OTurret Six:  &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet6 == LASER_DAMAGED ? "Damaged" : "Good" , target->target6 ? target->target6->name : "none");
  if (target->turret7)
    ch_printf( ch, "&OTurret Seven:&Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet7 == LASER_DAMAGED ? "Damaged" : "Good" , target->target7 ? target->target7->name : "none");
  if (target->turret8)
    ch_printf( ch, "&OTurret Eight:&Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet8 == LASER_DAMAGED ? "Damaged" : "Good" , target->target8 ? target->target8->name : "none");
  if (target->turret9)
    ch_printf( ch, "&OTurret Nine: &Y %s  &OCurrent Target:&Y %s\r\n",
               target->statet9 == LASER_DAMAGED ? "Damaged" : "Good" , target->target9 ? target->target9->name : "none");
  if (target->turret0)
    ch_printf( ch, "&OTurret Ten:  &Y %s  &OCurrent Target:&Y %s\r\n",
	       target->statet10 == LASER_DAMAGED ? "Damaged" : "Good" , target->target10 ? target->target10->name : "none");
  ch_printf( ch, "&OSensors:    &Y%d   &OTractor Beam:   &Y%d\r\n", target->sensor, target->tractorbeam);
  ch_printf( ch, "&OAstroArray: &Y%d   &OComm:           &Y%d\r\n", target->astro_array, target->comm);
  ch_printf( ch, "\r\n&OMissiles:&Y %d&O  Torpedos: &Y%d&O\r\nRockets:  &Y%d&O  Chaff:    &Y%d&O  \r\n Condition:&Y %s&w\r\n",
             target->missiles,
             target->torpedos,
             target->rockets,
             target->chaff,
             target->missilestate == MISSILE_DAMAGED ? "Damaged" : "Good");

  learn_from_success( ch, gsn_shipsystems );
}

void do_hyperspace(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  Vector3 tmp;
  SHIP_DATA *ship;
  SHIP_DATA *dship;
  SPACE_DATA *spaceobject;
  char buf[MAX_STRING_LENGTH];

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

  if ( autofly(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if (ship->hyperspeed == 0)
    {
      send_to_char("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }

  if (( !argument || argument[0] == '\0' ) && ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou are already travelling lightspeed!\r\n",ch);
      return;
    }

  if ( argument && !str_cmp( argument, "off" )
       && !ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RHyperdrive not active.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY )
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if (ship->tractoredby || ship->tractored )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }

  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not enter hyperspace with your tractor beam locked on.\r\n",ch);
      return;
    }

  if (ship->shipstate != SHIP_READY && !ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( argument && !str_cmp( argument, "off" )
       && ship_is_in_hyperspace( ship ) )
    {
      ship_to_spaceobject (ship, ship->currjump);

      if (ship->spaceobject == NULL)
        {
          echo_to_cockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
          return;
        }
      else
        {
          for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
            if( space_in_range( ship, spaceobject ) )
              {
                ship->currjump = spaceobject;
                break;
              }
          if( !spaceobject )
            ship->currjump = ship->spaceobject;

          vector_copy( &tmp, &ship->pos );
          vector_copy( &ship->pos, &ship->hyperpos );
          vector_copy( &ship->hyperpos, &tmp );
          ship->currjump = NULL;

          echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
          echo_to_ship( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
          sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
          echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
          ship->shipstate = SHIP_READY;
          STRFREE( ship->home );
          ship->home = STRALLOC( ship->spaceobject->name );

          if ( str_cmp("Public",ship->owner) )
            save_ship(ship);

          for( dship = first_ship; dship; dship = dship->next )
            if ( dship->docked && dship->docked == ship )
              {
                echo_to_room( AT_YELLOW, get_room_index(dship->pilotseat), "Hyperjump complete.");
                echo_to_ship( AT_YELLOW, dship, "The ship lurches slightly as it comes out of hyperspace.");
                sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , dship->name, dship->pos.x, dship->pos.y, dship->pos.\
			 z );
                echo_to_nearby_ships( AT_YELLOW, dship, buf , NULL );
                STRFREE( dship->home );
                dship->home = STRALLOC( ship->home );

                if ( str_cmp("Public",dship->owner) )
                  save_ship(dship);
	      }


          return;

        }
    }


  if (!ship->currjump)
    {
      send_to_char("&RYou need to calculate your jump first!\r\n",ch);
      return;
    }

  if ( ship->energy < 100)
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->currspeed <= 0 )
    {
      send_to_char("&RYou need to speed up a little first!\r\n",ch);
      return;
    }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( ship_distance_to_spaceobject( ship,  spaceobject ) < 100 + ( spaceobject->gravity * 5 ) )
        {
          ch_printf(ch, "&RYou are too close to %s to make the jump to lightspeed.\r\n", spaceobject->name );
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }
  sprintf( buf ,"%s enters hyperspace." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );

  ship->lastsystem = ship->spaceobject;
  ship_from_spaceobject( ship , ship->spaceobject );
  ship->shipstate = SHIP_HYPERSPACE;

  send_to_char( "&GYou push forward the hyperspeed lever.\r\n", ch);
  act( AT_PLAIN, "$n pushes a lever forward on the control panel.", ch,
       NULL, argument , TO_ROOM );
  echo_to_ship( AT_YELLOW , ship , "The ship lurches slightly as it makes the jump to lightspeed." );
  echo_to_cockpit( AT_YELLOW , ship , "The stars become streaks of light as you enter hyperspace.");
  echo_to_docked( AT_YELLOW , ship, "The stars become streaks of light as you enter hyperspace." );

  ship->energy -= 100;

  vector_copy( &tmp, &ship->pos );
  vector_copy( &ship->pos, &ship->jump );
  vector_copy( &ship->hyperpos, &tmp );
  vector_copy( &ship->jump, &tmp );
  vector_copy( &ship->originpos, &tmp );

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );

  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );

  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}

void do_target(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target, *dship;
  char buf[MAX_STRING_LENGTH];
  bool turret = FALSE;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = ship_from_turret(ch->in_room->vnum))  == NULL )
        {
          send_to_char("&RYou must be in the gunners seat or turret of a ship to do that!\r\n",ch);
          return;
        }
      if ( ship->gunseat != ch->in_room->vnum )
        turret = TRUE;

      if ( ship_is_in_hyperspace( ship ) && ship->sclass <= SHIP_PLATFORM)
        {
          send_to_char("&RYou can only do that in realspace!\r\n",ch);
          return;
        }
      if (! ship->spaceobject && ship->sclass <= SHIP_PLATFORM)
        {
          send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
          return;
        }

      if ( autofly(ship) && ( !turret || !check_pilot( ch, ship ) ) )
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
          send_to_char("&GTarget set to none.\r\n",ch);
          if ( ch->in_room->vnum == ship->gunseat )
            ship->target0 = NULL;
          if ( ch->in_room->vnum == ship->turret1 )
            ship->target1 = NULL;
          if ( ch->in_room->vnum == ship->turret2 )
            ship->target2 = NULL;
          if ( ch->in_room->vnum == ship->turret3 )
            ship->target3 = NULL;
          if ( ch->in_room->vnum == ship->turret4 )
            ship->target4 = NULL;
          if ( ch->in_room->vnum == ship->turret5 )
            ship->target5 = NULL;
          if ( ch->in_room->vnum == ship->turret6 )
            ship->target6 = NULL;
          if ( ch->in_room->vnum == ship->turret7 )
            ship->target7 = NULL;
          if ( ch->in_room->vnum == ship->turret8 )
            ship->target8 = NULL;
          if ( ch->in_room->vnum == ship->turret9 )
            ship->target9 = NULL;
          if ( ch->in_room->vnum == ship->turret0 )
            ship->target10 = NULL;
          return;
        }
      if (ship->sclass > SHIP_PLATFORM)
        target = ship_in_room( ship->in_room , arg );
      else
        target = get_ship_here( arg, ship );


      if (  target == NULL )
        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          send_to_char("&RYou can't target your own ship!\r\n",ch);
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

      if( ship->sclass <= SHIP_PLATFORM)
        {
          if ( ship_distance_to_ship( ship, target ) > 5000 )
            {
              send_to_char("&RThat ship is too far away to target.\r\n",ch);
              return;
            }
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_weaponsystems]) ;
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GTracking target.\r\n", ch);
          act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 1 , do_target , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_weaponsystems );
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

  if ( (ship = ship_from_turret(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  if (ship->sclass > SHIP_PLATFORM)
    target = ship_in_room( ship->in_room , arg );
  else
    target = get_ship_here( arg, ship );

  if (  target == NULL || target == ship)
    {
      send_to_char("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  if ( ch->in_room->vnum == ship->gunseat )
    ship->target0 = target;

  if ( ch->in_room->vnum == ship->turret1 )
    ship->target1 = target;

  if ( ch->in_room->vnum == ship->turret2 )
    ship->target2 = target;

  if ( ch->in_room->vnum == ship->turret3 )
    ship->target3 = target;

  if ( ch->in_room->vnum == ship->turret4 )
    ship->target4 = target;

  if ( ch->in_room->vnum == ship->turret5 )
    ship->target5 = target;

  if ( ch->in_room->vnum == ship->turret6 )
    ship->target6 = target;

  if ( ch->in_room->vnum == ship->turret7 )
    ship->target7 = target;

  if ( ch->in_room->vnum == ship->turret8 )
    ship->target8 = target;

  if ( ch->in_room->vnum == ship->turret9 )
    ship->target9 = target;

  if ( ch->in_room->vnum == ship->turret0 )
    ship->target0 = target;

  send_to_char( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You are being targetted by %s." , ship->name);
  echo_to_cockpit( AT_BLOOD , target , buf );
  echo_to_docked( AT_YELLOW , ship, "The ship's computer receives targetting data through the docking port link." );

  if ( ch->in_room->vnum == ship->gunseat )
    for( dship = first_ship; dship; dship = dship->next )
      if( dship->docked && dship->docked == ship )
        dship->target0 = target;

  sound_to_room( ch->in_room , "!!SOUND(targetlock)" );
  learn_from_success( ch, gsn_weaponsystems );

  if ( autofly(target) && !target->target0)
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      echo_to_cockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}

void do_fire(CHAR_DATA *ch, char *argument )
{
  int the_chance, origthe_chance;
  SHIP_DATA *ship;
  SHIP_DATA *target;
  char buf[MAX_STRING_LENGTH];
  bool turret = FALSE;
  if (  (ship = ship_from_turret(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the gunners chair or turret of a ship to do that!\r\n",ch);
      return;
    }
  if ( ship->gunseat != ch->in_room->vnum )
    turret = TRUE;

  if ( ship_is_in_hyperspace( ship ) && ship->sclass <= SHIP_PLATFORM )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->spaceobject == NULL && ship->sclass <= SHIP_PLATFORM)
    {
      send_to_char("&RYou can't do that until after you've finished launching!\r\n",ch);
      return;
    }
  if ( ship->energy <5 )
    {
      send_to_char("&RTheres not enough energy left to fire!\r\n",ch);
      return;
    }

  if ( autofly(ship) && !turret )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }


  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) ( ch->perm_dex*2 + ch->pcdata->learned[gsn_spacecombat]/3
              + ch->pcdata->learned[gsn_spacecombat2]/3 + ch->pcdata->learned[gsn_spacecombat3]/3 );
  origthe_chance = the_chance;

  if ( ship->sclass > SHIP_PLATFORM && !IS_NPC(ch))
    ((ch->pcdata->learned[gsn_speeders] == 100) ? (the_chance -= 100 - ch->pcdata->learned[gsn_speedercombat]) : (the_chance = 0) );

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "lasers"))
    {

      if (ship->statet0 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships main laser is damaged.\r\n",ch);
          return;
        }
      if (ship->statet0 >= ship->lasers )
        {
          send_to_char("&RThe lasers are still recharging.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
	}
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target ) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass > SHIP_PLATFORM && ship->target0->in_room != ship->in_room)
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }

      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of laser range.\r\n",ch);
              return;
            }
        }

      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RThe main laser can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      ship->statet0++;

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / ( 10 * ( target->sclass + 1 ) );
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
	{
          sprintf( buf , "Lasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships lasers fire at %s but miss." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          sprintf( buf, "Laserfire from %s barely misses %s." , ship->name , target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Laserfire from %s hits %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by lasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Your ships lasers hit %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      if (ship->sclass > SHIP_PLATFORM )
        learn_from_success( ch, gsn_speedercombat );

      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->sclass == SHIP_PLATFORM )
        damage_ship_ch( target, 100, 250, ch);
      else if( ship->sclass == CAPITAL_SHIP && target->sclass < CAPITAL_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "ions") )
    {

      if (ship->statet0 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships main weapons are damaged.\r\n",ch);
          return;
        }
      if (ship->ions <= 0)
        {
          send_to_char("&RYou have no ion cannons to fire.\r\n", ch);
          return;
        }
      if (ship->statei0 >= ship->ions )
        {
          send_to_char("&RThe ion cannons are still recharging.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range(ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of ion range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RThe main ion cannon can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
	}
      ship->statei0++;

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf , "Ion cannons fire from %s at you, but the blue plasma narrowly misses." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "The ships ion cannons fire at %s but the blue plasma narrowly misses." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          sprintf( buf, "Blue ion plasma from %s narrowly misses %s." , ship->name , target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          return;
        }
      sprintf( buf, "Blue plasma from %s engulfs %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are engulfed by ion energy from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Blue plasma from your ship engulf %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      if (ship->sclass > SHIP_PLATFORM )
        learn_from_success( ch, gsn_speedercombat );

      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );
      if( ship->sclass == SHIP_PLATFORM )
        damage_ship_ch( target, -200, -50, ch );
      else if( ship->sclass == CAPITAL_SHIP && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, -200, -50, ch );
      else
        damage_ship_ch( target, -75 , -10, ch );

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "missile") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
        {
          send_to_char("&RThe ships missile launchers are dammaged.\r\n",ch);
          return;
        }
      if (ship->missiles <= 0)
        {
          send_to_char("&RYou have no missiles to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
	  return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of missile range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RMissiles can only fire in a forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target)/(10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        new_missile( ship , target , ch , CONCUSSION_MISSILE );
      else
        damage_ship_ch(target, 75, 200, ch );
      ship->missiles-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming missile from %s." , ship->name);
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );

      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a missile towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
        ship->missilestate = MISSILE_FIRED;

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "torpedo") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
        {
          send_to_char("&RThe ships missile launchers are dammaged.\r\n",ch);
          return;
        }
      if (ship->torpedos <= 0)
        {
          send_to_char("&RYou have no torpedos to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe torpedos are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
	  return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if(ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of torpedo range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RTorpedos can only fire in a forward direction. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
	new_missile( ship , target , ch , PROTON_TORPEDO );
      else
        damage_ship_ch( target, 200, 300, ch);
      ship->torpedos-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Missiles launched.");
      sprintf( buf , "Incoming torpedo from %s." , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a torpedo towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        {
          echo_to_room(AT_ORANGE, ship->in_room, buf);
          echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
        ship->missilestate = MISSILE_FIRED;

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->gunseat && !str_prefix( argument , "rocket") )
    {
      if (ship->missilestate == MISSILE_DAMAGED)
        {
          send_to_char("&RThe ships missile launchers are damaged.\r\n",ch);
          return;
        }
      if (ship->rockets <= 0)
        {
          send_to_char("&RYou have no rockets to fire!\r\n",ch);
          return;
        }
      if (ship->missilestate != MISSILE_READY )
        {
          send_to_char("&RThe missiles are still reloading.\r\n",ch);
          return;
        }
      if (ship->target0 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target0;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target0 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 800 )
            {
              send_to_char("&RThat ship is out of rocket range.\r\n",ch);
              return;
            }
        }
      if ( ship->sclass < CAPITAL_SHIP
           && !ship_is_facing_ship( ship, target ) )
        {
          send_to_char("&RRockets can only fire forward. You'll need to turn your ship!\r\n",ch);
          return;
        }

      the_chance += target->sclass - ship->sclass;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += ship->manuever - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;

      the_chance += 30;

      the_chance = URANGE( 20 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
	   NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          send_to_char( "&RYou fail to lock onto your target!", ch );
          ship->missilestate = MISSILE_RELOAD_2;
          return;
        }
      if( ship->sclass <= SHIP_PLATFORM)
        new_missile( ship , target , ch , HEAVY_ROCKET );
      else
        damage_ship_ch( target, 450, 550, ch );

      ship->rockets-- ;
      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      echo_to_cockpit( AT_YELLOW , ship , "Rocket launched.");
      sprintf( buf , "Incoming rocket from %s." , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf, "%s fires a heavy rocket towards %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        {
          echo_to_room(AT_ORANGE, ship->in_room, buf);
          echo_to_ship( AT_RED , target , "A large explosion vibrates through the ship." );
        }
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      learn_from_success( ch, gsn_weaponsystems );
      if ( ship->sclass == CAPITAL_SHIP || ship->sclass == SHIP_PLATFORM )
        ship->missilestate = MISSILE_RELOAD;
      else
        ship->missilestate = MISSILE_FIRED;

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->turret1 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet1 == LASER_DAMAGED)
	{
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet1 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is recharging.\r\n",ch);
          return;
        }
      if (ship->target1 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target1;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target1 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of laser range.\r\n",ch);
              return;
            }
        }

      ship->statet1++;

      the_chance += target->sclass - CAPITAL_SHIP+1;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
	  sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the ships turret at %s but miss." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          sprintf( buf, "%s fires at %s but misses." , ship->name, target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turboasers fire from %s, hitting %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "Turbolasers fire from the turret, hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  if ( ch->in_room->vnum == ship->turret2 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet2 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet2 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target2 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target2;
      if (ship->sclass <= SHIP_PLATFORM && !ship_in_range( ship, target ) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target2 = NULL;
          return;
        }
      if (ship->sclass <= SHIP_PLATFORM)
        {
          if( ship_distance_to_ship( ship, target ) > 1000 )
            {
              send_to_char("&RThat ship is out of laser range.\r\n",ch);
              return;
            }
        }

      ship->statet2++;
      the_chance += target->sclass - CAPITAL_SHIP+1;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );

      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          if(ship->sclass > SHIP_PLATFORM)
            echo_to_room(AT_ORANGE, ship->in_room, buf);
          else
            echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      if(ship->sclass > SHIP_PLATFORM)
        echo_to_room(AT_ORANGE, ship->in_room, buf);
      else
        echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship && ship->spaceobject)
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret3 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet3 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet3 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target3 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target3;
      if (!ship_in_range( ship, target)  )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target3 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet3++;

      the_chance += target->sclass - CAPITAL_SHIP+1;
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
	{
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret4 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet4 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
	}
      if (ship->statet4 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target4 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target4;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target4 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet4++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship(ship, target) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
	  learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret5 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet5 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet5 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target5 == NULL )
	{
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target5;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target5 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet5++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret6 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet6 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet6 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target6 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target6;
      if (!ship_in_range( ship, target) )
        {
	  send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target6 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet6++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret7 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet7 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet7 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target7 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target7;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target7 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
	  send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }

      ship->statet7++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );

      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret8 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet8 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet8 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target8 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target8;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target8 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet8++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
	  echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret9 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet9 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet9 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target9 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target9;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target9 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }
      ship->statet9++;

      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
          sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }
  if ( ch->in_room->vnum == ship->turret0 && !str_prefix( argument , "lasers") )
    {
      if (ship->statet10 == LASER_DAMAGED)
        {
          send_to_char("&RThe ships turret is damaged.\r\n",ch);
          return;
        }
      if (ship->statet10 > ship->sclass )
        {
          send_to_char("&RThe turbolaser is still recharging.\r\n",ch);
          return;
        }
      if (ship->target10 == NULL )
        {
          send_to_char("&RYou need to choose a target first.\r\n",ch);
          return;
        }
      target = ship->target10;
      if (!ship_in_range( ship, target) )
        {
          send_to_char("&RYour target seems to have left.\r\n",ch);
          ship->target10 = NULL;
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 1000 )
        {
          send_to_char("&RThat ship is out of laser range.\r\n",ch);
          return;
        }

      ship->statet10++;
      the_chance += target->sclass - (CAPITAL_SHIP+1);
      the_chance += ship->currspeed - target->currspeed;
      the_chance += 100 - target->manuever;
      the_chance -= ship_distance_to_ship( ship, target ) / (10*(target->sclass+1));
      the_chance -= origthe_chance;
      the_chance /= 2;
      the_chance += origthe_chance;
      the_chance = URANGE( 1 , the_chance , 99 );

      act( AT_PLAIN, "$n presses the fire button.", ch,
           NULL, argument , TO_ROOM );
      if ( number_percent( ) > the_chance )
        {
          sprintf( buf, "Turbolasers fire from %s barely missing %s." , ship->name, target->name );
          echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
	  sprintf( buf , "Turbolasers fire from %s at you but miss." , ship->name);
          echo_to_cockpit( AT_ORANGE , target , buf );
          sprintf( buf , "Turbolasers fire from the turret missing %s." , target->name);
          echo_to_cockpit( AT_ORANGE , ship , buf );
          learn_from_failure( ch, gsn_spacecombat );
          learn_from_failure( ch, gsn_spacecombat2 );
          learn_from_failure( ch, gsn_spacecombat3 );
          return;
        }
      sprintf( buf, "Turbolasers fire from %s, hitting %s." , ship->name, target->name );
      echo_to_nearby_ships( AT_ORANGE , ship , buf , target );
      sprintf( buf , "You are hit by turbolasers from %s!" , ship->name);
      echo_to_cockpit( AT_BLOOD , target , buf );
      sprintf( buf , "turbolasers fire from the turret hitting %s!." , target->name);
      echo_to_cockpit( AT_YELLOW , ship , buf );
      learn_from_success( ch, gsn_spacecombat );
      learn_from_success( ch, gsn_spacecombat2 );
      learn_from_success( ch, gsn_spacecombat3 );
      echo_to_ship( AT_RED , target , "A small explosion vibrates through the ship." );

      if( ship->sclass == SHIP_PLATFORM && target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 100, 250, ch);
      else if ( target->sclass <= MIDSIZE_SHIP )
        damage_ship_ch( target, 50, 200, ch );
      else
        damage_ship_ch( target, 10 , 50, ch );

      if ( autofly(target) && target->target0 != ship )
        {
          target->target0 = ship;
          sprintf( buf , "You are being targetted by %s." , target->name);
          echo_to_cockpit( AT_BLOOD , ship , buf );
        }

      return;
    }

  send_to_char( "&RYou can't fire that!\r\n" , ch);
}

void do_calculate(CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance , distance = 0;
  SHIP_DATA *ship;
  SPACE_DATA *spaceobj, *spaceobject;
  bool found = FALSE;

  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);


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

  if (  (ship = ship_from_navseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be at a nav computer to calculate jumps.\r\n",ch);
      return;
    }

  if ( autofly(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RAnd what exactly are you going to calculate...?\r\n" , ch );
      return;
    }
  if (ship->hyperspeed == 0)
    {
      send_to_char("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->spaceobject == NULL)
    {
      send_to_char("&RYou can only do that in realspace.\r\n",ch);
      return;
    }
  if (arg1[0] == '\0')
    {
      send_to_char("&WFormat: Calculate <spaceobject> <entry x> <entry y> <entry z>\r\n&wPossible destinations:\r\n",ch);
      return;
    }
  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant seem to figure the charts out today.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }

  if( !is_number(arg1) && arg1[0] != '-')
    {
      ship->currjump = spaceobject_from_name( arg1 );
      if ( arg2[0] != '\0' )
        distance = atoi(arg2);
      if( ship->currjump )
        {
          vector_copy( &ship->jump, &ship->currjump->pos );
	  found = TRUE;
        }
    }
  else if( arg2[0] != '\0' && arg2[0] != '\0' )
    {
      vector_set( &ship->jump, atoi(arg1), atoi(arg2), atoi(arg3) );
      found = TRUE;
    }
  else
    {
      send_to_char("&WFormat: Calculate <spaceobject> \r\n        Calculate <entry x> <entry y> <entry z>&R&w\r\n",ch);
      return;
    }

  spaceobject = ship->currjump;

  if ( !found )
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }
  if (spaceobject && spaceobject->trainer && (ship->sclass != SHIP_TRAINER))
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }
  if (ship->sclass == SHIP_TRAINER && spaceobject && !spaceobject->trainer )
    {
      send_to_char( "&RYou can't seem to find that starsytem on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }

  vector_randomize( &ship->jump, ship->astro_array - 300, 300 - ship->astro_array );

  ship->jump.x += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );
  ship->jump.y += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );
  ship->jump.z += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if ( !spaceobj->trainer && distance && str_cmp(spaceobj->name,"")
         && vector_distance( &ship->jump, &spaceobj->pos ) <  spaceobj->gravity * 4 )
      {
	echo_to_cockpit( AT_RED, ship, "WARNING.. Jump coordinates too close to stellar object.");
        echo_to_cockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
        ship->currjump = NULL;
        return;
      }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if( space_in_range( ship, spaceobject ) )
      {
        ship->currjump = spaceobject;
        break;
      }
  if( !spaceobject )
    ship->currjump = ship->spaceobject;

  if( ship->jump.x > MAX_COORD_S || ship->jump.y > MAX_COORD_S || ship->jump.z > MAX_COORD_S ||
      ship->jump.x < -MAX_COORD_S || ship->jump.y < -MAX_COORD_S || ship->jump.z < -MAX_COORD_S )
    {
      echo_to_cockpit( AT_RED, ship, "WARNING.. Jump coordinates outside of the known galaxy.");
      echo_to_cockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
      ship->currjump = NULL;
      return;
    }

  ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 200;

  if (ship->hyperdistance<100)
    ship->hyperdistance = 100;

  ship->orighyperdistance = ship->hyperdistance;

  sound_to_room( ch->in_room , "!!SOUND(computer)" );

  sprintf(buf, "&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->hyperdistance );
  send_to_char( buf, ch);
  echo_to_docked( AT_YELLOW , ship, "The docking port link shows a new course being calculated." );

  act( AT_PLAIN, "$n does some calculations using the ships computer.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_navigation );

  WAIT_STATE( ch , 2*PULSE_VIOLENCE );
}

void do_calculate_diff(CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance , distance = 0;
  SHIP_DATA *ship;
  SPACE_DATA *spaceobj, *spaceobject;
  bool found = FALSE;

  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);


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

  if (  (ship = ship_from_navseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be at a nav computer to calculate jumps.\r\n",ch);
      return;
    }

  if ( autofly(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RAnd what exactly are you going to calculate...?\r\n" , ch );
      return;
    }
  if (ship->hyperspeed == 0)
    {
      send_to_char("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->spaceobject == NULL)
    {
      send_to_char("&RYou can only do that in realspace.\r\n",ch);
      return;
    }
  if (arg1[0] == '\0')
    {
      send_to_char("&WFormat: Calculate <spaceobject> <entry x> <entry y> <entry z>\r\n&wPossible destinations:\r\n",ch);
      return;
    }
  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant seem to figure the charts out today.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }

  if( arg2[0] != '\0' && arg3[0] != '\0')
    {
      ship->jump.x = ship->pos.x + atoi(arg1);
      ship->jump.y = ship->pos.y + atoi(arg2);
      ship->jump.z = ship->pos.z + atoi(arg3);
      found = TRUE;
    }
  else
    {
      send_to_char("&WFormat: Calculate x y z&R&w\r\n",ch);
      return;
    }

  spaceobject = ship->currjump;

  if ( !found )
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }

  vector_randomize( &ship->jump, ship->astro_array - 300, 300 - ship->astro_array );
  ship->jump.x += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );
  ship->jump.y += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );
  ship->jump.z += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if ( !spaceobj->trainer && distance && str_cmp(spaceobj->name,"")
         && vector_distance( &ship->jump, &spaceobj->pos ) < spaceobj->gravity * 4 )
      {
        echo_to_cockpit( AT_RED, ship, "WARNING.. Jump coordinates too close to stellar object.");
        echo_to_cockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
        ship->currjump = NULL;
        return;
      }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if( space_in_range( ship, spaceobject ) )
      {
        ship->currjump = spaceobject;
	ship->currjump = spaceobject;
        break;
      }
  if( !spaceobject )
    ship->currjump = ship->spaceobject;

  if( ship->jump.x > MAX_COORD_S || ship->jump.y > MAX_COORD_S || ship->jump.z > MAX_COORD_S ||
      ship->jump.x < -MAX_COORD_S || ship->jump.y < -MAX_COORD_S || ship->jump.z < -MAX_COORD_S )
    {
      echo_to_cockpit( AT_RED, ship, "WARNING.. Jump coordinates outside of the known galaxy.");
      echo_to_cockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
      ship->currjump = NULL;
      return;
    }

  ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 200;

  if (ship->hyperdistance<100)
    ship->hyperdistance = 100;

  ship->orighyperdistance = ship->hyperdistance;

  sound_to_room( ch->in_room , "!!SOUND(computer)" );

  sprintf(buf, "&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->hyperdistance );
  send_to_char( buf, ch);
  echo_to_docked( AT_YELLOW , ship, "The docking port link shows a new course being calculated." );

  act( AT_PLAIN, "$n does some calculations using the ships computer.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_navigation );

  WAIT_STATE( ch , 2*PULSE_VIOLENCE );
}

void do_recharge(CHAR_DATA *ch, char *argument )
{
  int recharge;
  int the_chance;
  SHIP_DATA *ship;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }
  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RThe controls must be at the co-pilot station.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to power a recharge order.\r\n",ch);
      return;
    }

  if ( ship->energy < 100 )
    {
      send_to_char("&RTheres not enough energy!\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_shipsystems]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  send_to_char( "&GRecharging shields..\r\n", ch);
  act( AT_PLAIN, "$n pulls back a lever on the control panel.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_shipsystems );

  recharge  = 25+ship->sclass*25;
  recharge  = UMIN(  ship->maxshield-ship->shield , recharge );
  ship->shield += recharge;
  ship->energy -= ( recharge*2 + recharge * ship->sclass );
}

void do_repairship(CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
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
           str_cmp( argument , "turret 1" ) && str_cmp( argument , "turret 2") &&
           str_cmp( argument , "docking" ) && str_cmp( argument , "tractor" ) )
        {
          send_to_char("&RYou need to spceify something to repair:\r\n",ch);
          send_to_char("&rTry: hull, drive, launcher, laser, docking, tractor, turret 1, or turret 2\r\n",ch);
          return;
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_shipmaintenance]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin your repairs\r\n", ch);
          act( AT_PLAIN, "$n begins repairing the ships $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !str_cmp(arg,"hull") )
            add_timer ( ch , TIMER_DO_FUN , 15 , do_repairship , 1 );
          else
	    add_timer ( ch , TIMER_DO_FUN , 5 , do_repairship , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou fail to locate the source of the problem.\r\n",ch);
      learn_from_failure( ch, gsn_shipmaintenance );
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
      send_to_char("&RYou are distracted and fail to finish your repairs.\r\n", ch);
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
                       number_range( (int) ( ch->pcdata->learned[gsn_shipmaintenance] / 2 ) , (int) (ch->pcdata->learned[gsn_shipmaintenance]) ),
                       ( ship->maxhull - ship->hull ) );
      ship->hull += change;
      ch_printf( ch, "&GRepair complete.. Hull strength inreased by %d points.\r\n", change );
    }

  if ( !str_cmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_LANDED;
      else if ( ship_is_in_hyperspace( ship ) )
        send_to_char("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n", ch);
      else
        ship->shipstate = SHIP_READY;
      send_to_char("&GShips drive repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"docking") )
    {
      ship->statetdocking = SHIP_READY;
      send_to_char("&GDocking bay repaired.\r\n", ch);
    }
  if ( !str_cmp(arg,"tractor") )
    {
      ship->statettractor = SHIP_READY;
      send_to_char("&GTractorbeam repaired.\r\n", ch);
    }
  if ( !str_cmp(arg,"launcher") )
    {
      ship->missilestate = MISSILE_READY;
      send_to_char("&GMissile launcher repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"laser") )
    {
      ship->statet0 = LASER_READY;
      send_to_char("&GMain laser repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"turret 1") )
    {
      ship->statet1 = LASER_READY;
      send_to_char("&GLaser Turret 1 repaired.\r\n", ch);
    }

  if ( !str_cmp(arg,"turret 2") )
    {
      ship->statet2 = LASER_READY;
      send_to_char("&Laser Turret 2 repaired.\r\n", ch);
    }

  act( AT_PLAIN, "$n finishes the repairs.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_shipmaintenance );
}

void do_addpilot(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int the_chance;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  the_chance = number_percent( );

  if ( IS_NPC(ch) || the_chance >= ch->pcdata->learned[gsn_slicing] )
    {
      if ( !check_pilot( ch , ship ) )
        {
          send_to_char( "&RThat isn't your ship!" ,ch );
          return;
        }
    }

  if (argument[0] == '\0')
    {
      send_to_char( "&RAdd which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    learn_from_success( ch, gsn_slicing );

  if ( str_cmp( ship->pilot , "" ) )
    {
      if ( str_cmp( ship->copilot , "" ) )
        {
          send_to_char( "&RYou already have a pilot and copilot..\r\n" ,ch );
          send_to_char( "&RTry rempilot first.\r\n" ,ch );
	  return;
        }

      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( argument );
      send_to_char( "Copilot Added.\r\n", ch );
      save_ship( ship );
      return;

      return;
    }

  STRFREE( ship->pilot );
  ship->pilot = STRALLOC( argument );
  send_to_char( "Pilot Added.\r\n", ch );
  save_ship( ship );
}

void do_rempilot(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RYou can't do that here.\r\n" , ch );
      return;
    }
  the_chance = number_percent( );
  if ( IS_NPC(ch) || the_chance >= ch->pcdata->learned[gsn_slicing] )
    {
      if ( !check_pilot( ch , ship ) )
        {
          send_to_char( "&RThat isn't your ship!" ,ch );
          return;
        }
    }

  if (argument[0] == '\0')
    {
      send_to_char( "&RRemove which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    learn_from_success( ch, gsn_slicing );

  if ( !str_cmp( ship->pilot , argument ) )
    {
      STRFREE( ship->pilot );
      ship->pilot = STRALLOC( "" );
      send_to_char( "Pilot Removed.\r\n", ch );
      save_ship( ship );
      return;
    }

  if ( !str_cmp( ship->copilot , argument ) )
    {
      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( "" );
      send_to_char( "Copilot Removed.\r\n", ch );
      save_ship( ship );
      return;
    }

  send_to_char( "&RThat person isn't listed as one of the ships pilots.\r\n" ,ch );
}

void do_radar( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *target;
  int the_chance;
  SHIP_DATA *ship;
  MISSILE_DATA *missile;
  SPACE_DATA *spaceobj;
  if (   (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit or turret of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_LANDED)
    {
      if (ship->docked == NULL) {
        send_to_char("&RWait until after you launch!\r\n",ch);
        return;
      }
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->spaceobject == NULL)
    {
      send_to_char("&RYou can't do that unless the ship is flying in realspace!\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }


  act( AT_PLAIN, "$n checks the radar.", ch,
       NULL, argument , TO_ROOM );

  set_char_color(  AT_RED, ch );
  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj ) && spaceobj->type == SPACE_SUN && str_cmp(spaceobj->name,"") )
        ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }
  set_char_color(  AT_LBLUE, ch );
  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj ) && spaceobj->type == SPACE_PLANET && str_cmp(spaceobj->name,"") )
        ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z));
    }

  ch_printf(ch,"\r\n");
  set_char_color(  AT_WHITE, ch );
  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj ) && spaceobj->type > SPACE_PLANET && str_cmp(spaceobj->name,"") )
        ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z, "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }
  ch_printf(ch,"\r\n");

  for ( target = first_ship; target; target = target->next )
    {
      if ( target != ship && target->spaceobject )
        {
          if( ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)\
									     +1))
            ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
                      target->name,
                      (target->pos.x - ship->pos.x),
                      (target->pos.y - ship->pos.y),
                      (target->pos.z - ship->pos.z));
          else if ( ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3))
            {
              if ( target->sclass == FIGHTER_SHIP )
                ch_printf(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass == MIDSIZE_SHIP )
                ch_printf(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass == SHIP_DEBRIS )
                ch_printf(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
			  (target->pos.z - ship->pos.z));
              else if ( target->sclass >= CAPITAL_SHIP )
                ch_printf(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
            }
        }

    }
  ch_printf(ch,"\r\n");
  for ( missile = first_missile; missile; missile = missile->next )
    {

      if( missile_distance_to_ship( missile, ship ) < 50*(ship->sensor+10)*2)
        {
          ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
                    missile->missiletype == CONCUSSION_MISSILE ? "A Concusion missile" :
                    ( missile->missiletype ==  PROTON_TORPEDO ? "A Torpedo" :
                      ( missile->missiletype ==  HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb" ) ),
                    (missile->pos.x - ship->pos.x),
                    (missile->pos.y - ship->pos.y),
                    (missile->pos.z - ship->pos.z));
        }
    }

  ch_printf(ch, "\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n" ,
            ship->pos.x , ship->pos.y, ship->pos.z);

  learn_from_success( ch, gsn_navigation );
}

void do_autotrack( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int the_chance;

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


  if ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char("&RPlatforms don't have autotracking systems!\r\n",ch);
      return;
    }
  if ( ship->sclass == CAPITAL_SHIP )
    {
      send_to_char("&RThis ship is too big for autotracking!\r\n",ch);
      return;
    }
  if ( ship->docked != NULL )
    {
      send_to_char("&RYou can not autotrack while docked!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots chair!\r\n",ch);
      return;
    }

  if ( autofly(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYour not sure which switch to flip.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );
  if (ship->autotrack)
    {
      ship->autotrack = FALSE;
      echo_to_cockpit( AT_YELLOW , ship, "Autotracking off.");
    }
  else
    {
      ship->autotrack = TRUE;
      echo_to_cockpit( AT_YELLOW , ship, "Autotracking on.");
    }

  learn_from_success( ch, gsn_shipsystems );
}

void do_chaff( CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;


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


  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RThe controls are at the copilots seat!\r\n",ch);
      return;
    }

  if ( autofly(ship) )
    {
      send_to_char("&RYou'll have to turn the autopilot off first...\r\n",ch);
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->chaff <= 0 )
    {
      send_to_char("&RYou don't have any chaff to release!\r\n",ch);
      return;
    }
  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_weaponsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which switch it is.\r\n",ch);
      learn_from_failure( ch, gsn_weaponsystems );
      return;
    }

  ship->chaff--;

  ship->chaff_released++;

  send_to_char( "You flip the chaff release switch.\r\n", ch);
  act( AT_PLAIN, "$n flips a switch on the control pannel", ch,
       NULL, argument , TO_ROOM );
  echo_to_cockpit( AT_YELLOW , ship , "A burst of chaff is released from the ship.");

  learn_from_success( ch, gsn_weaponsystems );
}


void do_drive( CHAR_DATA *ch, char *argument )
{
  int dir;
  SHIP_DATA *ship, *target;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);


  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the drivers seat of a land vehicle to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass < LAND_SPEEDER )
    {
      send_to_char("&RThis isn't a land vehicle!\r\n",ch);
      return;
    }


  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe drive is disabled.\r\n",ch);
      return;
    }

  if ( ship->energy <1 )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( !str_cmp( arg, "in" ))
    {
      target = ship_in_room( ship->in_room , arg2 );

      if ( !target )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      if (!target->hanger)
        {
          send_to_char("That ship does not have any room.\r\n", ch);
          return;
        }

      if (!target->bayopen)
        {
          send_to_char("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IS_SET( target->in_room->room_flags, ROOM_INDOORS )
           || target->in_room->sector_type == SECT_INSIDE )
        {
          send_to_char( "You can't drive indoors!\r\n", ch );
          return;
        }

      send_to_char("You drive the vehicle into the bay.\r\n", ch);
      sprintf( buf, "%s drives into %s.", ship->name, target->name);
      echo_to_room( AT_GREY,  ship->in_room, buf);

      transship(ship, target->hanger);

      sprintf( buf, "%s drives into the bay", ship->name);
      echo_to_room( AT_GREY, ship->in_room, buf);
      learn_from_success( ch, gsn_speeders );
      return;
    }

  if ( !str_cmp( arg, "out" ))
    {
      target = ship_from_hanger(ship->in_room->vnum);

      if (!target)
        {
          send_to_char("You have to be in a ship's hanger to drive out of one.\r\n", ch);
          return;
        }

      if ( target->spaceobject != NULL )
        {
          send_to_char("The ship must be landed before you drive out of its hanger!\r\n", ch);
          return;
        }

      if (!target->bayopen)
        {
          send_to_char("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IS_SET( target->in_room->room_flags, ROOM_INDOORS )
           || target->in_room->sector_type == SECT_INSIDE )
        {
          send_to_char( "You can't drive indoors!\r\n", ch );
          return;
        }

      send_to_char("You drive the vehicle out of the bay.\r\n", ch);
      sprintf( buf, "%s drives out of the ship.", ship->name);
      echo_to_room( AT_GREY,  ship->in_room, buf);

      transship(ship, target->in_room->vnum);

      sprintf( buf, "%s drives out of %s", ship->name, target->name);
      echo_to_room( AT_GREY, ship->in_room, buf);
      learn_from_success( ch, gsn_speeders );
      return;
    }



  if ( ( dir = get_dir( arg ) ) == -1 )
    {
      send_to_char( "Usage: drive <direction>\r\n", ch );
      return;
    }

  drive_ship( ch, ship, get_exit(get_room_index(ship->location), dir), 0 );
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
