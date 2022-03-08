#ifndef _SWRIP_PLUGINS_HPP_
#define _SWRIP_PLUGINS_HPP_

#include <memory>
#include <string>
#include <list>
#include <utility>
#include "types.hpp"

class Plugin
{
public:
    Plugin(const std::string &id);
    ~Plugin();
    std::string Id() const;
    std::string Name() const;
    void Name(const std::string &name);
    std::string Description() const;
    void Description(const std::string &description);

    void Add(std::shared_ptr<Room> room, vnum_t = INVALID_VNUM);
    void Add(std::shared_ptr<ProtoObject> obj, vnum_t = INVALID_VNUM);
    void Add(std::shared_ptr<ProtoMobile> mob, vnum_t = INVALID_VNUM);
    
    std::list<std::pair<vnum_t, std::shared_ptr<Room>>> Rooms() const;
    std::list<std::pair<vnum_t, std::shared_ptr<ProtoObject>>> Objects() const;
    std::list<std::pair<vnum_t, std::shared_ptr<ProtoMobile>>> Mobiles() const;

    std::shared_ptr<Area> ExportArea() const;
    void RoomsToWorld();
    void ObjectsToWorld();
    void MobilesToWorld();
    void ResetsToWorld(std::shared_ptr<Reset> resetList);
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

inline std::list<std::shared_ptr<Plugin>> Plugins;

void LoadPlugins();
void SavePlugin(std::shared_ptr<Plugin> plugin);
std::shared_ptr<Plugin> GetPlugin(const std::string &id);
std::shared_ptr<Plugin> CreatePlugin(const std::string &id);
std::string GetPluginPath(const Plugin *plugin);
std::shared_ptr<Area> FindPluginZone();

#endif
