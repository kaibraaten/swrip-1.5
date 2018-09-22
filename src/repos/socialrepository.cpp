#include <utility/algorithms.hpp>
#include "socialrepository.hpp"
#include "social.hpp"
#include "script.hpp"
#include "log.hpp"
#include "social.hpp"

#define SOCIAL_DATA_FILE     DATA_DIR "socials.lua"

SocialRepository *Socials = nullptr;

bool CompareSocial::operator()(const Social *lhs, const Social *rhs) const
{
  return StrCmp(lhs->Name, rhs->Name) < 0;
}

class LuaSocialRepository : public SocialRepository
{
public:
  void Save() const override;
  void Load() override;
  Social *FindByName(const std::string &name) const override;

private:
  static void PushSocialTable( lua_State *L, const void *userData );
  static void PushSocial( lua_State *L, const Social *social );
  static int L_SocialEntry( lua_State *L );
};

void LuaSocialRepository::Load()
{
  LuaLoadDataFile( SOCIAL_DATA_FILE, L_SocialEntry, "SocialEntry" );
}

void LuaSocialRepository::Save() const
{
  LuaSaveDataFile( SOCIAL_DATA_FILE, PushSocialTable, "socials", NULL );
}

Social *LuaSocialRepository::FindByName(const std::string &name) const
{
  Social *social = Find([name](const auto &s){ return StrCmp(name, s->Name) == 0; });

  if(social == nullptr)
    {
      social = Find([name](const auto &s){ return StringPrefix(name, s->Name) == 0; });
    }

  return social;
}

void LuaSocialRepository::PushSocial( lua_State *L, const Social *social )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", social->Name );
  LuaSetfieldString( L, "CharNoArg", social->CharNoArg );
  LuaSetfieldString( L, "OthersNoArg", social->OthersNoArg );
  LuaSetfieldString( L, "CharFound", social->CharFound );
  LuaSetfieldString( L, "OthersFound", social->OthersFound );
  LuaSetfieldString( L, "VictimFound", social->VictimFound );
  LuaSetfieldString( L, "CharAuto", social->CharAuto );
  LuaSetfieldString( L, "OthersAuto", social->OthersAuto );

  lua_settable( L, -3 );
}

void LuaSocialRepository::PushSocialTable( lua_State *L, const void *userData )
{
  lua_newtable( L );

  for(const Social *social : Socials->Entities())
    {
      if ( social->Name.empty() )
        {
          continue;
        }

      PushSocial( L, social );
    }

  lua_setglobal( L, "socials" );
}

int LuaSocialRepository::L_SocialEntry( lua_State *L )
{
  Social social;

  LuaGetfieldString( L, "Name", &social.Name );
  LuaGetfieldString( L, "CharNoArg", &social.CharNoArg );
  LuaGetfieldString( L, "OthersNoArg", &social.OthersNoArg );
  LuaGetfieldString( L, "CharFound", &social.CharFound );
  LuaGetfieldString( L, "OthersFound", &social.OthersFound );
  LuaGetfieldString( L, "VictimFound", &social.VictimFound );
  LuaGetfieldString( L, "CharAuto", &social.CharAuto );
  LuaGetfieldString( L, "OthersAuto", &social.OthersAuto );

  if ( social.Name.empty() )
    {
      Log->Bug( "%s: Name not found", __FUNCTION__ );
    }
  else if ( social.CharNoArg.empty() )
    {
      Log->Bug( "%s: CharNoArg not found for social %s",
                __FUNCTION__, social.Name.c_str() );
    }
  else
    {
      Social *newSocial = new Social( social );
      Socials->Add(newSocial);
    }

  return 0;
}

/////////////////////////////////////////////////
SocialRepository *NewSocialRepository()
{
  return new LuaSocialRepository();
}
