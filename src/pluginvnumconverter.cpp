#include <algorithm>
#include <functional>
#include <utility/algorithms.hpp>
#include "pluginvnumconverter.hpp"
#include "area.hpp"
#include "mud.hpp"
#include "plugins.hpp"
#include "room.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "reset.hpp"

class PluginVnumConverter::Impl
{
public:
    Impl(const Plugin *p);

    std::vector<vnum_t> RoomVnums() const;
    std::vector<vnum_t> ObjectVnums() const;
    std::vector<vnum_t> MobileVnums() const;

    vnum_t AbsoluteToRelativeRoomVnum(vnum_t absolute) const;
    vnum_t AbsoluteToRelativeObjectVnum(vnum_t absolute) const;
    vnum_t AbsoluteToRelativeMobileVnum(vnum_t absolute) const;

    vnum_t RelativeToAbsoluteRoomVnum(vnum_t vnum) const;
    vnum_t RelativeToAbsoluteObjectVnum(vnum_t vnum) const;
    vnum_t RelativeToAbsoluteMobileVnum(vnum_t vnum) const;

    bool ShouldPushReset(std::shared_ptr<Reset> reset) const;
    std::shared_ptr<Reset> ResetToAbsolute(std::shared_ptr<Reset> reset) const;
    std::shared_ptr<Reset> ResetToRelative(std::shared_ptr<Reset> reset) const;

private:
    template<typename Func>
    std::shared_ptr<Reset> ConvertReset(std::shared_ptr<Reset> reset,
                                        Func convertMobVnum,
                                        Func convertObjVnum,
                                        Func convertRoomVnum) const;

    const class Plugin *Plugin = nullptr;
};

PluginVnumConverter::PluginVnumConverter(const Plugin *plugin)
    : pImpl(std::make_unique<Impl>(plugin))
{

}

PluginVnumConverter::~PluginVnumConverter()
{

}

std::vector<vnum_t> PluginVnumConverter::RoomVnums() const
{
    return pImpl->RoomVnums();
}

std::vector<vnum_t> PluginVnumConverter::ObjectVnums() const
{
    return pImpl->ObjectVnums();
}

std::vector<vnum_t> PluginVnumConverter::MobileVnums() const
{
    return pImpl->MobileVnums();
}

vnum_t PluginVnumConverter::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    return pImpl->AbsoluteToRelativeRoomVnum(absolute);
}

vnum_t PluginVnumConverter::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    return pImpl->AbsoluteToRelativeObjectVnum(absolute);
}

vnum_t PluginVnumConverter::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    return pImpl->AbsoluteToRelativeMobileVnum(absolute);
}

vnum_t PluginVnumConverter::RelativeToAbsoluteRoomVnum(vnum_t vnum) const
{
    return pImpl->RelativeToAbsoluteRoomVnum(vnum);
}

vnum_t PluginVnumConverter::RelativeToAbsoluteObjectVnum(vnum_t vnum) const
{
    return pImpl->RelativeToAbsoluteObjectVnum(vnum);
}

vnum_t PluginVnumConverter::RelativeToAbsoluteMobileVnum(vnum_t vnum) const
{
    return pImpl->RelativeToAbsoluteMobileVnum(vnum);
}

bool PluginVnumConverter::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return pImpl->ShouldPushReset(reset);
}

std::shared_ptr<Reset> PluginVnumConverter::ResetToAbsolute(std::shared_ptr<Reset> reset) const
{
    return pImpl->ResetToAbsolute(reset);
}

std::shared_ptr<Reset> PluginVnumConverter::ResetToRelative(std::shared_ptr<Reset> reset) const
{
    return pImpl->ResetToRelative(reset);
}

PluginVnumConverter::Impl::Impl(const ::Plugin *p)
    : Plugin(p)
{

}

std::vector<vnum_t> PluginVnumConverter::Impl::RoomVnums() const
{
    std::vector<vnum_t> roomlist;
    std::ranges::transform(Plugin->Rooms(),
                           std::back_inserter(roomlist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    std::ranges::sort(roomlist);
    return roomlist;
}

std::vector<vnum_t> PluginVnumConverter::Impl::ObjectVnums() const
{
    std::vector<vnum_t> objlist;
    std::ranges::transform(Plugin->Objects(),
                           std::back_inserter(objlist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    std::ranges::sort(objlist);
    return objlist;
}

std::vector<vnum_t> PluginVnumConverter::Impl::MobileVnums() const
{
    std::vector<vnum_t> moblist;
    std::ranges::transform(Plugin->Mobiles(),
                           std::back_inserter(moblist),
                           [](const auto &p)
                           {
                               return p.second->Vnum;
                           });
    std::ranges::sort(moblist);
    return moblist;
}

vnum_t PluginVnumConverter::Impl::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    for(const auto & [relative, room] : Plugin->Rooms())
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

vnum_t PluginVnumConverter::Impl::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    for(const auto & [relative, obj] : Plugin->Objects())
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

vnum_t PluginVnumConverter::Impl::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    for(const auto & [relative, mob] : Plugin->Mobiles())
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

vnum_t PluginVnumConverter::Impl::RelativeToAbsoluteRoomVnum(vnum_t vnum) const
{
    for(const auto & [relative, room] : Plugin->Rooms())
    {
        if(relative == vnum)
        {
            return room->Vnum;
        }
    }

    return vnum;
}

vnum_t PluginVnumConverter::Impl::RelativeToAbsoluteObjectVnum(vnum_t vnum) const
{
    for(const auto & [relative, obj] : Plugin->Objects())
    {
        if(relative == vnum)
        {
            return obj->Vnum;
        }
    }

    return vnum;
}

vnum_t PluginVnumConverter::Impl::RelativeToAbsoluteMobileVnum(vnum_t vnum) const
{
    for(const auto & [relative, mob] : Plugin->Mobiles())
    {
        if(relative == vnum)
        {
            return mob->Vnum;
        }
    }

    return vnum;
}

bool PluginVnumConverter::Impl::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return reset->Plugin == this->Plugin;
}

std::shared_ptr<Reset> PluginVnumConverter::Impl::ResetToAbsolute(std::shared_ptr<Reset> reset) const
{
    return ConvertReset(reset,
                        std::mem_fn(&Impl::RelativeToAbsoluteMobileVnum),
                        std::mem_fn(&Impl::RelativeToAbsoluteObjectVnum),
                        std::mem_fn(&Impl::RelativeToAbsoluteRoomVnum));
}

std::shared_ptr<Reset> PluginVnumConverter::Impl::ResetToRelative(std::shared_ptr<Reset> reset) const
{
    return ConvertReset(reset,
                        std::mem_fn(&Impl::AbsoluteToRelativeMobileVnum),
                        std::mem_fn(&Impl::AbsoluteToRelativeObjectVnum),
                        std::mem_fn(&Impl::AbsoluteToRelativeRoomVnum));
}

template<typename Func>
std::shared_ptr<Reset> PluginVnumConverter::Impl::ConvertReset(std::shared_ptr<Reset> reset,
                                                               Func convertMobVnum,
                                                               Func convertObjVnum,
                                                               Func convertRoomVnum) const
{
    std::shared_ptr<Reset> convertedReset = std::make_shared<Reset>(*reset);

    switch(toupper(reset->Command))
    {
    case 'M':
        convertedReset->Arg1 = convertMobVnum(*this, reset->Arg1);
        convertedReset->Arg3 = convertRoomVnum(*this, reset->Arg3);
        break;

    case 'O':
        convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
        convertedReset->Arg3 = convertRoomVnum(*this, reset->Arg3);
        break;

    case 'P':
        convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
        convertedReset->Arg3 = convertObjVnum(*this, reset->Arg3);
        break;

    case 'E':
        convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
        break;

    case 'D':
        convertedReset->Arg1 = convertRoomVnum(*this, reset->Arg1);
        break;

    case 'T':
        if(IsBitSet(reset->MiscData, TRAP_OBJ))
        {
            convertedReset->Arg3 = convertObjVnum(*this, reset->Arg3);
        }
        else
        {
            convertedReset->Arg3 = convertRoomVnum(*this, reset->Arg3);
        }

        break;

    case 'G':
        convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
        break;

    case 'R':
        convertedReset->Arg1 = convertRoomVnum(*this, reset->Arg1);
        break;

    case 'H':
        convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
        break;

    case 'B':
        switch(reset->Arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
            convertedReset->Arg1 = convertRoomVnum(*this, reset->Arg1);
            break;

        case BIT_RESET_ROOM:
            convertedReset->Arg1 = convertRoomVnum(*this, reset->Arg1);
            break;

        case BIT_RESET_MOBILE:
            convertedReset->Arg1 = convertMobVnum(*this, reset->Arg1);
            break;

        case BIT_RESET_OBJECT:
            convertedReset->Arg1 = convertObjVnum(*this, reset->Arg1);
            break;

        default:
            break;
        }

        break;

    case '*':
    default:
        break;
    }

    return convertedReset;
}
