#ifndef _SWRIP_LOGGER_HPP_
#define _SWRIP_LOGGER_HPP_

#ifndef __GNUC__
#define __attribute__(a)
#endif

#include <string>
#include "constants.hpp"

class Logger
{
public:
    virtual ~Logger() = default;
    virtual void Bug(const char *str, ...) __attribute__((format(printf, 2, 3))) = 0;
    virtual void Boot(const char *str, ...) __attribute__((format(printf, 2, 3))) = 0;
    virtual void LogStringPlus(const std::string &str, LogType log_type, short level) = 0;
    virtual void Info(const char *fmt, ...) __attribute__((format(printf, 2, 3))) = 0;
    virtual void Script(const char *fmt, ...) __attribute__((format(printf, 2, 3))) = 0;
};

#endif
