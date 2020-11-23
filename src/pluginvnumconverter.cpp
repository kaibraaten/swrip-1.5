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
                           [](const auto &t)
                           {
                               return std::get<1>(t)->Vnum;
                           });
    roomlist.sort();
    return roomlist;
}

std::list<vnum_t> PluginVnumConverter::ObjectVnums() const
{
    std::list<vnum_t> objlist;
    std::ranges::transform(pImpl->Plugin->Objects(),
                           std::back_inserter(objlist),
                           [](const auto &t)
                           {
                               return std::get<1>(t)->Vnum;
                           });
    objlist.sort();
    return objlist;
}

std::list<vnum_t> PluginVnumConverter::MobileVnums() const
{
    std::list<vnum_t> moblist;
    std::ranges::transform(pImpl->Plugin->Mobiles(),
                           std::back_inserter(moblist),
                           [](const auto &t)
                           {
                               return std::get<1>(t)->Vnum;
                           });
    moblist.sort();
    return moblist;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    for(const auto &t : pImpl->Plugin->Rooms())
    {
        if(std::get<1>(t)->Vnum == absolute)
        {
            return std::get<0>(t);
        }
    }

    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    for(const auto &t : pImpl->Plugin->Objects())
    {
        if(std::get<1>(t)->Vnum == absolute)
        {
            return std::get<0>(t);
        }
    }
    
    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

vnum_t PluginVnumConverter::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    for(const auto &t : pImpl->Plugin->Mobiles())
    {
        if(std::get<1>(t)->Vnum == absolute)
        {
            return std::get<0>(t);
        }
    }
    
    // Vnum must point to somewhere outside the plugin area,
    // so just pass it through.
    return absolute;
}

bool PluginVnumConverter::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return reset->Plugin == pImpl->Plugin;
}
