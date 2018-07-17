#ifndef _SWRIP_BAN_HPP_
#define _SWRIP_BAN_HPP_

#include <utility/oldrepository.hpp>
#include "types.hpp"

struct Ban
{
  char *Site;
  int Level;
  char *BanTime;
};

extern OldRepository *BanRepository;

void AddBan(Ban *ban);
void RemoveBan(Ban *ban);
void LoadBans( void );
void SaveBans( void );
OldRepository *NewBanRepository(void);

#endif
