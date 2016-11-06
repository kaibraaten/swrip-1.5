#include "mud.h"
#include "badname.h"
#include "script.h"

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
  BadName *badName = NULL;
  
  if( IsBadName( name ) )
    {
      return;
    }

  AllocateMemory( badName, BadName, 1 );
  badName->Name = CopyString( name );
  LINK( badName, FirstBadName, LastBadName, Next, Previous );
}

static void PushBadName( lua_State *L, const BadName *badName )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", badName->Name );
  
  lua_settable( L, -3 );
}

static void PushBadNames( lua_State *L, const void *ud )
{
  const BadName *badName = NULL;
  lua_newtable( L );

  for( badName = FirstBadName; badName; badName = badName->Next )
    {
      PushBadName( L, badName );
    }
  
  lua_setglobal( L, "badnames" );
}

void SaveBadNames( void )
{
  LuaSaveDataFile( BADNAME_FILE, PushBadNames, "badnames", NULL );
}

void LoadBadNames( void )
{
  FILE *fp;
  
  if ( (fp = fopen(OLD_BADNAME_FILE,"r")) != NULL)
    {
      while (!feof(fp))
	{
	  const char *ln = ReadStringToTilde(fp);

	  if( IsName( "$", ln ) )
	    {
	      break;
	    }
	  else
	    {
	      AddBadName( ln );
	    }
	}

      fclose(fp);
    }
  else
    {
      Bug( "Can't open %s", OLD_BADNAME_FILE );
    }
}
