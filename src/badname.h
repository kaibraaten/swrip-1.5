#ifndef _SWRIP_BADNAME_H_
#define _SWRIP_BADNAME_H_

#define BAD_NAME_FILE SYSTEM_DIR "badnames.lua"
#define OLD_BAD_NAME_FILE SYSTEM_DIR "badnames.lst"

struct BadName
{
  char *Name;
};

bool IsBadName( const char *name );
int AddBadName( const char *name );

#endif
