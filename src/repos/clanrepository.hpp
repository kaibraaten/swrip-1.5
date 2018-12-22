#ifndef _SWRIP_CLANREPOSITORY_HPP_
#define _SWRIP_CLANREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class ClanRepository : public Ceris::Repository<std::shared_ptr<Clan>>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const std::shared_ptr<Clan>&) const = 0;
};

extern std::shared_ptr<ClanRepository> Clans;
std::shared_ptr<ClanRepository> NewClanRepository();
std::string GetClanFilename(const std::shared_ptr<Clan> &clan);

#endif
