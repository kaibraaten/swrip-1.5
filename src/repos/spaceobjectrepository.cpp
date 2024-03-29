#include "spaceobjectrepository.hpp"
#include "spaceobject.hpp"
#include "luascript.hpp"
#include "log.hpp"
#include "repos/planetrepository.hpp"
#include "mud.hpp"
#include "planet.hpp"
#include "room.hpp"

#define SPACE_DIR       DATA_DIR "space/"

class LuaSpaceobjectRepository : public SpaceobjectRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const std::shared_ptr<Spaceobject> &spaceobject) const override;

private:
    static bool LandingSiteIsBlank(const LandingSite *site);
    static void PushOneSite(lua_State *L, const LandingSite *site, int idx);
    static void PushLandingSites(lua_State *L, std::shared_ptr<Spaceobject> spaceobj);
    static void PushSpaceobject(lua_State *L, const std::shared_ptr<Spaceobject> &spaceobj);
    static void LoadLandingSite(lua_State *L, size_t idx, std::shared_ptr<Spaceobject> spaceobj);
    static void LoadLandingSites(lua_State *L, std::shared_ptr<Spaceobject> spaceobj);
    static int L_SpaceobjectEntry(lua_State *L);
    static void ExecuteSpaceobjectFile(const std::string &filePath);
};

void LuaSpaceobjectRepository::Load()
{
    ForEachLuaFileInDir(SPACE_DIR, ExecuteSpaceobjectFile);
}

void LuaSpaceobjectRepository::Save() const
{
    for(auto spaceobject : Entities())
    {
        Save(spaceobject);
    }
}

void LuaSpaceobjectRepository::Save(const std::shared_ptr<Spaceobject> &spaceobject) const
{
    LuaSaveDataFile(GetSpaceobjectFilename(spaceobject),
                    PushSpaceobject, "spaceobject", spaceobject);
}

bool LuaSpaceobjectRepository::LandingSiteIsBlank(const LandingSite *site)
{
    return site->LocationName.empty() && site->Dock == INVALID_VNUM;
}

void LuaSpaceobjectRepository::PushOneSite(lua_State *L, const LandingSite *site, int idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", site->LocationName);
    LuaSetfieldString(L, "DockVnum", VnumOrTagForRoom(site->Dock));
    LuaSetfieldBoolean(L, "IsSecret", site->IsSecret);

    lua_settable(L, -3);
}

void LuaSpaceobjectRepository::PushLandingSites(lua_State *L,
                                                std::shared_ptr<Spaceobject> spaceobj)
{
    lua_pushstring(L, "LandingSites");
    lua_newtable(L);

    for(size_t idx = 0; idx < MAX_LANDINGSITE; ++idx)
    {
        const LandingSite *site = &spaceobj->LandingSites[idx];

        if(!LandingSiteIsBlank(site))
        {
            PushOneSite(L, site, idx);
        }
    }

    lua_settable(L, -3);
}

void LuaSpaceobjectRepository::PushSpaceobject(lua_State *L, const std::shared_ptr<Spaceobject> &spaceobj)
{
    static int idx = 0;
    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", spaceobj->Name);

    if(spaceobj->Planet)
    {
        LuaSetfieldString(L, "Planet", spaceobj->Planet->Name);
    }

    LuaSetfieldString(L, "Type", SpaceobjectTypeName[spaceobj->Type]);

    if(spaceobj->Speed)
    {
        LuaSetfieldNumber(L, "Speed", spaceobj->Speed);
    }

    LuaSetfieldNumber(L, "Gravity", spaceobj->Gravity);

    if(spaceobj->IsSimulator)
    {
        LuaSetfieldNumber(L, "IsSimulator", spaceobj->IsSimulator);
    }

    PushLandingSites(L, spaceobj);
    LuaPushVector3(L, spaceobj->Position, "Position");

    if(spaceobj->Heading.x != 0 || spaceobj->Heading.y != 0 || spaceobj->Heading.z != 0)
    {
        LuaPushVector3(L, spaceobj->Heading, "Heading");
    }

    lua_setglobal(L, "spaceobject");
}

void LuaSpaceobjectRepository::LoadLandingSite(lua_State *L, size_t idx, std::shared_ptr<Spaceobject> spaceobj)
{
    LandingSite &site = spaceobj->LandingSites[idx];
    LuaGetfieldString(L, "Name", &site.LocationName);
    LuaGetfieldString(L, "DockVnum",
                      [&site](const auto &vnumOrTag)
                      {
                          if(IsValidVnumOrTag(vnumOrTag))
                          {
                              auto room = GetRoom(vnumOrTag);

                              if(room != nullptr)
                              {
                                  site.Dock = room->Vnum;
                              }
                          }
                      });
    LuaGetfieldBool(L, "IsSecret", &site.IsSecret);
}

void LuaSpaceobjectRepository::LoadLandingSites(lua_State *L, std::shared_ptr<Spaceobject> spaceobj)
{
    LuaLoadArray(L, "LandingSites", &LoadLandingSite, spaceobj);
}

int LuaSpaceobjectRepository::L_SpaceobjectEntry(lua_State *L)
{
    std::string name;
    LuaGetfieldString(L, "Name", &name);

    if(name.empty())
    {
        Log->Bug("%s: Name not found.", __FUNCTION__);
        return 0;
    }

    std::shared_ptr<Spaceobject> spaceobj = std::make_shared<Spaceobject>();
    spaceobj->Name = name;

    LuaGetfieldString(L, "Planet",
                      [spaceobj](const std::string &planetName)
                      {
                          spaceobj->Planet = Planets->FindByName(planetName);

                          if(spaceobj->Planet == nullptr)
                          {
                              Log->Bug("%s: Unknown planet name '%s' for spaceobject %s.",
                                       __FUNCTION__, planetName.c_str(), spaceobj->Name.c_str());
                          }
                      });
    LuaGetfieldString(L, "Type",
                      [spaceobj](const std::string &typeName)
                      {
                          SpaceobjectType type = GetSpaceobjectType(typeName);

                          if(type >= SPACE_SUN && type <= SPACE_OBJ)
                          {
                              spaceobj->Type = type;
                          }
                          else
                          {
                              Log->Bug("%s: SpaceobjectType out of range: %d", __FUNCTION__, type);
                          }
                      });
    LuaGetfieldInt(L, "Speed",
                   [spaceobj](const int speed)
                   {
                       if(speed >= 0)
                       {
                           spaceobj->Speed = speed;
                       }
                       else
                       {
                           Log->Bug("%s: Invalid speed %d", __FUNCTION__, speed);
                       }
                   });
    LuaGetfieldInt(L, "Gravity",
                   [spaceobj](const int gravity)
                   {
                       if(gravity >= 0)
                       {
                           spaceobj->Gravity = gravity;
                       }
                       else
                       {
                           Log->Bug("%s: Invalid gravity %d", __FUNCTION__, gravity);
                       }
                   });
    LuaGetfieldBool(L, "IsSimulator", &spaceobj->IsSimulator);

    spaceobj->Position = LuaLoadVector3(L, "Position");
    spaceobj->Heading = LuaLoadVector3(L, "Heading");
    LoadLandingSites(L, spaceobj);

    Spaceobjects->Add(spaceobj);

    return 0;
}

void LuaSpaceobjectRepository::ExecuteSpaceobjectFile(const std::string &filePath)
{
    LuaLoadDataFile(filePath, L_SpaceobjectEntry, "SpaceobjectEntry");
}

///////////////////////////////////////////////
std::shared_ptr<SpaceobjectRepository> NewSpaceobjectRepository()
{
    return std::make_shared<LuaSpaceobjectRepository>();
}

std::string GetSpaceobjectFilename(std::shared_ptr<Spaceobject> spaceobject)
{
    return FormatString("%s%s", SPACE_DIR, ConvertToLuaFilename(spaceobject->Name).c_str());
}
