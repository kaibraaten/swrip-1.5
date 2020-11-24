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

std::shared_ptr<Reset> PluginVnumConverter::ResetToAbsolute(std::shared_ptr<Reset> reset) const
{
    switch(reset->Command)
    {
    case 'm':
    case 'M':
        reset->Arg1 = RelativeToAbsoluteMobileVnum(reset->Arg1);
        reset->Arg3 = RelativeToAbsoluteRoomVnum(reset->Arg3);
        break;

    case 'o':
    case 'O':
        reset->Arg1 = RelativeToAbsoluteObjectVnum(reset->Arg1);
        reset->Arg3 = RelativeToAbsoluteRoomVnum(reset->Arg3);
        break;

    case 'p':
    case 'P':
        reset->Arg1 = RelativeToAbsoluteObjectVnum(reset->Arg1);
        reset->Arg3 = RelativeToAbsoluteObjectVnum(reset->Arg3);
        break;

    case 'e':
    case 'E':
        reset->Arg1 = RelativeToAbsoluteObjectVnum(reset->Arg1);
        break;

    case 'd':
    case 'D':
        reset->Arg1 = RelativeToAbsoluteRoomVnum(reset->Arg1);
        break;

    case 't':
    case 'T':
        if(IsBitSet(reset->MiscData, TRAP_OBJ))
        {
            reset->Arg3 = RelativeToAbsoluteObjectVnum(reset->Arg3);
        }
        else
        {
            reset->Arg3 = RelativeToAbsoluteRoomVnum(reset->Arg3);
        }
        break;

    case 'g':
    case 'G':
        reset->Arg1 = RelativeToAbsoluteObjectVnum(reset->Arg1);
        break;

    case 'r':
    case 'R':
        reset->Arg1 = AbsoluteToRelativeRoomVnum(reset->Arg1);
        break;

    case 'h':
    case 'H':
        reset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        break;

    case 'b':
    case 'B':
        switch(reset->Arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
            reset->Arg1 = RelativeToAbsoluteRoomVnum(reset->Arg1);
            break;

        case BIT_RESET_ROOM:
            reset->Arg1 = RelativeToAbsoluteRoomVnum(reset->Arg1);
            break;

        case BIT_RESET_MOBILE:
            reset->Arg1 = RelativeToAbsoluteMobileVnum(reset->Arg1);
            break;

        case BIT_RESET_OBJECT:
            reset->Arg1 = RelativeToAbsoluteObjectVnum(reset->Arg1);
            break;

        default:
            break;
        }

        break;

    case '*':
    default:
        break;
    }

    return reset;
}

std::shared_ptr<Reset> PluginVnumConverter::ResetToRelative(std::shared_ptr<Reset> reset) const
{
    std::shared_ptr<Reset> relativeReset = std::make_shared<Reset>(*reset);

    switch(reset->Command)
    {
    case 'm':
    case 'M':
        relativeReset->Arg1 = AbsoluteToRelativeMobileVnum(reset->Arg1);
        relativeReset->Arg3 = AbsoluteToRelativeRoomVnum(reset->Arg3);
        break;

    case 'o':
    case 'O':
        relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        relativeReset->Arg3 = AbsoluteToRelativeRoomVnum(reset->Arg3);
        break;

    case 'p':
    case 'P':
        relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        relativeReset->Arg3 = AbsoluteToRelativeObjectVnum(reset->Arg3);
        break;

    case 'e':
    case 'E':
        relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        break;

    case 'd':
    case 'D':
        relativeReset->Arg1 = AbsoluteToRelativeRoomVnum(reset->Arg1);
        break;

    case 't':
    case 'T':
        if(IsBitSet(reset->MiscData, TRAP_OBJ))
        {
            relativeReset->Arg3 = AbsoluteToRelativeObjectVnum(reset->Arg3);
        }
        else
        {
            relativeReset->Arg3 = AbsoluteToRelativeRoomVnum(reset->Arg3);
        }

        break;

    case 'g':
    case 'G':
        relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        break;

    case 'r':
    case 'R':
        relativeReset->Arg1 = AbsoluteToRelativeRoomVnum(reset->Arg1);
        break;

    case 'h':
    case 'H':
        relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
        break;

    case 'b':
    case 'B':
        switch(reset->Arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
            relativeReset->Arg1 = AbsoluteToRelativeRoomVnum(reset->Arg1);
            break;

        case BIT_RESET_ROOM:
            relativeReset->Arg1 = AbsoluteToRelativeRoomVnum(reset->Arg1);
            break;

        case BIT_RESET_MOBILE:
            relativeReset->Arg1 = AbsoluteToRelativeMobileVnum(reset->Arg1);
            break;

        case BIT_RESET_OBJECT:
            relativeReset->Arg1 = AbsoluteToRelativeObjectVnum(reset->Arg1);
            break;

        default:
            break;
        }

        break;

    case '*':
    default:
        break;
    }

    return relativeReset;
}
