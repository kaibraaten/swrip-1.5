#include <map>
#include <filesystem>
#include <utility/algorithms.hpp>
#include <utility/utility.hpp>
#include "mud.hpp"
#include "plugins.hpp"
#include "log.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"
#include "area.hpp"
#include "repos/arearepository.hpp"
#include "luascript.hpp"
#include "areasavehelper.hpp"
#include "reset.hpp"
#include "shop.hpp"
#include "exit.hpp"

namespace fs = std::filesystem;

#define PLUGIN_DIR DATA_DIR "plugins/"

struct Plugin::Impl
{
    Impl(const std::string &id)
        : Id(id),
          Name(id)
    {

    }

    std::string Id;
    std::string Name;
    std::string Description;

    // Local vnum -> real vnum
    std::map<vnum_t, std::shared_ptr<Room>> RoomMapping;
    std::map<vnum_t, std::shared_ptr<ProtoObject>> ObjectMapping;
    std::map<vnum_t, std::shared_ptr<ProtoMobile>> MobileMapping;

    vnum_t GetNextRoomVnum() const
    {
        if(RoomMapping.empty())
        {
            return 1;
        }
        else
        {
            return RoomMapping.crbegin()->first + 1;
        }
    }

    vnum_t GetNextObjectVnum() const
    {
        if(ObjectMapping.empty())
        {
            return 1;
        }
        else
        {
            return ObjectMapping.crbegin()->first + 1;
        }
    }

    vnum_t GetNextMobVnum() const
    {
        if(MobileMapping.empty())
        {
            return 1;
        }
        else
        {
            return MobileMapping.crbegin()->first + 1;
        }
    }

    vnum_t RelativeToAbsoluteRoomVnum(vnum_t vnum) const
    {
        for(const auto & [relative, room] : RoomMapping)
        {
            if(relative == vnum)
            {
                return room->Vnum;
            }
        }

        // Vnum must point to somewhere outside the plugin area,
        // so just pass it through.
        return vnum;
    }
};

Plugin::Plugin(const std::string &id)
    : pImpl(std::make_unique<Impl>(id))
{

}

Plugin::~Plugin()
{

}

std::string Plugin::Id() const
{
    return pImpl->Id;
}

std::string Plugin::Name() const
{
    return pImpl->Name;
}

void Plugin::Name(const std::string &name)
{
    pImpl->Name = name;
}

std::string Plugin::Description() const
{
    return pImpl->Description;
}

void Plugin::Description(const std::string &description)
{
    pImpl->Description = description;
}

void Plugin::Add(std::shared_ptr<Room> room, vnum_t localVnum)
{
    if(localVnum == INVALID_VNUM)
    {
        localVnum = pImpl->GetNextRoomVnum();
    }

    room->Plugin = this;
    pImpl->RoomMapping.insert({ localVnum, room });
}

void Plugin::Add(std::shared_ptr<ProtoObject> obj, vnum_t localVnum)
{
    if(localVnum == INVALID_VNUM)
    {
        localVnum = pImpl->GetNextObjectVnum();
    }

    obj->Plugin = this;
    pImpl->ObjectMapping.insert({ localVnum, obj });
}

void Plugin::Add(std::shared_ptr<ProtoMobile> mob, vnum_t localVnum)
{
    if(localVnum == INVALID_VNUM)
    {
        localVnum = pImpl->GetNextMobVnum();
    }

    mob->Plugin = this;
    pImpl->MobileMapping.insert({ localVnum, mob });
}

std::list<std::tuple<vnum_t, std::shared_ptr<Room>>> Plugin::Rooms() const
{
    std::list<std::tuple<vnum_t, std::shared_ptr<Room>>> rooms;

    for(const auto & [vnum, room] : pImpl->RoomMapping)
    {
        rooms.push_back({ vnum, room });
    }

    rooms.sort([](const auto &a, const auto &b)
               {
                   return std::get<0>(a) < std::get<0>(b);
               });
    return rooms;
}

std::list<std::tuple<vnum_t, std::shared_ptr<ProtoObject>>> Plugin::Objects() const
{
    std::list<std::tuple<vnum_t, std::shared_ptr<ProtoObject>>> objects;

    for(const auto & [vnum, obj] : pImpl->ObjectMapping)
    {
        objects.push_back({ vnum, obj });
    }

    objects.sort([](const auto &a, const auto &b)
                 {
                     return std::get<0>(a) < std::get<0>(b);
                 });
    return objects;
}

std::list<std::tuple<vnum_t, std::shared_ptr<ProtoMobile>>> Plugin::Mobiles() const
{
    std::list<std::tuple<vnum_t, std::shared_ptr<ProtoMobile>>> mobiles;

    for(const auto & [vnum, mob] : pImpl->MobileMapping)
    {
        mobiles.push_back({ vnum, mob });
    }

    mobiles.sort([](const auto &a, const auto &b)
                 {
                     return std::get<0>(a) < std::get<0>(b);
                 });
    return mobiles;
}

std::shared_ptr<Area> Plugin::ExportArea() const
{
    auto area = std::make_shared<Area>();
    area->SavingPlugin = const_cast<Plugin*>(this);
    area->Name = Name();
    vnum_t lastMob = pImpl->MobileMapping.size();
    vnum_t lastObj = pImpl->ObjectMapping.size();
    vnum_t lastRoom = pImpl->RoomMapping.size();

    if(lastMob != INVALID_VNUM)
    {
        area->VnumRanges.Mob.First = 1;
        area->VnumRanges.Mob.Last = lastMob;
    }

    if(lastObj != INVALID_VNUM)
    {
        area->VnumRanges.Object.First = 1;
        area->VnumRanges.Object.Last = lastObj;
    }

    if(lastRoom != INVALID_VNUM)
    {
        area->VnumRanges.Room.First = 1;
        area->VnumRanges.Room.Last = lastRoom;
    }

    auto pluginZone = Find(Areas->Entities(),
                           [](const auto &a)
                           {
                               return a->Flags.test(Flag::Area::PluginZone);
                           });

    area->FirstReset = pluginZone->FirstReset;
    area->LastReset = pluginZone->LastReset;
    area->LastMobReset = pluginZone->LastMobReset;
    area->LastObjectReset = pluginZone->LastObjectReset;

    return area;
}

//////////////////////////////////////////////////////////
// Free functions

static int L_PluginEntry(lua_State *L)
{
    std::string id;
    LuaGetfieldString(L, "Id", &id);

    if(GetPlugin(id))
    {
        Log->Bug("Plugin with id %s already exists.", id.c_str());
        return 0;
    }

    std::shared_ptr<Plugin> plugin = CreatePlugin(id);
    LuaGetfieldString(L, "Name", [plugin](const auto &name)
                                 {
                                     plugin->Name(name);
                                 });
    LuaGetfieldString(L, "Description", [plugin](const auto &desc)
                                        {
                                            plugin->Description(desc);
                                        });

    return 0;
}

void Plugin::RoomsToWorld()
{
    auto zone = FindPluginZone();
    
    for(const auto & [_, room] : pImpl->RoomMapping)
    {
        vnum_t vnum = GetFreeRoomVnum(zone);
        room->Vnum = vnum;
        room->Area = zone;
        room->Plugin = this;
        
        int iHash = vnum % MAX_KEY_HASH;
        room->Next = RoomIndexHash[iHash];
        RoomIndexHash[iHash] = room;
        top_room++;
    }

    for(const auto & [_, room] : pImpl->RoomMapping)
    {
        // Fix exit destination vnums:
        for(auto xit : room->Exits())
        {
            xit->Vnum = pImpl->RelativeToAbsoluteRoomVnum(xit->Vnum);
            xit->ReverseVnum = room->Vnum;
            xit->ToRoom = GetRoom(xit->Vnum);

            if(xit->ToRoom != nullptr && xit->ReverseExit == nullptr)
            {
                auto revExit = GetExitTo(xit->ToRoom, GetReverseDirection(xit->Direction), room->Vnum);

                if(revExit != nullptr)
                {
                    xit->ReverseExit = revExit;
                    revExit->ReverseExit = xit;
                }
            }
        }

        room->TeleVnum = pImpl->RelativeToAbsoluteRoomVnum(room->TeleVnum);
    }
}

void Plugin::ObjectsToWorld()
{
    auto zone = FindPluginZone();

    for(const auto & [_, obj] : pImpl->ObjectMapping)
    {
        vnum_t vnum = GetFreeObjectVnum(zone);
        obj->Vnum = vnum;
        obj->Plugin = this;
        
        ProtoObjects.insert({ vnum, obj });
    }
}

void Plugin::MobilesToWorld()
{
    auto zone = FindPluginZone();

    for(const auto & [_, mob] : pImpl->MobileMapping)
    {
        vnum_t vnum = GetFreeMobileVnum(zone);
        mob->Vnum = vnum;
        mob->Plugin = this;

        if(mob->Shop != nullptr)
        {
            mob->Shop->Keeper = mob->Vnum;
        }

        if(mob->RepairShop != nullptr)
        {
            mob->RepairShop->Keeper = mob->Vnum;
        }
        
        ProtoMobs.insert({ vnum, mob });
    }
}

void Plugin::ResetsToWorld()
{

}
static void LoadPluginInfo(const std::string &filename)
{
    LuaLoadDataFile(filename, L_PluginEntry, "PluginEntry");
}

static void LoadPluginArea(std::shared_ptr<Plugin> plugin)
{
    auto area = plugin->ExportArea();
    area->FirstReset = nullptr;
    area->LastReset = nullptr;
    area->LastMobReset = nullptr;
    area->LastObjectReset = nullptr;
    Areas->Load(area);

    Log->Info("Loaded %ld rooms.", plugin->Rooms().size());
    Log->Info("Loaded %ld objects.", plugin->Objects().size());
    Log->Info("Loaded %ld mobiles.", plugin->Mobiles().size());
    int numResets = 0;

    for(auto reset = area->FirstReset; reset; reset = reset->Next)
    {
        ++numResets;
    }

    Log->Info("Loaded %d resets.", numResets);

    Log->Info("Moving rooms to plugin zone.");
    plugin->RoomsToWorld();

    Log->Info("Moving objects to plugin zone.");
    plugin->ObjectsToWorld();

    Log->Info("Moving mobiles to plugin zone.");
    plugin->MobilesToWorld();

    Log->Info("Moving resets to plugin zone.");
    plugin->ResetsToWorld();
    
}

void LoadPlugins()
{
    try
    {
        for(const auto &iter : fs::directory_iterator(PLUGIN_DIR))
        {
            const auto &entry = iter.path().string();
            auto filename = iter.path().filename().string();

            if(iter.is_directory())
            {
                if(filename[0] == '_')
                {
                    Log->Info("Ignoring directory: %s", entry.c_str());
                }
                else
                {
                    Log->Info("Directory: %s", entry.c_str());

                    if(GetPlugin(filename) == nullptr)
                    {
                        if(fs::exists(entry + "/info.lua"))
                        {
                            Log->Info("Found plugin info file.");
                            LoadPluginInfo(entry + "/info.lua");
                        }

                        auto plugin = GetPlugin(filename);

                        if(plugin != nullptr)
                        {
                            if(fs::exists(entry + "/area.lua"))
                            {
                                Log->Info("Found area file.");
                                LoadPluginArea(plugin);
                            }
                        }
                        else
                        {
                            Log->Bug("Failed to load plugin!");
                        }
                    }
                    else
                    {
                        Log->Bug("Plugin with id %s already exists.", filename.c_str());
                    }
                }
            }
            else if(iter.is_regular_file())
            {
                Log->Info("Ignoring regular file: %s", entry.c_str());
            }
        }
    }
    catch(const fs::filesystem_error &ex)
    {
        perror(ex.what());
        exit(1);
    }
}

static void SaveInfo(std::shared_ptr<Plugin> plugin)
{
    auto saveData = [plugin](lua_State *L)
                    {
                        lua_newtable(L);

                        LuaSetfieldString(L, "Id", plugin->Id());
                        LuaSetfieldString(L, "Name", plugin->Name());
                        LuaSetfieldString(L, "Description", plugin->Description());

                        lua_setglobal(L, "plugin");
                    };
    LuaSaveDataFile(GetPluginPath(plugin.get()) + "/info.lua", saveData, "plugin");
}

void SavePlugin(std::shared_ptr<Plugin> plugin)
{
    Log->Info("Saving plugin %s (%s)", plugin->Name().c_str(), plugin->Id().c_str());
    fs::create_directory(GetPluginPath(plugin.get()));
    SaveInfo(plugin);
    auto area = plugin->ExportArea();
    auto helper = AreaSaveHelper::Create(area);
    Areas->Save(area, helper);
}

std::shared_ptr<Plugin> GetPlugin(const std::string &id)
{
    auto byId = [id](const auto &p)
                {
                    return StrCmp(p->Id(), id) == 0;
                };
    return Find(Plugins, byId);
}

std::shared_ptr<Plugin> CreatePlugin(const std::string &id)
{
    if(GetPlugin(id) == nullptr)
    {
        auto newPlugin = std::make_shared<Plugin>(id);
        Plugins.push_back(newPlugin);
        return newPlugin;
    }
    else
    {
        return nullptr;
    }
}

std::string GetPluginPath(const Plugin *plugin)
{
    return FormatString("%s%s", PLUGIN_DIR, plugin->Id().c_str());
}

std::shared_ptr<Area> FindPluginZone()
{
    return Find(Areas->Entities(),
                [](const auto &area)
                {
                    return area->Flags.test(Flag::Area::PluginZone);
                });
}
