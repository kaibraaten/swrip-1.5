#include "systemdata.hpp"
#include "script.hpp"
#define SYSTEMDATA_FILE DATA_DIR "sysdata.lua"

SystemData SysData;

static void PushSystemData( lua_State *L, const void *userData )
{
  lua_newtable( L );

  LuaSetfieldNumber( L, "AllTimeMaxPlayers", SysData.MaxPlayersEver );

  if( !SysData.TimeOfMaxPlayersEver.empty() )
    {
      LuaSetfieldString( L, "AllTimeMaxPlayersTime", SysData.TimeOfMaxPlayersEver );
    }

  LuaSetfieldBoolean( L, "NoNameResolving", SysData.NoNameResolving );
  LuaSetfieldBoolean( L, "WaitForAuth", SysData.NewPlayersMustWaitForAuth );
  LuaSetfieldNumber( L, "ReadAllMail", SysData.ReadAllMail );
  LuaSetfieldNumber( L, "ReadMailFree", SysData.ReadMailFree );
  LuaSetfieldNumber( L, "WriteMailFree", SysData.WriteMailFree );
  LuaSetfieldNumber( L, "TakeOthersMail", SysData.TakeOthersMail );
  LuaSetfieldNumber( L, "BuildChannelLevel", SysData.LevelOfBuildChannel );
  LuaSetfieldNumber( L, "LogChannelLevel", SysData.LevelOfLogChannel );
  LuaSetfieldNumber( L, "ModifyProto", SysData.LevelToModifyProto );
  LuaSetfieldNumber( L, "OverridePrivateFlag", SysData.LevelToOverridePrivateFlag );
  LuaSetfieldNumber( L, "MsetPlayer", SysData.LevelToMsetPlayers );
  LuaSetfieldNumber( L, "StunModPvP", SysData.StunModPlrVsPlr );
  LuaSetfieldNumber( L, "StunRegular", SysData.StunRegular );
  LuaSetfieldNumber( L, "DamModPvP", SysData.DamagePlrVsPlr );
  LuaSetfieldNumber( L, "DamModPvE", SysData.DamagePlrVsMob );
  LuaSetfieldNumber( L, "DamModEvP", SysData.DamageMobVsPlr );
  LuaSetfieldNumber( L, "DamModEvE", SysData.DamageMobVsMob );
  LuaSetfieldNumber( L, "ForcePc", SysData.LevelToForcePlayers );
  LuaSetfieldNumber( L, "SaveFlags", SysData.SaveFlags );
  LuaSetfieldNumber( L, "SaveFrequency", SysData.SaveFrequency );
  LuaSetfieldBoolean( L, "DisableHunger", SysData.DisableHunger );
  LuaSetfieldBoolean( L, "CanChooseJedi", SysData.CanChooseJedi );
  LuaSetfieldBoolean( L, "ExtendedRaceSelection", SysData.ExtendedRaceSelection );
  LuaSetfieldBoolean( L, "PermaDeath", SysData.PermaDeath );
  LuaSetfieldBoolean( L, "AllowMultiplaying", SysData.AllowMultiplaying );
  lua_setglobal( L, "systemdata" );
}

static int L_SystemDataEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "AllTimeMaxPlayers" );
  lua_getfield( L, idx, "AllTimeMaxPlayersTime" );
  lua_getfield( L, idx, "NoNameResolving" );
  lua_getfield( L, idx, "WaitForAuth" );
  lua_getfield( L, idx, "ReadAllMail" );
  lua_getfield( L, idx, "ReadMailFree" );
  lua_getfield( L, idx, "WriteMailFree" );
  lua_getfield( L, idx, "TakeOthersMail" );
  lua_getfield( L, idx, "BuildChannelLevel" );
  lua_getfield( L, idx, "LogChannelLevel" );
  lua_getfield( L, idx, "ModifyProto" );
  lua_getfield( L, idx, "OverridePrivateFlag" );
  lua_getfield( L, idx, "MsetPlayer" );
  lua_getfield( L, idx, "StunModPvP" );
  lua_getfield( L, idx, "StunRegular" );
  lua_getfield( L, idx, "DamModPvP" );
  lua_getfield( L, idx, "DamModPvE" );
  lua_getfield( L, idx, "DamModEvP" );
  lua_getfield( L, idx, "DamModEvE" );
  lua_getfield( L, idx, "ForcePc" );
  lua_getfield( L, idx, "SaveFlags" );
  lua_getfield( L, idx, "SaveFrequency" );
  lua_getfield( L, idx, "DisableHunger" );
  lua_getfield( L, idx, "CanChooseJedi" );
  lua_getfield( L, idx, "PermaDeath" );
  lua_getfield( L, idx, "ExtendedRaceSelection" );
  lua_getfield( L, idx, "AllowMultiplaying" );

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.MaxPlayersEver = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.TimeOfMaxPlayersEver = lua_tostring( L, idx );
    }
  else
    {
      SysData.TimeOfMaxPlayersEver = "(not recorded)";
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.NoNameResolving = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.NewPlayersMustWaitForAuth = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.ReadAllMail = lua_tointeger( L, idx );
      }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.ReadMailFree = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.WriteMailFree = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.TakeOthersMail = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelOfBuildChannel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelOfLogChannel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToModifyProto = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToOverridePrivateFlag = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToMsetPlayers = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.StunModPlrVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.StunRegular = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamagePlrVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamagePlrVsMob = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamageMobVsPlr = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DamageMobVsMob = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.LevelToForcePlayers = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.SaveFlags = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.SaveFrequency = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.DisableHunger = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.CanChooseJedi = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.PermaDeath = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.ExtendedRaceSelection = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      SysData.AllowMultiplaying = lua_toboolean( L, idx );
    }

  lua_pop( L, lua_gettop( L ) - 1 );

  return 0;
}

void SystemData::Load()
{
  LuaLoadDataFile( SYSTEMDATA_FILE, L_SystemDataEntry, "SystemDataEntry" );
}

void SystemData::Save() const
{
  LuaSaveDataFile( SYSTEMDATA_FILE, PushSystemData, "systemdata", NULL );
}
