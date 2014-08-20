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
#include "mud.h"

Planet * first_planet = NULL;
Planet * last_planet = NULL;

GuardData * first_guard = NULL;
GuardData * last_guard = NULL;

static void fread_planet( Planet *planet, FILE *fp );
static bool load_planet_file( const char *planetfile );

Planet *GetPlanet( const char *name )
{
  Planet *planet;

  for ( planet = first_planet; planet; planet = planet->next )
    {
      if ( !StrCmp( name, planet->name ) )
        {
          return planet;
        }
    }

  return NULL;
}

void WritePlanetList( void )
{
  Planet *tplanet = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", PLANET_DIR, PLANET_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open planet.lst for writing!\r\n", 0 );
      return;
    }

  for ( tplanet = first_planet; tplanet; tplanet = tplanet->next )
    {
      fprintf( fpout, "%s\n", tplanet->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void SavePlanet( const Planet *planet )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !planet )
    {
      Bug( "SavePlanet: null planet pointer!", 0 );
      return;
    }

  if ( !planet->filename || planet->filename[0] == '\0' )
    {
      Bug( "SavePlanet: %s has no filename", planet->name );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, planet->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "SavePlanet: fopen" );
      perror( filename );
    }
  else
    {
      Area *pArea = NULL;

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

static void fread_planet( Planet *planet, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          if ( !StrCmp( word, "Area" ) )
            {
              char aName[MAX_STRING_LENGTH];
              Area *pArea;
              char *tmp = ReadStringToTilde(fp);

              sprintf (aName, "%s", tmp);
              FreeMemory(tmp);

              for( pArea = first_area; pArea; pArea = pArea->next )
                {
                  if (pArea->filename && !StrCmp(pArea->filename , aName ) )
                    {
                      pArea->planet = planet;
                      LINK( pArea, planet->first_area, planet->last_area,
                            next_on_planet, prev_on_planet);
                    }
                }

              fMatch = true;
            }
          break;

	case 'B':
          KEY( "BaseValue", planet->base_value, ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if (!planet->name)
                {
                  planet->name = CopyString( "" );
                }

              return;
            }
          break;

        case 'F':
          KEY( "Filename", planet->filename, ReadStringToTilde( fp ) );
          KEY( "Flags",    planet->flags,    ReadInt( fp ) );
          break;

        case 'G':
          if ( !StrCmp( word, "GovernedBy" ) )
            {
              planet->governed_by = GetClan ( ReadStringToTilde(fp) );
              fMatch = true;
            }
          break;

        case 'N':
          KEY( "Name",  planet->name, ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PopSupport", planet->pop_support, ReadFloat( fp ) );
          break;

        case 'S':
          if ( !StrCmp( word, "spaceobject" ) )
            {
              char *tmp = ReadStringToTilde(fp);

              planet->spaceobject = GetSpaceobjectFromName( tmp );
              FreeMemory(tmp);

	      if (planet->spaceobject)
                {
                  Spaceobject *spaceobject = planet->spaceobject;

                  spaceobject->planet = planet;
                }

              fMatch = true;
            }
          break;

        case 'T':
          KEY( "Taxes", planet->base_value, ReadInt( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_planet: no match: %s", word );
        }
    }
}

static bool load_planet_file( const char *planetfile )
{
  char filename[256];
  Planet *planet = NULL;
  FILE *fp = NULL;
  bool found = false;

  AllocateMemory( planet, Planet, 1 );

  sprintf( filename, "%s%s", PLANET_DIR, planetfile );

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
              Bug( "Load_planet_file: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "PLANET" ) )
            {
              fread_planet( planet, fp );
              break;
            }
          else if ( !StrCmp( word, "END"  ) )
            {
              break;
            }
          else
            {
              Bug( "Load_planet_file: bad section: %s.", word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !found )
    {
      FreeMemory( planet );
    }
  else
    {
      LINK( planet, first_planet, last_planet, next, prev );
    }

  return found;
}

void LoadPlanets( void )
{
  FILE *fpList = NULL;
  char planetlist[256];

  LogPrintf( "Loading planets..." );
  sprintf( planetlist, "%s%s", PLANET_DIR, PLANET_LIST );

  if ( ( fpList = fopen( planetlist, "r" ) ) == NULL )
    {
      perror( planetlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );
      LogPrintf( filename );

      if ( filename[0] == '$' )
        {
          break;
        }

      if ( !load_planet_file( filename ) )
        {
          Bug( "Cannot load planet file: %s", filename );
        }
    }

  fclose( fpList );
  LogPrintf(" Done planets " );
}

long GetTaxes( const Planet *planet )
{
  long gain = planet->base_value;
  gain += planet->base_value*planet->pop_support/100;
  gain += umax(0, planet->pop_support/10 * planet->population);

  return gain;
}
