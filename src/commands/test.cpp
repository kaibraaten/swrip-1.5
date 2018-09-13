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
#include "repos/shiprepository.hpp"
#include "repos/badnamerepository.hpp"

void do_test( Character *ch, std::string argument )
{
  if( !StrCmp( argument, "uname" ) )
    {
      struct utsname buf;

      if( uname(&buf) == 0 )
	{
          ch->Echo("&Y%s-%s %s\r\n", buf.sysname, buf.machine, buf.release );
          ch->Echo("&Ysysname  %s\r\n", buf.sysname );
          ch->Echo("&Ynodename %s\r\n", buf.nodename );
          ch->Echo("&Yrelease  %s\r\n", buf.release );
          ch->Echo("&Yversion  %s\r\n", buf.version );
          ch->Echo("&Ymachine  %s\r\n", buf.machine );
	}
      else
	{
          ch->Echo("&RSomething didn't go right.&w\r\n" );
	}

      return;
    }

  if( !StrCmp( argument, "saveclans" ) )
    {
      ch->Echo("Saving clans...\r\n" );
      Clans->Save();
      return;
    }

  if( !StrCmp( argument, "savespace" ) )
    {
      ch->Echo("Saving spaceobjects...\r\n" );
      Spaceobjects->Save();
      return;
    }

   if( !StrCmp( argument, "saveplanets" ) )
    {
      ch->Echo("Saving planets...\r\n" );
      Planets->Save();
      return;
    }

   if( !StrCmp( argument, "saveboards" ) )
    {
      ch->Echo("Saving boards...\r\n" );
      Boards->Save();
      return;
    }

   if( !StrCmp( argument, "saveshuttles" ) )
    {
      ch->Echo("Saving shuttles...\r\n" );
      Shuttles->Save();
      return;
    }

   if( !StrCmp( argument, "saveships" ) )
     {
       ch->Echo("Saving ships...\r\n" );
       Ships->Save();
       return;
     }

   if( !StrCmp( argument, "savebadnames" ) )
     {
       ch->Echo("Saving bad names...\r\n" );
       BadNames->Save();
       return;
     }

   if( !StrCmp( argument, "savebans" ) )
     {
       ch->Echo("Saving bans...\r\n" );
       Bans->Save();
       return;
     }

   if( !StrCmp( argument, "savehalloffame" ) )
     {
       ch->Echo("Saving Hall of Fame...\r\n" );
       SaveHallOfFame();
       return;
     }
}
