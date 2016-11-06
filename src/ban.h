#ifndef _SWRIP_BAN_H_
#define _SWRIP_BAN_H_

#include "types.h"

struct Ban
{
  Ban *Next;
  Ban *Previous;
  char *Site;
  int Level;
  char *BanTime;
};

extern Ban *FirstBan;
extern Ban *LastBan;

void LoadBans( void );
void SaveBans( void );

#endif
