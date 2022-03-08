#ifndef _SWRIP_STOREROOMREPOSITORY_HPP_
#define _SWRIP_STOREROOMREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class Room;

class StoreroomRepository : public Ceris::Repository<std::shared_ptr<Room>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Room> &storeroom) const = 0;
};

inline std::shared_ptr<StoreroomRepository> Storerooms;
std::shared_ptr<StoreroomRepository> NewStoreroomRepository();

#endif
