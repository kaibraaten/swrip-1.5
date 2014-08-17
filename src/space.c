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

#include "mud.h"
#include "vector3_aux.h"
#include "ships.h"
#include "character.h"

Missile *first_missile = NULL;
Missile *last_missile = NULL;

void echo_to_room_dnr( int ecolor, Room *room,
		       const char *argument )
{
  Character *vic = NULL;

  if ( room == NULL )
    {
      return;
    }

  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      set_char_color( ecolor, vic );
      send_to_char( argument, vic );
    }
}

void new_missile( Ship *ship , Ship *target , Character *ch , int missiletype )
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

  CREATE( missile, Missile, 1 );
  LINK( missile, first_missile, last_missile, next, prev );

  missile->target = target;
  missile->fired_from = ship;

  if ( ch )
    {
      missile->fired_by = STRALLOC( ch->name );
    }
  else
    {
      missile->fired_by = STRALLOC( "" );
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

  vector_copy( &missile->pos, &ship->pos );
  missile->spaceobject = spaceobject;
}

void extract_missile( Missile *missile )
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

  UNLINK( missile, first_missile, last_missile, next, prev );

  missile->target = NULL;
  missile->fired_from = NULL;

  if (  missile->fired_by )
    {
      STRFREE( missile->fired_by );
    }

  DISPOSE( missile );
}

void update_missiles( void )
{
  Missile *missile = NULL;
  Missile *m_next = NULL;

  for ( missile = first_missile; missile; missile = m_next )
    {
      Ship *ship = missile->fired_from;
      Ship *target = missile->target;

      m_next = missile->next;

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

                  echo_to_room( AT_YELLOW, get_room_index(ship->room.gunseat),
				"Your missile hits its target dead on!" );
                  EchoToCockpit( AT_BLOOD, target,
				   "The ship is hit by a missile.");
                  EchoToShip( AT_RED, target,
				"A loud explosion shakes thee ship violently!" );
                  sprintf( buf, "You see a small explosion as %s is hit by a missile", target->name );
                  EchoToNearbyShips( AT_ORANGE, target, buf, ship );

                  for ( ch = first_char; ch; ch = ch->next )
		    {
		      if ( !IsNpc( ch ) && nifty_is_name( missile->fired_by, ch->name ) )
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

                  extract_missile( missile );
                }
              else
                {
                  echo_to_room( AT_YELLOW , get_room_index(ship->room.gunseat), "Your missile explodes harmlessly in a cloud of chaff!" );
                  EchoToCockpit( AT_YELLOW, target, "A missile explodes in your chaff.");
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
	    {
	      extract_missile( missile );
	    }
        }
    }
}
