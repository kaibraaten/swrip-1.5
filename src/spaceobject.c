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

Spaceobject *FirstSpaceobject = NULL;
Spaceobject *LastSpaceobject = NULL;

void SpaceobjectUpdate( void )
{
  Spaceobject *spaceobj = NULL;

  for( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
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

  for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
    if ( !StrCmp( name, spaceobject->Name ) )
      return spaceobject;

  for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
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

  for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
    {
      if ( GetLandingSiteFromVnum( spaceobject, vnum ) )
	{
	  return spaceobject;
	}
    }

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( vnum == ship->Room.Hanger )
	{
	  if( !(ship->BayOpen) )
	    {
	      return NULL;
	    }

	  return ship->Spaceobject;
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
      LuaSetfieldString( L, "Planet", spaceobj->Planet->Name );
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
  NewSaveSpaceobject( spaceobject, 0 );
}

static void LoadLandingSite( lua_State *L, LandingSite *site )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "DockVnum" );
  lua_getfield( L, idx, "IsSecret" );

  if( !lua_isnil( L, ++idx ) )
    {
      site->LocationName = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      site->Dock = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      site->IsSecret = lua_tointeger( L, idx ) != 0 ? true : false;
    }

  lua_pop( L, 3 );
}

static void LoadLandingSites( lua_State *L, Spaceobject *spaceobj )
{
  int idx = lua_gettop( L );
  size_t n = 0;

  lua_getfield( L, idx, "LandingSites" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
	  size_t subscript = lua_tointeger( L, -2 );
	  LoadLandingSite( L, &spaceobj->LandingSites[subscript] );
          lua_pop( L, 1 );
        }
    }

  for( n = 0; n < MAX_LANDINGSITE; ++n )
    {
      LandingSite *site = &spaceobj->LandingSites[n];

      if( !site->LocationName )
	{
	  site->LocationName = CopyString( "" );
	}
    }

  lua_pop( L, 1 );
}

static int L_SpaceobjectEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  Spaceobject *spaceobj = NULL;

  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "Planet" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "Speed" );
  lua_getfield( L, idx, "Gravity" );
  lua_getfield( L, idx, "IsSimulator" );
  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      AllocateMemory( spaceobj, Spaceobject, 1 );
      spaceobj->Filename = CopyString( "" );
      spaceobj->Name = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      Bug( "%s: Name not found.", __FUNCTION__ );
      lua_pop( L, topAfterGets - topAtStart );
      return 0;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *planetName = lua_tostring( L, idx );
      spaceobj->Planet = GetPlanet( planetName );

      if( !spaceobj->Planet )
	{
	  Bug( "%s: Unknown planet name '%s' for spaceobject %s.",
	       __FUNCTION__, planetName, spaceobj->Name );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SpaceobjectType type = GetSpaceobjectType( lua_tostring( L, idx ) );

      if( type >= SPACE_SUN && type <= SPACE_OBJ )
	{
	  spaceobj->Type = type;
	}
      else
	{
	  Bug( "%s: SpaceobjectType out of range: %d", __FUNCTION__, type );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      int speed = lua_tointeger( L, idx );

      if( speed >= 0 )
	{
	  spaceobj->Speed = speed;
	}
      else
	{
	  Bug( "%s: Invalid speed %d", __FUNCTION__, speed );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      int gravity = lua_tointeger( L, idx );

      if( gravity >= 0 )
        {
          spaceobj->Gravity = gravity;
        }
      else
        {
          Bug( "%s: Invalid speed %d", __FUNCTION__, gravity );
        }
    }

  if( !lua_isnil( L, ++idx ) )
    {
      spaceobj->IsSimulator = lua_toboolean( L, idx );
    }

  lua_pop( L, topAfterGets - topAtStart );

  LuaLoadVector3( L, &spaceobj->Position, "Position" );
  LuaLoadVector3( L, &spaceobj->Heading, "Heading" );
  LoadLandingSites( L, spaceobj );

  LINK( spaceobj, FirstSpaceobject, LastSpaceobject, Next, Previous );

  return 0;
}

static void ExecuteSpaceobjectFile( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_SpaceobjectEntry, "SpaceobjectEntry" );
}

/*
 * Load in all the spaceobject files.
 */
void LoadSpaceobjects( void )
{
  LogPrintf( "Loading spaceobjects..." );
  ForEachLuaFileInDir( SPACE_DIR, ExecuteSpaceobjectFile, (void*)"SpaceobjectEntry" );
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
