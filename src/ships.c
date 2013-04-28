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

#include <string.h>
#include "mud.h"
#include "vector3_aux.h"

SHIP_DATA *first_ship = NULL;
SHIP_DATA *last_ship = NULL;

void fread_ship( SHIP_DATA *ship, FILE *fp );
bool load_ship_file( const char *shipfile );
void write_ship_list( void );
void resetship( SHIP_DATA *ship );
void approachland( SHIP_DATA *ship, const char *arg );
void landship( SHIP_DATA *ship, const char *arg );
void launchship( SHIP_DATA *ship );
ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *exit, int fall );
void sound_to_ship( SHIP_DATA *ship , const char *argument );
void modtrainer( SHIP_DATA *ship, short pclass );
void makedebris( SHIP_DATA *ship );
bool space_in_range_h( SHIP_DATA *ship, SPACE_DATA *space);
void  echo_to_room_dnr( int ecolor, ROOM_INDEX_DATA *room,
			const char *argument );
void move_ships()
{
  SHIP_DATA *ship = NULL;
  MISSILE_DATA *missile = NULL;
  MISSILE_DATA *m_next = NULL;
  SHIP_DATA *target = NULL;
  SPACE_DATA *spaceobj = NULL;
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *ch = NULL;
  bool ch_found = FALSE;

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      spaceobject_move( spaceobj );

      if( spaceobj->pos.x > MAX_COORD )
        spaceobj->pos.x = -MAX_COORD_S;

      if( spaceobj->pos.y > MAX_COORD )
        spaceobj->pos.y = -MAX_COORD_S;

      if( spaceobj->pos.z > MAX_COORD )
        spaceobj->pos.z = -MAX_COORD_S;

      if( spaceobj->pos.x < -MAX_COORD )
        spaceobj->pos.x = MAX_COORD_S;

      if( spaceobj->pos.y < -MAX_COORD )
        spaceobj->pos.y = MAX_COORD_S;

      if( spaceobj->pos.z < -MAX_COORD )
        spaceobj->pos.z = MAX_COORD_S;
    }

  for ( missile = first_missile; missile; missile = m_next )
    {
      m_next = missile->next;

      ship = missile->fired_from;
      target = missile->target;

      if ( target->spaceobject && missile_in_range( ship, missile ) )
        {
          missile_set_course_to_ship( missile, target );
          missile_move( missile );

          if ( missile_distance_to_ship( missile, target ) <= 20 )
            {
              if ( target->chaff_released <= 0)
                {
                  echo_to_room( AT_YELLOW , get_room_index(ship->gunseat), "Your missile hits its target dead on!" );
                  echo_to_cockpit( AT_BLOOD, target, "The ship is hit by a missile.");
                  echo_to_ship( AT_RED , target , "A loud explosion shakes thee ship violently!" );
                  sprintf( buf, "You see a small explosion as %s is hit by a missile" , target->name );
                  echo_to_system( AT_ORANGE , target , buf , ship );
                  for ( ch = first_char; ch; ch = ch->next )
                    if ( !IS_NPC( ch ) && nifty_is_name( missile->fired_by, ch->name ) )
                      {
                        ch_found = TRUE;
                        damage_ship_ch( target , 30+missile->missiletype*missile->missiletype*30 ,
                                        50+missile->missiletype*missile->missiletype*missile->missiletype*50 , ch );
                      }

                  if ( !ch_found )
                    damage_ship( target , ship, 20+missile->missiletype*missile->missiletype*20 ,
                                 30+missile->missiletype*missile->missiletype*ship->missiletype*30 );

                  extract_missile( missile );
                }
              else
                {
                  echo_to_room( AT_YELLOW , get_room_index(ship->gunseat), "Your missile explodes harmlessly in a cloud of chaff!" );
                  echo_to_cockpit( AT_YELLOW, target, "A missile explodes in your chaff.");
                  extract_missile( missile );
                }

	      continue;
            }
          else
            {
              missile->age++;

              if (missile->age >= 50)
                {
                  extract_missile( missile );
                  continue;
                }
            }
        }
      else
        {
          missile->age++;

          if (missile->age >= 50)
            extract_missile( missile );
        }

    }

  for ( ship = first_ship; ship; ship = ship->next )
    {

      if ( !ship->spaceobject )
        continue;

      if( ship->shipstate == SHIP_LANDED && ship->spaceobject )
        ship->shipstate = SHIP_READY;

      if ( ship->shipstate != SHIP_LAND && ship->shipstate != SHIP_LAND_2)
        {
          ship_move( ship );
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
          if ( spaceobj->type == SPACE_SUN && spaceobj->name
               && str_cmp(spaceobj->name,"")
               && ship_distance_to_spaceobject( ship, spaceobj ) < 10 )
            {
              /* Evading the sun added by Darrik Vequir */
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

          if ( ship->currspeed > 0 )
            {
              if ( spaceobj->type >= SPACE_PLANET
                   && spaceobj->name && str_cmp(spaceobj->name,"")
                   && ship_distance_to_spaceobject( ship, spaceobj ) < 10 )
                {
                  sprintf( buf , "You begin orbitting %s.", spaceobj->name);
                  echo_to_cockpit( AT_YELLOW, ship, buf);
                  sprintf( buf , "%s begins orbiting %s.", ship->name, spaceobj->name);
                  echo_to_system( AT_ORANGE , ship , buf , NULL );
                  ship->inorbitof = spaceobj;
                  ship->currspeed = 0;
                }

            }
        }

    }

  target = NULL;

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if (ship->shipstate == SHIP_HYPERSPACE)
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
            if( space_in_range_h( ship, spaceobj ) )
              {
                int dmg;
                echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
                echo_to_ship( AT_YELLOW, ship, "The ship slams to a halt as it comes out of hyperspace.");
                sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
                dmg = 15* number_range( 1, 4 );
                ship->hull -= dmg;
                echo_to_ship( AT_YELLOW, ship, "The hull cracks from the pressure.");
                vector_copy( &ship->pos, &ship->hyperpos );
                ship_to_spaceobject( ship, ship->currjump );
                ship->currjump = NULL;
                echo_to_system( AT_YELLOW, ship, buf , NULL );
                ship->shipstate = SHIP_READY;
                STRFREE( ship->home );
                ship->home = STRALLOC( ship->spaceobject->name );
              }

          if( target )
            {
              echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
              echo_to_ship( AT_YELLOW, ship, "The ship slams to a halt as it comes out of hyperspace.  An artificial gravity well surrounds you!");
	      sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
              vector_copy( &ship->pos, &ship->hyperpos );
              ship_to_spaceobject( ship, ship->currjump );
              ship->currjump = NULL;
              echo_to_system( AT_YELLOW, ship, buf , NULL );
              ship->shipstate = SHIP_READY;
              STRFREE( ship->home );
              ship->home = STRALLOC( ship->spaceobject->name );
            }

          if (ship->shipstate == SHIP_HYPERSPACE
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
                  echo_to_system( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  STRFREE( ship->home );
                  ship->home = STRALLOC( ship->spaceobject->name );
                }
            }
          else if ( ( ship->count >= (ship->tcount ? ship->tcount : 10 ) ) && ship->shipstate == SHIP_HYPERSPACE && ship->tracking == TRUE)
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
                  echo_to_system( AT_YELLOW, ship, buf , NULL );
                  ship->shipstate = SHIP_READY;
                  STRFREE( ship->home );
                  ship->home = STRALLOC( ship->spaceobject->name );

                  vector_set( &ship->jump,
                              ship->pos.x + ship->trackvector.x,
                              ship->pos.y + ship->trackvector.y,
                              ship->pos.z + ship->trackvector.z );

                  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
                    if( space_in_range( ship, spaceobj ) )
                      {
                        ship->currjump = spaceobj;
                        break;
                      }

                  if( !spaceobj )
                    ship->currjump = ship->spaceobject;

                  ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 50;
                  ship->orighyperdistance = ship->hyperdistance;

                  ship->count = 0;
                  do_radar( ship->ch, "" );
                }
            }
	  else if (ship->count >= 10 && ship->shipstate == SHIP_HYPERSPACE)
            {
              ship->count = 0;
              sprintf( buf ,"%d" , ship->hyperdistance );
              echo_to_room_dnr( AT_YELLOW , get_room_index(ship->pilotseat), "Remaining jump distance: " );
              echo_to_room( AT_WHITE , get_room_index(ship->pilotseat),  buf );

            }

          if( ship->shipstate == SHIP_HYPERSPACE )
	    {
	      if( ship->count%2 && ship->hyperdistance < 10*ship->hyperspeed && ship->hyperdistance > 0 )
		{
		  sprintf( buf ,"An alarm sounds. Your hyperjump is ending: %d",
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

      if (ship->shipstate != SHIP_DISABLED)
        ship->shipstate = SHIP_READY;

      return;
    }

  echo_to_room( AT_YELLOW , get_room_index(ship->pilotseat), "Landing sequence complete.");
  echo_to_ship( AT_YELLOW , ship , "You feel a slight thud as the ship sets down on the ground.");
  sprintf( buf ,"%s disapears from your scanner." , ship->name  );
  echo_to_system( AT_YELLOW, ship, buf , NULL );

  if( ship->ch && ship->ch->desc )
    {
      int xp;

      ch = ship->ch;
      xp =  (exp_level( ch->skill_level[PILOTING_ABILITY]+1) - exp_level( ch->skill_level[PILOTING_ABILITY])) ;
      xp = UMIN( get_ship_value( ship ) , xp );
      gain_exp( ch , xp , PILOTING_ABILITY );
      ch_printf( ch, "&WYou gain %ld points of flight experience!\r\n",
		 UMIN( get_ship_value( ship ) , xp ) );
      ship->ch = NULL;
    }

  ship->location = destination;
  ship->lastdoc = ship->location;

  if (ship->shipstate != SHIP_DISABLED)
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
  echo_to_system( AT_YELLOW, ship, buf , NULL );
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

  if (ship->shipstate != SHIP_DISABLED)
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
  echo_to_system( AT_YELLOW, ship, buf , NULL );
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
