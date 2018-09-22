#include "spaceobjectrepository.hpp"
#include "spaceobject.hpp"
#include "script.hpp"
#include "log.hpp"
#include "repos/planetrepository.hpp"
#include "mud.hpp"
#include "planet.hpp"

#define SPACE_DIR       DATA_DIR "space/"

SpaceobjectRepository *Spaceobjects = nullptr;

class LuaSpaceobjectRepository : public SpaceobjectRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Spaceobject *spaceobject) const override;

private:
  static bool LandingSiteIsBlank( const LandingSite *site );
  static void PushOneSite( lua_State *L, const LandingSite *site, int idx );
  static void PushLandingSites( lua_State *L, const Spaceobject *spaceobj );
  static void PushSpaceobject( lua_State *L, const void *userData );
  static void LoadLandingSite( lua_State *L, LandingSite *site );
  static void LoadLandingSites( lua_State *L, Spaceobject *spaceobj );
  static int L_SpaceobjectEntry( lua_State *L );
  static void ExecuteSpaceobjectFile( const std::string &filePath, void *userData );
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

bool LuaSpaceobjectRepository::LandingSiteIsBlank( const LandingSite *site )
{
  return site->LocationName.empty() && site->Dock == INVALID_VNUM;
}

void LuaSpaceobjectRepository::PushOneSite( lua_State *L, const LandingSite *site, int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", site->LocationName );
  LuaSetfieldNumber( L, "DockVnum",  site->Dock );
  LuaSetfieldNumber( L, "IsSecret", site->IsSecret );

  lua_settable( L, -3 );
}

void LuaSpaceobjectRepository::PushLandingSites( lua_State *L, const Spaceobject *spaceobj )
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

void LuaSpaceobjectRepository::PushSpaceobject( lua_State *L, const void *userData )
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

void LuaSpaceobjectRepository::LoadLandingSite( lua_State *L, LandingSite *site )
{
  LuaGetfieldString( L, "Name", &site->LocationName );
  LuaGetfieldLong( L, "DockVnum", &site->Dock );
  LuaGetfieldBool( L, "IsSecret", &site->IsSecret );
}

void LuaSpaceobjectRepository::LoadLandingSites( lua_State *L, Spaceobject *spaceobj )
{
  int idx = lua_gettop( L );

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

  lua_pop( L, 1 );
}

int LuaSpaceobjectRepository::L_SpaceobjectEntry( lua_State *L )
{
  std::string name;
  LuaGetfieldString( L, "Name", &name );

  if( name.empty() )
    {
      Log->Bug( "%s: Name not found.", __FUNCTION__ );
      return 0;
    }

  Spaceobject *spaceobj = new Spaceobject();
  spaceobj->Name = name;
  
  LuaGetfieldString( L, "Planet",
                     [spaceobj](const std::string &planetName)
                     {
                       spaceobj->Planet = Planets->FindByName( planetName );

                       if( spaceobj->Planet == nullptr )
                         {
                           Log->Bug( "%s: Unknown planet name '%s' for spaceobject %s.",
                                     __FUNCTION__, planetName.c_str(), spaceobj->Name.c_str() );
                         }
                     });
  LuaGetfieldString( L, "Type",
                     [spaceobj](const std::string &typeName)
                     {
                       SpaceobjectType type = GetSpaceobjectType( typeName );

                       if( type >= SPACE_SUN && type <= SPACE_OBJ )
                         {
                           spaceobj->Type = type;
                         }
                       else
                         {
                           Log->Bug( "%s: SpaceobjectType out of range: %d", __FUNCTION__, type );
                         }
                     });
  LuaGetfieldInt( L, "Speed",
                  [spaceobj](const int speed)
                  {
                    if( speed >= 0 )
                      {
                        spaceobj->Speed = speed;
                      }
                    else
                      {
                        Log->Bug( "%s: Invalid speed %d", __FUNCTION__, speed );
                      }
                  });
  LuaGetfieldInt( L, "Gravity",
                  [spaceobj](const int gravity)
                  {
                    if( gravity >= 0 )
                      {
                        spaceobj->Gravity = gravity;
                      }
                    else
                      {
                        Log->Bug( "%s: Invalid gravity %d", __FUNCTION__, gravity );
                      }
                  });
  LuaGetfieldBool( L, "IsSimulator", &spaceobj->IsSimulator );

  LuaLoadVector3( L, &spaceobj->Position, "Position" );
  LuaLoadVector3( L, &spaceobj->Heading, "Heading" );
  LoadLandingSites( L, spaceobj );

  Spaceobjects->Add(spaceobj);

  return 0;
}

void LuaSpaceobjectRepository::ExecuteSpaceobjectFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_SpaceobjectEntry, "SpaceobjectEntry" );
}

///////////////////////////////////////////////
SpaceobjectRepository *NewSpaceobjectRepository()
{
  return new LuaSpaceobjectRepository();
}

std::string GetSpaceobjectFilename( const Spaceobject *spaceobject )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SPACE_DIR, ConvertToLuaFilename( spaceobject->Name ).c_str() );
  return fullPath;
}

