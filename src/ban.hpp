#ifndef _SWRIP_BAN_HPP_
#define _SWRIP_BAN_HPP_

#include <memory>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class Ban
{
public:
  std::string Site;
  int Level = 0;
  std::string BanTime;
};

class BanRepository : public Ceris::Repository<std::shared_ptr<Ban>>
{
public:
  virtual bool Contains(const std::string&) const = 0;
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern BanRepository *Bans;

BanRepository *NewBanRepository();

#endif
