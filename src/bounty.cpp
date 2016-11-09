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

#define BOUNTY_LIST   DATA_DIR "bounties.lua"

Bounty *FirstBounty = NULL;
Bounty *LastBounty = NULL;

static void PushBounty( lua_State *L, const Bounty *bounty )
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
  const Bounty *bounty = NULL;
  lua_newtable( L );

  for ( bounty = FirstBounty; bounty; bounty = bounty->Next )
    {
      PushBounty( L, bounty );
    }

  lua_setglobal( L, "bounties" );
}

static void SaveBounties( void )
{
  LuaSaveDataFile( BOUNTY_LIST, PushBounties, "bounties", NULL );
}

bool IsBountyOn( const Character *victim )
{
  const Bounty *bounty = NULL;

  for ( bounty = FirstBounty; bounty; bounty = bounty->Next )
    {
      if ( !StrCmp( victim->Name , bounty->Target ) )
	{
	  return true;
	}
    }

  return false;
}

Bounty *GetBounty( const char *target )
{
  Bounty *bounty = NULL;

  for ( bounty = FirstBounty; bounty; bounty = bounty->Next )
    {
      if ( !StrCmp( target, bounty->Target ) )
	{
	  return bounty;
	}
    }

  return NULL;
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
      Bounty *bounty = NULL;
      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, FirstBounty, LastBounty, Next, Previous );

      bounty->Target = CopyString( target );
      bounty->Reward = reward;
      bounty->Poster = CopyString( poster );
    }

  lua_pop( L, lua_gettop( L ) - 1 );
  return 0;
}

void LoadBounties( void )
{
  LuaLoadDataFile( BOUNTY_LIST, L_BountyEntry, "BountyEntry" );
  LogPrintf(" Done bounties " );
}

void AddBounty( const Character *ch , const Character *victim , long amount )
{
  Bounty *bounty = NULL;
  bool found = false;
  char buf[MAX_STRING_LENGTH];
  Character *p = NULL;
  Character *p_prev = NULL;

  for ( bounty = FirstBounty; bounty; bounty = bounty->Next )
    {
      if ( !StrCmp( bounty->Target , victim->Name ))
        {
          found = true;
          break;
        }
    }

  if (!found)
    {
      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, FirstBounty, LastBounty, Next, Previous );

      bounty->Target = CopyString( victim->Name );
      bounty->Poster = CopyString( ch->Name );
      bounty->Reward = 0;
    }

  bounty->Reward = bounty->Reward + amount;
  SaveBounties();

  sprintf( buf, "&R%s has added %ld credits to the bounty on %s.\r\n",
	   ch->Name, amount, victim->Name );
  SendToCharacter(buf, ch);

  for (p = LastCharacter; p ; p = p_prev )
    {
      p_prev = p->Previous;

      if ( ( ( ch->PCData
	       && ch->PCData->ClanInfo.Clan
	       && ( !StrCmp(ch->PCData->ClanInfo.Clan->Name, "the hunters guild")
		    || !StrCmp(ch->PCData->ClanInfo.Clan->Name, "the assassins guild") ) )
	     || IsImmortal(p) ) && p != ch )
	{
	  Echo(p, buf);
	}

      if (victim == p)
	{
	  Echo(p, "&RSomeone has added %ld credits to the bounty on you!\r\n", amount );
	}
    }
}

void RemoveBounty( Bounty *bounty )
{
  UNLINK( bounty, FirstBounty, LastBounty, Next, Previous );
  FreeMemory( bounty->Target );
  FreeMemory( bounty->Poster );
  FreeMemory( bounty );

  SaveBounties();
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

  if (bounty
      && ( !ch->PCData || !ch->PCData->ClanInfo.Clan
	   || ( StrCmp(ch->PCData->ClanInfo.Clan->Name, "the hunters guild")
		|| StrCmp(ch->PCData->ClanInfo.Clan->Name, "the assassins guild") ) ) )
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
          Echo( ch, "You receive %ld hunting experience for executing a wanted killer.\r\n", xp );
        }
      else if ( !IsNpc(ch) )
        {
          SetBit(ch->Flags, PLR_KILLER );
          Echo( ch, "You are now wanted for the murder of %s.\r\n", victim->Name );
        }

      return;
    }

  ch->Gold += bounty->Reward;

  xp = urange(1, bounty->Reward + ComputeXP(ch, victim) , ( GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
  GainXP( ch, HUNTING_ABILITY, xp );

  SetCharacterColor( AT_BLOOD, ch );
  Echo( ch, "You receive %ld experience and %ld credits,\r\n from the bounty on %s.\r\n", xp, bounty->Reward, bounty->Target );

  sprintf( buf, "The disintegration bounty on %s has been claimed!",victim->Name );
  EchoToAll ( AT_RED , buf, 0 );

  if ( !IsBitSet(victim->Flags , PLR_KILLER ) )
    {
      SetBit(ch->Flags, PLR_KILLER );
    }

  RemoveBounty(bounty);
}
