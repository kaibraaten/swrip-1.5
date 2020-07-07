#ifndef _SWRIP_LUA_MACROREPOSITORY_HPP_
#define _SWRIP_LUA_MACROREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/dirty.cpp

#include <memory>
#include "macrorepository.hpp"

std::shared_ptr<MacroRepository> NewLuaMacroRepository();

#endif
