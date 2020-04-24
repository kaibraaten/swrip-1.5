#ifndef _SWRIP_AREAREPOSITORY_HPP_
#define _SWRIP_AREAREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class AreaRepository : public Ceris::Repository<std::shared_ptr<Area>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Area>&) const = 0;

    // All areas unordered
    std::shared_ptr<Area> FirstArea;
    std::shared_ptr<Area> LastArea;

    // Areas currently being built. Only appears here when the builder/owner is logged in.
    // Unsure if they also show up in the main area list. Must investigate.
    // Update: Seems they don't.
    //
    // Suggested name: AreasInProgress
    std::shared_ptr<Area> FirstBuild;
    std::shared_ptr<Area> LastBuild;

    // Installed areas ordered by room vnum ascending
    std::shared_ptr<Area> FirstASort;
    std::shared_ptr<Area> LastASort;

    // Uninstalled areas ordered by room vnum ascending
    std::shared_ptr<Area> FirstBSort;
    std::shared_ptr<Area> LastBSort;
};

extern std::shared_ptr<AreaRepository> Areas;
std::shared_ptr<AreaRepository> NewAreaRepository();
//std::string GetClanFilename(const std::shared_ptr<Clan>& clan);

#endif
