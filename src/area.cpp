#include "area.hpp"
#include "area.hpp"
#include "area.hpp"
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "area.hpp"
#include "mud.hpp"
#include "shop.hpp"
#include "reset.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "exit.hpp"
#include "repos/shoprepository.hpp"
#include "repos/objectrepository.hpp"
#include "repos/arearepository.hpp"

static void LinkForwardExits(const std::shared_ptr<Area> &tarea);
static void LinkReverseExits(const std::shared_ptr<Area> &tarea);
static void ExtractCharactersFromArea(const std::shared_ptr<Area> &pArea);
static void ExtractObjectsFromArea(const std::shared_ptr<Area> &pArea);
static void EraseRooms(const std::shared_ptr<Area> &pArea);
static void EraseProtoMobs(const std::shared_ptr<Area> &pArea);
static void EraseProtoObjects(const std::shared_ptr<Area> &pArea);

void FixAreaExits(std::shared_ptr<Area> tarea)
{
    LinkForwardExits(tarea);
    LinkReverseExits(tarea);
}

static void LinkReverseExits(const std::shared_ptr<Area> &tarea)
{
    for(vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; ++rnum)
    {
        auto pRoomIndex = GetRoom(rnum);

        if(pRoomIndex != nullptr)
        {
            for(auto pexit : pRoomIndex->Exits())
            {
                if(pexit->ToRoom && !pexit->ReverseExit)
                {
                    std::shared_ptr<Exit> rev_exit = GetExitTo(pexit->ToRoom,
                                                               GetReverseDirection(pexit->Direction),
                                                               pRoomIndex->Vnum);

                    if(rev_exit != nullptr)
                    {
                        pexit->ReverseExit = rev_exit;
                        rev_exit->ReverseExit = pexit;
                    }
                }
            }
        }
    }
}

static void LinkForwardExits(const std::shared_ptr<Area> &tarea)
{
    for(vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; ++rnum)
    {
        auto pRoomIndex = GetRoom(rnum);

        if(pRoomIndex != nullptr)
        {
            if(!pRoomIndex->Exits().empty())
            {
                for(auto pexit : pRoomIndex->Exits())
                {
                    pexit->ReverseVnum = pRoomIndex->Vnum;

                    if(pexit->Vnum <= 0)
                    {
                        pexit->ToRoom = nullptr;
                    }
                    else
                    {
                        pexit->ToRoom = GetRoom(pexit->Vnum);
                    }
                }
            }
            else
            {
                pRoomIndex->Flags.set(Flag::Room::NoMob);
            }
        }
    }
}

constexpr int DEFAULT_RESET_FREQUENCY = 15;

/*
 * Repopulate areas periodically.
 */
void AreaUpdate()
{
    for(auto area : Areas)
    {
        int reset_age = area->ResetFrequency > 0 ? area->ResetFrequency : DEFAULT_RESET_FREQUENCY;

        if((reset_age == -1 && area->Age == -1)
           || ++area->Age < (reset_age - 1))
        {
            return;
        }
        
        /*
         * Check for PC's.
         */
        if(area->NumberOfPlayers > 0 && area->Age == (reset_age - 1))
        {
            std::string buf;

            /* Rennard */
            if(!area->ResetMessage.empty())
            {
                buf = area->ResetMessage + "\r\n";
            }
            else
            {
                buf = "You hear some squeaking sounds...\r\n";
            }
            
            for(auto pch = FirstCharacter; pch; pch = pch->Next)
            {
                if(!IsNpc(pch)
                   && IsAwake(pch)
                   && pch->InRoom
                   && pch->InRoom->Area == area)
                {
                    SetCharacterColor(AT_RESET, pch);
                    pch->Echo(buf);
                }
            }
        }

        /*
         * Check age and reset.
         * Note: Mud Academy resets every 3 minutes (not 15).
         */
        if(area->NumberOfPlayers == 0 || area->Age >= reset_age)
        {
            fprintf(stderr, "Resetting: %s\n", area->Filename.c_str());
            ResetArea(area);

            if(reset_age == -1)
            {
                area->Age = -1;
            }
            else
            {
                area->Age = GetRandomNumberFromRange(0, reset_age / 5);
            }
            
            auto pRoomIndex = GetRoom(ROOM_VNUM_SCHOOL);

            if(pRoomIndex != nullptr
               && area == pRoomIndex->Area
               && area->ResetFrequency == 0)
            {
                area->Age = DEFAULT_RESET_FREQUENCY - 3;
            }
        }
    }
}

/*
 * This could have other applications too.. move if needed. -- Altrag
 */
void CloseArea(std::shared_ptr<Area> pArea)
{
    ExtractCharactersFromArea(pArea);
    ExtractObjectsFromArea(pArea);

    EraseRooms(pArea);
    EraseProtoMobs(pArea);
    EraseProtoObjects(pArea);
    CleanResets(pArea);

    Areas->Remove(pArea);
}

static void EraseProtoMobs(const std::shared_ptr<Area> &pArea)
{
    auto protoMobs = ProtoMobs;

    for(const auto & [_, mid] : protoMobs)
    {
        if(mid->Vnum < pArea->VnumRanges.Mob.First
           || mid->Vnum > pArea->VnumRanges.Mob.Last)
        {
            continue;
        }
        
        if(mid->Shop)
        {
            Shops->Remove(mid->Shop);
        }

        if(mid->RepairShop)
        {
            RepairShops->Remove(mid->RepairShop);
        }

        auto mobProgs = mid->mprog.MudProgs();

        for(auto mprog : mobProgs)
        {
            mid->mprog.Remove(mprog);
        }

        ProtoMobs.erase(mid->Vnum);
    }
}

static void EraseProtoObjects(const std::shared_ptr<Area> &pArea)
{
    auto protoObjects = ProtoObjects;

    for(const auto & [_, oid] : protoObjects)
    {
        if(oid->Vnum < pArea->VnumRanges.Object.First
           || oid->Vnum > pArea->VnumRanges.Object.Last)
        {
            continue;
        }
        
        auto extraDescrs = oid->ExtraDescriptions();

        for(auto eed : extraDescrs)
        {
            oid->Remove(eed);
        }

        auto affects = oid->Affects();

        for(auto paf : affects)
        {
            oid->Remove(paf);
        }

        auto objProgs = oid->mprog.MudProgs();

        for(auto mprog : objProgs)
        {
            oid->mprog.Remove(mprog);
        }

        ProtoObjects.erase(oid->Vnum);
    }
}

static void EraseRooms(const std::shared_ptr<Area> &pArea)
{
    for(int icnt = 0; icnt < MAX_KEY_HASH; icnt++)
    {
        for(std::shared_ptr<Room> rid = RoomIndexHash[icnt], rid_next; rid; rid = rid_next)
        {
            auto exitsInRoom = rid->Exits();
            rid_next = rid->Next;

            for(auto xit : exitsInRoom)
            {
                if(rid->Area == pArea || xit->ToRoom->Area == pArea)
                {
                    rid->Remove(xit);
                }
            }

            if(rid->Area != pArea)
            {
                continue;
            }
            
            if(!rid->Characters().empty())
            {
                Log->Bug("CloseArea: room with people #%ld", rid->Vnum);

                auto copyOfCharacterList = rid->Characters();

                for(auto ech : copyOfCharacterList)
                {
                    if(IsFighting(ech))
                    {
                        StopFighting(ech, true);
                    }
                    
                    if(IsNpc(ech))
                    {
                        ExtractCharacter(ech, true);
                    }
                    else
                    {
                        do_recall(ech, "");
                    }
                }
            }

            if(!rid->Objects().empty())
            {
                Log->Bug("CloseArea: room with contents #%ld", rid->Vnum);

                auto objectsInRoom = rid->Objects();

                for(auto eobj : objectsInRoom)
                {
                    ExtractObject(eobj);
                }
            }

            auto extrasInRoom = rid->ExtraDescriptions();

            for(auto eed : extrasInRoom)
            {
                rid->Remove(eed);
            }

            auto mprogActLists = rid->mprog.ActLists();

            for(auto mpact : mprogActLists)
            {
                rid->mprog.Remove(mpact);
            }

            auto roomProgs = rid->mprog.MudProgs();

            for(auto mprog : roomProgs)
            {
                rid->mprog.Remove(mprog);
            }

            if(rid == RoomIndexHash[icnt])
            {
                RoomIndexHash[icnt] = rid->Next;
            }
            else
            {
                std::shared_ptr<Room> trid;

                for(trid = RoomIndexHash[icnt]; trid; trid = trid->Next)
                {
                    if(trid->Next == rid)
                    {
                        break;
                    }
                }
                
                if(!trid)
                {
                    Log->Bug("Close_area: room not in hash list %ld", rid->Vnum);
                }
                else
                {
                    trid->Next = rid->Next;
                }
            }
        }
    }
}

static void ExtractObjectsFromArea(const std::shared_ptr<Area> &pArea)
{
    auto objectsToExtract = Filter(Objects->Entities(),
                                   [pArea](const auto obj)
                                   {
                                       return urange(pArea->VnumRanges.Object.First,
                                                     obj->Prototype->Vnum,
                                                     pArea->VnumRanges.Object.Last)
                                           == obj->Prototype->Vnum
                                           || (obj->InRoom != nullptr
                                               && obj->InRoom->Area == pArea);
                                   });

    for(auto obj : objectsToExtract)
    {
        ExtractObject(obj);
    }
}

static void ExtractCharactersFromArea(const std::shared_ptr<Area> &pArea)
{
    for(std::shared_ptr<Character> ech = FirstCharacter, ech_next; ech; ech = ech_next)
    {
        ech_next = ech->Next;

        if(IsFighting(ech))
        {
            StopFighting(ech, true);
        }
        
        if(IsNpc(ech))
        {
            /* if mob is in area, or part of area. */
            if(urange(pArea->VnumRanges.Mob.First, ech->Prototype->Vnum,
                      pArea->VnumRanges.Mob.Last) == ech->Prototype->Vnum ||
               (ech->InRoom && ech->InRoom->Area == pArea))
            {
                ExtractCharacter(ech, true);
            }
            
            continue;
        }

        if(ech->InRoom && ech->InRoom->Area == pArea)
        {
            do_recall(ech, "");
        }
    }
}

void FreeArea(std::shared_ptr<Area> are)
{
    while(are->FirstReset)
    {
        FreeReset(are, are->FirstReset);
    }
}

template<typename SourceT, typename TargetT>
static void CopyVnumRanges(const SourceT &source, TargetT &target)
{
    target.Room.First = source.Room.First;
    target.Object.First = source.Object.First;
    target.Mob.First = source.Mob.First;
    target.Room.Last = source.Room.Last;
    target.Object.Last = source.Object.Last;
    target.Mob.Last = source.Mob.Last;
}

void AssignAreaTo(std::shared_ptr<Character> ch)
{
    if(IsNpc(ch))
    {
        return;
    }

    if(GetTrustLevel(ch) >= LEVEL_AVATAR
       && ch->PCData->Build.VnumRanges.Room.First != INVALID_VNUM
       && ch->PCData->Build.VnumRanges.Room.Last != INVALID_VNUM)
    {
        auto tarea = ch->PCData->Build.Area;
        auto filename = ConvertToLuaFilename(ch->Name);

        if(tarea == nullptr)
        {
            tarea = Areas->FindProtoArea(filename);
        }

        if(tarea == nullptr)
        {
            auto logBuf = FormatString("Creating area entry for %s", ch->Name.c_str());
            Log->LogStringPlus(logBuf, LogType::Normal, ch->TopLevel());
            tarea = std::make_shared<Area>();
            CopyVnumRanges(ch->PCData->Build.VnumRanges, tarea->VnumRanges);
            tarea->Flags.set(Flag::Area::Prototype);
            Areas->Add(tarea);
            tarea->Name = FormatString("{PROTO} %s's area in progress", ch->Name.c_str());
            tarea->Filename = filename;
            tarea->Author = ch->Name;
        }
        else
        {
            auto logBuf = FormatString("Updating area entry for %s", ch->Name.c_str());
            Log->LogStringPlus(logBuf, LogType::Normal, ch->TopLevel());
        }

        ch->PCData->Build.Area = tarea;
    }
}

void CleanResets(std::shared_ptr<Area> tarea)
{
    for(std::shared_ptr<Reset> pReset = tarea->FirstReset, pReset_next; pReset; pReset = pReset_next)
    {
        pReset_next = pReset->Next;
        --top_reset;
    }

    tarea->FirstReset = nullptr;
    tarea->LastReset = nullptr;
}

vnum_t GetFreeRoomVnum(std::shared_ptr<Area> area)
{
    vnum_t first = area->VnumRanges.Room.First;
    vnum_t last = area->VnumRanges.Room.Last;
    
    for(vnum_t vnum = first; vnum <= last; ++vnum)
    {
        if(!GetRoom(vnum))
        {
            return vnum;
        }
    }

    return INVALID_VNUM;
}

vnum_t GetFreeObjectVnum(std::shared_ptr<Area> area)
{
    vnum_t first = area->VnumRanges.Object.First;
    vnum_t last = area->VnumRanges.Object.Last;

    for(vnum_t vnum = first; vnum <= last; ++vnum)
    {
        if(!GetProtoObject(vnum))
        {
            return vnum;
        }
    }

    return INVALID_VNUM;
}

vnum_t GetFreeMobileVnum(std::shared_ptr<Area> area)
{
    vnum_t first = area->VnumRanges.Mob.First;
    vnum_t last = area->VnumRanges.Mob.Last;

    for(vnum_t vnum = first; vnum <= last; ++vnum)
    {
        if(!GetProtoMobile(vnum))
        {
            return vnum;
        }
    }

    return INVALID_VNUM;
}

bool RoomVnumIsInArea(vnum_t vnum, std::shared_ptr<Area> area)
{
    return vnum >= area->VnumRanges.Room.First && vnum <= area->VnumRanges.Room.Last;
}

bool ObjectVnumIsInArea(vnum_t vnum, std::shared_ptr<Area> area)
{
    return vnum >= area->VnumRanges.Object.First && vnum <= area->VnumRanges.Object.Last;
}

bool MobileVnumIsInArea(vnum_t vnum, std::shared_ptr<Area> area)
{
    return vnum >= area->VnumRanges.Mob.First && vnum <= area->VnumRanges.Mob.Last;
}
