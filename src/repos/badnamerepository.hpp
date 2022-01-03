#ifndef _SWRIP_BADNAMEREPOSITORY_HPP_
#define _SWRIP_BADNAMEREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class BadNameRepository : public Ceris::Repository<std::string>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
};

inline std::shared_ptr<BadNameRepository> BadNames;
std::shared_ptr<BadNameRepository> NewBadNameRepository();

#endif
