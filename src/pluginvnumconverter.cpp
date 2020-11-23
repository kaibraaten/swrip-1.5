#include <algorithm>
#include <utility/algorithms.hpp>
#include "pluginvnumconverter.hpp"
#include "area.hpp"
#include "mud.hpp"
#include "plugins.hpp"
#include "room.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "reset.hpp"

struct PluginVnumConverter::Impl
{
    Impl(const Plugin *p)
        : Plugin(p)
    {

    }

    const class Plugin *Plugin = nullptr;
};

PluginVnumConverter::PluginVnumConverter(const Plugin *plugin)
    : pImpl(std::make_unique<Impl>(plugin))
{

}

PluginVnumConverter::~PluginVnumConverter()
{

}

std::list<vnum_t> PluginVnumConverter::RoomVnums() const
{
    std::list<vnum_t> roomlist;
    std::ranges::transform(pImpl->Plugin->Rooms(),
                           std::back_inserter(roomlist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    roomlist.sort();
    return roomlist;
}

std::list<vnum_t> PluginVnumConverter::ObjectVnums() const
{
    std::list<vnum_t> objlist;
    std::ranges::transform(pImpl->Plugin->Objects(),
                           std::back_inserter(objlist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    objlist.sort();
    return objlist;
}

std::list<vnum_t> PluginVnumConverter::MobileVnums() const
{
    std::list<vnum_t> moblist;
    std::ranges::transform(pImpl->Plugin->Mobiles(),
                           std::back_inserter(moblist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    moblist.sort();
    return moblist;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    for(const auto & [relative, room] : pImpl->Plugin->Rooms())
    {
        if(room->Vnum == absolute)
        {
            return relative;
        }
    }

    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    for(const auto & [relative, obj] : pImpl->Plugin->Objects())
    {
        if(obj->Vnum == absolute)
        {
            return relative;
        }
    }
    
    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    for(const auto & [relative, mob] : pImpl->Plugin->Mobiles())
    {
        if(mob->Vnum == absolute)
        {
            return relative;
        }
    }
    
    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

vnum_t PluginVnumConverter::RelativeToAbsoluteRoomVnum(vnum_t vnum) const
{
    for(const auto & [relative, room] : pImpl->Plugin->Rooms())
    {
        if(relative == vnum)
        {
            return room->Vnum;
        }
    }
    
    return vnum;
}

vnum_t PluginVnumConverter::RelativeToAbsoluteObjectVnum(vnum_t vnum) const
{
    for(const auto & [relative, obj] : pImpl->Plugin->Objects())
    {
        if(relative == vnum)
        {
            return obj->Vnum;
        }
    }

    return vnum;
}

vnum_t PluginVnumConverter::RelativeToAbsoluteMobileVnum(vnum_t vnum) const
{
    for(const auto & [relative, mob] : pImpl->Plugin->Mobiles())
    {
        if(relative == vnum)
        {
            return mob->Vnum;
        }
    }

    return vnum;
}

bool PluginVnumConverter::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return reset->Plugin == pImpl->Plugin;
}
