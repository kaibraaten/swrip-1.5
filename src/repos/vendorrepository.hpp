#ifndef _SWRIP_VENDORREPOSITORY_HPP_
#define _SWRIP_VENDORREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include <string>
#include "types.hpp"

class VendorRepository : public Ceris::Repository<std::shared_ptr<Character>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(std::shared_ptr<Character> vendor) const = 0;
    virtual void RemoveVendor(std::shared_ptr<Character> pc) const = 0;
    virtual bool HasVendor(std::shared_ptr<Character> pc) const = 0;
};

extern std::shared_ptr<VendorRepository> Vendors;

std::shared_ptr<VendorRepository> NewVendorRepository();

#endif
