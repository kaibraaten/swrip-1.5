#ifndef _SWRIP_SHUTTLEREPOSITORY_HPP_
#define _SWRIP_SHUTTLEREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class Shuttle;

class ShuttleRepository : public Ceris::Repository<std::shared_ptr<Shuttle>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Shuttle> &shuttle) const = 0;
    virtual std::shared_ptr<Shuttle> FindByName(const std::string &name) const = 0;
    virtual void DeleteFromStorage(std::shared_ptr<Shuttle> shuttle) = 0;
};

inline std::shared_ptr<ShuttleRepository> Shuttles;
std::shared_ptr<ShuttleRepository> NewShuttleRepository();
std::string GetShuttleFilename(std::shared_ptr<Shuttle> shuttle);

#endif
