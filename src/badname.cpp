#include "mud.hpp"
#include "badname.hpp"
#include "script.hpp"

BadName *FirstBadName = NULL;
BadName *LastBadName = NULL;

struct UserData
{
  const char *NameToCheck;
  bool IsBad;
};

static bool CheckIfNameIsBad( const BadName *bad, struct UserData *userData )
{
  if( !StrCmp( bad->Name, userData->NameToCheck ) )
    {
      userData->IsBad = true;
      return false;
    }

  return true;
}

bool IsBadName( const char *name )
{
  struct UserData userData = { name, false };

  ForEach( BadName, FirstBadName, Next, CheckIfNameIsBad, &userData );

  return userData.IsBad;
}

void AddBadName(const char *name)
{
  BadName *badName = NULL;
  
  if( IsBadName( name ) )
    {
      return;
    }

  AllocateMemory( badName, BadName, 1 );
  badName->Name = CopyString( name );
  LINK( badName, FirstBadName, LastBadName, Next, Previous );
}

void RemoveBadName( const char *name )
{
  BadName *badname = NULL;

  for( badname = FirstBadName; badname; badname = badname->Next )
    {
      if( !StrCmp( badname->Name, name ) )
	{
	  UNLINK( badname, FirstBadName, LastBadName, Next, Previous );
	  FreeMemory( badname->Name );
	  FreeMemory( badname );
	  return;
	}
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
  const BadName *badName = NULL;
  lua_newtable( L );

  for( badName = FirstBadName; badName; badName = badName->Next )
    {
      PushBadName( L, badName );
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

void SaveBadNames( void )
{
  LuaSaveDataFile( BADNAME_FILE, PushBadNames, "badnames", NULL );
}

void LoadBadNames( void )
{
  LuaLoadDataFile( BADNAME_FILE, L_BadNameEntry, "BadNameEntry" );
}
