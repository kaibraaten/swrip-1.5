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
 *                                Planets                                   *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "clan.h"

PLANET_DATA * first_planet = NULL;
PLANET_DATA * last_planet = NULL;

GUARD_DATA * first_guard = NULL;
GUARD_DATA * last_guard = NULL;

static void fread_planet( PLANET_DATA *planet, FILE *fp );
static bool load_planet_file( const char *planetfile );

PLANET_DATA *get_planet( const char *name )
{
  PLANET_DATA *planet;

  for ( planet = first_planet; planet; planet = planet->next )
    {
      if ( !str_cmp( name, planet->name ) )
        {
          return planet;
        }
    }

  return NULL;
}

void write_planet_list( void )
{
  PLANET_DATA *tplanet;
  FILE *fpout;
  char filename[256];

  sprintf( filename, "%s%s", PLANET_DIR, PLANET_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open planet.lst for writing!\r\n", 0 );
      return;
    }

  for ( tplanet = first_planet; tplanet; tplanet = tplanet->next )
    {
      fprintf( fpout, "%s\n", tplanet->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void save_planet( const PLANET_DATA *planet )
{
  FILE *fp;
  char filename[256];
  char buf[MAX_STRING_LENGTH];

  if ( !planet )
    {
      bug( "save_planet: null planet pointer!", 0 );
      return;
    }

  if ( !planet->filename || planet->filename[0] == '\0' )
    {
      sprintf( buf, "save_planet: %s has no filename", planet->name );
      bug( buf, 0 );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, planet->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_planet: fopen", 0 );
      perror( filename );
    }
  else
    {
      AREA_DATA *pArea;

      fprintf( fp, "#PLANET\n" );
      fprintf( fp, "Name         %s~\n", planet->name        );
      fprintf( fp, "Filename     %s~\n", planet->filename    );
      fprintf( fp, "BaseValue    %ld\n", planet->base_value  );
      fprintf( fp, "Flags        %d\n",  planet->flags       );
      fprintf( fp, "PopSupport   %f\n",  planet->pop_support );

      if ( planet->spaceobject && planet->spaceobject->name )
        {
          fprintf( fp, "spaceobject   %s~\n", planet->spaceobject->name );
        }

      if ( planet->governed_by && planet->governed_by->name )
        {
          fprintf( fp, "GovernedBy   %s~\n", planet->governed_by->name );
        }

      for( pArea = planet->first_area; pArea; pArea = pArea->next_on_planet )
        {
          if (pArea->filename)
            {
              fprintf( fp, "Area         %s~\n", pArea->filename );
            }
        }

      fprintf( fp, "End\n\n" );
      fprintf( fp, "#END\n" );
    }

  fclose( fp );
}

static void fread_planet( PLANET_DATA *planet, FILE *fp )
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
          if ( !str_cmp( word, "Area" ) )
            {
              char aName[MAX_STRING_LENGTH];
              AREA_DATA *pArea;
              char *tmp = fread_string_hash(fp);

              sprintf (aName, "%s", tmp);
              STRFREE(tmp);

              for( pArea = first_area; pArea; pArea = pArea->next )
                {
                  if (pArea->filename && !str_cmp(pArea->filename , aName ) )
                    {
                      pArea->planet = planet;
                      LINK( pArea, planet->first_area, planet->last_area,
                            next_on_planet, prev_on_planet);
                    }
                }

              fMatch = TRUE;
            }
          break;

	case 'B':
          KEY( "BaseValue", planet->base_value, fread_number( fp ) );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if (!planet->name)
                {
                  planet->name = STRALLOC( "" );
                }

              return;
            }
          break;

        case 'F':
          KEY( "Filename", planet->filename, fread_string_nohash( fp ) );
          KEY( "Flags",    planet->flags,    fread_number( fp ) );
          break;

        case 'G':
          if ( !str_cmp( word, "GovernedBy" ) )
            {
              planet->governed_by = GetClan( fread_string_hash(fp) );
              fMatch = TRUE;
            }
          break;

        case 'N':
          KEY( "Name",  planet->name, fread_string_hash( fp ) );
          break;

        case 'P':
          KEY( "PopSupport", planet->pop_support, fread_number( fp ) );
          break;

        case 'S':
          if ( !str_cmp( word, "spaceobject" ) )
            {
              char *tmp = fread_string_hash(fp);

              planet->spaceobject = spaceobject_from_name( tmp );
              STRFREE(tmp);

	      if (planet->spaceobject)
                {
                  SPACE_DATA *spaceobject = planet->spaceobject;

                  spaceobject->planet = planet;
                }

              fMatch = TRUE;
            }
          break;

        case 'T':
          KEY( "Taxes", planet->base_value, fread_number( fp ) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_planet: no match: %s", word );
        }
    }
}

static bool load_planet_file( const char *planetfile )
{
  char filename[256];
  PLANET_DATA *planet;
  FILE *fp;
  bool found = FALSE;

  CREATE( planet, PLANET_DATA, 1 );

  planet->governed_by = NULL;
  planet->next_in_system = NULL;
  planet->prev_in_system = NULL;
  planet->spaceobject = NULL ;
  planet->first_area = NULL;
  planet->last_area = NULL;
  planet->first_guard = NULL;
  planet->last_guard = NULL;

  sprintf( filename, "%s%s", PLANET_DIR, planetfile );

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
              bug( "Load_planet_file: # not found." );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "PLANET" ) )
            {
              fread_planet( planet, fp );
              break;
            }
          else if ( !str_cmp( word, "END"  ) )
            {
              break;
            }
          else
            {
              bug( "Load_planet_file: bad section: %s.", word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !found )
    {
      DISPOSE( planet );
    }
  else
    {
      LINK( planet, first_planet, last_planet, next, prev );
    }

  return found;
}

void load_planets( void )
{
  FILE *fpList;
  char planetlist[256];

  log_string( "Loading planets..." );
  sprintf( planetlist, "%s%s", PLANET_DIR, PLANET_LIST );

  if ( ( fpList = fopen( planetlist, "r" ) ) == NULL )
    {
      perror( planetlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : fread_word( fpList );
      log_string( filename );

      if ( filename[0] == '$' )
        {
          break;
        }

      if ( !load_planet_file( filename ) )
        {
          bug( "Cannot load planet file: %s", filename );
        }
    }

  fclose( fpList );
  log_string(" Done planets " );
}

long get_taxes( const PLANET_DATA *planet )
{
  long gain;

  gain = planet->base_value;
  gain += planet->base_value*planet->pop_support/100;
  gain += UMAX(0, planet->pop_support/10 * planet->population);

  return gain;
}
