#include <cassert>
#include <filesystem>
#include "playerrepository.hpp"
#include "character.hpp"
#include "script.hpp"
#include "race.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "clan.hpp"
#include "clanrepository.hpp"
#include "alias.hpp"
#include "log.hpp"
#include "board.hpp"
#include "skill.hpp"
#include "area.hpp"

namespace fs = std::filesystem;

PlayerRepository *PlayerCharacters = nullptr;

static std::string GetPlayerBackupFilename(const std::string &name);
static std::string GetPlayerFilename(const std::string &name);

class InMemoryPlayerRepository : public PlayerRepository
{
public:
    void Load() override;
    bool Load(std::shared_ptr<Descriptor> d, const std::string &name, bool preload) override;
    void Save() const override;
    void Save(const Character *pc) const override;

protected:
    void OnAdded(Character* &entity) override;
    void OnRemoved(Character* &entity) override;

private:
    static constexpr int SAVE_VERSION = 1;
    static void PushPlayer(lua_State *L, const void *userData);
    static void PushGuildData(lua_State *L, const Character *pc);
    static void PushAliases(lua_State *L, const Character *pc);
    static void PushAddictions(lua_State *L, const Character *pc);
    static void PushDrugLevels(lua_State *L, const Character *pc);
    static void PushBuildData(lua_State *L, const Character *pc);
    static void PushHelled(lua_State *L, const Character *pc);
    static void PushConditions(lua_State *L, const Character *pc);
    static void PushSkills(lua_State *L, const Character *pc);
    static void PushKilledData(lua_State *L, const Character *pc);
    static void PushImcData(lua_State *L, const Character *pc);
    static void PushComments(lua_State *L, const Character *pc);
    static void PushPlayerData(lua_State *L, const Character *pc);

    static int L_CharacterEntry(lua_State *L);
    static void PreloadCharacter(lua_State *L, Character *ch);
    static void LoadPlayerData(lua_State *L, Character *ch);
    static void LoadGuildData(lua_State *L, Character *ch);
    static void LoadImcData(lua_State *L, Character *ch);
    static void LoadKilledData(lua_State *L, Character *ch);
    static void LoadComments(lua_State *L, Character *ch);
    static void LoadSkills(lua_State *L, Character *ch);
    static void LoadConditions(lua_State *L, Character *ch);
    static void LoadHelled(lua_State *L, Character *ch);
    static void LoadDrugLevels(lua_State *L, Character *ch);
    static void LoadAddictions(lua_State *L, Character *ch);
    static void LoadAliases(lua_State *L, Character *ch);
    static void LoadBuildData(lua_State *L, Character *ch);
};

void InMemoryPlayerRepository::Load()
{

}

void InMemoryPlayerRepository::Save() const
{

}

bool InMemoryPlayerRepository::Load(std::shared_ptr<Descriptor> d, const std::string &name, bool preload)
{
    bool found = false;
    struct stat fst;
    char buf[MAX_INPUT_LENGTH];

    for (int x = 0; x < MAX_WEAR; x++)
    {
        for (int i = 0; i < MAX_LAYERS; i++)
        {
            save_equipment[x][i] = NULL;
        }
    }

    std::string filename = GetPlayerFilename(name);

    if (stat(filename.c_str(), &fst) != -1)
    {
        if (fst.st_size == 0)
        {
            filename = GetPlayerBackupFilename(name);
            //ch->Echo( "Restoring your backup player file...\r\n" );
        }
        else
        {
            sprintf(buf, "%s player data for: %s (%dK)",
                preload ? "Preloading" : "Loading", Capitalize(name).c_str(),
                (int)fst.st_size / 1024);
            Log->LogStringPlus(buf, LOG_COMM, LEVEL_GREATER);
        }
    }
    else
    {
        Character *ch = new Character(std::make_unique<PCData>(), d);
        ch->Name = Capitalize(name);
        ImcInitializeCharacter(ch);
        loading_char = nullptr;
        return false;
    }

    lua_State *L = CreateLuaState();

    lua_pushcfunction(L, L_CharacterEntry);
    lua_setglobal(L, "CharacterEntry");
    lua_pushlightuserdata(L, &d);
    lua_setglobal(L, "descriptor");
    lua_pushboolean(L, preload);
    lua_setglobal(L, "preload");

    int error = luaL_loadfile(L, filename.c_str()) || lua_pcall(L, 0, 0, 0);

    if (error)
    {
        Log->Bug("%s:%d %s() : Cannot run file: %s. Msg: %s",
            __FILE__, __LINE__, __FUNCTION__,
            filename.c_str(), lua_tostring(L, -1));
        return false;
    }
    else
    {
        found = true;
    }

    lua_close(L);
    loading_char = nullptr;
    return found;
}

void InMemoryPlayerRepository::PreloadCharacter(lua_State *L, Character *ch)
{
    LuaGetfieldString(L, "Name", &ch->Name);
    LuaGetfieldInt(L, "Level", &ch->TopLevel);
    LuaGetfieldString(L, "Password", &ch->PCData->Password);
    ch->Flags = LuaLoadFlags(L, "Flags").to_ulong();
}

void InMemoryPlayerRepository::LoadPlayerData(lua_State *L, Character *ch)
{
    std::string saveVersion;
    LuaGetfieldString(L, "SaveVersion", &saveVersion);
    LuaGetfieldString(L, "Title", &ch->PCData->Title);
    LuaGetfieldInt(L, "Played", &ch->PCData->Played);
    LuaGetfieldLong(L, "Bank", &ch->PCData->Bank);
    LuaGetfieldInt(L, "Clones", &ch->PCData->Clones);
    LuaGetfieldLong(L, "JailVnum", &ch->PCData->JailVnum);
    LuaGetfieldLong(L, "RestoreTime", &ch->PCData->RestoreTime);
    LuaGetfieldString(L, "Password", &ch->PCData->Password);
    LuaGetfieldString(L, "BamfIn", &ch->PCData->BamfIn);
    LuaGetfieldString(L, "BamfOut", &ch->PCData->BamfOut);
    LuaGetfieldString(L, "Email", &ch->PCData->Email);
    LuaGetfieldString(L, "HomePage", &ch->PCData->HomePage);
    LuaGetfieldString(L, "Rank", &ch->PCData->Rank);
    LuaGetfieldString(L, "Bestowments", &ch->PCData->Bestowments);
    LuaGetfieldString(L, "Biography", &ch->PCData->Bio);
    LuaGetfieldString(L, "AuthedBy", &ch->PCData->AuthedBy);
    LuaGetfieldInt(L, "MinSnoop", &ch->PCData->MinSnoop);
    LuaGetfieldString(L, "Prompt", &ch->PCData->Prompt);
    LuaGetfieldInt(L, "PKills", &ch->PCData->PKills);
    LuaGetfieldInt(L, "PDeaths", &ch->PCData->PDeaths);
    LuaGetfieldString(L, "AliasFocus", &ch->PCData->AliasFocus);
    LuaGetfieldInt(L, "MobKills", &ch->PCData->MKills);
    LuaGetfieldInt(L, "MobDeaths", &ch->PCData->MDeaths);
    LuaGetfieldInt(L, "IllegalPk", &ch->PCData->IllegalPk);
    LuaGetfieldInt(L, "PKilledTimer",
        [ch](const int pkilledTimer)
    {
        if (pkilledTimer < 0)
        {
            AddTimerToCharacter(ch, TIMER_PKILLED, pkilledTimer, nullptr, SUB_NONE);
        }
    });
    LuaGetfieldInt(L, "Alignment", &ch->Alignment);
    LuaGetfieldInt(L, "ArmorClass", &ch->ArmorClass);
    LuaGetfieldInt(L, "PlayerHome",
        [ch](const int homeVnum)
    {
        if (homeVnum > 0)
        {
            ch->PlayerHome = GetRoom(homeVnum);
        }
    });

    ch->Flags = LuaLoadFlags(L, "Flags").to_ulong();
    ch->PCData->Flags = LuaLoadFlags(L, "PcFlags");
    ch->PCData->WantedOn = LuaLoadFlags(L, "Wanted");

    std::list<Character*> pet = LuaLoadMobiles(L, "Pets");

    if (!pet.empty())
    {
        ch->PCData->Pet = pet.front();
    }

    LoadGuildData(L, ch);
    LoadImcData(L, ch);
    LoadKilledData(L, ch);
    LoadComments(L, ch);
    LoadSkills(L, ch);
    LoadConditions(L, ch);
    LoadHelled(L, ch);
    LoadDrugLevels(L, ch);
    LoadAddictions(L, ch);
    LoadAliases(L, ch);
    LoadBuildData(L, ch);
}

void InMemoryPlayerRepository::LoadGuildData(lua_State *L, Character *ch)
{
    int outerIdx = lua_gettop(L);
    lua_getfield(L, outerIdx, "Guild");

    if (!lua_isnil(L, ++outerIdx))
    {
        int idx = lua_gettop(L);
        const int topAtStart = idx;

        lua_getfield(L, idx, "Guild");
        lua_getfield(L, idx, "SalaryTime");
        lua_getfield(L, idx, "Salary");

        const int elementsToPop = lua_gettop(L) - topAtStart;

        if (!lua_isnil(L, ++idx))
        {
            std::string guildName = lua_tostring(L, idx);
            std::shared_ptr<Clan> guild = GetClan(guildName);

            if (guild != nullptr)
            {
                ch->PCData->ClanInfo.ClanName = guildName;
                ch->PCData->ClanInfo.Clan = guild;
            }
            else
            {
                Log->Bug("PlayerRepository::LoadGuildData() : Error while loading player '%s'. Guild '%s' doesn't exist.", ch->Name.c_str(), guildName.c_str());
            }
        }

        if (ch->PCData->ClanInfo.Clan != nullptr)
        {
            if (!lua_isnil(L, ++idx))
            {
                ch->PCData->ClanInfo.SalaryDate = lua_tointeger(L, idx);
            }

            if (!lua_isnil(L, ++idx))
            {
                ch->PCData->ClanInfo.Salary = lua_tointeger(L, idx);
            }
        }

        lua_pop(L, elementsToPop);
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadImcData(lua_State *L, Character *ch)
{
    ImcLoadCharacter(L, ch);
}

void InMemoryPlayerRepository::LoadKilledData(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Killed");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            if (ch->PCData->Killed.size() < GetKillTrackCount(ch))
            {
                long vnum = 0;
                int count = 0;
                LuaGetfieldLong(L, "Vnum", &vnum);
                LuaGetfieldInt(L, "Count", &count);
                ch->PCData->Killed.push_front({ vnum, static_cast<char>(count) });
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadComments(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Comments");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            std::shared_ptr<Note> note = std::make_shared<Note>();
            LuaGetfieldString(L, "Sender", &note->Sender);
            LuaGetfieldString(L, "Date", &note->Date);
            LuaGetfieldString(L, "To", &note->ToList);
            LuaGetfieldString(L, "Subject", &note->Subject);
            LuaGetfieldString(L, "Text", &note->Text);
            ch->PCData->Add(note);
            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadSkills(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Skills");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            std::string typeName;
            std::string skillName;
            int skillLevel = 0;
            LuaGetfieldString(L, "Type", &typeName);
            LuaGetfieldString(L, "Name", &skillName);
            LuaGetfieldInt(L, "Level", &skillLevel);

            int sn = -1;
            SkillType type = GetSkillType(typeName);

            switch (type)
            {
            case SKILL_SPELL:
                sn = BSearchSkillExact(skillName, gsn_first_spell, gsn_first_skill - 1);
                break;

            case SKILL_SKILL:
                sn = BSearchSkillExact(skillName, gsn_first_skill, gsn_first_weapon - 1);
                break;

            case SKILL_WEAPON:
                sn = BSearchSkillExact(skillName, gsn_first_weapon, gsn_first_tongue - 1);
                break;

            case SKILL_TONGUE:
                sn = BSearchSkillExact(skillName, gsn_first_tongue, gsn_TopSN - 1);
                break;

            default:
                Log->Bug("InMemoryPlayerRepository::LoadSkills() : Invalid skill type '%s'",
                    typeName.c_str());
                break;
            }

            if (sn >= 0)
            {
                ch->PCData->Learned[sn] = skillLevel;
            }
            else
            {
                Log->Bug("InMemoryPlayerRepository::LoadSkills() : Unknown skill '%s'",
                    skillName.c_str());
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadConditions(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Conditions");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t conditionSubscript = lua_tointeger(L, -2);

            if (conditionSubscript < ch->PCData->Condition.size())
            {
                LuaGetfieldInt(L, "Level", &ch->PCData->Condition[conditionSubscript]);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadHelled(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Helled");

    if (!lua_isnil(L, ++idx))
    {
        long releaseDate = 0;
        LuaGetfieldLong(L, "ReleaseDate", &releaseDate);
        ch->PCData->ReleaseDate = releaseDate;
        LuaGetfieldString(L, "HelledBy", &ch->PCData->HelledBy);
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadDrugLevels(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "SpiceLevels");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t drug = lua_tointeger(L, -2);

            if (drug < GetSpiceTableSize())
            {
                LuaGetfieldInt(L, "Level", &ch->PCData->DrugLevel[drug]);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadAddictions(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Addictions");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            size_t drug = lua_tointeger(L, -2);

            if (drug < GetSpiceTableSize())
            {
                LuaGetfieldInt(L, "Level", &ch->PCData->Addiction[drug]);
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadAliases(lua_State *L, Character *ch)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Aliases");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            Alias alias;
            LuaGetfieldString(L, "Name", &alias.Name);
            LuaGetfieldString(L, "Value", &alias.Command);
            lua_pop(L, 1);

            if (!alias.Name.empty() && !alias.Command.empty())
            {
                ch->PCData->Add(std::make_shared<Alias>(alias));
            }
        }
    }

    lua_pop(L, 1);
}

void InMemoryPlayerRepository::LoadBuildData(lua_State *L, Character *ch)
{
#pragma message("InMemoryPlayerRepository::LoadBuildData")
}

int InMemoryPlayerRepository::L_CharacterEntry(lua_State *L)
{
    lua_settop(L, 1);
    luaL_checktype(L, 1, LUA_TTABLE);

    lua_getglobal(L, "descriptor");
    lua_getglobal(L, "preload");

    assert(lua_islightuserdata(L, -2));
    assert(lua_isboolean(L, -1));

    auto d = *static_cast<std::shared_ptr<Descriptor>*>(lua_touserdata(L, -2));
    bool preload = lua_toboolean(L, -1);
    lua_pop(L, 2);

    Character *ch = new Character(std::make_unique<PCData>(), d);

    loading_char = ch;
    ImcInitializeCharacter(ch);

    if (preload)
    {
        PreloadCharacter(L, ch);
        return 0;
    }

    LuaLoadCharacter(L, ch, LoadPlayerData);

    // Final bits and pieces
    if (GetTrustLevel(ch) > LEVEL_AVATAR)
    {
        if (ch->PCData->WizInvis < 2)
        {
            ch->PCData->WizInvis = ch->TopLevel;
        }

        AssignAreaTo(ch);
    }

    for (int i = 0; i < MAX_WEAR; i++)
    {
        for (int x = 0; x < MAX_LAYERS; x++)
        {
            if (save_equipment[i][x])
            {
                EquipCharacter(ch, save_equipment[i][x], (WearLocation)i);
                save_equipment[i][x] = NULL;
            }
            else
            {
                break;
            }
        }
    }

    return 0;
}

void InMemoryPlayerRepository::PushPlayerData(lua_State *L, const Character *pc)
{
    assert(!IsNpc(pc));

    LuaSetfieldNumber(L, "SaveVersion", SAVE_VERSION);
    LuaSetfieldString(L, "CharacterType", "PlayerCharacter");
    LuaSetfieldNumber(L, "Played", pc->PCData->Played + (int)(current_time - pc->PCData->Logon));
    LuaSetfieldNumber(L, "LastPlayed", current_time);
    LuaSetfieldNumber(L, "Bank", pc->PCData->Bank);
    LuaSetfieldNumber(L, "Clones", pc->PCData->Clones);
    LuaSetfieldNumber(L, "JailVnum", pc->PCData->JailVnum);
    LuaSetfieldNumber(L, "RestoreTime", pc->PCData->RestoreTime);
    LuaSetfieldString(L, "Password", pc->PCData->Password);
    LuaSetfieldString(L, "BamfIn", pc->PCData->BamfIn);
    LuaSetfieldString(L, "BamfOut", pc->PCData->BamfOut);
    LuaSetfieldString(L, "Email", pc->PCData->Email);
    LuaSetfieldString(L, "HomePage", pc->PCData->HomePage);
    LuaSetfieldString(L, "Rank", pc->PCData->Rank);
    LuaSetfieldString(L, "Bestowments", pc->PCData->Bestowments);
    LuaSetfieldString(L, "Title", pc->PCData->Title);
    LuaSetfieldString(L, "Biography", pc->PCData->Bio);
    LuaSetfieldString(L, "AuthedBy", pc->PCData->AuthedBy);
    LuaSetfieldNumber(L, "MinSnoop", pc->PCData->MinSnoop);
    LuaSetfieldString(L, "Prompt", pc->PCData->Prompt);
    LuaSetfieldNumber(L, "PKills", pc->PCData->PKills);
    LuaSetfieldNumber(L, "PDeaths", pc->PCData->PDeaths);
    LuaSetfieldString(L, "AliasFocus", pc->PCData->AliasFocus);
    LuaSetfieldNumber(L, "MobKills", pc->PCData->MKills);
    LuaSetfieldNumber(L, "MobDeaths", pc->PCData->MDeaths);
    LuaSetfieldNumber(L, "IllegalPk", pc->PCData->IllegalPk);
    LuaSetfieldNumber(L, "PKilledTimer", GetTimer(pc, TIMER_PKILLED));
    LuaSetfieldNumber(L, "Alignment", pc->Alignment);
    LuaSetfieldNumber(L, "ArmorClass", pc->ArmorClass);
    LuaSetfieldNumber(L, "PlayerHome",
        pc->PlayerHome != nullptr ? pc->PlayerHome->Vnum : INVALID_VNUM);

    if (pc->Desc != nullptr
        && !pc->Desc->Remote.Hostname.empty())
    {
        LuaSetfieldString(L, "LastConnectedFrom", pc->Desc->Remote.Hostname);
    }

    LuaPushFlags(L, pc->Flags, PlayerFlags, "Flags");
    LuaPushFlags(L, pc->PCData->Flags, PcFlags, "PcFlags");
    LuaPushFlags(L, pc->PCData->WantedOn, WantedFlags, "Wanted");

    if (pc->PCData->Pet != nullptr)
    {
        LuaPushMobiles(L, { pc->PCData->Pet }, "Pets");
    }

    PushGuildData(L, pc);
    PushImcData(L, pc);
    PushKilledData(L, pc);
    PushComments(L, pc);
    PushSkills(L, pc);
    PushConditions(L, pc);
    PushHelled(L, pc);
    PushDrugLevels(L, pc);
    PushAddictions(L, pc);
    PushAliases(L, pc);
    PushBuildData(L, pc);
}

void InMemoryPlayerRepository::PushAliases(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Aliases");
    lua_newtable(L);

    for (auto alias : pc->PCData->Aliases())
    {
        LuaSetfieldString(L, "Name", alias->Name);
        LuaSetfieldString(L, "Value", alias->Command);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushAddictions(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Addictions");
    lua_newtable(L);

    for (size_t drug = 0; drug < GetSpiceTableSize(); ++drug)
    {
        lua_pushnumber(L, drug);
        lua_newtable(L);

        LuaSetfieldString(L, "Name", GetSpiceTypeName(drug));
        LuaSetfieldNumber(L, "Level", pc->PCData->Addiction[drug]);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushDrugLevels(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "SpiceLevels");
    lua_newtable(L);

    for (size_t drug = 0; drug < GetSpiceTableSize(); ++drug)
    {
        lua_pushnumber(L, drug);
        lua_newtable(L);

        LuaSetfieldString(L, "Name", GetSpiceTypeName(drug));
        LuaSetfieldNumber(L, "Level", pc->PCData->DrugLevel[drug]);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushBuildData(lua_State *L, const Character *pc)
{
#pragma message("InMemoryPlayerRepository::PushBuildData")
}

void InMemoryPlayerRepository::PushHelled(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Helled");
    lua_newtable(L);

    LuaSetfieldNumber(L, "ReleaseDate", pc->PCData->ReleaseDate);
    LuaSetfieldString(L, "HelledBy", pc->PCData->HelledBy);

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushConditions(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Conditions");
    lua_newtable(L);

    for (size_t idx = 0; idx < pc->PCData->Condition.size(); ++idx)
    {
        lua_pushinteger(L, idx);
        lua_newtable(L);

        LuaSetfieldString(L, "Type", ConditionNames[idx]);
        LuaSetfieldNumber(L, "Level", pc->PCData->Condition[idx]);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushSkills(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Skills");
    lua_newtable(L);

    for (int sn = 1; sn < TopSN; ++sn)
    {
        const Skill *skill = SkillTable[sn];

        if (!skill->Name.empty() && pc->PCData->Learned[sn] > 0)
        {
            lua_pushnumber(L, sn);
            lua_newtable(L);

            LuaSetfieldString(L, "Type", SkillTypeName[skill->Type]);
            LuaSetfieldString(L, "Name", skill->Name);
            LuaSetfieldNumber(L, "Level", pc->PCData->Learned[sn]);

            lua_settable(L, -3);
        }
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushComments(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Comments");
    lua_newtable(L);
    size_t idx = 0;

    for (auto note : pc->PCData->Comments())
    {
        lua_pushnumber(L, ++idx);
        lua_newtable(L);

        LuaSetfieldString(L, "Sender", note->Sender);
        LuaSetfieldString(L, "Date", note->Date);
        LuaSetfieldString(L, "To", note->ToList);
        LuaSetfieldString(L, "Subject", note->Subject);
        LuaSetfieldString(L, "Text", note->Text);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushKilledData(lua_State *L, const Character *pc)
{
    lua_pushstring(L, "Killed");
    lua_newtable(L);
    size_t idx = 0;

    for (const KilledData &killed : pc->PCData->Killed)
    {
        lua_pushnumber(L, ++idx);
        lua_newtable(L);

        LuaSetfieldNumber(L, "Vnum", killed.Vnum);
        LuaSetfieldNumber(L, "Count", killed.Count);

        lua_settable(L, -3);
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushImcData(lua_State *L, const Character *pc)
{
    ImcSaveCharacter(L, pc);
}

void InMemoryPlayerRepository::PushGuildData(lua_State *L, const Character *pc)
{
    if (pc->PCData->ClanInfo.Clan != nullptr)
    {
        lua_pushstring(L, "Guild");
        lua_newtable(L);

        LuaSetfieldString(L, "Guild", pc->PCData->ClanInfo.ClanName);
        LuaSetfieldNumber(L, "SalaryTime", pc->PCData->ClanInfo.SalaryDate);
        LuaSetfieldNumber(L, "Salary", pc->PCData->ClanInfo.Salary);

        lua_settable(L, -3);
    }
}

void InMemoryPlayerRepository::PushPlayer(lua_State *L, const void *userData)
{
    const Character *pc = static_cast<const Character*>(userData);

    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaPushCharacter(L, pc, PushPlayerData);

    lua_setglobal(L, "character");
}

void InMemoryPlayerRepository::Save(const Character *pc) const
{
    if (IsNpc(pc) || !IsAuthed(pc))
    {
        return;
    }

    if (pc->Desc != nullptr && pc->Desc->Original != nullptr)
    {
        pc = pc->Desc->Original;
    }

    saving_char = const_cast<Character*>(pc);

    if (IsClanned(pc))
    {
        UpdateClanMember(pc);
    }

    pc->PCData->SaveTime = current_time;

    fs::rename(GetPlayerFilename(pc).c_str(), GetPlayerBackupFilename(pc->Name).c_str());
    LuaSaveDataFile(GetPlayerFilename(pc),
        &InMemoryPlayerRepository::PushPlayer,
        "character", pc);

    WriteCorpses(pc, "");

    quitting_char = nullptr;
    saving_char = nullptr;
}

void InMemoryPlayerRepository::OnAdded(Character* &entity)
{
    assert(!IsNpc(entity));
}

void InMemoryPlayerRepository::OnRemoved(Character* &entity)
{

}

////////////////////////
PlayerRepository *NewPlayerRepository()
{
    return new InMemoryPlayerRepository();
}

std::string GetPlayerFilename(const Character *pc)
{
    return FormatString("%s%c/%s.lua", PLAYER_DIR, tolower(pc->Name[0]),
        ToLower(pc->Name).c_str());
}

static std::string GetPlayerFilename(const std::string &name)
{
    return FormatString("%s%c/%s.lua", PLAYER_DIR, tolower(name[0]),
        ToLower(name).c_str());
}

static std::string GetPlayerBackupFilename(const std::string &name)
{
    return FormatString("%s%c/%s.lua", BACKUP_DIR, tolower(name[0]),
        ToLower(name).c_str());
}
