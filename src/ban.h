#ifndef _SWRIP_BAN_H_
#define _SWRIP_BAN_H_

#include <utility/repository.h>
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
