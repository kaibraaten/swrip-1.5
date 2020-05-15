#include <utility/algorithms.hpp>
#include "lua_arearepository.hpp"
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

        if(!Contains(pImpl->AreasInProgress, area))
        {
            pImpl->AreasInProgress.push_back(area);
            pImpl->AreasInProgress.sort(CompareArea());
        }
    }
}

void AreaRepository::OnRemoved(std::shared_ptr<Area> &area)
{
    pImpl->AreasInProgress.remove(area);
}

std::shared_ptr<Area> AreaRepository::Find(const std::string &name) const
{
    return ::Find(Entities(),
                  [name](const auto &area)
                  {
                      return StrCmp(area->Filename, name) == 0
                          || StrCmp(area->Name, name) == 0;
                  });
}

std::shared_ptr<Area> AreaRepository::FindProtoArea(const std::string &name) const
{
    return ::Find(AreasInProgress(),
                  [name](const auto &area)
                  {
                      return StrCmp(area->Filename, name) == 0
                          || StrCmp(area->Name, name) == 0;
                  });
}

////////////////////////////////////////////////////////////////////////////////

std::shared_ptr<AreaRepository> NewAreaRepository()
{
    return NewLuaAreaRepository();
}

bool CompareArea::operator()(const std::shared_ptr<Area> &a, const std::shared_ptr<Area> &b) const
{
    return a->VnumRanges.Room.First < b->VnumRanges.Room.First;
}
