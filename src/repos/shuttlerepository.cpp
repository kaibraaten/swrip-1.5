#include "shuttlerepository.hpp"
#include "shuttle.hpp"
#include "script.hpp"
#include "mud.hpp"

#define SHUTTLE_DIR     DATA_DIR "shuttles/"

ShuttleRepository *Shuttles = nullptr;

class LuaShuttleRepository : public ShuttleRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Shuttle *shuttle) const override;
  Shuttle *FindByName(const std::string &name) const override;
  void DeleteFromStorage( Shuttle *shuttle ) override;

private:
  static void PushStop( lua_State *L, const ShuttleStop *stop, const int idx );
  static void PushStops( lua_State *L, const Shuttle *shuttle );
  static void PushRooms( lua_State *L, const Shuttle *shuttle );
  static void PushShuttle( lua_State *L, const void *userData );
  static void LoadRooms( lua_State *L, Shuttle *shuttle );
  static void LoadStop( lua_State *L, Shuttle *shuttle );
  static void LoadStops( lua_State *L, Shuttle *shuttle );
  static int L_ShuttleEntry( lua_State *L );
  static void ExecuteShuttleFile( const std::string &filePath, void *userData );
};

Shuttle *LuaShuttleRepository::FindByName(const std::string &name) const
{
  Shuttle *shuttle = Find([name](const auto &s)
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

void LuaShuttleRepository::Save(const Shuttle *shuttle) const
{
  LuaSaveDataFile( GetShuttleFilename( shuttle ), PushShuttle, "shuttle", shuttle );
}

void LuaShuttleRepository::Save() const
{
  for(const Shuttle *shuttle : Shuttles->Entities())
    {
      Save(shuttle);
    }
}

void LuaShuttleRepository::Load()
{
  ForEachLuaFileInDir( SHUTTLE_DIR, ExecuteShuttleFile, NULL );
}

void LuaShuttleRepository:: PushStop( lua_State *L, const ShuttleStop *stop, const int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", stop->Name );
  LuaSetfieldNumber( L, "RoomVnum", stop->RoomVnum );

  lua_settable( L, -3 );
}

void LuaShuttleRepository:: PushStops( lua_State *L, const Shuttle *shuttle )
{
  int idx = 0;
  lua_pushstring( L, "Stops" );
  lua_newtable( L );

  for(const ShuttleStop *stop : shuttle->Stops())
    {
      PushStop( L, stop, ++idx );
    }

  lua_settable( L, -3 );
}

void LuaShuttleRepository:: PushRooms( lua_State *L, const Shuttle *shuttle )
{
  lua_pushstring( L, "Rooms" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "First", shuttle->Rooms.First );
  LuaSetfieldNumber( L, "Last", shuttle->Rooms.Last );
  LuaSetfieldNumber( L, "Entrance", shuttle->Rooms.Entrance );

  lua_settable( L, -3 );
}

void LuaShuttleRepository:: PushShuttle( lua_State *L, const void *userData )
{
  const Shuttle *shuttle = (const Shuttle*) userData;
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

void LuaShuttleRepository:: LoadRooms( lua_State *L, Shuttle *shuttle )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "First" );
      lua_getfield( L, sub_idx, "Last" );
      lua_getfield( L, sub_idx, "Entrance" );

      const int elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          shuttle->Rooms.First = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          shuttle->Rooms.Last = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          shuttle->Rooms.Entrance = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

void LuaShuttleRepository:: LoadStop( lua_State *L, Shuttle *shuttle )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  ShuttleStop *stop = new ShuttleStop();

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "RoomVnum" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      stop->Name = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      stop->RoomVnum = lua_tointeger( L, idx );
    }

  lua_pop( L, elementsToPop );
  shuttle->Add(stop);
  }

void LuaShuttleRepository:: LoadStops( lua_State *L, Shuttle *shuttle )
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
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  luaL_checktype( L, 1, LUA_TTABLE );

  Shuttle *shuttle = new Shuttle();
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "Delay" );
  lua_getfield( L, idx, "CurrentDelay" );
  lua_getfield( L, idx, "CurrentStop" );
  lua_getfield( L, idx, "Type" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->Name = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->Delay = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->CurrentDelay = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->CurrentNumber = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *shuttleTypeName = lua_tostring( L, idx );
      int shuttleType = SHUTTLE_HYPERSPACE;

      if( !StrCmp( shuttleTypeName, "Turbocar" ) )
        {
          shuttleType = SHUTTLE_TURBOCAR;
        }
      else if( !StrCmp( shuttleTypeName, "Space" ) )
        {
          shuttleType = SHUTTLE_SPACE;
        }
      else if( !StrCmp( shuttleTypeName, "Hyperspace" ) )
        {
          shuttleType = SHUTTLE_HYPERSPACE;
        }

      shuttle->Type = shuttleType;
    }

  lua_pop( L, elementsToPop );
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

void LuaShuttleRepository:: ExecuteShuttleFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ShuttleEntry, "ShuttleEntry" );
}

void LuaShuttleRepository::DeleteFromStorage( Shuttle *shuttle )
{
  char buf[MAX_STRING_LENGTH];
  Shuttles->Remove(shuttle);
  sprintf(buf, "%s/%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ).c_str() );
  unlink(buf);
  delete shuttle;
}

///////////////////////////////////////

std::string GetShuttleFilename( const Shuttle *shuttle )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ).c_str() );
  return fullPath;
}

ShuttleRepository *NewShuttleRepository()
{
  return new LuaShuttleRepository();
}
