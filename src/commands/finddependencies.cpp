#include <map>
#include <list>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "area.hpp"
#include "room.hpp"
#include "character.hpp"
#include "reset.hpp"
#include "repos/arearepository.hpp"
#include "exit.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"

static std::list<std::shared_ptr<Room>> GetRooms(std::shared_ptr<Area> area);
static std::list<std::string> ReportOutgoingExits(std::shared_ptr<Room> room);
static std::list<std::string> ReportExternalResets(std::shared_ptr<Area> area);

void do_finddependencies(std::shared_ptr<Character> ch, std::string argument)
{
    std::string option;
    argument = OneArgument(argument, option);

    if(StrCmp(option, "exits") == 0)
    {
        std::list<std::string> results;
        std::list<std::string> nodeps;
        
        for(const auto &area : Areas)
        {
            std::list<std::string> areaResults;
            
            for(const auto &room : GetRooms(area))
            {
                auto outgoing = ReportOutgoingExits(room);
                areaResults.insert(areaResults.end(), outgoing.begin(), outgoing.end());
            }

            if(areaResults.empty())
            {
                nodeps.push_back(area->Filename + " has no exit dependencies.");
            }
            else
            {
                results.insert(results.end(), areaResults.begin(), areaResults.end());
            }
        }

        if(!argument.empty())
        {
            results = Filter(results,
                             [argument](const auto &line)
                             {
                                 return line.find(argument) != std::string::npos;
                             });
            nodeps.clear();
        }
        
        results.sort();
        nodeps.sort();
        
        for(auto line : results)
        {
            ch->Echo("%s\r\n", line.c_str());
        }

        for(auto line : nodeps)
        {
            ch->Echo("%s\r\n", line.c_str());
        }
    }
    else if(StrCmp(option, "resets") == 0)
    {
        std::list<std::string> results;
        std::list<std::string> nodeps;
        
        for(const auto &area : Areas)
        {
            auto externalResets = ReportExternalResets(area);

            if(externalResets.empty())
            {
                nodeps.push_back(area->Filename + " has no reset dependencies.");
            }
            else
            {
                results.insert(results.end(), externalResets.begin(), externalResets.end());
            }
        }

        while(!argument.empty())
        {
            std::string pattern;
            argument = OneArgument(argument, pattern);
            
            results = Filter(results,
                             [pattern](const auto &line)
                             {
                                 return line.find(pattern) != std::string::npos;
                             });
            nodeps.clear();
        }
        
        results.sort();
        nodeps.sort();
        
        for(auto line : results)
        {
            ch->Echo("%s\r\n", line.c_str());
        }

        for(auto line : nodeps)
        {
            ch->Echo("%s\r\n", line.c_str());
        }
    }
    else
    {
        ch->Echo("Unknown option.\r\n");
    }
}

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
            results.push_back(FormatString("%-15.15s: room %ld -> room %ld (%s)",
                                           room->Area->Filename.c_str(),
                                           room->Vnum,
                                           targetRoom->Vnum,
                                           targetRoom->Area->Filename.c_str()));
        }
    }

    return results;
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
            auto mobArea = GetAreaOf(mob);

            if(mob == nullptr)
            {
                auto line = FormatString("%-15.15s M reset: mob %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
            }

            if(room == nullptr)
            {
                auto line = FormatString("%-15.15s M reset: room %d does not exist",
                                         areaName, reset->Arg3);
                results.push_back(line);
            }

            if(mobArea != area && room->Area != area)
            {
                auto line = FormatString("%-15.15s M reset: mob %ld (%s) <-> room %ld (%s)",
                                         areaName, mob->Vnum, mobArea->Filename.c_str(),
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
            else if(mobArea != area)
            {
                auto line = FormatString("%-15.15s M reset: room %ld <- mob %ld (%s)",
                                         areaName,
                                         room->Vnum,
                                         mob->Vnum, mobArea->Filename.c_str());
                results.push_back(line);
            }
            else if(room->Area != area)
            {
                auto line = FormatString("%-15.15s M reset: mob %ld -> room %ld (%s)",
                                         areaName, mob->Vnum,
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'O'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto room = GetRoom(reset->Arg3);
            auto objArea = GetAreaOf(obj);

            if(obj == nullptr)
            {
                auto line = FormatString("%-15.15s O reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
            }

            if(room == nullptr)
            {
                auto line = FormatString("%-15.15s O reset: room %d does not exist",
                                         areaName, reset->Arg3);
                results.push_back(line);
            }

            if(objArea != area && room->Area != area)
            {
                auto line = FormatString("%-15.15s O reset: object %ld (%s) <-> room %ld (%s)",
                                         areaName, obj->Vnum, objArea->Filename.c_str(),
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
            else if(objArea != area)
            {
                auto line = FormatString("%-15.15s O reset: room %ld <- object %ld (%s)",
                                         areaName,
                                         room->Vnum,
                                         obj->Vnum, objArea->Filename.c_str());
                results.push_back(line);
            }
            else if(room->Area != area)
            {
                auto line = FormatString("%-15.15s O reset: object %ld -> room %ld (%s)",
                                         areaName, obj->Vnum,
                                         room->Vnum, room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'P'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto container = reset->Arg3 > 0 ? GetProtoObject(reset->Arg3) : nullptr;
            auto objArea = GetAreaOf(obj);
            auto containerArea = container ? GetAreaOf(container) : nullptr;

            if(obj == nullptr)
            {
                auto line = FormatString("%-15.15s P reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(container == nullptr && objArea != area)
            {
                auto line = FormatString("%-15.15s P reset: object %ld (%s)",
                                         areaName, obj->Vnum,
                                         objArea->Filename.c_str());
                results.push_back(line);
            }
            else if(container == nullptr)
            {
                continue;
            }
            else if(objArea != area && containerArea != area)
            {
                auto line = FormatString("%-15.15s P reset: object %ld (%s) <-> container %ld (%s)",
                                         areaName, obj->Vnum, objArea->Filename.c_str(),
                                         container->Vnum, containerArea->Filename.c_str());
                results.push_back(line);
            }
            else if(objArea != area)
            {
                auto line = FormatString("%-15.15s P reset: container %ld <- object %ld (%s)",
                                         areaName,
                                         container->Vnum,
                                         obj->Vnum, objArea->Filename.c_str());
                results.push_back(line);
            }
            else if(containerArea != area)
            {
                auto line = FormatString("%-15.15s P reset: object %ld -> container %ld (%s)",
                                         areaName, obj->Vnum,
                                         container->Vnum, containerArea->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'E'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto objArea = obj ? GetAreaOf(obj) : nullptr;

            if(obj == nullptr)
            {
                auto line = FormatString("%-15.15s E reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(objArea != area)
            {
                auto line = FormatString("%-15.15s E reset: object %ld (%s)",
                                         areaName, obj->Vnum,
                                         objArea->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'D'))
        {
            auto room = GetRoom(reset->Arg1);

            if(room == nullptr)
            {
                auto line = FormatString("%-15.15s D reset: room %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(room->Area != area)
            {
                auto line = FormatString("%-15.15s D reset: room %ld (%s)",
                                         areaName, room->Vnum,
                                         room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'T'))
        {
            if(IsBitSet(reset->MiscData, TRAP_OBJ))
            {
                auto obj = GetProtoObject(reset->Arg1);
                auto objArea = obj ? GetAreaOf(obj) : nullptr;

                if(obj == nullptr)
                {
                    auto line = FormatString("%-15.15s T reset: object %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(objArea != area)
                {
                    auto line = FormatString("%-15.15s T reset: object %ld (%s)",
                                             areaName, obj->Vnum,
                                             objArea->Filename.c_str());
                    results.push_back(line);
                }
            }
            else
            {
                auto room = GetRoom(reset->Arg1);

                if(room == nullptr)
                {
                    auto line = FormatString("%-15.15s T reset: room %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(room->Area != area)
                {
                    auto line = FormatString("%-15.15s T reset: room %ld (%s)",
                                             areaName, room->Vnum,
                                             room->Area->Filename.c_str());
                    results.push_back(line);
                }
            }
        }
        else if(toupper(reset->Command == 'G'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto objArea = obj ? GetAreaOf(obj) : nullptr;

            if(obj == nullptr)
            {
                auto line = FormatString("%-15.15s G reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(objArea != area)
            {
                auto line = FormatString("%-15.15s G reset: object %ld (%s)",
                                         areaName, obj->Vnum,
                                         objArea->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'R'))
        {
            auto room = GetRoom(reset->Arg1);

            if(room == nullptr)
            {
                auto line = FormatString("%-15.15s R reset: room %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(room->Area != area)
            {
                auto line = FormatString("%-15.15s R reset: room %ld (%s)",
                                         areaName, room->Vnum,
                                         room->Area->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'H'))
        {
            auto obj = GetProtoObject(reset->Arg1);
            auto objArea = obj ? GetAreaOf(obj) : nullptr;

            if(obj == nullptr)
            {
                auto line = FormatString("%-15.15s H reset: object %d does not exist",
                                         areaName, reset->Arg1);
                results.push_back(line);
                continue;
            }

            if(objArea != area)
            {
                auto line = FormatString("%-15.15s H reset: object %ld (%s)",
                                         areaName, obj->Vnum,
                                         objArea->Filename.c_str());
                results.push_back(line);
            }
        }
        else if(toupper(reset->Command == 'B'))
        {
            if((reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_DOOR)
            {
                auto room = GetRoom(reset->Arg1);

                if(room == nullptr)
                {
                    auto line = FormatString("%-15.15s B door reset: room %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(room->Area != area)
                {
                    auto line = FormatString("%-15.15s B door reset: room %ld (%s)",
                                             areaName, room->Vnum,
                                             room->Area->Filename.c_str());
                    results.push_back(line);
                }
            }
            else if((reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_ROOM)
            {
                auto room = GetRoom(reset->Arg1);

                if(room == nullptr)
                {
                    auto line = FormatString("%-15.15s B room reset: room %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(room->Area != area)
                {
                    auto line = FormatString("%-15.15s B room reset: room %ld (%s)",
                                             areaName, room->Vnum,
                                             room->Area->Filename.c_str());
                    results.push_back(line);
                }
            }
            else if((reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_MOBILE)
            {
                auto mob = GetProtoMobile(reset->Arg1);
                auto mobArea = mob ? GetAreaOf(mob) : nullptr;

                if(mob == nullptr)
                {
                    auto line = FormatString("%-15.15s B mobile reset: mob %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(mobArea != area)
                {
                    auto line = FormatString("%-15.15s B mobile reset: mob %ld (%s)",
                                             areaName, mob->Vnum,
                                             mobArea->Filename.c_str());
                    results.push_back(line);
                }
            }
            else if((reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_OBJECT)
            {
                auto obj = GetProtoObject(reset->Arg1);
                auto objArea = obj ? GetAreaOf(obj) : nullptr;

                if(obj == nullptr)
                {
                    auto line = FormatString("%-15.15s B object reset: object %d does not exist",
                                             areaName, reset->Arg1);
                    results.push_back(line);
                    continue;
                }

                if(objArea != area)
                {
                    auto line = FormatString("%-15.15s B object reset: object %ld (%s)",
                                             areaName, obj->Vnum,
                                             objArea->Filename.c_str());
                    results.push_back(line);
                }
            }
        }
    }

    return results;
}
