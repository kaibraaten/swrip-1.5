#include "builtinvnumconverter.hpp"
#include "area.hpp"
#include "mud.hpp"

struct BuiltinVnumConverter::Impl
{
    Impl(std::shared_ptr<Area> a)
        : area(a)
    {

    }

    std::shared_ptr<Area> area;
};

BuiltinVnumConverter::BuiltinVnumConverter(std::shared_ptr<Area> area)
    : pImpl(std::make_unique<Impl>(area))
{

}

BuiltinVnumConverter::~BuiltinVnumConverter()
{

}

std::vector<vnum_t> BuiltinVnumConverter::RoomVnums() const
{
    std::vector<vnum_t> roomlist;
    const auto firstVnum = pImpl->area->VnumRanges.Room.First;
    const auto lastVnum = pImpl->area->VnumRanges.Room.Last;
    
    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(vnum != INVALID_VNUM && GetRoom(vnum))
        {
            roomlist.push_back(vnum);
        }
    }

    return roomlist;
}

std::vector<vnum_t> BuiltinVnumConverter::ObjectVnums() const
{
    std::vector<vnum_t> objlist;
    const auto firstVnum = pImpl->area->VnumRanges.Object.First;
    const auto lastVnum = pImpl->area->VnumRanges.Object.Last;

    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(vnum != INVALID_VNUM && GetProtoObject(vnum))
        {
            objlist.push_back(vnum);
        }
    }

    return objlist;
}

std::vector<vnum_t> BuiltinVnumConverter::MobileVnums() const
{
    std::vector<vnum_t> moblist;
    const auto firstVnum = pImpl->area->VnumRanges.Mob.First;
    const auto lastVnum = pImpl->area->VnumRanges.Mob.Last;

    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(vnum != INVALID_VNUM && GetProtoMobile(vnum))
        {
            moblist.push_back(vnum);
        }
    }

    return moblist;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t BuiltinVnumConverter::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    return absolute;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t BuiltinVnumConverter::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    return absolute;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t BuiltinVnumConverter::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    return absolute;
}

vnum_t BuiltinVnumConverter::RelativeToAbsoluteRoomVnum(vnum_t relative) const
{
    return relative;
}

vnum_t BuiltinVnumConverter::RelativeToAbsoluteObjectVnum(vnum_t relative) const
{
    return relative;
}

vnum_t BuiltinVnumConverter::RelativeToAbsoluteMobileVnum(vnum_t relative) const
{
    return relative;
}

bool BuiltinVnumConverter::ShouldPushReset(std::shared_ptr<Reset> reset) const
{
    return true;
}

std::shared_ptr<Reset> BuiltinVnumConverter::ResetToAbsolute(std::shared_ptr<Reset> reset) const
{
    return reset;
}

std::shared_ptr<Reset> BuiltinVnumConverter::ResetToRelative(std::shared_ptr<Reset> reset) const
{
    return reset;
}
