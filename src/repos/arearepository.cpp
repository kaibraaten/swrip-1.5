#include <memory>
#include "arearepository.hpp"

std::shared_ptr<AreaRepository> Areas;

class LuaAreaRepository : public AreaRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const std::shared_ptr<Area>&) const override;

private:
    /*static void PushMember(lua_State* L, const std::shared_ptr<ClanMember>& member, int idx);
    static void PushMembers(lua_State* L, const std::shared_ptr<Clan>& clan);
    static void PushClan(lua_State* L, const void* userData);
    static void LoadOneMember(lua_State* L, const std::shared_ptr<Clan>& clan);
    static void LoadMembers(lua_State* L, const std::shared_ptr<Clan>& clan);
    static void LoadStoreroom(lua_State* L, const std::shared_ptr<Clan>& clan);
    static int L_ClanEntry(lua_State* L);
    static void ExecuteClanFile(const std::string& filePath, void* userData);*/
};

void LuaAreaRepository::Load()
{
    /*ForEachLuaFileInDir(CLAN_DIR, ExecuteClanFile, NULL);

    for (const auto& clan : Clans)
    {
        AssignGuildToMainclan(clan);
    }*/
}

void LuaAreaRepository::Save() const
{
    for (const auto &area : Entities())
    {
        Save(area);
    }
}

void LuaAreaRepository::Save(const std::shared_ptr<Area> &area) const
{
    //LuaSaveDataFile(GetClanFilename(clan), PushClan, "clan", &clan);
}

////////////////////////////////
std::shared_ptr<AreaRepository> NewAreaRepository()
{
    return std::make_shared<LuaAreaRepository>();
}
