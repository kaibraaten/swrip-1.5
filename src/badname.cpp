#include "mud.hpp"
#include "badname.hpp"
#include "script.hpp"

BadNameRepository *BadNames = nullptr;

static BadName *GetBadName(const std::string &name)
{
  return BadNames->Find([&name](auto entity) { return StrCmp(entity->Name, name) == 0; });
}

bool IsBadName( const std::string &name )
{
  return GetBadName(name) != nullptr;
}

void AddBadName(const std::string &name)
{
  if( IsBadName( name ) )
    {
      return;
    }

  BadName *badName = new BadName { name };
  BadNames->Add(badName);
}

void RemoveBadName( const std::string &name )
{
  BadName *badname = GetBadName(name);

  if(badname != nullptr)
    {
      BadNames->Remove(badname);
      delete badname;
    }
}

static void PushBadName( lua_State *L, const BadName *badName )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", badName->Name );
  
  lua_settable( L, -3 );
}

static void PushBadNames( lua_State *L, const void *ud )
{
  lua_newtable( L );

  for(const BadName *badName : BadNames->Entities())
    {
      PushBadName(L, badName);
    }

  lua_setglobal( L, "badnames" );
}

static int L_BadNameEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Name" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      AddBadName( lua_tostring( L, idx ) );
    }

  lua_pop( L, elementsToPop );
  return 0;
}

BadNameRepository *NewBadNameRepository()
{
  return new BadNameRepository();
}

/////////////////////////////////////////////

void BadNameRepository::Load()
{
  LuaLoadDataFile( BADNAME_FILE, L_BadNameEntry, "BadNameEntry" );
}

void BadNameRepository::Save() const
{
  LuaSaveDataFile( BADNAME_FILE, PushBadNames, "badnames", NULL );
}
