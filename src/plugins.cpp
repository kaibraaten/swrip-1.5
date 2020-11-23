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
    std::map<vnum_t, std::weak_ptr<Room>> RoomMapping;
    std::map<vnum_t, std::weak_ptr<ProtoObject>> ObjectMapping;
    std::map<vnum_t, std::weak_ptr<ProtoMobile>> MobileMapping;

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
    
    pImpl->RoomMapping.insert({ localVnum, room });
}

void Plugin::Add(std::shared_ptr<ProtoObject> obj, vnum_t localVnum)
{
    if(localVnum == INVALID_VNUM)
    {
        localVnum = pImpl->GetNextObjectVnum();
    }
    
    pImpl->ObjectMapping.insert({ localVnum, obj });
}

void Plugin::Add(std::shared_ptr<ProtoMobile> mob, vnum_t localVnum)
{
    if(localVnum == INVALID_VNUM)
    {
        localVnum = pImpl->GetNextMobVnum();
    }
    
    pImpl->MobileMapping.insert({ localVnum, mob });
}

std::list<std::tuple<vnum_t, std::shared_ptr<Room>>> Plugin::Rooms() const
{
    std::list<std::tuple<vnum_t, std::shared_ptr<Room>>> rooms;

    for(const auto & [vnum, room] : pImpl->RoomMapping)
    {
        if(!room.expired())
        {
            rooms.push_back({ vnum, room.lock() });
        }
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
        if(!obj.expired())
        {
            objects.push_back({ vnum, obj.lock() });
        }
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
        if(!mob.expired())
        {
            mobiles.push_back({ vnum, mob.lock() });
        }
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

void LoadPlugins()
{

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

std::shared_ptr<Plugin> FindPlugin(const std::string &id)
{
    auto byId = [id](const auto &p)
                {
                    return StrCmp(p->Id(), id) == 0;
                };
    return Find(Plugins, byId);
}

std::shared_ptr<Plugin> CreatePlugin(const std::string &id)
{
    if(FindPlugin(id) == nullptr)
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
