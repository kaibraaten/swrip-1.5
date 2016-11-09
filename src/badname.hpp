#ifndef _SWRIP_BADNAME_H_
#define _SWRIP_BADNAME_H_

#include "constants.hpp"
#include "types.hpp"
#define BADNAME_FILE DATA_DIR "badnames.lua"

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
