#ifndef _SWRIP_CLANREPOSITORY_HPP_
#define _SWRIP_CLANREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class ClanRepository : public Ceris::Repository<Clan*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Clan*) const = 0;
};

extern ClanRepository *Clans;
ClanRepository *NewClanRepository();
std::string GetClanFilename( const Clan *clan );

#endif
