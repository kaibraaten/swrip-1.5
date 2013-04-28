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

#include <math.h>
#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include "mud.h"
#include "vector3_aux.h"

/* ships.c */
void landship( SHIP_DATA *ship, const char *arg );
void approachland( SHIP_DATA *ship, const char *arg );
void launchship( SHIP_DATA *ship );
void makedebris( SHIP_DATA *ship );
ch_ret drive_ship( CHAR_DATA *ch, SHIP_DATA *ship, EXIT_DATA *pexit, int fall );

MISSILE_DATA *first_missile = NULL;
MISSILE_DATA *last_missile = NULL;

SPACE_DATA *first_spaceobject = NULL;
SPACE_DATA *last_spaceobject = NULL;

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
void    fread_spaceobject( SPACE_DATA *spaceobject, FILE *fp );
bool    load_one_spaceobject( const char *spaceobjectfile );
void    write_spaceobject_list( void );
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

void write_spaceobject_list()
{
  SPACE_DATA *tspaceobject = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SPACE_DIR, SPACE_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open space.lst for writing!\r\n", 0 );
      return;
    }

  for ( tspaceobject = first_spaceobject; tspaceobject; tspaceobject = tspaceobject->next )
    fprintf( fpout, "%s\n", tspaceobject->filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

/*
 * Get pointer to space structure from spaceobject name.
 */
SPACE_DATA *spaceobject_from_name( const char *name )
{
  SPACE_DATA *spaceobject = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !str_cmp( name, spaceobject->name ) )
      return spaceobject;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !str_prefix( name, spaceobject->name ) )
      return spaceobject;

  return NULL;
}

/*
 * Get pointer to space structure from the dock vnun.
 */
SPACE_DATA *spaceobject_from_vnum( int vnum )
{
  SPACE_DATA *spaceobject = NULL;
  SHIP_DATA *ship = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if ( vnum == spaceobject->doca ||
	   vnum == spaceobject->docb ||
	   vnum == spaceobject->docc )
	{
	  return spaceobject;
	}
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->hanger )
	{
	  if( !(ship->bayopen) )
	    {
	      return NULL;
	    }

	  return ship->spaceobject;
	}
    }

  return NULL;
}

/*
 * Save a spaceobject's data to its data file
 */
void save_spaceobject( SPACE_DATA *spaceobject )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !spaceobject )
    {
      bug( "%s: null pointer!", __FUNCTION__ );
      return;
    }

  if ( !spaceobject->filename || spaceobject->filename[0] == '\0' )
    {
      bug( "%s: %s has no filename", __FUNCTION__, spaceobject->name );
      return;
    }

  sprintf( filename, "%s%s", SPACE_DIR, spaceobject->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#SPACE\n" );
      fprintf( fp, "Name         %s~\n",   spaceobject->name      );
      fprintf( fp, "Filename     %s~\n",   spaceobject->filename  );
      fprintf( fp, "Type         %d~\n",   spaceobject->type      );
      fprintf( fp, "Locationa      %s~\n", spaceobject->locationa );
      fprintf( fp, "Locationb      %s~\n", spaceobject->locationb );
      fprintf( fp, "Locationc      %s~\n", spaceobject->locationc );
      fprintf( fp, "Doca          %d\n",   spaceobject->doca      );
      fprintf( fp, "Docb          %d\n",   spaceobject->docb      );
      fprintf( fp, "Docc          %d\n",   spaceobject->docc      );
      fprintf( fp, "Seca          %d\n",   spaceobject->seca      );
      fprintf( fp, "Secb          %d\n",   spaceobject->secb      );
      fprintf( fp, "Secc          %d\n",   spaceobject->secc      );
      fprintf( fp, "Gravity     %d\n",     spaceobject->gravity   );
      fprintf( fp, "Xpos          %.0f\n", spaceobject->pos.x     );
      fprintf( fp, "Ypos          %.0f\n", spaceobject->pos.y     );
      fprintf( fp, "Zpos          %.0f\n", spaceobject->pos.z     );
      fprintf( fp, "HX            %.0f\n", spaceobject->head.x    );
      fprintf( fp, "HY            %.0f\n", spaceobject->head.y    );
      fprintf( fp, "HZ            %.0f\n", spaceobject->head.z    );
      fprintf( fp, "SP            %d\n",   spaceobject->speed     );
      fprintf( fp, "Trainer       %d\n",   spaceobject->trainer   );
      fprintf( fp, "End\n\n" );
      fprintf( fp, "#END\n" );
    }

  fclose( fp );
}


/*
 * Read in actual spaceobject data.
 */
void fread_spaceobject( SPACE_DATA *spaceobject, FILE *fp )
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

        case 'D':
          KEY( "Doca",  spaceobject->doca,          fread_number( fp ) );
          KEY( "Docb",  spaceobject->docb,          fread_number( fp ) );
          KEY( "Docc",  spaceobject->docc,          fread_number( fp ) );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if (!spaceobject->name)
                spaceobject->name               = STRALLOC( "" );
              if (!spaceobject->locationa)
                spaceobject->locationa            = STRALLOC( "" );
              if (!spaceobject->locationb)
                spaceobject->locationb            = STRALLOC( "" );
              if (!spaceobject->locationc)
                spaceobject->locationc            = STRALLOC( "" );
              return;
            }
          break;

        case 'F':
          KEY( "Filename",      spaceobject->filename,          fread_string_nohash( fp ) );
          break;

        case 'G':
          KEY( "Gravity",  spaceobject->gravity,     fread_number( fp ) );
          break;

        case 'H':
          KEY( "HX",  spaceobject->head.x,     fread_number( fp ) );
          KEY( "HY",  spaceobject->head.y,     fread_number( fp ) );
          KEY( "HZ",  spaceobject->head.z,     fread_number( fp ) );
          break;

        case 'L':
          KEY( "Locationa",     spaceobject->locationa,         fread_string( fp ) );
          KEY( "Locationb",     spaceobject->locationb,         fread_string( fp ) );
          KEY( "Locationc",     spaceobject->locationc,         fread_string( fp ) );
          break;

        case 'N':
          KEY( "Name",  spaceobject->name,              fread_string( fp ) );
          break;

        case 'S':
          KEY( "Seca", spaceobject->seca,               fread_number( fp ) );
          KEY( "Secb", spaceobject->secb,               fread_number( fp ) );
          KEY( "Secc", spaceobject->secc,               fread_number( fp ) );
          KEY( "SP", spaceobject->speed,                fread_number( fp ) );

        case 'T':
          KEY( "Trainer",  spaceobject->trainer,     fread_number( fp ) );
          KEY( "Type",  spaceobject->type,             fread_number( fp ) );

        case 'X':
          KEY( "Xpos",  spaceobject->pos.x,     fread_number( fp ) );

        case 'Y':
          KEY( "Ypos",  spaceobject->pos.y,     fread_number( fp ) );

        case 'Z':
          KEY( "Zpos",  spaceobject->pos.z,     fread_number( fp ) );

        }

      if ( !fMatch )
        {
          bug( "Fread_spaceobject: no match: %s", word );
        }
    }
}

/*
 * Load a spaceobject file
 */

bool load_one_spaceobject( const char *spaceobjectfile )
{
  char filename[256];
  SPACE_DATA *spaceobject = NULL;
  FILE *fp = NULL;
  bool found = FALSE;

  CREATE( spaceobject, SPACE_DATA, 1 );
  sprintf( filename, "%s%s", SPACE_DIR, spaceobjectfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = TRUE;
      LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

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
              bug( "Load_spaceobject_file: # not found.", 0 );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "SPACE"  ) )
            {
              fread_spaceobject( spaceobject, fp );
              break;
            }
          else if ( !str_cmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      bug( "Load_spaceobject_file: bad section: %s.", word );
	      break;
	    }
        }
      fclose( fp );
    }

  if ( !(found) )
    DISPOSE( spaceobject );

  return found;
}

/*
 * Load in all the spaceobject files.
 */
void load_spaceobjects()
{
  FILE *fpList = NULL;
  char spaceobjectlist[256];

  log_string( "Loading spaceobjects..." );
  sprintf( spaceobjectlist, "%s%s", SPACE_DIR, SPACE_LIST );

  if ( ( fpList = fopen( spaceobjectlist, "r" ) ) == NULL )
    {
      perror( spaceobjectlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : fread_word( fpList );

      if ( filename[0] == '$' )
        break;

      if ( !load_one_spaceobject( filename ) )
        {
          bug( "Cannot load spaceobject file: %s", filename );
        }
    }

  fclose( fpList );
  log_string(" Done spaceobjects " );
}

void do_setspaceobject( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  SPACE_DATA *spaceobject;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: setspaceobject <spaceobject> <field> <values>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "name filename type trainer,\r\n", ch );
      send_to_char( "xpos ypos zpos gravity seca secb secc,\r\n", ch );
      send_to_char( "locationa locationb locationc doca docb docc\r\n", ch );
      send_to_char( "", ch );
      return;
    }

  spaceobject = spaceobject_from_name( arg1 );

  if ( !spaceobject )
    {
      send_to_char( "No such spaceobject.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "trainer" ) )
    {
      if ( spaceobject->trainer )
        spaceobject->trainer = 0;
      else
        spaceobject->trainer = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "seca" ) )
    {
      if ( spaceobject->seca )
        spaceobject->seca = 0;
      else
        spaceobject->seca = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "secb" ) )
    {
      if ( spaceobject->secb )
        spaceobject->secb = 0;
      else
        spaceobject->secb = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "secc" ) )
    {
      if ( spaceobject->secc )
        spaceobject->secc = 0;
      else
        spaceobject->secc = 1;

      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      int sotype = 0;

      if( is_number(argument) )
	{
	  sotype = atoi( argument );
	}
      else
	{
	  sotype = get_spaceobj_type_from_name(argument);
	}

      if( sotype < 0 || sotype >= (int)spaceobj_type_size() )
	{
	  size_t n = 0;

	  ch_printf(ch, "Invalid type. Possible values:\r\n");

	  for(n = 0; n < spaceobj_type_size(); ++n)
	    {
	      ch_printf(ch, " %s", get_spaceobj_type_table()[n]);
	    }

	  ch_printf(ch, "\r\n");
	  return;
	}

      spaceobject->type = sotype;
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "doca" ) )
    {
      spaceobject->doca = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "docb" ) )
    {
      spaceobject->docb = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "docc" ) )
    {
      spaceobject->docc = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }


  if ( !str_cmp( arg2, "xpos" ) )
    {
      spaceobject->pos.x = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "ypos" ) )
    {
      spaceobject->pos.y = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "zpos" ) )
    {
      spaceobject->pos.z = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "gravity" ) )
    {
      spaceobject->gravity = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !str_cmp( arg2, "hx" ) )
    {
      spaceobject->head.x = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "hy" ) )
    {
      spaceobject->head.y = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "hz" ) )
    {
      spaceobject->head.z = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "speed" ) )
    {
      spaceobject->speed = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( spaceobject->name );
      spaceobject->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( spaceobject->filename );
      spaceobject->filename = strdup( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  if ( !str_cmp( arg2, "locationa" ) )
    {
      STRFREE( spaceobject->locationa );
      spaceobject->locationa = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !str_cmp( arg2, "locationb" ) )
    {
      STRFREE( spaceobject->locationb );
      spaceobject->locationb = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }
  if ( !str_cmp( arg2, "locationc" ) )
    {
      STRFREE( spaceobject->locationc );
      spaceobject->locationc = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_spaceobject( spaceobject );
      return;
    }

  do_setspaceobject( ch, "" );
}

void showspaceobject( CHAR_DATA *ch , SPACE_DATA *spaceobject )
{
  ch_printf( ch, "Space object: %s\r\n", spaceobject->name);
  ch_printf( ch, "Filename:     %s\r\n", spaceobject->filename);
  ch_printf( ch, "Trainer:      %s\r\n", spaceobject->trainer ? "Yes" : "No");
  ch_printf( ch, "Type:         %s (%d)\r\n", capitalize(get_spaceobj_type(spaceobject->type)), spaceobject->type);

  ch_printf( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
             spaceobject->pos.x, spaceobject->pos.y, spaceobject->pos.z);
  ch_printf( ch, "Gravity:      %d\r\n", spaceobject->gravity);
  ch_printf( ch, "     doca: %5d (%s)\r\n",
             spaceobject->doca, spaceobject->locationa);
  ch_printf( ch, "     docb: %5d (%s)\r\n",
             spaceobject->docb, spaceobject->locationb);
  ch_printf( ch, "     docc: %5d (%s)\r\n",
             spaceobject->docc, spaceobject->locationc);
}

void do_showspaceobject( CHAR_DATA *ch, char *argument )
{
  SPACE_DATA *spaceobject = spaceobject_from_name( argument );

  if ( spaceobject == NULL )
    send_to_char("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);

}

void do_makespaceobject( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char filename[256];
  SPACE_DATA *spaceobject;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }


  CREATE( spaceobject, SPACE_DATA, 1 );
  LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

  spaceobject->name      = STRALLOC( argument );

  spaceobject->locationa = STRALLOC( "" );
  spaceobject->locationb = STRALLOC( "" );
  spaceobject->locationc = STRALLOC( "" );

  argument = one_argument( argument, arg );
  sprintf( filename, "%s" , strlower(arg) );
  spaceobject->filename = str_dup( filename );
  save_spaceobject( spaceobject );
  write_spaceobject_list();
}

void do_spaceobjects( CHAR_DATA *ch, char *argument )
{
  SPACE_DATA *spaceobject;
  int count = 0;

  set_char_color( AT_RED, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type > SPACE_SUN )
        continue;

      if ( !(spaceobject->trainer && (!IS_GOD(ch))) )
        ch_printf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  ch_printf( ch, "\r\n" );
  set_char_color( AT_NOTE, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type != SPACE_PLANET )
        continue;

      if ( !(spaceobject->trainer && (!IS_GOD(ch))) )
        ch_printf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  if ( !count )
    {
      send_to_char( "There are no spaceobjects currently formed.\r\n", ch );
      return;
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

/* Generic Pilot Command To use as template

   void do_hmm( CHAR_DATA *ch, char *argument )
   {
   char arg[MAX_INPUT_LENGTH];
   int the_chance;
   SHIP_DATA *ship;

   strcpy( arg, argument );

   switch( ch->substate )
   {
   default:
   if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
   {
   send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
   return;
   }
   if (ship->shipstate == SHIP_HYPERSPACE)
   {
   send_to_char("&RYou can only do that in realspace!\r\n",ch);
   return;
   }
   if (ship->shipstate == SHIP_DISABLED)
   {
   send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
   return;
   }
   if (ship->shipstate == SHIP_LANDED)
   {
   send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
   return;
   }
   if (ship->shipstate != SHIP_READY)
   {
   send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
   return;
   }

   if ( ship->energy <1 )
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
   if ( ship->sclass == CAPITAL_SHIP )
   the_chance = IS_NPC(ch) ? ch->top_level
   : (int) (ch->pcdata->learned[gsn_capitalships]);
   if ( number_percent( ) < the_chance )
   {
   send_to_char( "&G\r\n", ch);
   act( AT_PLAIN, "$n does  ...", ch,
   NULL, argument , TO_ROOM );
   echo_to_room( AT_YELLOW , get_room_index(ship->cockpit) , "");
   add_timer ( ch , TIMER_DO_FUN , 1 , do_hmm , 1 );
   ch->dest_buf = str_dup(arg);
   return;
   }
   send_to_char("&RYou fail to work the controls properly.\r\n",ch);
   if ( ship->sclass == FIGHTER_SHIP )
   learn_from_failure( ch, gsn_starfighters );
   if ( ship->sclass == MIDSIZE_SHIP )
   learn_from_failure( ch, gsn_midships );
   if ( ship->sclass == CAPITAL_SHIP )
   learn_from_failure( ch, gsn_capitalships );
   return;

   case 1:
   if ( !ch->dest_buf )
   return;
   strcpy(arg, ch->dest_buf);
   DISPOSE( ch->dest_buf);
   break;

   case SUB_TIMER_DO_ABORT:
   DISPOSE( ch->dest_buf );
   ch->substate = SUB_NONE;
   if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
   return;
   send_to_char("&Raborted.\r\n", ch);
   echo_to_room( AT_YELLOW , get_room_index(ship->cockpit) , "");
   if (ship->shipstate != SHIP_DISABLED)
   ship->shipstate = SHIP_READY;
   return;
   }

   ch->substate = SUB_NONE;

   if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
   {
   return;
   }

   send_to_char( "&G\r\n", ch);
   act( AT_PLAIN, "$n does  ...", ch,
   NULL, argument , TO_ROOM );
   echo_to_room( AT_YELLOW , get_room_index(ship->cockpit) , "");


   if ( ship->sclass == FIGHTER_SHIP )
   learn_from_success( ch, gsn_starfighters );
   if ( ship->sclass == MIDSIZE_SHIP )
   learn_from_success( ch, gsn_midships );
   if ( ship->sclass == CAPITAL_SHIP )
   learn_from_success( ch, gsn_capitalships );

   }

   void do_hmm( CHAR_DATA *ch, char *argument )
   {
   char arg[MAX_INPUT_LENGTH];
   int the_chance;
   SHIP_DATA *ship;


   if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
   {
   send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
   return;
   }

   if (ship->shipstate == SHIP_HYPERSPACE)
   {
   send_to_char("&RYou can only do that in realspace!\r\n",ch);
   return;
   }
   if (ship->shipstate == SHIP_DISABLED)
   {
   send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
   return;
   }
   if (ship->shipstate == SHIP_LANDED)
   {
   send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
   return;
   }
   if (ship->shipstate != SHIP_READY)
   {
   send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
   return;
   }

   if ( ship->energy <1 )
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
   if ( ship->sclass == CAPITAL_SHIP )
   the_chance = IS_NPC(ch) ? ch->top_level
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

   send_to_char( "&G\r\n", ch);
   act( AT_PLAIN, "$n does  ...", ch,
   NULL, argument , TO_ROOM );
   echo_to_room( AT_YELLOW , get_room_index(ship->cockpit) , "");



   if ( ship->sclass == FIGHTER_SHIP )
   learn_from_success( ch, gsn_starfighters );
   if ( ship->sclass == MIDSIZE_SHIP )
   learn_from_success( ch, gsn_midships );
   if ( ship->sclass == CAPITAL_SHIP )
   learn_from_success( ch, gsn_capitalships );
   }
*/
