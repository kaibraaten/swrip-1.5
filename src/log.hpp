#ifndef _SWRIP_LOG_HPP_
#define _SWRIP_LOG_HPP_

#include "logger.hpp"

inline std::shared_ptr<Logger> Log;

std::shared_ptr<Logger> NewLogger();

#endif
