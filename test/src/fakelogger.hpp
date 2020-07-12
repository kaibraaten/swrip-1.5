#ifndef _SWRIP_TEST_FAKELOGGER_HPP_
#define _SWRIP_TEST_FAKELOGGER_HPP_

#include <string>
#include "logger.hpp"

class FakeLogger : public Logger
{
public:
    void Bug(const char *str, ...) override { }
    void Boot(const char *str, ...) override { }
    void LogStringPlus(const std::string &str, LogType log_type, short level) override { }
    void Info( const char *fmt, ... ) override { }
};

#endif
