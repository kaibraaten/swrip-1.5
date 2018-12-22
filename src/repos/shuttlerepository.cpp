#include "shuttlerepository.hpp"
#include "shuttle.hpp"
#include "script.hpp"
#include "mud.hpp"
#include "log.hpp"

#define SHUTTLE_DIR     DATA_DIR "shuttles/"

std::shared_ptr<ShuttleRepository> Shuttles;

class LuaShuttleRepository : public ShuttleRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(std::shared_ptr<Shuttle> shuttle) const override;
  std::shared_ptr<Shuttle> FindByName(const std::string &name) const override;
  void DeleteFromStorage(std::shared_ptr<Shuttle> shuttle) override;

private:
  static void PushStop( lua_State *L, std::shared_ptr<ShuttleStop> stop, const int idx );
  static void PushStops( lua_State *L, std::shared_ptr<Shuttle> shuttle );
  static void PushRooms( lua_State *L, std::shared_ptr<Shuttle> shuttle );
  static void PushShuttle( lua_State *L, const void *userData );
  static void LoadRooms( lua_State *L, std::shared_ptr<Shuttle> shuttle );
  static void LoadStop( lua_State *L, std::shared_ptr<Shuttle> shuttle );
  static void LoadStops( lua_State *L, std::shared_ptr<Shuttle> shuttle );
  static int L_ShuttleEntry( lua_State *L );
  static void ExecuteShuttleFile( const std::string &filePath, void *userData );
};

std::shared_ptr<Shuttle> LuaShuttleRepository::FindByName(const std::string &name) const
{
  auto shuttle = Find([name](const auto &s)
                      {
                        return StrCmp(name, s->Name) == 0;
                      });

  if(shuttle == nullptr)
    {
      shuttle = Find([name](const auto &s)
                     {
                       return NiftyIsNamePrefix(name, s->Name);
                     });
    }

  return shuttle;
}

void LuaShuttleRepository::Save(std::shared_ptr<Shuttle> shuttle) const
{
  LuaSaveDataFile( GetShuttleFilename( shuttle ), PushShuttle, "shuttle", &shuttle );
}

void LuaShuttleRepository::Save() const
{
  for(auto shuttle : Shuttles)
    {
      Save(shuttle);
    }
}

void LuaShuttleRepository::Load()
{
  ForEachLuaFileInDir( SHUTTLE_DIR, ExecuteShuttleFile, nullptr );
}

void LuaShuttleRepository::PushStop( lua_State *L, std::shared_ptr<ShuttleStop> stop,
                                     const int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", stop->Name );
  LuaSetfieldNumber( L, "RoomVnum", stop->RoomVnum );

  lua_settable( L, -3 );
}

void LuaShuttleRepository::PushStops( lua_State *L, std::shared_ptr<Shuttle> shuttle )
{
  int idx = 0;
  lua_pushstring( L, "Stops" );
  lua_newtable( L );

  for(auto stop : shuttle->Stops())
    {
      PushStop( L, stop, ++idx );
    }

  lua_settable( L, -3 );
}

void LuaShuttleRepository::PushRooms( lua_State *L, std::shared_ptr<Shuttle> shuttle )
{
  lua_pushstring( L, "Rooms" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "First", shuttle->Rooms.First );
  LuaSetfieldNumber( L, "Last", shuttle->Rooms.Last );
  LuaSetfieldNumber( L, "Entrance", shuttle->Rooms.Entrance );

  lua_settable( L, -3 );
}

void LuaShuttleRepository::PushShuttle( lua_State *L, const void *userData )
{
  std::shared_ptr<Shuttle> shuttle = *static_cast<const std::shared_ptr<Shuttle>*>(userData);
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", shuttle->Name );
  LuaSetfieldNumber( L, "Delay", shuttle->Delay );
  LuaSetfieldNumber( L, "CurrentDelay", shuttle->CurrentDelay );

  if( shuttle->CurrentStop() != nullptr )
    {
      LuaSetfieldNumber( L, "CurrentStop", shuttle->CurrentNumber );
    }

  LuaSetfieldString( L, "Type",
                     shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar"
                     : shuttle->Type == SHUTTLE_SPACE ? "Space"
                     : shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace"
                     : "Unknown" );

  PushRooms( L, shuttle );
  PushStops( L, shuttle );
  lua_setglobal( L, "shuttle" );
}

void LuaShuttleRepository::LoadRooms( lua_State *L, std::shared_ptr<Shuttle> shuttle )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldLong( L, "First", &shuttle->Rooms.First );
      LuaGetfieldLong( L, "Last", &shuttle->Rooms.Last );
      LuaGetfieldLong( L, "Entrance", &shuttle->Rooms.Entrance );
    }

  lua_pop( L, 1 );
}

void LuaShuttleRepository::LoadStop( lua_State *L, std::shared_ptr<Shuttle> shuttle )
{
  std::shared_ptr<ShuttleStop> stop = std::make_shared<ShuttleStop>();

  LuaGetfieldString( L, "Name", &stop->Name );
  LuaGetfieldLong( L, "RoomVnum", &stop->RoomVnum );

  shuttle->Add(stop);
}

void LuaShuttleRepository::LoadStops( lua_State *L, std::shared_ptr<Shuttle> shuttle )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Stops" );

  if( !lua_isnil(L, ++idx))
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
          LoadStop( L, shuttle );
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

int LuaShuttleRepository::L_ShuttleEntry( lua_State *L )
{
  std::shared_ptr<Shuttle> shuttle = std::make_shared<Shuttle>();
  LuaGetfieldString( L, "Name", &shuttle->Name );
  LuaGetfieldInt( L, "Delay", &shuttle->Delay );
  LuaGetfieldInt( L, "CurrentDelay", &shuttle->CurrentDelay );
  LuaGetfieldInt( L, "CurrentStop", &shuttle->CurrentNumber );
  LuaGetfieldString( L, "Type",
                     [shuttle](const std::string &shuttleTypeName)
                     {
                       if( !StrCmp( shuttleTypeName, "Turbocar" ) )
                         {
                           shuttle->Type = SHUTTLE_TURBOCAR;
                         }
                       else if( !StrCmp( shuttleTypeName, "Space" ) )
                         {
                           shuttle->Type = SHUTTLE_SPACE;
                         }
                       else if( !StrCmp( shuttleTypeName, "Hyperspace" ) )
                         {
                           shuttle->Type = SHUTTLE_HYPERSPACE;
                         }
                       else
                         {
                           Log->Bug( "%s:%d: LuaShuttleRepository::%s() - Invalid shuttle type: %s",
                                     __FILE__, __LINE__, __FUNCTION__, shuttleTypeName.c_str() );
                         }
                     });

  LoadRooms( L, shuttle );
  LoadStops( L, shuttle );

  Shuttles->Add(shuttle);

  if (shuttle->Rooms.Entrance == INVALID_VNUM)
    {
      shuttle->Rooms.Entrance = shuttle->Rooms.First;
    }

  if (shuttle->CurrentNumber == -1 && !shuttle->Stops().empty())
    {
      shuttle->CurrentNumber = 0;
    }

  if (shuttle->CurrentStop() != nullptr)
    {
      InsertShuttle(shuttle, GetRoom(shuttle->CurrentStop()->RoomVnum));
    }

  return 0;
}

void LuaShuttleRepository::ExecuteShuttleFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ShuttleEntry, "ShuttleEntry" );
}

void LuaShuttleRepository::DeleteFromStorage( std::shared_ptr<Shuttle> shuttle )
{
  Shuttles->Remove(shuttle);
  std::string buf = GetShuttleFilename(shuttle);
  unlink(buf.c_str());
}

///////////////////////////////////////

std::string GetShuttleFilename( std::shared_ptr<Shuttle> shuttle )
{
  return FormatString( "%s%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ).c_str() );
}

std::shared_ptr<ShuttleRepository> NewShuttleRepository()
{
  return std::make_shared<LuaShuttleRepository>();
}
