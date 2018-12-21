#ifndef _SWRIP_BADNAMEREPOSITORY_HPP_
#define _SWRIP_BADNAMEREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

struct CompareBadName
{
  bool operator()(const std::shared_ptr<BadName> &lhs, const std::shared_ptr<BadName> &rhs);
};

using BadNameRepositoryBase = Ceris::Repository<std::shared_ptr<BadName>, CompareBadName>;

class BadNameRepository : public BadNameRepositoryBase
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern std::shared_ptr<BadNameRepository> BadNames;
std::shared_ptr<BadNameRepository> NewBadNameRepository();

#endif
