#ifndef _SWRIP_AREA_SAVE_HELPER_BUILTIN_HPP_
#define _SWRIP_AREA_SAVE_HELPER_BUILTIN_HPP_

#include <memory>
#include "areasavehelper.hpp"

class AreaSaveHelperBuiltin : public AreaSaveHelper
{
public:
    AreaSaveHelperBuiltin(std::shared_ptr<Area> area);
    ~AreaSaveHelperBuiltin();
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
