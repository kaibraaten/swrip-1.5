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
    for (vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++)
    {
        std::shared_ptr<Room> pRoomIndex;
        bool fexit = false;

        if ((pRoomIndex = GetRoom(rnum)) == NULL)
            continue;

        for (auto pexit : pRoomIndex->Exits())
        {
            fexit = true;
            pexit->ReverseVnum = pRoomIndex->Vnum;

            if (pexit->Vnum <= 0)
                pexit->ToRoom = NULL;
            else
                pexit->ToRoom = GetRoom(pexit->Vnum);
        }

        if (!fexit)
        {
            pRoomIndex->Flags.set(Flag::Room::NoMob);
        }
    }

    for (vnum_t rnum = tarea->VnumRanges.Room.First; rnum <= tarea->VnumRanges.Room.Last; rnum++)
    {
        auto pRoomIndex = GetRoom(rnum);

        if (pRoomIndex == nullptr)
        {
            continue;
        }

        for (auto pexit : pRoomIndex->Exits())
        {
            if (pexit->ToRoom && !pexit->ReverseExit)
            {
                std::shared_ptr<Exit> rev_exit = GetExitTo(pexit->ToRoom, GetReverseDirection(pexit->Direction), pRoomIndex->Vnum);

                if (rev_exit)
                {
                    pexit->ReverseExit = rev_exit;
                    rev_exit->ReverseExit = pexit;
                }
            }
        }
    }
}

std::shared_ptr<Area> GetArea(const std::string &name)
{
    return Find(Areas->Entities(),
                [name](const auto &area)
                {
                    return StrCmp(area->Filename, name) == 0
                        || StrCmp(area->Name, name) == 0;
                });
}

/*
 * Repopulate areas periodically.
 */
void AreaUpdate()
{
    for (auto area : Areas)
    {
        int reset_age = area->ResetFrequency ? area->ResetFrequency : 15;

        if ((reset_age == -1 && area->Age == -1)
            || ++area->Age < (reset_age - 1))
            return;

        /*
         * Check for PC's.
         */
        if (area->NumberOfPlayers > 0 && area->Age == (reset_age - 1))
        {
            char buf[MAX_STRING_LENGTH];

            /* Rennard */
            if (!area->ResetMessage.empty())
                sprintf(buf, "%s\r\n", area->ResetMessage.c_str());
            else
                strcpy(buf, "You hear some squeaking sounds...\r\n");

            for (auto pch = FirstCharacter; pch; pch = pch->Next)
            {
                if (!IsNpc(pch)
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
        if (area->NumberOfPlayers == 0 || area->Age >= reset_age)
        {
            fprintf(stderr, "Resetting: %s\n", area->Filename.c_str());
            ResetArea(area);

            if (reset_age == -1)
                area->Age = -1;
            else
                area->Age = GetRandomNumberFromRange(0, reset_age / 5);

            auto pRoomIndex = GetRoom(ROOM_VNUM_SCHOOL);

            if (pRoomIndex != NULL && area == pRoomIndex->Area
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
    int icnt = 0;
    std::shared_ptr<Room> rid;
    std::shared_ptr<Room> rid_next;
    std::shared_ptr<ProtoObject> oid;
    std::shared_ptr<ProtoObject> oid_next;
    std::shared_ptr<ProtoMobile> mid;
    std::shared_ptr<ProtoMobile> mid_next;

    for (Character *ech = FirstCharacter, *ech_next; ech; ech = ech_next)
    {
        ech_next = ech->Next;

        if (ech->Fighting)
            StopFighting(ech, true);
        if (IsNpc(ech))
        {
            /* if mob is in area, or part of area. */
            if (urange(pArea->VnumRanges.Mob.First, ech->Prototype->Vnum,
                pArea->VnumRanges.Mob.Last) == ech->Prototype->Vnum ||
                (ech->InRoom && ech->InRoom->Area == pArea))
                ExtractCharacter(ech, true);
            continue;
        }
        if (ech->InRoom && ech->InRoom->Area == pArea)
            do_recall(ech, "");
    }

    std::list<Object*> objectsToExtract = Filter(Objects->Entities(),
        [pArea](const auto obj)
    {
        return urange(pArea->VnumRanges.Object.First,
            obj->Prototype->Vnum,
            pArea->VnumRanges.Object.Last)
            == obj->Prototype->Vnum
            || (obj->InRoom != nullptr
                && obj->InRoom->Area == pArea);
    });

    for (Object *obj : objectsToExtract)
    {
        ExtractObject(obj);
    }

    for (icnt = 0; icnt < MAX_KEY_HASH; icnt++)
    {
        for (rid = RoomIndexHash[icnt]; rid; rid = rid_next)
        {
            std::list<std::shared_ptr<Exit>> copyOfExitList(rid->Exits());
            rid_next = rid->Next;

            for (std::shared_ptr<Exit> xit : copyOfExitList)
            {
                if (rid->Area == pArea || xit->ToRoom->Area == pArea)
                {
                    rid->Remove(xit);
                }
            }

            if (rid->Area != pArea)
                continue;

            if (!rid->Characters().empty())
            {
                Log->Bug("CloseArea: room with people #%ld", rid->Vnum);

                std::list<Character*> copyOfCharacterList(rid->Characters());

                for (Character *ech : copyOfCharacterList)
                {
                    if (ech->Fighting)
                        StopFighting(ech, true);

                    if (IsNpc(ech))
                        ExtractCharacter(ech, true);
                    else
                        do_recall(ech, "");
                }
            }

            if (!rid->Objects().empty())
            {
                Log->Bug("CloseArea: room with contents #%ld", rid->Vnum);

                std::list<Object*> objectsInRoom(rid->Objects());

                for (Object *eobj : objectsInRoom)
                {
                    ExtractObject(eobj);
                }
            }

            std::list<std::shared_ptr<ExtraDescription>> extrasInRoom(rid->ExtraDescriptions());

            for (auto eed : extrasInRoom)
            {
                rid->Remove(eed);
            }

            auto mprogActLists(rid->mprog.ActLists());

            for (auto mpact : mprogActLists)
            {
                rid->mprog.Remove(mpact);
                FreeMemory(mpact->buf);
            }

            auto roomProgs(rid->mprog.MudProgs());

            for (auto mprog : roomProgs)
            {
                rid->mprog.Remove(mprog);
                FreeMemory(mprog->arglist);
            }

            if (rid == RoomIndexHash[icnt])
            {
                RoomIndexHash[icnt] = rid->Next;
            }
            else
            {
                std::shared_ptr<Room> trid;

                for (trid = RoomIndexHash[icnt]; trid; trid = trid->Next)
                    if (trid->Next == rid)
                        break;

                if (!trid)
                    Log->Bug("Close_area: room not in hash list %ld", rid->Vnum);
                else
                    trid->Next = rid->Next;
            }
        }

        for (mid = MobIndexHash[icnt]; mid; mid = mid_next)
        {
            mid_next = mid->Next;

            if (mid->Vnum < pArea->VnumRanges.Mob.First
                || mid->Vnum > pArea->VnumRanges.Mob.Last)
                continue;

            if (mid->Shop)
            {
                Shops->Remove(mid->Shop);
            }

            if (mid->RepairShop)
            {
                RepairShops->Remove(mid->RepairShop);
            }

            auto mobProgs(mid->mprog.MudProgs());

            for (auto mprog : mobProgs)
            {
                mid->mprog.Remove(mprog);
                FreeMemory(mprog->arglist);
            }

            if (mid == MobIndexHash[icnt])
            {
                MobIndexHash[icnt] = mid->Next;
            }
            else
            {
                std::shared_ptr<ProtoMobile> tmid;

                for (tmid = MobIndexHash[icnt]; tmid; tmid = tmid->Next)
                    if (tmid->Next == mid)
                        break;

                if (!tmid)
                    Log->Bug("Close_area: mid not in hash list %ld", mid->Vnum);
                else
                    tmid->Next = mid->Next;
            }
        }

        for (oid = ObjectIndexHash[icnt]; oid; oid = oid_next)
        {
            oid_next = oid->Next;

            if (oid->Vnum < pArea->VnumRanges.Object.First
                || oid->Vnum > pArea->VnumRanges.Object.Last)
                continue;

            std::list<std::shared_ptr<ExtraDescription>> extraDescrs(oid->ExtraDescriptions());

            for (auto eed : extraDescrs)
            {
                oid->Remove(eed);
            }

            auto affects(oid->Affects());

            for (auto paf : affects)
            {
                oid->Remove(paf);
            }

            auto objProgs(oid->mprog.MudProgs());

            for (auto mprog : objProgs)
            {
                oid->mprog.Remove(mprog);
                FreeMemory(mprog->arglist);
            }

            if (oid == ObjectIndexHash[icnt])
            {
                ObjectIndexHash[icnt] = oid->Next;
            }
            else
            {
                std::shared_ptr<ProtoObject> toid;

                for (toid = ObjectIndexHash[icnt]; toid; toid = toid->Next)
                    if (toid->Next == oid)
                        break;

                if (!toid)
                    Log->Bug("Close_area: oid not in hash list %ld", oid->Vnum);
                else
                    toid->Next = oid->Next;
            }
        }
    }

    for (std::shared_ptr<Reset> ereset = pArea->FirstReset, ereset_next; ereset; ereset = ereset_next)
    {
        ereset_next = ereset->Next;
    }

    Areas->Remove(pArea);
}

void FreeArea(std::shared_ptr<Area> are)
{
    while (are->FirstReset)
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

void AssignAreaTo(Character *ch)
{
    if (IsNpc(ch))
    {
        return;
    }

    if (GetTrustLevel(ch) >= LEVEL_AVATAR
        && ch->PCData->Build.VnumRanges.Room.First != INVALID_VNUM
        && ch->PCData->Build.VnumRanges.Room.Last != INVALID_VNUM)
    {
        std::shared_ptr<Area> tarea = ch->PCData->Build.Area;

        auto filename = ConvertToLuaFilename(ch->Name);

        if (tarea == nullptr)
        {
            tarea = Find(Areas->AreasInProgress(),
                         [filename](const auto &a)
                         {
                             return StrCmp(filename, a->Filename) == 0;
                         });
        }

        if (tarea == nullptr)
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
    for (std::shared_ptr<Reset> pReset = tarea->FirstReset, pReset_next; pReset; pReset = pReset_next)
    {
        pReset_next = pReset->Next;
        --top_reset;
    }

    tarea->FirstReset = nullptr;
    tarea->LastReset = nullptr;
}
