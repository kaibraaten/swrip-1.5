#include "bountyrepository.hpp"
#include "bounty.hpp"
#include "script.hpp"

#define BOUNTY_LIST DATA_DIR "bounties.lua"

BountyRepository *Bounties = nullptr;

/////////////////////////////////////////////////////
class LuaBountyRepository : public BountyRepository
{
public:
  void Load() override;
  void Save() const override;

private:
  static void PushBounty( const Bounty *bounty, lua_State *L);
  static void PushBounties( lua_State *L, const void *userData );
  static int L_BountyEntry( lua_State *L );
};

void LuaBountyRepository::Save() const
{
  LuaSaveDataFile( BOUNTY_LIST, PushBounties, "bounties", NULL );
}

void LuaBountyRepository::Load()
{
  LuaLoadDataFile( BOUNTY_LIST, L_BountyEntry, "BountyEntry" );
}

BountyRepository *NewBountyRepository()
{
  return new LuaBountyRepository();
}

void LuaBountyRepository::PushBounty( const Bounty *bounty, lua_State *L)
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Target", bounty->Target );
  LuaSetfieldNumber( L, "Reward", bounty->Reward );
  LuaSetfieldString( L, "Poster", bounty->Poster );

  lua_settable( L, -3 );
}

void LuaBountyRepository::PushBounties( lua_State *L, const void *userData )
{
  lua_newtable( L );

  for(const Bounty *bounty : Bounties->Entities())
    {
      PushBounty(bounty, L);
    }

  lua_setglobal( L, "bounties" );
}

int LuaBountyRepository::L_BountyEntry( lua_State *L )
{
  std::string target;
  std::string poster;
  long reward = 0;
  int idx = lua_gettop( L );
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Target" );
  lua_getfield( L, idx, "Reward" );
  lua_getfield( L, idx, "Poster" );

  if( !lua_isnil( L, ++idx ) )
    {
      target = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      reward = lua_tointeger( L, idx );
      reward = reward <= 0 ? 5000 : reward;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      poster = lua_tostring( L, idx );
    }

  if( !target.empty() && !poster.empty() )
    {
      Bounty *bounty = new Bounty();
      Bounties->Add(bounty);

      bounty->Target = target;
      bounty->Reward = reward;
      bounty->Poster = poster;
    }

  lua_pop( L, lua_gettop( L ) - 1 );
  return 0;
}
