#ifndef _SWRIP_AREAREPOSITORY_HPP_
#define _SWRIP_AREAREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

#define USE_NEW_AREA_FORMAT

class AreaRepository : public Ceris::Repository<std::shared_ptr<Area>>
{
public:
    AreaRepository();
    virtual ~AreaRepository();
    virtual void Load() = 0;
    virtual void Load(std::shared_ptr<Area> area) = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Area>&) const = 0;
    virtual void Save(const std::shared_ptr<Area>&, bool install) const = 0;
    virtual std::string GetAreaFilename(std::shared_ptr<Area> area) const = 0;
    const std::list<std::shared_ptr<Area>> &AreasInProgress() const noexcept;

protected:
    void OnAdded(std::shared_ptr<Area> &area) override;
    void OnRemoved(std::shared_ptr<Area> &area) override;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

extern std::shared_ptr<AreaRepository> Areas;
std::shared_ptr<AreaRepository> NewAreaRepository();

#endif
