#include "areasavehelperbuiltin.hpp"
#include "area.hpp"
#include "mud.hpp"

struct AreaSaveHelperBuiltin::Impl
{
    Impl(std::shared_ptr<Area> a)
        : area(a)
    {

    }

    std::shared_ptr<class Area> area;
};

AreaSaveHelperBuiltin::AreaSaveHelperBuiltin(std::shared_ptr<Area> area)
    : pImpl(std::make_unique<Impl>(area))
{

}

AreaSaveHelperBuiltin::~AreaSaveHelperBuiltin()
{

}

std::list<vnum_t> AreaSaveHelperBuiltin::RoomVnums() const
{
    std::list<vnum_t> roomlist;
    const auto firstVnum = pImpl->area->VnumRanges.Room.First;
    const auto lastVnum = pImpl->area->VnumRanges.Room.Last;
    
    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(GetRoom(vnum))
        {
            roomlist.push_back(vnum);
        }
    }

    return roomlist;
}

std::list<vnum_t> AreaSaveHelperBuiltin::ObjectVnums() const
{
    std::list<vnum_t> objlist;
    const auto firstVnum = pImpl->area->VnumRanges.Object.First;
    const auto lastVnum = pImpl->area->VnumRanges.Object.Last;

    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(GetProtoObject(vnum))
        {
            objlist.push_back(vnum);
        }
    }

    return objlist;
}

std::list<vnum_t> AreaSaveHelperBuiltin::MobileVnums() const
{
    std::list<vnum_t> moblist;
    const auto firstVnum = pImpl->area->VnumRanges.Mob.First;
    const auto lastVnum = pImpl->area->VnumRanges.Mob.Last;

    for(vnum_t vnum = firstVnum; vnum <= lastVnum; vnum++)
    {
        if(GetProtoMobile(vnum))
        {
            moblist.push_back(vnum);
        }
    }

    return moblist;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t AreaSaveHelperBuiltin::AbsoluteToRelativeRoomVnum(vnum_t absolute) const
{
    return absolute;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t AreaSaveHelperBuiltin::AbsoluteToRelativeObjectVnum(vnum_t absolute) const
{
    return absolute;
}

// For builtin areas the absolute and relative vnums are the same.
vnum_t AreaSaveHelperBuiltin::AbsoluteToRelativeMobileVnum(vnum_t absolute) const
{
    return absolute;
}
