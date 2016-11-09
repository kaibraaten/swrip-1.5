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
#include "mud.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "script.hpp"
#include "planet.hpp"
#include "area.hpp"

Planet * FirstPlanet = NULL;
Planet * LastPlanet = NULL;

Planet *GetPlanet( const char *name )
{
  Planet *planet;

  for ( planet = FirstPlanet; planet; planet = planet->Next )
    {
      if ( !StrCmp( name, planet->Name ) )
        {
          return planet;
        }
    }

  return NULL;
}

static void LoadPlanetAreas( lua_State *L, Planet *planet )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Areas" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
	{
	  Area *area = GetArea( lua_tostring( L, -1 ) );

	  if( area )
	    {
	      area->Planet = planet;
	      LINK( area, planet->FirstArea, planet->LastArea,
		    NextOnPlanet, PreviousOnPlanet);	      
	    }

	  lua_pop( L, 1 );
	}
    }
  
  lua_pop( L, 1 );
}

static int L_PlanetEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  Planet *planet = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  AllocateMemory( planet, Planet, 1 );

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "BaseValue" );
  lua_getfield( L, idx, "PopulationSupport" );
  lua_getfield( L, idx, "Spaceobject" );
  lua_getfield( L, idx, "GovernedBy" );
  
  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      planet->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      planet->BaseValue = lua_tonumber( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      planet->PopularSupport = lua_tonumber( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      planet->Spaceobject = GetSpaceobject( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      planet->GovernedBy = GetClan( lua_tostring( L, idx ) );
    }
  
  lua_pop( L, topAfterGets - topAtStart );

  planet->Flags = LuaLoadFlags( L, "Flags" );
  LoadPlanetAreas( L, planet );
  
  LINK( planet, FirstPlanet, LastPlanet, Next, Previous );
  return 0;
}

static void LoadPlanet( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_PlanetEntry, "PlanetEntry" );
}

void LoadPlanets( void )
{
  ForEachLuaFileInDir( PLANET_DIR, LoadPlanet, NULL );
  LogPrintf(" Done planets " );
}

long GetTaxes( const Planet *planet )
{
  long gain = planet->BaseValue;
  gain += planet->BaseValue * planet->PopularSupport / 100;
  gain += umax(0, planet->PopularSupport / 10 * planet->Population);

  return gain;
}

static void LuaPushAreas( lua_State *L, const Planet *planet )
{
  if( planet->FirstArea )
    {
      const Area *area = NULL;
      int idx = 1;
      lua_pushstring( L, "Areas" );
      lua_newtable( L );

      for( area = planet->FirstArea; area; area = area->NextOnPlanet, ++idx )
	{
	  lua_pushinteger( L, idx );
	  lua_pushstring( L, area->Filename );
	  lua_settable( L, -3 );
	}
      
      lua_settable( L, -3 );
    }
}

static void PushPlanet( lua_State *L, const void *userData )
{
  const Planet *planet = (const Planet*) userData;
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", planet->Name );
  LuaSetfieldNumber( L, "BaseValue", planet->BaseValue );
  LuaSetfieldNumber( L, "PopulationSupport", planet->PopularSupport );

  if( planet->Spaceobject )
    {
      LuaSetfieldString( L, "Spaceobject", planet->Spaceobject->Name );
    }

  if( planet->GovernedBy )
    {
      LuaSetfieldString( L, "GovernedBy", planet->GovernedBy->Name );
    }
  
  LuaPushFlags( L, planet->Flags, PlanetFlags, "Flags" );
  LuaPushAreas( L, planet );
  
  lua_setglobal( L, "planet" );
}

void SavePlanet( const Planet *planet )
{
  NewSavePlanet( planet, 0 );
}

const char *GetPlanetFilename( const Planet *planet )
{
  static char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", PLANET_DIR, ConvertToLuaFilename( planet->Name ) );
  return fullPath;
}

bool NewSavePlanet( const Planet *planet, int dummy )
{
  LuaSaveDataFile( GetPlanetFilename( planet ), PushPlanet, "planet", planet );

  return true;
}
