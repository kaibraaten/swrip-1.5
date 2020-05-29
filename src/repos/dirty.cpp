//
// This file is called "dirty" because it know the actual runtime
// type of the various repositories. And it contains the knowledge
// create them.

#include "lua_storeroomrepository.hpp"
#include "lua_arearepository.hpp"
#include "lua_vendorrepository.hpp"

std::shared_ptr<VendorRepository> Vendors;

std::shared_ptr<AreaRepository> NewAreaRepository()
{
    return NewLuaAreaRepository();
}

std::shared_ptr<StoreroomRepository> NewStoreroomRepository()
{
    return NewLuaStoreroomRepository();
}

std::shared_ptr<VendorRepository> NewVendorRepository()
{
    return NewLuaVendorRepository();
}
