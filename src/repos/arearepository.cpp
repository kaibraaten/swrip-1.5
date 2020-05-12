#include "lua_arearepository.hpp"
#include "legacy_arearepository.hpp"
#include "area.hpp"

std::shared_ptr<AreaRepository> Areas;

struct AreaRepository::Impl
{
    std::list<std::shared_ptr<Area>> AreasInProgress;
};

AreaRepository::AreaRepository()
    : pImpl(std::make_unique<Impl>())
{

}

AreaRepository::~AreaRepository()
{

}

const std::list<std::shared_ptr<Area>> &AreaRepository::AreasInProgress() const noexcept
{
    return pImpl->AreasInProgress;
}

void AreaRepository::OnAdded(std::shared_ptr<Area> &area)
{
    if(area->Flags.test(Flag::Area::Prototype))
    {
        Remove(area);
        pImpl->AreasInProgress.push_back(area);
        pImpl->AreasInProgress.sort([](const auto &a, const auto &b)
                                    {
                                        return a->VnumRanges.Room.First < b->VnumRanges.Room.First;
                                    });
    }
}

void AreaRepository::OnRemoved(std::shared_ptr<Area> &area)
{
    pImpl->AreasInProgress.remove(area);
}

std::shared_ptr<AreaRepository> NewAreaRepository()
{
#ifdef USE_NEW_AREA_FORMAT
    return NewLuaAreaRepository();
#else
    return NewLegacyAreaRepository();
#endif
}
