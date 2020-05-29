#ifndef _SWRIP_LUA_VENDORREPOSITORY_HPP_
#define _SWRIP_LUA_VENDORREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/dirty.cpp

#include <memory>
#include "vendorrepository.hpp"

std::shared_ptr<VendorRepository> NewLuaVendorRepository();

#endif
