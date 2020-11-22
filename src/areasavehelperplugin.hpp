#ifndef _SWRIP_AREA_SAVE_HELPER_PLUGIN_HPP_
#define _SWRIP_AREA_SAVE_HELPER_PLUGIN_HPP_

#include <memory>
#include "areasavehelper.hpp"

class AreaSaveHelperPlugin : public AreaSaveHelper
{
public:
    AreaSaveHelperPlugin(const Plugin *plugin);
    ~AreaSaveHelperPlugin();
    std::list<vnum_t> RoomVnums() const;
    std::list<vnum_t> ObjectVnums() const;
    std::list<vnum_t> MobileVnums() const;
    vnum_t AbsoluteToRelativeRoomVnum(vnum_t absolute) const;
    vnum_t AbsoluteToRelativeObjectVnum(vnum_t absolute) const;
    vnum_t AbsoluteToRelativeMobileVnum(vnum_t absolute) const;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
