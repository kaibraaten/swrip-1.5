#ifndef _SWRIP_BADNAME_HPP_
#define _SWRIP_BADNAME_HPP_

#include <utility/repository.hpp>
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
