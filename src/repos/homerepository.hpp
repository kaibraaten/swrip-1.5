#ifndef _SWRIP_HOMEREPOSITORY_HPP_
#define _SWRIP_HOMEREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include <string>
#include "types.hpp"

class HomeRepository : public Ceris::Repository<std::shared_ptr<Room>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;

    virtual void Load(std::shared_ptr<Room> room) = 0;
    virtual void Save(std::shared_ptr<Room> room) const = 0;
};

extern std::shared_ptr<HomeRepository> Homes;

std::shared_ptr<HomeRepository> NewHomeRepository();

#endif
