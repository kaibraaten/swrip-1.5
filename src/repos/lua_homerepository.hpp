#ifndef _SWRIP_LUA_HOMEREPOSITORY_HPP_
#define _SWRIP_LUA_HOMEREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/dirty.cpp

#include <memory>
#include "homerepository.hpp"

std::shared_ptr<HomeRepository> NewLuaHomeRepository();

#endif
