#ifndef _SWRIP_BADNAME_HPP_
#define _SWRIP_BADNAME_HPP_

#include <utility/oldrepository.hpp>
#include "constants.hpp"
#include "types.hpp"

#define BADNAME_FILE DATA_DIR "badnames.lua"

struct BadName
{
  char *Name;
};

extern OldRepository *BadNameRepository;

bool IsBadName( const char *name );
void AddBadName( const char *name );
void RemoveBadName( const char *name );
void SaveBadNames( void );
void LoadBadNames( void );
OldRepository *NewBadNameRepository(void);

#endif
