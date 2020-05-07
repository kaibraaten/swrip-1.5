#ifndef _SWRIP_LEGACY_AREAREPOSITORY_HPP_
#define _SWRIP_LEGACY_AREAREPOSITORY_HPP_

// This file should only ever be included by
// src/repos/arearepository.cpp

#include <memory>
#include "arearepository.hpp"

std::shared_ptr<AreaRepository> NewLegacyAreaRepository();

#endif
