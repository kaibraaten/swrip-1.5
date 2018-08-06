#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <sys/utsname.h>

#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "shuttle.hpp"
#include "board.hpp"
#include "planet.hpp"
#include "ship.hpp"
#include "badname.hpp"
#include "ban.hpp"
#include "arena.hpp"

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
      Clans->Save();
      return;
    }

  if( !StrCmp( argument, "savespace" ) )
    {
      Echo( ch, "Saving spaceobjects...\r\n" );
      Spaceobjects->Save();
      return;
    }

   if( !StrCmp( argument, "saveplanets" ) )
    {
      Echo( ch, "Saving planets...\r\n" );
      Planets->Save();
      return;
    }

   if( !StrCmp( argument, "saveboards" ) )
    {
      Echo( ch, "Saving boards...\r\n" );
      Boards->Save();
      return;
    }

   if( !StrCmp( argument, "saveshuttles" ) )
    {
      Echo( ch, "Saving shuttles...\r\n" );
      Shuttles->Save();
      return;
    }

   if( !StrCmp( argument, "saveships" ) )
     {
       Echo( ch, "Saving ships...\r\n" );
       Ships->Save();
       return;
     }

   if( !StrCmp( argument, "savebadnames" ) )
     {
       Echo( ch, "Saving bad names...\r\n" );
       BadNames->Save();
       return;
     }

   if( !StrCmp( argument, "savebans" ) )
     {
       Echo( ch, "Saving bans...\r\n" );
       Bans->Save();
       return;
     }

   if( !StrCmp( argument, "savehalloffame" ) )
     {
       Echo( ch, "Saving Hall of Fame...\r\n" );
       SaveHallOfFame();
       return;
     }
}
