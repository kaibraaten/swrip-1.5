#include <map>
#include <list>
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "character.hpp"
#include "reset.hpp"
#include "repos/arearepository.hpp"
#include "exit.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"

static std::list<std::shared_ptr<Room>> GetRooms(std::shared_ptr<Area> area)
{
    std::list<std::shared_ptr<Room>> rooms;

    for(vnum_t vnum = area->VnumRanges.Room.First; vnum <= area->VnumRanges.Room.Last; ++vnum)
    {
        auto room = GetRoom(vnum);

        if(room != nullptr)
        {
            rooms.push_back(room);
        }
    }

    return rooms;
}

static std::list<std::string> ReportOutgoingExits(std::shared_ptr<Room> room)
{
    std::list<std::string> results;
    
    for(auto xit : room->Exits())
    {
        auto targetRoom = GetRoom(xit->Vnum);

        if(targetRoom->Area != room->Area)
        {
            results.push_back(FormatString("%s room %ld -> %s room %ld",
                                           room->Area->Filename.c_str(),
                                           room->Vnum,
                                           targetRoom->Area->Filename.c_str(),
                                           targetRoom->Vnum));
        }
    }

    return results;
}


static std::shared_ptr<Area> GetArea(std::shared_ptr<ProtoObject> obj)
{
    for(auto area : Areas)
    {
        if(ObjectVnumIsInArea(obj->Vnum, area))
        {
            return area;
        }
    }

    return nullptr;
}

static std::shared_ptr<Area> GetArea(std::shared_ptr<ProtoMobile> mob)
{
    for(auto area : Areas)
    {
        if(MobileVnumIsInArea(mob->Vnum, area))
        {
            return area;
        }
    }

    return nullptr;
}

static std::list<std::string> ReportExternalResets(std::shared_ptr<Area> area)
{
    std::list<std::string> results;
    const char *areaName = area->Filename.c_str();
    
    for(auto reset = area->FirstReset; reset; reset = reset->Next)
    {
        if(toupper(reset->Command == 'M'))
        {
            auto mob = GetProtoMobile(reset->Arg1);
            auto room = GetRoom(reset->Arg3);
            auto mobArea = GetArea(mob);
            
            if(mob == nullptr)
            {
                auto line = FormatString("%s M reset: mob %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
            }

            if(room == nullptr)
            {
                auto line = FormatString("%s M reset: room %d does not exist",
                                         areaName, reset->Arg3);
                results.push_back(line);
            }

            if(mobArea != area && room->Area != area)
            {
                auto line = FormatString("%-25s M reset: mob %ld (%s) <-> room %ld (%s)",
                                         areaName, mob->Vnum, mobArea->Filename.c_str(),
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
            else if(mobArea != area)
            {
                auto line = FormatString("%-25s M reset: room %ld <- mob %ld (%s)",
                                         areaName,
                                         room->Vnum,
                                         mob->Vnum, mobArea->Filename.c_str());
                results.push_back(line);
            }
            else if(room->Area != area)
            {
                auto line = FormatString("%-25s M reset: mob %ld -> room %ld (%s)",
                                         areaName, mob->Vnum,
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'O'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto room = GetRoom(reset->Arg3);
            auto objArea = GetArea(obj);

            if(obj == nullptr)
            {
                auto line = FormatString("%s O reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
            }

            if(room == nullptr)
            {
                auto line = FormatString("%s O reset: room %d does not exist",
                                         areaName, reset->Arg3);
                results.push_back(line);
            }

            if(objArea != area && room->Area != area)
            {
                auto line = FormatString("%-25s O reset: object %ld (%s) <-> room %ld (%s)",
                                         areaName, obj->Vnum, objArea->Filename.c_str(),
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
            else if(objArea != area)
            {
                auto line = FormatString("%-25s O reset: room %ld <- object %ld (%s)",
                                         areaName,
                                         room->Vnum,
                                         obj->Vnum, objArea->Filename.c_str());
                results.push_back(line);
            }
            else if(room->Area != area)
            {
                auto line = FormatString("%-25s O reset: object %ld -> room %ld (%s)",
                                         areaName, obj->Vnum,
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
    }

    return results;
}

void do_finddependencies(std::shared_ptr<Character> ch, std::string argument)
{
    std::string option;
    argument = OneArgument(argument, option);
    
    if(StrCmp(option, "exits") == 0)
    {
        std::list<std::string> results;
        
        for(const auto &area : Areas)
        {
            if(!argument.empty()
               && StringPrefix(argument, area->Filename))
            {
                continue;
            }
            
            for(const auto &room : GetRooms(area))
            {
                auto outgoing = ReportOutgoingExits(room);
                results.insert(results.end(), outgoing.begin(), outgoing.end());
            }
        }

        results.sort();
        
        for(auto line : results)
        {
            ch->Echo("%s\r\n", line.c_str());
        }
    }
    else if(StrCmp(option, "resets") == 0)
    {
        std::list<std::string> results;

        for(const auto &area : Areas)
        {
            if(!argument.empty()
               && StringPrefix(argument, area->Filename))
            {
                continue;
            }

            auto externalResets = ReportExternalResets(area);
            results.insert(results.end(), externalResets.begin(), externalResets.end());
        }

        results.sort();

        for(auto line : results)
        {
            ch->Echo("%s\r\n", line.c_str());
        }
    }
    else
    {
        ch->Echo("Unknown option.\r\n");
    }
}
