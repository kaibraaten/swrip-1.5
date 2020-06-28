#include <cstring>
#include <cstdlib>
#include <cstdarg>
#ifdef HAVE_UNAME
#include <sys/utsname.h>
#endif
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
#include "room.hpp"
#include "area.hpp"
#include "repos/shiprepository.hpp"
#include "repos/badnamerepository.hpp"
#include "repos/banrepository.hpp"
#include "repos/boardrepository.hpp"
#include "repos/clanrepository.hpp"
#include "repos/planetrepository.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "repos/shuttlerepository.hpp"
#include "repos/arearepository.hpp"

void do_test( std::shared_ptr<Character> ch, std::string argument )
{
#ifdef HAVE_UNAME
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
#endif

    if( !StrCmp( argument, "saveareas" ) )
    {
        ch->Echo("Saving areas...\r\n" );
        Areas->Save();
    }
    else if( !StrCmp( argument, "saveclans" ) )
    {
        ch->Echo("Saving clans...\r\n" );
        Clans->Save();
    }
    else if( !StrCmp( argument, "savespace" ) )
    {
        ch->Echo("Saving spaceobjects...\r\n" );
        Spaceobjects->Save();
    }
    else if( !StrCmp( argument, "saveplanets" ) )
    {
        ch->Echo("Saving planets...\r\n" );
        Planets->Save();
    }
    else if( !StrCmp( argument, "saveboards" ) )
    {
        ch->Echo("Saving boards...\r\n" );
        Boards->Save();
    }
    else if( !StrCmp( argument, "saveshuttles" ) )
    {
        ch->Echo("Saving shuttles...\r\n" );
        Shuttles->Save();
    }
    else if( !StrCmp( argument, "saveships" ) )
    {
        ch->Echo("Saving ships...\r\n" );
        Ships->Save();
    }
    else if( !StrCmp( argument, "savebadnames" ) )
    {
        ch->Echo("Saving bad names...\r\n" );
        BadNames->Save();
    }
    else if( !StrCmp( argument, "savebans" ) )
    {
        ch->Echo("Saving bans...\r\n" );
        Bans->Save();
    }
    else if( !StrCmp( argument, "savehalloffame" ) )
    {
        ch->Echo("Saving Hall of Fame...\r\n" );
        SaveHallOfFame();
    }
    else if(StrCmp(argument, "resethomes") == 0)
    {
        int homeCount = 0;
        
        for (int iHash = 0; iHash < MAX_KEY_HASH; iHash++)
        {
            for (auto room = RoomIndexHash[iHash];
                 room;
                 room = room->Next)
            {
                if(room->Flags.test(Flag::Room::PlayerHome))
                {
                    room->Flags.reset();
                    room->Flags.set(Flag::Room::PlayerHome);
                    room->Flags.set(Flag::Room::Indoors);
                    room->Sector = SECT_INSIDE;
                    room->Name = "An Empty Home";
                    room->Description = "This is a small apartment with the bare essentials required to live here.\r\n"
                        "Apart from the cramped bathroom, the rest of the apartment is a single room.\r\n";

                    ++homeCount;
                }
            }
        }

        ch->Echo("%d player homes reset to default values. Nothing persisted.\r\n", homeCount);
    }
    else if(StrCmp(argument, "findhomes") == 0)
    {
        std::set<std::string> homes;
        
        for (int iHash = 0; iHash < MAX_KEY_HASH; iHash++)
        {
            for (auto room = RoomIndexHash[iHash];
                 room;
                 room = room->Next)
            {
                if(room->Flags.test(Flag::Room::PlayerHome))
                {
                    std::string entry = FormatString("%5ld) %s",
                                                     room->Vnum,
                                                     room->Area->Filename.c_str());
                    homes.insert(entry);
                }
            }
        }

        for(auto entry : homes)
        {
            ch->Echo("%s\r\n", entry.c_str());
        }
    }
    else
    {
        ch->Echo("Unknown argument.\r\n");
    }
}
