#include <array>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <map>
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
#include "protomob.hpp"
#include "protoobject.hpp"
#include "protoobject.hpp"
#include "repos/shiprepository.hpp"
#include "repos/badnamerepository.hpp"
#include "repos/banrepository.hpp"
#include "repos/boardrepository.hpp"
#include "repos/clanrepository.hpp"
#include "repos/planetrepository.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "repos/shuttlerepository.hpp"
#include "repos/arearepository.hpp"

static std::shared_ptr<Area> GetAreaFromObjVnum(vnum_t vnum);

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
                    room->Sector = SectorType::Inside;
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
    else if(StrCmp(argument, "fabrics") == 0)
    {
        for(const auto &i : ProtoObjects)
        {
            auto obj = i.second;

            if(obj->ItemType == ITEM_FABRIC)
            {
                auto area = GetAreaFromObjVnum(obj->Vnum);
                
                ch->Echo("%5ld) Strength %d  (%s) (%s)\r\n",
                         obj->Vnum,
                         obj->Value[OVAL_FABRIC_STRENGTH],
                         obj->ShortDescr.c_str(),
                         area->Filename.c_str());
            }
        }
    }
    else if(StrCmp(argument, "oldmobflags") == 0)
    {
        const std::array<size_t, 10> oldFlags
        {
            Flag::Mob::_03,
                Flag::Mob::_04,
                Flag::Mob::_12,
                Flag::Mob::_13,
                Flag::Mob::_14,
                Flag::Mob::_15,
                Flag::Mob::_17,
                Flag::Mob::_28,
                Flag::Mob::_29,
                Flag::Mob::_31
        };
        std::map<size_t, int> stats;

        for(auto mob : ProtoMobs)
        {
            for(auto flag : oldFlags)
            {
                if(mob.second->Flags.test(flag))
                {
                    mob.second->Flags.reset(flag);
                    stats[flag] += 1;
                }
            }
        }

        ch->Echo("Report:\r\n");
        for(const auto &tuple : stats)
        {
            ch->Echo("  Flag %s: %d removals.\r\n",
                     MobFlags[tuple.first], tuple.second);
        }
    }
    else if(StrCmp(argument, "oldobjectflags") == 0)
    {
        const std::array<size_t, 9> oldFlags
        {
            Flag::Obj::_02,
                Flag::Obj::_14,
                Flag::Obj::_15,
                Flag::Obj::_16,
                Flag::Obj::_17,
                Flag::Obj::_20,
                Flag::Obj::_22,
                Flag::Obj::_23,
                Flag::Obj::_24
        };
        std::map<size_t, int> stats;

        for(const auto &tuple : ProtoObjects)
        {
            for(auto flag : oldFlags)
            {
                if(tuple.second->Flags.test(flag))
                {
                    tuple.second->Flags.reset(flag);
                    stats[flag] += 1;
                }
            }
        }

        ch->Echo("Report:\r\n");
        for(const auto &tuple : stats)
        {
            ch->Echo("  Flag %s: %d removals.\r\n",
                     ObjectFlags[tuple.first], tuple.second);
        }
    }
    else if(StrCmp(argument, "oldroomflags") == 0)
    {
        const std::array<size_t, 4> oldFlags
        {
            Flag::Room::_11,
                Flag::Room::_14,
                Flag::Room::_21,
                Flag::Room::_27
        };
        std::map<size_t, int> stats;

        for(int iHash = 0; iHash < MAX_KEY_HASH; iHash++)
        {
            for(auto room = RoomIndexHash[iHash];
                room;
                room = room->Next)
            {
                for(auto flag : oldFlags)
                {
                    if(room->Flags.test(flag))
                    {
                        room->Flags.reset(flag);
                        stats[flag] += 1;
                    }
                }
            }
        }

        ch->Echo("Report:\r\n");
        for(const auto &tuple : stats)
        {
            ch->Echo("  Flag %s: %d removals.\r\n",
                     RoomFlags[tuple.first], tuple.second);
        }
    }
    else
    {
        ch->Echo("Unknown argument.\r\n");
    }
}

static std::shared_ptr<Area> GetAreaFromObjVnum(vnum_t vnum)
{
    for(auto area : Areas)
    {
        if(vnum >= area->VnumRanges.Object.First
           && vnum <= area->VnumRanges.Object.Last)
        {
            return area;
        }
    }

    return nullptr;
}
