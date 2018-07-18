#ifndef _SWRIP_BAN_HPP_
#define _SWRIP_BAN_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

struct Ban
{
  std::string Site;
  int Level = 0;
  std::string BanTime;
};

class BanRepository : public Ceris::Repository<Ban*>
{
public:
  bool Contains(const std::string&) const;
  virtual void Load() override;
  virtual void Save() const override;
};

extern BanRepository *BanRepos;

void AddBan(Ban *ban);
void RemoveBan(Ban *ban);
void LoadBans( void );
void SaveBans( void );
BanRepository *NewBanRepository(void);

#endif
