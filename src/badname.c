#include "mud.h"
#include "badname.h"

BadName *FirstBadName = NULL;
BadName *LastBadName = NULL;

struct UserData
{
  const char *NameToCheck;
  bool IsBad;
};

static bool CheckIfNameIsBad( const BadName *bad, struct UserData *userData )
{
  if( !StrCmp( bad->Name, userData->NameToCheck ) )
    {
      userData->IsBad = true;
      return false;
    }

  return true;
}

bool IsBadName( const char *name )
{
  struct UserData userData = { name, false };

  ForEach( BadName, FirstBadName, Next, CheckIfNameIsBad, &userData );

  return userData.IsBad;
}

void AddBadName(const char *name)
{
  if( IsBadName( name ) )
    {
      return;
    }
}
