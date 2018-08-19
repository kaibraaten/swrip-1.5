#ifndef _SWRIP_BADNAME_HPP_
#define _SWRIP_BADNAME_HPP_

#include <string>
#include <utility/utility.hpp>
#include <utility/repository.hpp>
#include "constants.hpp"
#include "types.hpp"

#define BADNAME_FILE DATA_DIR "badnames.lua"

class BadNameRepository;

class BadName
{
public:
  std::string Name;
};

extern BadNameRepository *BadNames;

bool IsBadName( const std::string &name );
void AddBadName( const std::string &name );
void RemoveBadName( const std::string &name );
BadNameRepository *NewBadNameRepository();

struct CompareBadName
{
  bool operator()(const BadName *lhs, const BadName *rhs)
  {
    return StrCmp(lhs->Name, rhs->Name) < 0;
  }
};

class BadNameRepository : public Ceris::Repository<BadName*, CompareBadName>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

#endif
