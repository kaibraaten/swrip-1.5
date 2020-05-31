#ifndef _SWRIP_HOMEREPOSITORY_HPP_
#define _SWRIP_HOMEREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include <string>
#include "types.hpp"

class HomeRepository : public Ceris::Repository<std::shared_ptr<Home>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;

    virtual void Load(std::shared_ptr<Home> home) = 0;
    virtual void Save(std::shared_ptr<Home> home) const = 0;

    virtual void Delete(std::shared_ptr<Home> home) = 0;
    
    virtual std::shared_ptr<Home> FindByVnum(vnum_t) const = 0;
    virtual std::list<std::shared_ptr<Home>> FindHomesForResident(const std::string &name) const = 0;
    virtual bool IsResidentOf(const std::string &name, vnum_t room) const = 0;
};

extern std::shared_ptr<HomeRepository> Homes;

std::shared_ptr<HomeRepository> NewHomeRepository();

#endif
