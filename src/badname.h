#ifndef _SWRIP_BADNAME_H_
#define _SWRIP_BADNAME_H_

#include <utility/repository.h>
#include "constants.h"
#include "types.h"
#define BADNAME_FILE DATA_DIR "badnames.lua"

struct BadName
{
  char *Name;
};

extern Repository *BadNameRepository;

bool IsBadName( const char *name );
void AddBadName( const char *name );
void RemoveBadName( const char *name );
void SaveBadNames( void );
void LoadBadNames( void );
Repository *NewBadNameRepository(void);

#endif
