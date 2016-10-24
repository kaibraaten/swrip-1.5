#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <sys/utsname.h>

#include "mud.h"
#include "character.h"
#include "clan.h"
#include "spaceobject.h"

void do_test( Character *ch, char *argument )
{
  if( !StrCmp( argument, "uname" ) )
    {
      struct utsname buf;

      if( uname(&buf) == 0 )
	{
	  Echo( ch, "&Y%s-%s %s\r\n", buf.sysname, buf.machine, buf.release );
	  Echo( ch, "&Ysysname  %s\r\n", buf.sysname );
	  Echo( ch, "&Ynodename %s\r\n", buf.nodename );
	  Echo( ch, "&Yrelease  %s\r\n", buf.release );
	  Echo( ch, "&Yversion  %s\r\n", buf.version );
	  Echo( ch, "&Ymachine  %s\r\n", buf.machine );
	}
      else
	{
	  Echo( ch, "&RSomething didn't go right.&w\r\n" );
	}

      return;
    }

  if( !StrCmp( argument, "saveclans" ) )
    {
      Echo( ch, "Saving clans...\r\n" );
      ForEach( Clan, FirstClan, Next, NewSaveClan, 0 );
      return;
    }

  if( !StrCmp( argument, "savespace" ) )
    {
      Echo( ch, "Saving spaceobjects...\r\n" );
      ForEach( Spaceobject, FirstSpaceobject, Next, NewSaveSpaceobject, 0 );
      return;
    }

   if( !StrCmp( argument, "saveplanets" ) )
    {
      Echo( ch, "Saving planets...\r\n" );
      ForEach( Planet, FirstPlanet, Next, NewSavePlanet, 0 );
      return;
    }
}
