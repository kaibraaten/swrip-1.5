#ifndef _SWRIP_AREA_SAVE_HELPER_HPP_
#define _SWRIP_AREA_SAVE_HELPER_HPP_

#include <list>
#include "types.hpp"

class AreaSaveHelper
{
public:
    virtual ~AreaSaveHelper() = default;

    // Room vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::list<vnum_t> RoomVnums() const = 0;

    // ProtoObject vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::list<vnum_t> ObjectVnums() const = 0;

    // ProtoMobile vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::list<vnum_t> MobileVnums() const = 0;

    virtual vnum_t AbsoluteToRelativeRoomVnum(vnum_t absolute) const = 0;
    virtual vnum_t AbsoluteToRelativeObjectVnum(vnum_t absolute) const = 0;
    virtual vnum_t AbsoluteToRelativeMobileVnum(vnum_t absolute) const = 0;
    
    static std::shared_ptr<AreaSaveHelper> Create(std::shared_ptr<Area> area);
};

#endif
