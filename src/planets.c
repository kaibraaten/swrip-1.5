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
#include "clan.h"
#include "spaceobject.h"

Planet * first_planet = NULL;
Planet * last_planet = NULL;

GuardData * first_guard = NULL;
GuardData * last_guard = NULL;

static void ReadPlanet( Planet *planet, FILE *fp );
static bool LoadPlanetFile( const char *planetfile );

Planet *GetPlanet( const char *name )
{
  Planet *planet;

  for ( planet = first_planet; planet; planet = planet->Next )
    {
      if ( !StrCmp( name, planet->Name ) )
        {
          return planet;
        }
    }

  return NULL;
}

void WritePlanetList( void )
{
  const Planet *tplanet = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", PLANET_DIR, PLANET_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open planet.lst for writing!\r\n", 0 );
      return;
    }

  for ( tplanet = first_planet; tplanet; tplanet = tplanet->Next )
    {
      fprintf( fpout, "%s\n", tplanet->Filename );
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

  if ( IsNullOrEmpty( planet->Filename ) )
    {
      Bug( "SavePlanet: %s has no filename", planet->Name );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, planet->Filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "SavePlanet: fopen" );
      perror( filename );
    }
  else
    {
      const Area *pArea = NULL;

      fprintf( fp, "#PLANET\n" );
      fprintf( fp, "Name         %s~\n", planet->Name        );
      fprintf( fp, "Filename     %s~\n", planet->Filename    );
      fprintf( fp, "BaseValue    %ld\n", planet->BaseValue  );
      fprintf( fp, "Flags        %d\n",  planet->Flags       );
      fprintf( fp, "PopSupport   %f\n",  planet->PopularSupport );

      if ( planet->Spaceobject && planet->Spaceobject->Name )
        {
          fprintf( fp, "spaceobject   %s~\n", planet->Spaceobject->Name );
        }

      if ( planet->GovernedBy && planet->GovernedBy->Name )
        {
          fprintf( fp, "GovernedBy   %s~\n", planet->GovernedBy->Name );
        }

      for( pArea = planet->FirstArea; pArea; pArea = pArea->next_on_planet )
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

static void ReadPlanet( Planet *planet, FILE *fp )
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
                      LINK( pArea, planet->FirstArea, planet->LastArea,
                            next_on_planet, prev_on_planet);
                    }
                }

              fMatch = true;
            }
          break;

	case 'B':
          KEY( "BaseValue", planet->BaseValue, ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if (!planet->Name)
                {
                  planet->Name = CopyString( "" );
                }

              return;
            }
          break;

        case 'F':
          KEY( "Filename", planet->Filename, ReadStringToTilde( fp ) );
          KEY( "Flags",    planet->Flags,    ReadInt( fp ) );
          break;

        case 'G':
          if ( !StrCmp( word, "GovernedBy" ) )
            {
              planet->GovernedBy = GetClan( ReadStringToTilde(fp) );
              fMatch = true;
            }
          break;

        case 'N':
          KEY( "Name",  planet->Name, ReadStringToTilde( fp ) );
          break;

        case 'P':
          KEY( "PopSupport", planet->PopularSupport, ReadFloat( fp ) );
          break;

        case 'S':
          if ( !StrCmp( word, "spaceobject" ) )
            {
              char *tmp = ReadStringToTilde(fp);

              planet->Spaceobject = GetSpaceobjectFromName( tmp );
              FreeMemory(tmp);

	      if (planet->Spaceobject)
                {
                  Spaceobject *spaceobject = planet->Spaceobject;

                  spaceobject->Planet = planet;
                }

              fMatch = true;
            }
          break;

        case 'T':
          KEY( "Taxes", planet->BaseValue, ReadInt( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_planet: no match: %s", word );
        }
    }
}

static bool LoadPlanetFile( const char *planetfile )
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
              ReadPlanet( planet, fp );
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
      LINK( planet, first_planet, last_planet, Next, Previous );
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

      if ( !LoadPlanetFile( filename ) )
        {
          Bug( "Cannot load planet file: %s", filename );
        }
    }

  fclose( fpList );
  LogPrintf(" Done planets " );
}

long GetTaxes( const Planet *planet )
{
  long gain = planet->BaseValue;
  gain += planet->BaseValue * planet->PopularSupport / 100;
  gain += umax(0, planet->PopularSupport / 10 * planet->Population);

  return gain;
}
