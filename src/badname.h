#ifndef _SWRIP_BADNAME_H_
#define _SWRIP_BADNAME_H_

#define BADNAME_FILE SYSTEM_DIR "badnames.lua"

#include "types.h"

extern BadName *FirstBadName;
extern BadName *LastBadName;

struct BadName
{
  BadName *Next;
  BadName *Previous;
  char *Name;
};

bool IsBadName( const char *name );
void AddBadName( const char *name );
void RemoveBadName( const char *name );
void SaveBadNames( void );
void LoadBadNames( void );

#endif
