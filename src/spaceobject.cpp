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

#include <cctype>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "spaceobject.hpp"
#include "script.hpp"
#include "ship.hpp"
#include "planet.hpp"

SpaceobjectRepository *Spaceobjects = nullptr;

void SpaceobjectUpdate( void )
{
  for(Spaceobject *spaceobj : Spaceobjects->Entities())
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
Spaceobject *GetSpaceobject( const char *name )
{
  Spaceobject *spaceobject = Spaceobjects->Find([name](const auto &so)
                                                {
                                                  return StrCmp(name, so->Name) == 0;
                                                });

  if(spaceobject == nullptr)
    {
      spaceobject = Spaceobjects->Find([name](const auto &so)
                                       {
                                         return StringPrefix(name, so->Name) == 0;
                                       });
    }

  return spaceobject;
}

struct SpaceobjectSearch
{
  vnum_t vnum;
  Spaceobject *spaceobject;
};

static bool FindSpaceobjectFromHangar(Ship *ship, void *userData)
{
  struct SpaceobjectSearch *data = (struct SpaceobjectSearch*)userData;

  if ( data->vnum == ship->Rooms.Hangar )
    {
      if( ship->BayOpen )
        {
          data->spaceobject = ship->Spaceobject;
          return false;
        }
    }

  return true;
}

/*
 * Get pointer to space structure from the dock vnun.
 */
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum )
{
  Spaceobject *spaceobject = Spaceobjects->Find([vnum](const auto &so)
                                                {
                                                  return GetLandingSiteFromVnum(so, vnum) != nullptr;
                                                });

  if(spaceobject != nullptr)
    {
      return spaceobject;
    }

  struct SpaceobjectSearch data;
  data.vnum = vnum;
  data.spaceobject = NULL;
  ForEachShip(FindSpaceobjectFromHangar, &data);

  if(data.spaceobject != NULL)
    {
      return data.spaceobject;
    }
  else
    {
      return NULL;
    }
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
  lua_pushstring( L, "LandingSites" );
  lua_newtable( L );

  for( size_t idx = 0; idx < MAX_LANDINGSITE; ++idx )
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

const char *GetSpaceobjectFilename( const Spaceobject *spaceobject )
{
  static char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SPACE_DIR, ConvertToLuaFilename( spaceobject->Name ) );
  return fullPath;
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
      std::string planetName = lua_tostring( L, idx );
      spaceobj->Planet = Planets->FindByName( planetName );

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

  Spaceobjects->Add(spaceobj);

  return 0;
}

static void ExecuteSpaceobjectFile( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_SpaceobjectEntry, "SpaceobjectEntry" );
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

//////////////////////////////////
class LuaSpaceobjectRepository : public SpaceobjectRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Spaceobject *spaceobject) const override;
};

void LuaSpaceobjectRepository::Load()
{
  ForEachLuaFileInDir( SPACE_DIR, ExecuteSpaceobjectFile, (void*)"SpaceobjectEntry" );
}

void LuaSpaceobjectRepository::Save() const
{
  for(const Spaceobject *spaceobject : Spaceobjects->Entities())
    {
      Save(spaceobject);
    }
}

void LuaSpaceobjectRepository::Save(const Spaceobject *spaceobject) const
{
  LuaSaveDataFile( GetSpaceobjectFilename( spaceobject ),
                   PushSpaceobject, "spaceobject", spaceobject );
}

SpaceobjectRepository *NewSpaceobjectRepository()
{
  return new LuaSpaceobjectRepository();
}
