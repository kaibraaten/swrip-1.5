#ifndef _SWRIP_VNUM_CONVERTER_HPP_
#define _SWRIP_VNUM_CONVERTER_HPP_

#include <vector>
#include <memory>
#include "types.hpp"

class Reset;
class Area;
class Plugin;

class VnumConverter
{
public:
    virtual ~VnumConverter() = default;

    // Room vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::vector<vnum_t> RoomVnums() const = 0;

    // ProtoObject vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::vector<vnum_t> ObjectVnums() const = 0;

    // ProtoMobile vnums of area in ascending order.
    // Only return actual valid vnums, and not the
    // entire range for the area.
    virtual std::vector<vnum_t> MobileVnums() const = 0;

    virtual vnum_t AbsoluteToRelativeRoomVnum(vnum_t absolute) const = 0;
    virtual vnum_t AbsoluteToRelativeObjectVnum(vnum_t absolute) const = 0;
    virtual vnum_t AbsoluteToRelativeMobileVnum(vnum_t absolute) const = 0;
    
    virtual vnum_t RelativeToAbsoluteRoomVnum(vnum_t absolute) const = 0;
    virtual vnum_t RelativeToAbsoluteObjectVnum(vnum_t absolute) const = 0;
    virtual vnum_t RelativeToAbsoluteMobileVnum(vnum_t absolute) const = 0;
    
    virtual bool ShouldPushReset(std::shared_ptr<Reset> reset) const = 0;
    virtual std::shared_ptr<Reset> ResetToAbsolute(std::shared_ptr<Reset> reset) const = 0;
    virtual std::shared_ptr<Reset> ResetToRelative(std::shared_ptr<Reset> reset) const = 0;
    
    static std::shared_ptr<VnumConverter> Create(std::shared_ptr<Area> area);
    static std::shared_ptr<VnumConverter> Create(const Plugin *plugin);
};

#endif
