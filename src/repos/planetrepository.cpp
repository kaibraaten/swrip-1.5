#include "planetrepository.hpp"
#include "planet.hpp"
#include "script.hpp"
#include "area.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"

#define PLANET_DIR      DATA_DIR "planets/"
//#define GUARD_DIR       PLANET_DIR

PlanetRepository *Planets = nullptr;

class LuaPlanetRepository : public PlanetRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Planet *planet) const override;
  Planet *FindByName(const std::string &name) const override;

private:
  static void LoadPlanetAreas( lua_State *L, Planet *planet );
  static int L_PlanetEntry( lua_State *L );
  static void LoadPlanet( const std::string &filePath, void *userData );
  static void LuaPushAreas( lua_State *L, const Planet *planet );
  static void PushPlanet( lua_State *L, const void *userData );
};

void LuaPlanetRepository::Save() const
{
  for(const Planet *planet : Entities())
    {
      Save(planet);
    }
}

void LuaPlanetRepository::Save(const Planet *planet) const
{
  LuaSaveDataFile( GetPlanetFilename( planet ), PushPlanet, "planet", planet );
}

void LuaPlanetRepository::Load()
{
  ForEachLuaFileInDir( PLANET_DIR, LoadPlanet, NULL );
}

Planet *LuaPlanetRepository::FindByName(const std::string &name) const
{
  return Find([name](const auto &planet){ return StrCmp(name, planet->Name) == 0; });
}

void LuaPlanetRepository::LoadPlanetAreas( lua_State *L, Planet *planet )
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
              planet->Add(area);
            }

          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

int LuaPlanetRepository::L_PlanetEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  luaL_checktype( L, 1, LUA_TTABLE );

  Planet *planet = new Planet();

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "BaseValue" );
  lua_getfield( L, idx, "PopulationSupport" );
  lua_getfield( L, idx, "Spaceobject" );
  lua_getfield( L, idx, "GovernedBy" );

  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      planet->Name = lua_tostring( L, idx );
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

  Planets->Add(planet);
  return 0;
}

void LuaPlanetRepository::LoadPlanet( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_PlanetEntry, "PlanetEntry" );
}

void LuaPlanetRepository::LuaPushAreas( lua_State *L, const Planet *planet )
{
  if( !planet->Areas().empty() )
    {
      int idx = 0;
      lua_pushstring( L, "Areas" );
      lua_newtable( L );

      for(const Area *area : planet->Areas())
        {
          lua_pushinteger( L, ++idx );
          lua_pushstring( L, area->Filename.c_str() );
          lua_settable( L, -3 );
        }

      lua_settable( L, -3 );
    }
}

void LuaPlanetRepository::PushPlanet( lua_State *L, const void *userData )
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

////////////////////////////////////////////////////////////////

PlanetRepository *NewPlanetRepository()
{
  return new LuaPlanetRepository();
}

std::string GetPlanetFilename( const Planet *planet )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", PLANET_DIR, ConvertToLuaFilename( planet->Name ).c_str() );
  return fullPath;
}
