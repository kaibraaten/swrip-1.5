#include "badnamerepository.hpp"
#include "badname.hpp"
#include "script.hpp"

BadNameRepository *BadNames = nullptr;

#define BADNAME_FILE DATA_DIR "badnames.lua"

bool CompareBadName::operator()(const BadName *lhs, const BadName *rhs)
{
  return StrCmp(lhs->Name, rhs->Name) < 0;
}

class LuaBadNameRepository : public BadNameRepository
{
public:
  void Load() override;
  void Save() const override;

private:
  static void PushBadName( lua_State *L, const BadName *badName );
  static void PushBadNames( lua_State *L, const void *ud );
  static int L_BadNameEntry( lua_State *L );
  
};

void LuaBadNameRepository::Load()
{
  LuaLoadDataFile( BADNAME_FILE, L_BadNameEntry, "BadNameEntry" );
}

void LuaBadNameRepository::Save() const
{
  LuaSaveDataFile( BADNAME_FILE, PushBadNames, "badnames", NULL );
}

BadNameRepository *NewBadNameRepository()
{
  return new LuaBadNameRepository();
}

void LuaBadNameRepository::PushBadName( lua_State *L, const BadName *badName )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", badName->Name );

  lua_settable( L, -3 );
}

void LuaBadNameRepository::PushBadNames( lua_State *L, const void *ud )
{
  lua_newtable( L );

  for(const BadName *badName : BadNames->Entities())
    {
      PushBadName(L, badName);
    }

  lua_setglobal( L, "badnames" );
}

int LuaBadNameRepository::L_BadNameEntry( lua_State *L )
{
  LuaGetfieldString( L, "Name",
                     [](const std::string &name)
                     {
                       AddBadName( name );
                     });
  return 0;
}
