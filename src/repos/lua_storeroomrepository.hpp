#ifndef _SWRIP_LUA_STOREROOMREPOSITORY_HPP_
#define _SWRIP_LUA_STOREROOMREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/dirty.cpp

#include <memory>
#include "storeroomrepository.hpp"

std::shared_ptr<StoreroomRepository> NewLuaStoreroomRepository();

#endif
