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

void FixAreaExits(std::shared_ptr<Area> tarea)
{
    for(vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++)
    {
        std::shared_ptr<Room> pRoomIndex;
        bool fexit = false;

        if((pRoomIndex = GetRoom(rnum)) == NULL)
            continue;

        for(auto pexit : pRoomIndex->Exits())
        {
            fexit = true;
            pexit->ReverseVnum = pRoomIndex->Vnum;

            if(pexit->Vnum <= 0)
                pexit->ToRoom = NULL;
            else
                pexit->ToRoom = GetRoom(pexit->Vnum);
        }

        if(!fexit)
        {
            pRoomIndex->Flags.set(Flag::Room::NoMob);
        }
    }

    for(vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++)
    {
        auto pRoomIndex = GetRoom(rnum);

        if(pRoomIndex == nullptr)
        {
            continue;
        }

        for(auto pexit : pRoomIndex->Exits())
        {
            if(pexit->ToRoom && !pexit->ReverseExit)
            {
                std::shared_ptr<Exit> rev_exit = GetExitTo(pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum);

                if(rev_exit)
                {
                    pexit->ReverseExit = rev_exit;
                    rev_exit->ReverseExit = pexit;
                }
            }
        }
    }
}

/*
 * Repopulate areas periodically.
 */
void AreaUpdate()
{
    for(auto area : Areas)
    {
        int reset_age = area->ResetFrequency ? area->ResetFrequency : 15;

        if((reset_age == -1 && area->Age == -1)
           || ++area->Age < (reset_age - 1))
            return;

        /*
         * Check for PC's.
         */
        if(area->NumberOfPlayers > 0 && area->Age == (reset_age - 1))
        {
            char buf[MAX_STRING_LENGTH];

            /* Rennard */
            if(!area->ResetMessage.empty())
                sprintf(buf, "%s\r\n", area->ResetMessage.c_str());
            else
                strcpy(buf, "You hear some squeaking sounds...\r\n");

            for(auto pch = FirstCharacter; pch; pch = pch->Next)
            {
                if(!IsNpc(pch)
                   && IsAwake(pch)
                   && pch->InRoom
                   && pch->InRoom->Area == area)
                {
                    SetCharacterColor(AT_RESET, pch);
                    pch->Echo("%s", buf);
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
                area->Age = -1;
            else
                area->Age = GetRandomNumberFromRange(0, reset_age / 5);

            auto pRoomIndex = GetRoom(ROOM_VNUM_SCHOOL);

            if(pRoomIndex != NULL && area == pRoomIndex->Area
               && area->ResetFrequency == 0)
                area->Age = 15 - 3;
        }
    }
}

/*
 * This could have other applications too.. move if needed. -- Altrag
 */
void CloseArea(std::shared_ptr<Area> pArea)
{
    for(std::shared_ptr<Character>  ech = FirstCharacter, ech_next; ech; ech = ech_next)
    {
        ech_next = ech->Next;

        if(ech->Fighting)
            StopFighting(ech, true);

        if(IsNpc(ech))
        {
            /* if mob is in area, or part of area. */
            if(urange(pArea->VnumRanges.Mob.First, ech->Prototype->Vnum,
                      pArea->VnumRanges.Mob.Last) == ech->Prototype->Vnum ||
               (ech->InRoom && ech->InRoom->Area == pArea))
                ExtractCharacter(ech, true);
            continue;
        }
        if(ech->InRoom && ech->InRoom->Area == pArea)
            do_recall(ech, "");
    }

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

    for(int icnt = 0; icnt < MAX_KEY_HASH; icnt++)
    {
        for(std::shared_ptr<Room> rid = RoomIndexHash[icnt], rid_next; rid; rid = rid_next)
        {
            std::list<std::shared_ptr<Exit>> copyOfExitList(rid->Exits());
            rid_next = rid->Next;

            for(std::shared_ptr<Exit> xit : copyOfExitList)
            {
                if(rid->Area == pArea || xit->ToRoom->Area == pArea)
                {
                    rid->Remove(xit);
                }
            }

            if(rid->Area != pArea)
                continue;

            if(!rid->Characters().empty())
            {
                Log->Bug("CloseArea: room with people #%ld", rid->Vnum);

                auto copyOfCharacterList = rid->Characters();

                for(auto ech : copyOfCharacterList)
                {
                    if(ech->Fighting)
                        StopFighting(ech, true);

                    if(IsNpc(ech))
                        ExtractCharacter(ech, true);
                    else
                        do_recall(ech, "");
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

            std::list<std::shared_ptr<ExtraDescription>> extrasInRoom(rid->ExtraDescriptions());

            for(auto eed : extrasInRoom)
            {
                rid->Remove(eed);
            }

            auto mprogActLists(rid->mprog.ActLists());

            for(auto mpact : mprogActLists)
            {
                rid->mprog.Remove(mpact);
            }

            auto roomProgs(rid->mprog.MudProgs());

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
                    if(trid->Next == rid)
                        break;

                if(!trid)
                    Log->Bug("Close_area: room not in hash list %ld", rid->Vnum);
                else
                    trid->Next = rid->Next;
            }
        }

        auto protoMobs = ProtoMobs;
        
        for(const auto &i : protoMobs)
        {
            auto mid = i.second;

            if(mid->Vnum < pArea->VnumRanges.Mob.First
               || mid->Vnum > pArea->VnumRanges.Mob.Last)
                continue;

            if(mid->Shop)
            {
                Shops->Remove(mid->Shop);
            }

            if(mid->RepairShop)
            {
                RepairShops->Remove(mid->RepairShop);
            }

            auto mobProgs(mid->mprog.MudProgs());

            for(auto mprog : mobProgs)
            {
                mid->mprog.Remove(mprog);
            }

            ProtoMobs.erase(mid->Vnum);
        }

        auto protoObjects = ProtoObjects;
        
        for(const auto &i : protoObjects)

        {
            auto oid = i.second;

            if(oid->Vnum < pArea->VnumRanges.Object.First
               || oid->Vnum > pArea->VnumRanges.Object.Last)
                continue;

            std::list<std::shared_ptr<ExtraDescription>> extraDescrs(oid->ExtraDescriptions());

            for(auto eed : extraDescrs)
            {
                oid->Remove(eed);
            }

            auto affects(oid->Affects());

            for(auto paf : affects)
            {
                oid->Remove(paf);
            }

            auto objProgs(oid->mprog.MudProgs());

            for(auto mprog : objProgs)
            {
                oid->mprog.Remove(mprog);
            }

            ProtoObjects.erase(oid->Vnum);
        }
    }

    for(std::shared_ptr<Reset> ereset = pArea->FirstReset, ereset_next; ereset; ereset = ereset_next)
    {
        ereset_next = ereset->Next;
    }

    Areas->Remove(pArea);
}

void FreeArea(std::shared_ptr<Area> are)
{
    while(are->FirstReset)
        FreeReset(are, are->FirstReset);
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
        std::shared_ptr<Area> tarea = ch->PCData->Build.Area;

        auto filename = ConvertToLuaFilename(ch->Name);

        if(tarea == nullptr)
        {
            tarea = Areas->FindProtoArea(filename);
        }

        if(tarea == nullptr)
        {
            auto logBuf = FormatString("Creating area entry for %s", ch->Name.c_str());
            Log->LogStringPlus(logBuf, LOG_NORMAL, ch->TopLevel);
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
            Log->LogStringPlus(logBuf, LOG_NORMAL, ch->TopLevel);
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
