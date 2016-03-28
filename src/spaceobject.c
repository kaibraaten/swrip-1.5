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
#include "mud.h"
#include "vector3_aux.h"
#include "spaceobject.h"
#include "script.h"

Spaceobject *first_spaceobject = NULL;
Spaceobject *last_spaceobject = NULL;

/* local routines */
static void ReadSpaceobject( Spaceobject *spaceobject, FILE *fp );
static bool LoadSpaceobjectFile( const char *spaceobjectfile );

void SpaceobjectUpdate( void )
{
  Spaceobject *spaceobj = NULL;

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      MoveSpaceobject( spaceobj );

      if( spaceobj->Position.x > MAX_COORD )
        spaceobj->Position.x = -MAX_COORD_S;

      if( spaceobj->Position.y > MAX_COORD )
        spaceobj->Position.y = -MAX_COORD_S;

      if( spaceobj->Position.z > MAX_COORD )
        spaceobj->Position.z = -MAX_COORD_S;

      if( spaceobj->Position.x < -MAX_COORD )
        spaceobj->Position.x = MAX_COORD_S;

      if( spaceobj->Position.y < -MAX_COORD )
        spaceobj->Position.y = MAX_COORD_S;

      if( spaceobj->Position.z < -MAX_COORD )
        spaceobj->Position.z = MAX_COORD_S;
    }
}

/*
 * Get pointer to space structure from spaceobject name.
 */
Spaceobject *GetSpaceobjectFromName( const char *name )
{
  Spaceobject *spaceobject = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !StrCmp( name, spaceobject->Name ) )
      return spaceobject;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !StringPrefix( name, spaceobject->Name ) )
      return spaceobject;

  return NULL;
}

/*
 * Get pointer to space structure from the dock vnun.
 */
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum )
{
  Spaceobject *spaceobject = NULL;
  Ship *ship = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if ( GetLandingSiteFromVnum( spaceobject, vnum ) )
	{
	  return spaceobject;
	}
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.hanger )
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

static bool LandingSiteIsBlank( const LandingSite *site )
{
  return IsNullOrEmpty( site->LocationName ) && site->Dock == INVALID_VNUM;
}

static void PushOneSite( lua_State *L, const LandingSite *site, int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", site->LocationName );
  LuaSetfieldNumber( L, "DockVnum",  site->Dock );
  LuaSetfieldNumber( L, "IsSecret", site->IsSecret );

  lua_settable( L, -3 );
}

static void PushLandingSites( lua_State *L, const Spaceobject *spaceobj )
{
  int idx = 0;
  lua_pushstring( L, "LandingSites" );
  lua_newtable( L );

  for( idx = 0; idx < MAX_LANDINGSITE; ++idx )
    {
      const LandingSite *site = &spaceobj->LandingSites[idx];

      if( !LandingSiteIsBlank( site ) )
	{
	  PushOneSite( L, site, idx );
	}
    }

  lua_settable( L, -3 );
}

static void PushSpaceobject( lua_State *L, const void *userData )
{
  const Spaceobject *spaceobj = (const Spaceobject*) userData;
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", spaceobj->Name );

  if( spaceobj->Planet )
    {
      LuaSetfieldString( L, "Planet", spaceobj->Planet->name );
    }

  LuaSetfieldString( L, "Type", SpaceobjectTypeName[spaceobj->Type] );

  if( spaceobj->Speed )
    {
      LuaSetfieldNumber( L, "Speed", spaceobj->Speed );
    }

  LuaSetfieldNumber( L, "Gravity", spaceobj->Gravity );

  if( spaceobj->IsSimulator )
    {
      LuaSetfieldNumber( L, "IsSimulator", spaceobj->IsSimulator );
    }

  PushLandingSites( L, spaceobj );
  LuaPushVector3( L, &spaceobj->Position, "Position" );

  if( spaceobj->Heading.x != 0 || spaceobj->Heading.y != 0 || spaceobj->Heading.z != 0 )
    {
      LuaPushVector3( L, &spaceobj->Heading, "Heading" );
    }

  lua_setglobal( L, "spaceobject" );
}

bool NewSaveSpaceobject( const Spaceobject *spaceobject, int dummy )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SPACE_DIR, ConvertToLuaFilename( spaceobject->Name ) );
  LuaSaveDataFile( fullPath, PushSpaceobject, "spaceobject", spaceobject );

  return true;
}

/*
 * Save a spaceobject's data to its data file
 */
void SaveSpaceobject( const Spaceobject *spaceobject )
{
  return;
  NewSaveSpaceobject( spaceobject, 0 );

#if 0
  FILE *fp = NULL;
  char filename[256];

  if ( !spaceobject )
    {
      Bug( "%s: null pointer!", __FUNCTION__ );
      return;
    }

  if ( IsNullOrEmpty( spaceobject->Filename ) )
    {
      Bug( "%s: %s has no filename", __FUNCTION__, spaceobject->Name );
      return;
    }

  sprintf( filename, "%s%s", SPACE_DIR, spaceobject->Filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#SPACE\n" );
      fprintf( fp, "Name         %s~\n",  spaceobject->Name                   );
      fprintf( fp, "Filename     %s~\n",  spaceobject->Filename               );
      fprintf( fp, "Type         %d\n",   spaceobject->Type                   );
      fprintf( fp, "Locationa    %s~\n",  spaceobject->LandingSites[0].LocationName );
      fprintf( fp, "Locationb    %s~\n",  spaceobject->LandingSites[1].LocationName );
      fprintf( fp, "Locationc    %s~\n",  spaceobject->LandingSites[2].LocationName );
      fprintf( fp, "Doca         %ld\n",  spaceobject->LandingSites[0].Dock      );
      fprintf( fp, "Docb         %ld\n",  spaceobject->LandingSites[1].Dock      );
      fprintf( fp, "Docc         %ld\n",  spaceobject->LandingSites[2].Dock      );
      fprintf( fp, "Seca         %d\n",   spaceobject->LandingSites[0].Secret      );
      fprintf( fp, "Secb         %d\n",   spaceobject->LandingSites[1].Secret      );
      fprintf( fp, "Secc         %d\n",   spaceobject->LandingSites[2].Secret      );
      fprintf( fp, "Gravity      %d\n",   spaceobject->Gravity                );
      fprintf( fp, "Xpos         %.0f\n", spaceobject->Position.x                  );
      fprintf( fp, "Ypos         %.0f\n", spaceobject->Position.y                  );
      fprintf( fp, "Zpos         %.0f\n", spaceobject->Position.z                  );
      fprintf( fp, "HX           %.0f\n", spaceobject->Heading.x                 );
      fprintf( fp, "HY           %.0f\n", spaceobject->Heading.y                 );
      fprintf( fp, "HZ           %.0f\n", spaceobject->Heading.z                 );
      fprintf( fp, "SP           %d\n",   spaceobject->Speed                  );
      fprintf( fp, "Trainer      %d\n",   spaceobject->IsSimulator          );
      fprintf( fp, "End\n\n"                                                  );
      fprintf( fp, "#END\n"                                                   );
    }

  fclose( fp );
#endif
}

/*
 * Read in actual spaceobject data.
 */
static void ReadSpaceobject( Spaceobject *spaceobject, FILE *fp )
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

        case 'D':
          KEY( "Doca",  spaceobject->LandingSites[0].Dock,          ReadInt( fp ) );
          KEY( "Docb",  spaceobject->LandingSites[1].Dock,          ReadInt( fp ) );
          KEY( "Docc",  spaceobject->LandingSites[2].Dock,          ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if (!spaceobject->Name)
                spaceobject->Name               = CopyString( "" );

              if (!spaceobject->LandingSites[0].LocationName)
                spaceobject->LandingSites[0].LocationName            = CopyString( "" );

              if (!spaceobject->LandingSites[1].LocationName)
                spaceobject->LandingSites[1].LocationName            = CopyString( "" );

              if (!spaceobject->LandingSites[2].LocationName)
                spaceobject->LandingSites[2].LocationName            = CopyString( "" );

              return;
            }
          break;

        case 'F':
          KEY( "Filename",      spaceobject->Filename,          ReadStringToTilde( fp ) );
          break;

        case 'G':
          KEY( "Gravity",  spaceobject->Gravity,     ReadInt( fp ) );
          break;

        case 'H':
          KEY( "HX",  spaceobject->Heading.x,     ReadInt( fp ) );
          KEY( "HY",  spaceobject->Heading.y,     ReadInt( fp ) );
          KEY( "HZ",  spaceobject->Heading.z,     ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Locationa", spaceobject->LandingSites[0].LocationName, ReadStringToTilde( fp ) );
          KEY( "Locationb", spaceobject->LandingSites[1].LocationName, ReadStringToTilde( fp ) );
          KEY( "Locationc", spaceobject->LandingSites[2].LocationName, ReadStringToTilde( fp ) );
          break;

        case 'N':
          KEY( "Name",  spaceobject->Name,              ReadStringToTilde( fp ) );
          break;

        case 'S':
          KEY( "Seca", spaceobject->LandingSites[0].IsSecret,               ReadInt( fp ) );
          KEY( "Secb", spaceobject->LandingSites[1].IsSecret,               ReadInt( fp ) );
          KEY( "Secc", spaceobject->LandingSites[2].IsSecret,               ReadInt( fp ) );
          KEY( "SP", spaceobject->Speed,                ReadInt( fp ) );

        case 'T':
          KEY( "Trainer",  spaceobject->IsSimulator, ReadInt( fp ) );
          KEY( "Type",  spaceobject->Type,             ReadInt( fp ) );

        case 'X':
          KEY( "Xpos",  spaceobject->Position.x,     ReadInt( fp ) );

        case 'Y':
          KEY( "Ypos",  spaceobject->Position.y,     ReadInt( fp ) );

        case 'Z':
          KEY( "Zpos",  spaceobject->Position.z,     ReadInt( fp ) );

        }

      if ( !fMatch )
        {
          Bug( "Fread_spaceobject: no match: %s", word );
        }
    }
}

/*
 * Load a spaceobject file
 */
static bool LoadSpaceobjectFile( const char *spaceobjectfile )
{
  char filename[256];
  Spaceobject *spaceobject = NULL;
  FILE *fp = NULL;
  bool found = false;

  AllocateMemory( spaceobject, Spaceobject, 1 );
  sprintf( filename, "%s%s", SPACE_DIR, spaceobjectfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;
      LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

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
              Bug( "Load_spaceobject_file: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SPACE"  ) )
            {
              ReadSpaceobject( spaceobject, fp );
              break;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      Bug( "Load_spaceobject_file: bad section: %s.", word );
	      break;
	    }
        }
      fclose( fp );
    }

  if ( !(found) )
    FreeMemory( spaceobject );

  return found;
}

/*
 * Load in all the spaceobject files.
 */
void LoadSpaceobjects( void )
{
  FILE *fpList = NULL;
  char spaceobjectlist[256];

  LogPrintf( "Loading spaceobjects..." );
  sprintf( spaceobjectlist, "%s%s", SPACE_DIR, SPACE_LIST );

  if ( ( fpList = fopen( spaceobjectlist, "r" ) ) == NULL )
    {
      perror( spaceobjectlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( filename[0] == '$' )
        break;

      if ( !LoadSpaceobjectFile( filename ) )
        {
          Bug( "Cannot load spaceobject file: %s", filename );
        }
    }

  fclose( fpList );
  LogPrintf(" Done spaceobjects " );
}

LandingSite *GetLandingSiteFromVnum( const Spaceobject *spaceobj, vnum_t vnum )
{
  size_t siteNum = 0;

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobj->LandingSites[siteNum];

      if( vnum == site->Dock )
        {
          return (LandingSite*) site;
        }
    }

  return NULL;
}

LandingSite *GetLandingSiteFromLocationName( const Spaceobject *spaceobj, const char *name )
{
  size_t siteNum = 0;

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobj->LandingSites[siteNum];

      if ( !StringPrefix( name, site->LocationName ) )
        {
          return (LandingSite*) site;
        }
    }

  return NULL;
}
