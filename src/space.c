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
 *                              Space Module                               *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for strdup() */
#define _BSD_SOURCE
#endif

#include "mud.h"
#include "vector3_aux.h"

MISSILE_DATA *first_missile = NULL;
MISSILE_DATA *last_missile = NULL;

#if 0
int bus_pos =0;
int bus_planet =0;
int bus2_planet = 8;
int bus3_planet = 11;
int bus4_planet = 3;
int turbocar_stop =0;
int corus_shuttle =0;

#define MAX_STATION    10
#define MAX_BUS_STOP 14

#define STOP_PLANET     202
#define STOP_SHIPYARD   32015

#define SENATEPAD       32055
#define OUTERPAD        2064

#define SHUTTLESTOP_NONEXISTANT      2
#define SHUTTLESTOP_CORUSCANT      201
#define SHUTTLESTOP_RYLOTH         822
#define SHUTTLESTOP_ENDOR         3060
#define SHUTTLESTOP_YAVIN         6100
#define SHUTTLESTOP_SPACEMALL     7300
#define SHUTTLESTOP_CORELLIA     10500
#define SHUTTLESTOP_HOTH         11206
#define SHUTTLESTOP_MONCALAMARI  21100
#define SHUTTLESTOP_CORULAG      21944
#define SHUTTLESTOP_KUAT         23082
#define SHUTTLESTOP_GAMORR       28038
#define SHUTTLESTOP_KASHYYYK     28613
#define SHUTTLESTOP_ADARI        29001
#define SHUTTLESTOP_TATOOINE     31872
#define SHUTTLESTOP_BYSS         28247

struct  serin_shuttle
{
  char          name    [20];
  int                   startingloc;
  int                   cockpitvnum;
  int                   planetloc;
  int           const   bus_vnum [12];
  char *        const   bus_stop [12];
};

/* New Serin system, makes it much easier to add new ones - Darrik Vequir, May, 01 */
/* MAX_BUS defined in mud.h */

struct serin_shuttle serin[MAX_BUS] =
  {
    {
      "Pluogus", 0, 32140, 0,
      { SHUTTLESTOP_CORUSCANT, SHUTTLESTOP_CORULAG, SHUTTLESTOP_KASHYYYK, SHUTTLESTOP_MONCALAMARI, SHUTTLESTOP_GAMORR, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_CORUSCANT },
      { "Coruscant", "Corulag", "Kashyyyk", "Mon Calamari", "Gamorr", "Corellia", "Coruscant" }

    },
    {
      "Tocca", 0, 32410, 0,
      { SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_CORULAG, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_ADARI, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_KUAT, SHUTTLESTOP_NONEXISTANT },
      { "Ord Mantell", "Corulag", "Corellia", "Adari", "Roche", "Sullust", "Kuat", "Ord Mantell" }

    },
    {
      "Cassia", 0, 32425, 0,
      { SHUTTLESTOP_BYSS, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_TATOOINE, SHUTTLESTOP_RYLOTH, SHUTTLESTOP_GAMORR, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_BYSS },
      { "Byss", "Corellia", "Af'el", "Tatooine", "Ryloth", "Gamorr", "Corellia", "Byss" }

    },
    {
      "Siego", 0, 32435, 0,
      { SHUTTLESTOP_CORUSCANT, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_SPACEMALL, SHUTTLESTOP_HOTH, SHUTTLESTOP_ENDOR, SHUTTLESTOP_YAVIN, SHUTTLESTOP_BYSS, SHUTTLESTOP_CORUSCANT },
      { "Coruscant", "Corellia", "Corporate Sector Space Mall", "Hoth", "Endor", "Yavin IV", "Byss", "Coruscant"}

    },
    {
      "Amose", 0, 32445, 0,
      { SHUTTLESTOP_ENDOR, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_TATOOINE, SHUTTLESTOP_GAMORR, SHUTTLESTOP_MONCALAMARI, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_ENDOR },
      { "Endor", "Bespin", "Sullust", "Tatooine", "Gamorr", "Mon Calamari", "Ord Mantell", "Endor"}

    },
    {
      "Edena", 0, 32440, 0,
      { SHUTTLESTOP_BYSS, SHUTTLESTOP_CORUSCANT, SHUTTLESTOP_CORULAG, SHUTTLESTOP_KUAT, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_ADARI, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_BYSS },
      { "Byss", "Coruscant", "Corulag", "Kuat", "Corellia", "Adari", "Wroona", "Byss"}

    },
    {
      "Odani", 0, 32450, 0,
      { SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_KASHYYYK, SHUTTLESTOP_NONEXISTANT, SHUTTLESTOP_KUAT, SHUTTLESTOP_CORELLIA, SHUTTLESTOP_ADARI, SHUTTLESTOP_NONEXISTANT },
      { "Wroona", "Roche", "Kashyyyk", "Ord Mantell", "Kuat", "Corellia", "Adari", "Wroona"}

    }
  };


int     const   station_vnum [MAX_STATION] =
  {
    215 , 216 , 217 , 218 , 219 , 220 , 221 ,222 , 223 , 224
  };

char *  const   station_name [MAX_STATION] =
  {
    "Menari Spaceport" , "Skydome Botanical Gardens" , "Grand Towers" ,
    "Grandis Mon Theater" , "Palace Station" , "Great Galactic Museum" ,
    "College Station" , "Holographic Zoo of Extinct Animals" ,
    "Dometown Station " , "Monument Plaza"
  };
#endif

/* local routines */
#if 0
bool    land_bus( SHIP_DATA *ship, int destination );
void    launch_bus( SHIP_DATA *ship );
#endif
void    echo_to_room_dnr( int ecolor, ROOM_INDEX_DATA *room, const char *argument );

ROOM_INDEX_DATA *generate_exit( ROOM_INDEX_DATA *in_room, EXIT_DATA **pexit );


void echo_to_room_dnr( int ecolor, ROOM_INDEX_DATA *room,
		       const char *argument )
{
  CHAR_DATA *vic = NULL;

  if ( room == NULL )
    return;

  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      set_char_color( ecolor, vic );
      send_to_char( argument, vic );
    }
}

void new_missile( SHIP_DATA *ship , SHIP_DATA *target , CHAR_DATA *ch , int missiletype )
{
  SPACE_DATA *spaceobject;
  MISSILE_DATA *missile;

  if ( ship  == NULL )
    return;

  if ( target  == NULL )
    return;

  if ( ( spaceobject = ship->spaceobject ) == NULL )
    return;

  CREATE( missile, MISSILE_DATA, 1 );
  LINK( missile, first_missile, last_missile, next, prev );

  missile->target = target;
  missile->fired_from = ship;
  if ( ch )
    missile->fired_by = STRALLOC( ch->name );
  else
    missile->fired_by = STRALLOC( "" );
  missile->missiletype = missiletype;
  missile->age =0;
  if ( missile->missiletype == HEAVY_BOMB )
    missile->speed = 20;
  else if ( missile->missiletype == PROTON_TORPEDO )
    missile->speed = 200;
  else if ( missile->missiletype == CONCUSSION_MISSILE )
    missile->speed = 300;
  else
    missile->speed = 50;

  vector_copy( &missile->pos, &ship->pos );
  missile->spaceobject = spaceobject;
}

void extract_missile( MISSILE_DATA *missile )
{
  SPACE_DATA *spaceobject;

  if ( missile == NULL )
    return;

  if ( ( spaceobject = missile->spaceobject ) != NULL )
    missile->spaceobject = NULL;

  UNLINK( missile, first_missile, last_missile, next, prev );

  missile->target = NULL;
  missile->fired_from = NULL;
  if (  missile->fired_by )
    STRFREE( missile->fired_by );

  DISPOSE( missile );
}

void update_missiles( void )
{
  MISSILE_DATA *missile = NULL;
  MISSILE_DATA *m_next = NULL;

  for ( missile = first_missile; missile; missile = m_next )
    {
      SHIP_DATA *ship = NULL;
      SHIP_DATA *target = NULL;

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
		  bool ch_found = FALSE;
		  CHAR_DATA *ch = NULL;
		  char buf[MAX_STRING_LENGTH];

                  echo_to_room( AT_YELLOW, get_room_index(ship->gunseat),
				"Your missile hits its target dead on!" );
                  echo_to_cockpit( AT_BLOOD, target,
				   "The ship is hit by a missile.");
                  echo_to_ship( AT_RED, target,
				"A loud explosion shakes thee ship violently!" );
                  sprintf( buf, "You see a small explosion as %s is hit by a missile", target->name );
                  echo_to_nearby_ships( AT_ORANGE, target, buf, ship );

                  for ( ch = first_char; ch; ch = ch->next )
		    {
		      if ( !IS_NPC( ch ) && nifty_is_name( missile->fired_by, ch->name ) )
			{
			  ch_found = TRUE;
			  damage_ship_ch( target, 30 + missile->missiletype * missile->missiletype * 30, 50 + missile->missiletype * missile->missiletype * missile->missiletype * 50, ch );
			}
		    }

		  if ( !ch_found )
		    {
		      damage_ship( target , ship, 20+missile->missiletype*missile->missiletype*20 ,
				   30+missile->missiletype*missile->missiletype*ship->missiletype*30 );
		    }

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
}
