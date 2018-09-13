#ifndef _SWRIP_BADNAMEREPOSITORY_HPP_
#define _SWRIP_BADNAMEREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

struct CompareBadName
{
  bool operator()(const BadName *lhs, const BadName *rhs);
};

class BadNameRepository : public Ceris::Repository<BadName*, CompareBadName>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern BadNameRepository *BadNames;
BadNameRepository *NewBadNameRepository();

#endif
