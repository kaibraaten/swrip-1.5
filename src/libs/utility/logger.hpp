#ifndef _CERIS_LOGGER_HPP_
#define _CERIS_LOGGER_HPP_

class Logger
{
public:
  virtual ~Logger() = default;
  virtual void Bug(const char *str, ...) = 0;
  virtual void Boot(const char *str, ...) = 0;
  virtual void LogStringPlus( const char *str, short log_type, short level ) = 0;
  virtual void Info( const char *fmt, ... ) = 0;
};

#endif
