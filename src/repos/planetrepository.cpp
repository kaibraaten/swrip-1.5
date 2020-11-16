#include "planetrepository.hpp"
#include "planet.hpp"
#include "luascript.hpp"
#include "area.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "repos/arearepository.hpp"

#define PLANET_DIR      DATA_DIR "planets/"

class LuaPlanetRepository : public PlanetRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(std::shared_ptr<Planet> planet) const override;
    std::shared_ptr<Planet> FindByName(const std::string &name) const override;

private:
    static void LoadPlanetAreas(lua_State *L, std::shared_ptr<Planet> planet);
    static int L_PlanetEntry(lua_State *L);
    static void LoadPlanet(const std::string &filePath);
    static void LuaPushAreas(lua_State *L, std::shared_ptr<Planet> planet);
    static void PushPlanet(lua_State *L, const std::shared_ptr<Planet> &planet);
};

void LuaPlanetRepository::Save() const
{
    for (auto planet : Entities())
    {
        Save(planet);
    }
}

void LuaPlanetRepository::Save(std::shared_ptr<Planet> planet) const
{
    LuaSaveDataFile(GetPlanetFilename(planet), PushPlanet, "planet", planet);
}

void LuaPlanetRepository::Load()
{
    ForEachLuaFileInDir(PLANET_DIR, LoadPlanet);
}

std::shared_ptr<Planet> LuaPlanetRepository::FindByName(const std::string &name) const
{
    return Find([name](const auto &planet) { return StrCmp(name, planet->Name) == 0; });
}

void LuaPlanetRepository::LoadPlanetAreas(lua_State *L, std::shared_ptr<Planet> planet)
{
    int idx = lua_gettop(L);
    lua_getfield(L, idx, "Areas");

    if (!lua_isnil(L, ++idx))
    {
        lua_pushnil(L);

        while (lua_next(L, -2))
        {
            auto area = Areas->Find(lua_tostring(L, -1));

            if (area)
            {
                planet->Add(area);
                area->Planet = planet;
            }

            lua_pop(L, 1);
        }
    }

    lua_pop(L, 1);
}

int LuaPlanetRepository::L_PlanetEntry(lua_State *L)
{
    std::shared_ptr<Planet> planet = std::make_shared<Planet>();

    LuaGetfieldString(L, "Name", &planet->Name);
    LuaGetfieldLong(L, "BaseValue", &planet->BaseValue);
    LuaGetfieldDouble(L, "PopulationSupport", &planet->PopularSupport);
    LuaGetfieldString(L, "Spaceobject",
        [planet](const std::string &name)
    {
        planet->Spaceobject = GetSpaceobject(name);
    });
    LuaGetfieldString(L, "GovernedBy",
        [planet](const std::string &name)
    {
        planet->GovernedBy = GetClan(name);
    });

    planet->Flags = LuaLoadFlags(L, "Flags").to_ulong();
    LoadPlanetAreas(L, planet);

    Planets->Add(planet);
    return 0;
}

void LuaPlanetRepository::LoadPlanet(const std::string &filePath)
{
    LuaLoadDataFile(filePath, L_PlanetEntry, "PlanetEntry");
}

void LuaPlanetRepository::LuaPushAreas(lua_State *L, std::shared_ptr<Planet> planet)
{
    if (!planet->Areas().empty())
    {
        int idx = 0;
        lua_pushstring(L, "Areas");
        lua_newtable(L);

        for (auto area : planet->Areas())
        {
            lua_pushinteger(L, ++idx);
            lua_pushstring(L, area->Filename.c_str());
            lua_settable(L, -3);
        }

        lua_settable(L, -3);
    }
}

void LuaPlanetRepository::PushPlanet(lua_State *L, const std::shared_ptr<Planet> &planet)
{
    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", planet->Name);
    LuaSetfieldNumber(L, "BaseValue", planet->BaseValue);
    LuaSetfieldNumber(L, "PopulationSupport", planet->PopularSupport);

    if (planet->Spaceobject)
    {
        LuaSetfieldString(L, "Spaceobject", planet->Spaceobject->Name);
    }

    if (planet->GovernedBy)
    {
        LuaSetfieldString(L, "GovernedBy", planet->GovernedBy->Name);
    }

    LuaPushFlags(L, planet->Flags, PlanetFlags, "Flags");
    LuaPushAreas(L, planet);

    lua_setglobal(L, "planet");
}

////////////////////////////////////////////////////////////////

std::shared_ptr<PlanetRepository> NewPlanetRepository()
{
    return std::make_shared<LuaPlanetRepository>();
}

std::string GetPlanetFilename(std::shared_ptr<Planet> planet)
{
    return FormatString("%s%s", PLANET_DIR, ConvertToLuaFilename(planet->Name).c_str());
}
