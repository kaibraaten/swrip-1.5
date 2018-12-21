#ifndef _SWRIP_BANREPOSITORY_HPP_
#define _SWRIP_BANREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include <string>
#include "types.hpp"

using BanRepositoryBase = Ceris::Repository<std::shared_ptr<Ban>>;
  
class BanRepository : public BanRepositoryBase
{
public:
  virtual bool Contains(const std::string&) const = 0;
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern std::shared_ptr<BanRepository> Bans;

std::shared_ptr<BanRepository> NewBanRepository();

#endif
