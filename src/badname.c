#include "mud.h"
#include "badname.h"
#include "script.h"

Repository *BadNameRepository = NULL;

struct UserData
{
  const char *NameToCheck;
  bool IsBad;
};

static bool NameIsBad( const void *element, const void *name )
{
  const BadName *bad = (const BadName*)element;

  if( !StrCmp( bad->Name, (const char*)name ) )
    {
      return true;
    }

  return false;
}

static BadName *GetBadName(const char *name)
{
  const List *badnames = GetEntities(BadNameRepository);
  return FindIf(badnames, NameIsBad, (void*)name);
}

bool IsBadName( const char *name )
{
  return GetBadName(name) != NULL;
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
  AddEntity(BadNameRepository, badName);
}

void RemoveBadName( const char *name )
{
  BadName *badname = GetBadName(name);

  if(badname != NULL)
    {
      RemoveEntity(BadNameRepository, badname);
      FreeMemory( badname->Name );
      FreeMemory( badname );
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

static void PushOneElement(void *element, void *ud)
{
  const BadName *badName = (const BadName*)element;
  lua_State *L = (lua_State*)ud;
  PushBadName(L, badName);
}

static void PushBadNames( lua_State *L, const void *ud )
{
  const List *badnames = GetEntities(BadNameRepository);
  lua_newtable( L );

  ForEachInList(badnames, PushOneElement, L);

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
  SaveEntities(BadNameRepository);
}

void LoadBadNames( void )
{
  LoadEntities(BadNameRepository);
}

static void _SaveBadNames(const Repository *repo)
{
  LuaSaveDataFile( BADNAME_FILE, PushBadNames, "badnames", NULL );
}

static void _LoadBadNames(Repository *repo)
{
  LuaLoadDataFile( BADNAME_FILE, L_BadNameEntry, "BadNameEntry" );
}

Repository *NewBadNameRepository(void)
{
  Repository *repo = NewRepository(_LoadBadNames, _SaveBadNames);
  return repo;
}
