#include "lua_arearepository.hpp"
#include "legacy_arearepository.hpp"

std::shared_ptr<AreaRepository> Areas;

std::shared_ptr<AreaRepository> NewAreaRepository()
{
#ifdef USE_NEW_AREA_FORMAT
    return NewLuaAreaRepository();
#else
    return NewLegacyAreaRepository();
#endif
}
