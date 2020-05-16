#ifndef _SWRIP_LUA_AREAREPOSITORY_HPP_
#define _SWRIP_LUA_AREAREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/dirty.cpp

#include <memory>
#include "arearepository.hpp"

std::shared_ptr<AreaRepository> NewLuaAreaRepository();

#endif
