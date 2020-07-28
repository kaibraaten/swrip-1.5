#include "mud.hpp"
#include "systemdata.hpp"
#include "script.hpp"
#define SYSTEMDATA_FILE DATA_DIR "sysdata.lua"

SystemData SysData;

static void PushSystemData(lua_State *L)
{
    lua_newtable(L);

    LuaSetfieldNumber(L, "AllTimeMaxPlayers", SysData.MaxPlayersEver);

    if (!SysData.TimeOfMaxPlayersEver.empty())
    {
        LuaSetfieldString(L, "AllTimeMaxPlayersTime", SysData.TimeOfMaxPlayersEver);
    }

    LuaSetfieldBoolean(L, "NoNameResolving", SysData.NoNameResolving);
    LuaSetfieldBoolean(L, "WaitForAuth", SysData.NewPlayersMustWaitForAuth);
    LuaSetfieldNumber(L, "ReadAllMail", SysData.ReadAllMail);
    LuaSetfieldNumber(L, "ReadMailFree", SysData.ReadMailFree);
    LuaSetfieldNumber(L, "WriteMailFree", SysData.WriteMailFree);
    LuaSetfieldNumber(L, "TakeOthersMail", SysData.TakeOthersMail);
    LuaSetfieldNumber(L, "BuildChannelLevel", SysData.LevelOfBuildChannel);
    LuaSetfieldNumber(L, "LogChannelLevel", SysData.LevelOfLogChannel);
    LuaSetfieldNumber(L, "ModifyProto", SysData.LevelToModifyProto);
    LuaSetfieldNumber(L, "OverridePrivateFlag", SysData.LevelToOverridePrivateFlag);
    LuaSetfieldNumber(L, "MsetPlayer", SysData.LevelToMsetPlayers);
    LuaSetfieldNumber(L, "StunModPvP", SysData.StunModPlrVsPlr);
    LuaSetfieldNumber(L, "StunRegular", SysData.StunRegular);
    LuaSetfieldNumber(L, "DamModPvP", SysData.DamagePlrVsPlr);
    LuaSetfieldNumber(L, "DamModPvE", SysData.DamagePlrVsMob);
    LuaSetfieldNumber(L, "DamModEvP", SysData.DamageMobVsPlr);
    LuaSetfieldNumber(L, "DamModEvE", SysData.DamageMobVsMob);
    LuaSetfieldNumber(L, "ForcePc", SysData.LevelToForcePlayers);
    LuaSetfieldNumber(L, "SaveFrequency", SysData.SaveFrequency);
    LuaSetfieldBoolean(L, "DisableHunger", SysData.DisableHunger);
    LuaSetfieldBoolean(L, "CanChooseJedi", SysData.CanChooseJedi);
    LuaSetfieldBoolean(L, "ExtendedRaceSelection", SysData.ExtendedRaceSelection);
    LuaSetfieldBoolean(L, "PermaDeath", SysData.PermaDeath);
    LuaSetfieldBoolean(L, "AllowMultiplaying", SysData.AllowMultiplaying);
    LuaSetfieldBoolean(L, "DropOnDefeat", SysData.DropOnDefeat);
    LuaSetfieldBoolean(L, "TopLevelFromAbility", SysData.TopLevelFromAbility);
    LuaPushFlags(L, SysData.SaveFlags, SaveFlags, "SaveFlags");
    lua_setglobal(L, "systemdata");
}

static int L_SystemDataEntry(lua_State *L)
{
    LuaGetfieldInt(L, "AllTimeMaxPlayers", &SysData.MaxPlayersEver);
    LuaGetfieldString(L, "AllTimeMaxPlayersTime", &SysData.TimeOfMaxPlayersEver);
    LuaGetfieldBool(L, "NoNameResolving", &SysData.NoNameResolving);
    LuaGetfieldBool(L, "WaitForAuth", &SysData.NewPlayersMustWaitForAuth);
    LuaGetfieldInt(L, "ReadAllMail", &SysData.ReadAllMail);
    LuaGetfieldInt(L, "ReadMailFree", &SysData.ReadMailFree);
    LuaGetfieldInt(L, "WriteMailFree", &SysData.WriteMailFree);
    LuaGetfieldInt(L, "TakeOthersMail", &SysData.TakeOthersMail);
    LuaGetfieldInt(L, "BuildChannelLevel", &SysData.LevelOfBuildChannel);
    LuaGetfieldInt(L, "LogChannelLevel", &SysData.LevelOfLogChannel);
    LuaGetfieldInt(L, "ModifyProto", &SysData.LevelToModifyProto);
    LuaGetfieldInt(L, "OverridePrivateFlag", &SysData.LevelToOverridePrivateFlag);
    LuaGetfieldInt(L, "MsetPlayer", &SysData.LevelToMsetPlayers);
    LuaGetfieldInt(L, "StunModPvP", &SysData.StunModPlrVsPlr);
    LuaGetfieldInt(L, "StunRegular", &SysData.StunRegular);
    LuaGetfieldInt(L, "DamModPvP", &SysData.DamagePlrVsPlr);
    LuaGetfieldInt(L, "DamModPvE", &SysData.DamagePlrVsMob);
    LuaGetfieldInt(L, "DamModEvP", &SysData.DamageMobVsPlr);
    LuaGetfieldInt(L, "DamModEvE", &SysData.DamageMobVsMob);
    LuaGetfieldInt(L, "ForcePc", &SysData.LevelToForcePlayers);
    LuaGetfieldInt(L, "SaveFrequency", &SysData.SaveFrequency);
    LuaGetfieldBool(L, "DisableHunger", &SysData.DisableHunger);
    LuaGetfieldBool(L, "CanChooseJedi", &SysData.CanChooseJedi);
    LuaGetfieldBool(L, "PermaDeath", &SysData.PermaDeath);
    LuaGetfieldBool(L, "ExtendedRaceSelection", &SysData.ExtendedRaceSelection);
    LuaGetfieldBool(L, "AllowMultiplaying", &SysData.AllowMultiplaying);
    LuaGetfieldBool(L, "DropOnDefeat", &SysData.DropOnDefeat);
    LuaGetfieldBool(L, "TopLevelFromAbility", &SysData.TopLevelFromAbility);
    
    if (FieldExists(L, "SaveFlags"))
    {
        SysData.SaveFlags = LuaLoadFlags(L, "SaveFlags");
    }

    return 0;
}

SystemData::SystemData()
    : SaveFlags(CreateBitSet<Flag::MAX>({
                                          Flag::AutoSave::Death,
                                          Flag::AutoSave::ChangePassword,
                                          Flag::AutoSave::Auto,
                                          Flag::AutoSave::Put,
                                          Flag::AutoSave::Drop,
                                          Flag::AutoSave::Give,
                                          Flag::AutoSave::Auction,
                                          Flag::AutoSave::Zap,
                                          Flag::AutoSave::Idle
        }))
{

}

void SystemData::Load()
{
    LuaLoadDataFile(SYSTEMDATA_FILE, L_SystemDataEntry, "SystemDataEntry");
}

void SystemData::Save() const
{
    LuaSaveDataFile(SYSTEMDATA_FILE, PushSystemData, "systemdata");
}
