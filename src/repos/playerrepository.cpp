#include <sstream>
#include <cassert>
#include <filesystem>
#include <set>
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

#define PLAYER_DIR      DATA_DIR "players/"   /* Player files                 */
#define BACKUP_DIR      DATA_DIR "backup/"    /* Backup Player files          */
#define CLONE_DIR       DATA_DIR "clones/"

namespace fs = std::filesystem;

std::shared_ptr<PlayerRepository> PlayerCharacters;

static std::string GetPlayerBackupFilename(const std::string &name);
static std::string GetPlayerFilename(const std::string &name);
static std::string GetCloneFilename(const std::string &name);

class InMemoryPlayerRepository : public PlayerRepository
{
public:
    void Load() override;
    bool Load(std::shared_ptr<Descriptor> d, const std::string &name, bool preload) override;
    void Save() const override;
    void Save(std::shared_ptr<Character> pc) const override;
    std::string MakeWizlist() const override;
    bool Exists(const std::string &name) const override;
    void MakeClone(std::shared_ptr<Character> pc) override;
    void RestoreClone(std::shared_ptr<Character> pc) override;
    void Delete(const std::string &name) override;
    time_t LastOnline(const std::string &name) const override;
    
protected:
    void OnAdded(const std::shared_ptr<Character> &entity) override;
    void OnRemoved(const std::shared_ptr<Character> &entity) override;

private:
    static constexpr int SAVE_VERSION = 1;
    static void PushPlayer(lua_State *L, const std::shared_ptr<Character> &pc);
    static void PushGuildData(lua_State *L, std::shared_ptr<Character> pc);
    static void PushAliases(lua_State *L, std::shared_ptr<Character> pc);
    static void PushAddictions(lua_State *L, std::shared_ptr<Character> pc);
    static void PushDrugLevels(lua_State *L, std::shared_ptr<Character> pc);
    static void PushHelled(lua_State *L, std::shared_ptr<Character> pc);
    static void PushConditions(lua_State *L, std::shared_ptr<Character> pc);
    static void PushSkills(lua_State *L, std::shared_ptr<Character> pc);
    static void PushKilledData(lua_State *L, std::shared_ptr<Character> pc);
    static void PushImcData(lua_State *L, std::shared_ptr<Character> pc);
    static void PushComments(lua_State *L, std::shared_ptr<Character> pc);
    static void PushPlayerData(lua_State *L, std::shared_ptr<Character> pc);

    static int L_CharacterEntry(lua_State *L);
    static void PreloadCharacter(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadPlayerData(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadGuildData(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadImcData(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadKilledData(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadComments(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadSkills(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadConditions(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadHelled(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadDrugLevels(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadAddictions(lua_State *L, std::shared_ptr<Character> ch);
    static void LoadAliases(lua_State *L, std::shared_ptr<Character> ch);
};

class Wizard
{
public:
    Wizard(const std::string &name, short level) : Name(name), Level(level) { }
    std::string Name;
    short Level = 0;
};

struct CompareWizard
{
    bool operator()(const Wizard &lhv, const Wizard &rhv) const
    {
        return lhv.Level > rhv.Level;
    }
};

static std::set<Wizard, CompareWizard> Wizards;

static void AddToWizList(const std::string &name, int level)
{
    Wizards.insert(Wizard(name, level));
}

static void ToOutput(const std::string &line, std::ostringstream &output)
{
    char outline[MAX_STRING_LENGTH] = { '\0' };

    if (!line.empty())
    {
        int filler = 78 - line.size();

        if (filler < 1)
            filler = 1;

        filler /= 2;

        for (int xx = 0; xx < filler; xx++)
            strcat(outline, " ");

        strcat(outline, line.c_str());
    }

    strcat(outline, "\r\n");
    output << outline;
}

static int L_WizardEntry(lua_State *L)
{
    int level = 0;
    std::string name;
    LuaGetfieldInt(L, "Level", &level);
    LuaGetfieldString(L, "Name", &name);

    if(level >= LEVEL_IMMORTAL)
    {
        AddToWizList(name, level);
    }

    return 0;
}

static void AddIfWizard(const std::string &filename)
{
    LuaLoadDataFile(filename, L_WizardEntry, "CharacterEntry");
}

std::string InMemoryPlayerRepository::MakeWizlist() const
{
    std::ostringstream output;

    Wizards.clear();

    try
    {
        for (const auto &entry : fs::directory_iterator(PLAYER_DIR))
        {
            if(entry.is_directory())
            {
                const auto &path = entry.path();
                std::string dirname = path.string();
                Log->Info("Scanning directory %s", dirname.c_str());
                ForEachLuaFileInDir(dirname, AddIfWizard);
            }
        }

        ToOutput(" Masters of Star Wars: Rise in Power!", output);
        int ilevel = 65535;
        char buf[MAX_STRING_LENGTH] = { '\0' };

        for (const auto &wiz : Wizards)
        {
            if (wiz.Level > LEVEL_AVATAR)
            {
                if (wiz.Level < ilevel)
                {
                    if (buf[0])
                    {
                        ToOutput(buf, output);
                        buf[0] = '\0';
                    }

                    ToOutput("", output);
                    ilevel = wiz.Level;

                    switch (ilevel)
                    {
                    case MAX_LEVEL - 0:
                        ToOutput(" Implementors ", output);
                        break;

                    case MAX_LEVEL - 1:
                        ToOutput(" Head Administrator ", output);
                        break;

                    case MAX_LEVEL - 2:
                        ToOutput(" Administrators ", output);
                        break;

                    case MAX_LEVEL - 4:
                        ToOutput(" Lower Immortals ", output);

                    default:
                        ToOutput(" Builders", output);
                        break;
                    }
                }

                if (strlen(buf) + wiz.Name.size() > 76)
                {
                    ToOutput(buf, output);
                    buf[0] = '\0';
                }

                strcat(buf, " ");
                strcat(buf, wiz.Name.c_str());

                if (strlen(buf) > 70)
                {
                    ToOutput(buf, output);
                    buf[0] = '\0';
                }
            }
        }

        if (buf[0])
        {
            ToOutput(buf, output);
        }

        Wizards.clear();
    }
    catch (const fs::filesystem_error &ex)
    {
        Log->Bug("%s: Filesystem error: %s", __FUNCTION__, ex.what());
        output.str("");
    }

    return output.str();
}

bool InMemoryPlayerRepository::Exists(const std::string &name) const
{
    return fs::exists(GetPlayerFilename(name));
}

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

    ResetSaveEquipmentMatrix();

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
            Log->LogStringPlus(buf, LogType::Comm, LEVEL_GREATER);
        }
    }
    else
    {
        std::shared_ptr<Character> ch = std::make_shared<Character>(std::make_unique<PCData>());
        MapCharacterAndDescriptor(ch, d);
        ch->Name = Capitalize(name);
        ImcInitializeCharacter(ch);
        loading_char.reset();
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
    loading_char.reset();
    return found;
}

void InMemoryPlayerRepository::PreloadCharacter(lua_State *L, std::shared_ptr<Character> ch)
{
    LuaGetfieldString(L, "Name", &ch->Name);
    LuaGetfieldInt(L, "Level", &ch->TopLevel);
    LuaGetfieldString(L, "Password", &ch->PCData->Password);
    ch->Flags = LuaLoadFlags(L, "Flags").to_ulong();
}

void InMemoryPlayerRepository::LoadPlayerData(lua_State *L, std::shared_ptr<Character> ch)
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
                           AddTimerToCharacter(ch, TIMER_PKILLED, pkilledTimer,
                                               nullptr, CharacterSubState::None);
                       }
                   });
    LuaGetfieldInt(L, "Alignment", &ch->Alignment);
    LuaGetfieldInt(L, "ArmorClass", &ch->ArmorClass);
    
    ch->Flags = LuaLoadFlags(L, "Flags").to_ulong();
    ch->PCData->Flags = LuaLoadFlags(L, "PcFlags");
    ch->PCData->WantedOn = LuaLoadFlags(L, "Wanted");

    auto pets = LuaLoadMobiles(L, "Pets");

    if (!pets.empty())
    {
        ch->PCData->Pet = pets.front();

        if(ch->PCData->Pet->InRoom == ch->InRoom)
        {
            StartFollowing(ch->PCData->Pet, ch);
        }
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
}

void InMemoryPlayerRepository::LoadGuildData(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadImcData(lua_State *L, std::shared_ptr<Character> ch)
{
    ImcLoadCharacter(L, ch);
}

void InMemoryPlayerRepository::LoadKilledData(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadComments(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadSkills(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadConditions(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadHelled(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadDrugLevels(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadAddictions(lua_State *L, std::shared_ptr<Character> ch)
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

void InMemoryPlayerRepository::LoadAliases(lua_State *L, std::shared_ptr<Character> ch)
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

    std::shared_ptr<Character> ch = std::make_shared<Character>(std::make_unique<PCData>());
    MapCharacterAndDescriptor(ch, d);
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

    for (size_t i = 0; i < MAX_WEAR; i++)
    {
        for (size_t x = 0; x < MAX_LAYERS; x++)
        {
            if (!save_equipment[i][x].expired())
            {
                EquipCharacter(ch, save_equipment[i][x].lock(), (WearLocation)i);
                save_equipment[i][x].reset();
            }
            else
            {
                break;
            }
        }
    }

    return 0;
}

void InMemoryPlayerRepository::PushPlayerData(lua_State *L, std::shared_ptr<Character> pc)
{
    assert(!IsNpc(pc));

    DeEquipCharacter(pc);
    
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
    
    if (pc->Desc != nullptr
        && !pc->Desc->Remote.Hostname.empty())
    {
        LuaSetfieldString(L, "LastConnectedFrom", pc->Desc->Remote.Hostname);
    }

    LuaPushFlags(L, pc->Flags, PlayerFlags, "Flags");
    LuaPushFlags(L, pc->PCData->Flags, PcFlags, "PcFlags");
    LuaPushFlags(L, pc->PCData->WantedOn, WantedFlags, "Wanted");

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

    ReEquipCharacter(pc);
    
    if (pc->PCData->Pet != nullptr)
    {
        LuaPushMobiles(L, { pc->PCData->Pet }, "Pets");
    }
}

void InMemoryPlayerRepository::PushAliases(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushAddictions(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushDrugLevels(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushHelled(lua_State *L, std::shared_ptr<Character> pc)
{
    lua_pushstring(L, "Helled");
    lua_newtable(L);

    LuaSetfieldNumber(L, "ReleaseDate", pc->PCData->ReleaseDate);
    LuaSetfieldString(L, "HelledBy", pc->PCData->HelledBy);

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushConditions(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushSkills(lua_State *L, std::shared_ptr<Character> pc)
{
    lua_pushstring(L, "Skills");
    lua_newtable(L);

    for (int sn = 1; sn < TopSN; ++sn)
    {
        std::shared_ptr<Skill> skill = SkillTable[sn];

        if (!skill->Name.empty() && GetSkillLevel(pc, sn) > 0)
        {
            lua_pushnumber(L, sn);
            lua_newtable(L);

            LuaSetfieldString(L, "Type", SkillTypeName[skill->Type]);
            LuaSetfieldString(L, "Name", skill->Name);
            LuaSetfieldNumber(L, "Level", GetSkillLevel(pc, sn));

            lua_settable(L, -3);
        }
    }

    lua_settable(L, -3);
}

void InMemoryPlayerRepository::PushComments(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushKilledData(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushImcData(lua_State *L, std::shared_ptr<Character> pc)
{
    ImcSaveCharacter(L, pc);
}

void InMemoryPlayerRepository::PushGuildData(lua_State *L, std::shared_ptr<Character> pc)
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

void InMemoryPlayerRepository::PushPlayer(lua_State *L, const std::shared_ptr<Character> &pc)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaPushCharacter(L, pc, PushPlayerData);

    lua_setglobal(L, "character");
}

void InMemoryPlayerRepository::Save(std::shared_ptr<Character> pc) const
{
    if (IsNpc(pc) || !IsAuthed(pc))
    {
        return;
    }

    if (pc->Desc != nullptr && pc->Desc->Original != nullptr)
    {
        pc = pc->Desc->Original;
    }

    saving_char = pc;

    if (IsClanned(pc))
    {
        UpdateClanMember(pc);
    }

    pc->PCData->SaveTime = current_time;

    if(fs::exists(GetPlayerFilename(pc)))
    {
        fs::rename(GetPlayerFilename(pc), GetPlayerBackupFilename(pc->Name));
    }

    LuaSaveDataFile(GetPlayerFilename(pc),
                    &InMemoryPlayerRepository::PushPlayer,
                    "character", pc);

    WriteCorpses(pc, "");

    quitting_char.reset();
    saving_char.reset();
}

void InMemoryPlayerRepository::OnAdded(const std::shared_ptr<Character> &entity)
{
    assert(!IsNpc(entity));
}

void InMemoryPlayerRepository::OnRemoved(const std::shared_ptr<Character> &entity)
{

}

void InMemoryPlayerRepository::MakeClone(std::shared_ptr<Character> pc)
{
    std::error_code ec;
    auto pfileFilename = GetPlayerFilename(pc);
    auto cloneFilename = GetCloneFilename(pc->Name);

    fs::copy(pfileFilename, cloneFilename, ec);
}

void InMemoryPlayerRepository::RestoreClone(std::shared_ptr<Character> pc)
{
    std::error_code ec;
    auto cloneFilename = GetCloneFilename(pc->Name);
    auto pfileFilename = GetPlayerFilename(pc);

    fs::rename(cloneFilename, pfileFilename, ec);
}

void InMemoryPlayerRepository::Delete(const std::string &name)
{
    std::error_code ec;
    fs::rename(GetPlayerFilename(name), GetPlayerBackupFilename(name), ec);
    fs::remove(GetCloneFilename(name), ec);
}

time_t InMemoryPlayerRepository::LastOnline(const std::string &name) const
{
    time_t tm = 0;
    struct stat fst;
    std::string filename = GetPlayerFilename(name);
    
    if (stat(filename.c_str(), &fst) != -1)
    {
        tm = fst.st_mtime;
    }

    return tm;
}

////////////////////////
std::shared_ptr<PlayerRepository> NewPlayerRepository()
{
    return std::make_shared<InMemoryPlayerRepository>();
}

std::string GetPlayerFilename(std::shared_ptr<Character> pc)
{
    return GetPlayerFilename(pc->Name);
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

static std::string GetCloneFilename(const std::string &name)
{
    return FormatString("%s%c/%s.lua", CLONE_DIR, tolower(name[0]),
                        ToLower(name).c_str());
}
