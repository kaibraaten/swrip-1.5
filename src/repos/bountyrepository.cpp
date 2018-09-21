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

  LuaGetfieldString( L, "Target", &target );
  LuaGetfieldString( L, "Poster", &poster );
  LuaGetfieldLong( L, "Reward",
                   [&reward](const long r)
                   {
                     reward = r <= 0 ? 5000 : r;
                   } );
  
  if( !target.empty() && !poster.empty() )
    {
      Bounty *bounty = new Bounty();

      bounty->Target = target;
      bounty->Reward = reward;
      bounty->Poster = poster;

      Bounties->Add(bounty);
    }

  return 0;
}
