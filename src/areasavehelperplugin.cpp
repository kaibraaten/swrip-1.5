#include <algorithm>
#include <utility/algorithms.hpp>
#include "areasavehelperplugin.hpp"
#include "area.hpp"
#include "mud.hpp"
#include "plugins.hpp"
#include "room.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "reset.hpp"

struct AreaSaveHelperPlugin::Impl
{
    Impl(const Plugin *p)
        : Plugin(p)
    {

    }

    const class Plugin *Plugin = nullptr;
};

AreaSaveHelperPlugin::AreaSaveHelperPlugin(const Plugin *plugin)
    : pImpl(std::make_unique<Impl>(plugin))
{

}

AreaSaveHelperPlugin::~AreaSaveHelperPlugin()
{

}

std::list<vnum_t> AreaSaveHelperPlugin::RoomVnums() const
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

std::list<vnum_t> AreaSaveHelperPlugin::ObjectVnums() const
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

std::list<vnum_t> AreaSaveHelperPlugin::MobileVnums() const
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

vnum_t AreaSaveHelperPlugin::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
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

vnum_t AreaSaveHelperPlugin::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
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

vnum_t AreaSaveHelperPlugin::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
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

bool AreaSaveHelperPlugin::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return reset->Plugin == pImpl->Plugin;
}
