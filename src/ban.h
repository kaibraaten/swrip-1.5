#ifndef _SWRIP_BAN_HPP_
#define _SWRIP_BAN_HPP_

#include <utility/repository.hpp>
#include "types.h"

struct Ban
{
  char *Site;
  int Level;
  char *BanTime;
};

extern Repository *BanRepository;

void AddBan(Ban *ban);
void RemoveBan(Ban *ban);
void LoadBans( void );
void SaveBans( void );
Repository *NewBanRepository(void);

#endif
