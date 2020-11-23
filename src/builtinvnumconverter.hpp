#ifndef _SWRIP_BUILTIN_VNUM_CONVERTER_HPP_
#define _SWRIP_BUILTIN_VNUM_CONVERTER_HPP_

#include <memory>
#include "vnumconverter.hpp"

class BuiltinVnumConverter : public VnumConverter
{
public:
    BuiltinVnumConverter(std::shared_ptr<Area> area);
    ~BuiltinVnumConverter();
    std::list<vnum_t> RoomVnums() const override;
    std::list<vnum_t> ObjectVnums() const override;
    std::list<vnum_t> MobileVnums() const override;

    vnum_t AbsoluteToRelativeRoomVnum(vnum_t absolute) const override;
    vnum_t AbsoluteToRelativeObjectVnum(vnum_t absolute) const override;
    vnum_t AbsoluteToRelativeMobileVnum(vnum_t absolute) const override;

    bool ShouldPushReset(std::shared_ptr<Reset> reset) const override;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
