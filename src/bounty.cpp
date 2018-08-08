/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "script.hpp"
#include "pcdata.hpp"

#define BOUNTY_LIST   DATA_DIR "bounties.lua"

BountyRepository *Bounties = nullptr;

static void _PushBounty( const Bounty *bounty, lua_State *L)
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Target", bounty->Target );
  LuaSetfieldNumber( L, "Reward", bounty->Reward );
  LuaSetfieldString( L, "Poster", bounty->Poster );

  lua_settable( L, -3 );
}

static void PushBounties( lua_State *L, const void *userData )
{
  lua_newtable( L );

  for(const Bounty *bounty : Bounties->Entities())
    {
      _PushBounty(bounty, L);
    }

  lua_setglobal( L, "bounties" );
}

bool IsBountyOn( const Character *victim )
{
  return GetBounty(victim->Name) != NULL;
}

Bounty *GetBounty( const char *name )
{
  return Bounties->Find([name](const auto &bounty){ return StrCmp(name, bounty->Target) == 0; });
}

static int L_BountyEntry( lua_State *L )
{
  const char *target = NULL;
  const char *poster = NULL;
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

  if( !IsNullOrEmpty( target ) && !IsNullOrEmpty( poster ) )
    {
      Bounty *bounty = nullptr;
      AllocateMemory( bounty, Bounty, 1 );
      Bounties->Add(bounty);

      bounty->Target = CopyString( target );
      bounty->Reward = reward;
      bounty->Poster = CopyString( poster );
    }

  lua_pop( L, lua_gettop( L ) - 1 );
  return 0;
}

void AddBounty( const Character *ch , const Character *victim , long amount )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  Character *echoTo = nullptr;
  Bounty *bounty = GetBounty(victim->Name);

  if (bounty == nullptr)
    {
      AllocateMemory( bounty, Bounty, 1 );
      Bounties->Add(bounty);

      bounty->Target = CopyString( victim->Name );
      bounty->Poster = CopyString( ch->Name );
    }

  bounty->Reward = bounty->Reward + amount;
  Bounties->Save();

  victim->Echo("&RSomeone has added %ld credits to the bounty on you!\r\n", amount);
  sprintf( buf, "&R%s has added %ld credits to the bounty on %s.\r\n",
           ch->Name, amount, victim->Name );
  ch->Echo(buf);

  for (echoTo = LastCharacter; echoTo; echoTo = echoTo->Previous)
    {
      if(((IsClanned(ch) && IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name))
          || IsImmortal(echoTo))
         && echoTo != ch)
	{
	  echoTo->Echo(buf);
	}
    }
}

void RemoveBounty( Bounty *bounty )
{
  Bounties->Remove(bounty);
  FreeMemory( bounty->Target );
  FreeMemory( bounty->Poster );
  FreeMemory( bounty );

  Bounties->Save();
}

void ClaimBounty( Character *ch, const Character *victim )
{
  Bounty *bounty = NULL;
  long xp = 0;
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(victim) )
    {
      return;
    }

  bounty = GetBounty( victim->Name );

  if ( ch == victim )
    {
      if ( bounty != NULL )
        RemoveBounty(bounty);

      return;
    }

  if (bounty != NULL
      && ( !IsClanned(ch)
           || !IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name)))
    {
      RemoveBounty(bounty);
      bounty = NULL;
    }

  if (bounty == NULL)
    {
      if ( IsBitSet(victim->Flags , PLR_KILLER ) && !IsNpc(ch) )
        {
          xp = urange(1, ComputeXP(ch, victim) , ( GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
          GainXP( ch, HUNTING_ABILITY, xp );
          SetCharacterColor( AT_BLOOD, ch );
          ch->Echo( "You receive %ld hunting experience for executing a wanted killer.\r\n", xp );
        }
      else if ( !IsNpc(ch) )
        {
          SetBit(ch->Flags, PLR_KILLER );
          ch->Echo( "You are now wanted for the murder of %s.\r\n", victim->Name );
        }

      return;
    }

  ch->Gold += bounty->Reward;

  xp = urange(1, bounty->Reward + ComputeXP(ch, victim) , ( GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
  GainXP( ch, HUNTING_ABILITY, xp );

  SetCharacterColor( AT_BLOOD, ch );
  ch->Echo( "You receive %ld experience and %ld credits,\r\n from the bounty on %s.\r\n",
            xp, bounty->Reward, bounty->Target );

  sprintf( buf, "The disintegration bounty on %s has been claimed!",victim->Name );
  EchoToAll( AT_RED , buf, 0 );

  if ( !IsBitSet(victim->Flags , PLR_KILLER ) )
    {
      SetBit(ch->Flags, PLR_KILLER );
    }

  RemoveBounty(bounty);
}

/////////////////////////////////////////////////////
class LuaBountyRepository : public BountyRepository
{
public:
  void Load() override;
  void Save() const override;
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

