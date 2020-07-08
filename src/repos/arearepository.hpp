#ifndef _SWRIP_AREAREPOSITORY_HPP_
#define _SWRIP_AREAREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

struct CompareArea
{
    bool operator()(const std::shared_ptr<Area> &a, const std::shared_ptr<Area> &b) const;
};

class AreaRepository : public Ceris::Repository<std::shared_ptr<Area>, CompareArea>
{
public:
    AreaRepository();
    virtual ~AreaRepository();
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Area>&) const = 0;
    virtual void Save(const std::shared_ptr<Area>&, bool install) const = 0;
    virtual std::string GetAreaFilename(std::shared_ptr<Area> area) const = 0;
    virtual void Install(std::shared_ptr<Area> area, const std::string &newfilename = "") = 0;
    const std::list<std::shared_ptr<Area>> &AreasInProgress() const noexcept;
    virtual void ChangeFilename(std::shared_ptr<Area> area, const std::string &newfilename) = 0;

    // Find by filename OR full name.
    std::shared_ptr<Area> Find(const std::string &name) const;
    std::shared_ptr<Area> FindProtoArea(const std::string &name) const;
    
protected:
    void OnAdded(const std::shared_ptr<Area> &area) override;
    void OnRemoved(const std::shared_ptr<Area> &area) override;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

extern std::shared_ptr<AreaRepository> Areas;
std::shared_ptr<AreaRepository> NewAreaRepository();

#endif
