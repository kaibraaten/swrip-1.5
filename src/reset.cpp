/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

 /*
  * This file relies heavily on the fact that your linked lists are correct,
  * and that pArea->reset_first is the first reset in pArea.  Likewise,
  * pArea->reset_last *MUST* be the last reset in pArea.  Weird and
  * wonderful things will happen if any of your lists are messed up, none
  * of them good.  The most important are your pRoom->contents,
  * pRoom->people, rch->carrying, obj->contains, and pArea->reset_first ..
  * pArea->reset_last.  -- Altrag
  */

#include <array>
#include <cstring>
#include <cctype>
#include <cassert>
#include <cmath>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "exit.hpp"
#include "triggers.hpp"
#include "pcdata.hpp"

static bool IsRoomReset(std::shared_ptr<Reset> pReset, std::shared_ptr<Room> aRoom, std::shared_ptr<Area> pArea);
static void AddObjectReset(std::shared_ptr<Area> pArea, char cm, std::shared_ptr<Object> obj, int v2, int v3, const Plugin *plugin);
static void DeleteReset(std::shared_ptr<Area> pArea, std::shared_ptr<Reset> pReset);
static std::shared_ptr<Reset> FindReset(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom, int num);
static void ListResets(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea,
                       std::shared_ptr<Room> pRoom, int start, int end);
static std::shared_ptr<Reset> FindObjectReset(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea,
                                              std::shared_ptr<Room> pRoom, const std::string &name);
static std::shared_ptr<Reset> FindMobileReset(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea,
                                              std::shared_ptr<Room> pRoom, const std::string &name);
static int GenerateItemLevel(std::shared_ptr<Area> pArea, std::shared_ptr<ProtoObject> pObjIndex);

static std::shared_ptr<Reset> FindReset(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom, int numb)
{
    int num = 0;

    for(auto pReset = pArea->FirstReset; pReset; pReset = pReset->Next)
        if(IsRoomReset(pReset, pRoom, pArea) && ++num >= numb)
            return pReset;

    return nullptr;
}

/* This is one loopy function.  Ugh. -- Altrag */
static bool IsRoomReset(std::shared_ptr<Reset> pReset, std::shared_ptr<Room> aRoom, std::shared_ptr<Area> pArea)
{
    std::shared_ptr<Room> pRoom;
    std::shared_ptr<Reset> reset = nullptr;
    int pr = 0;

    if(!aRoom)
    {
        return true;
    }

    switch(pReset->Command)
    {
    case 'M':
    case 'O':
        pRoom = GetRoom(pReset->Arg3);

        if(!pRoom || pRoom != aRoom)
        {
            return false;
        }

        return true;

    case 'P':
    case 'T':
    case 'H':
        if(pReset->Command == 'H')
        {
            pr = pReset->Arg1;
        }
        else
        {
            pr = pReset->Arg3;
        }

        for(reset = pReset->Previous; reset; reset = reset->Previous)
        {
            if((reset->Command == 'O' || reset->Command == 'P' ||
                reset->Command == 'G' || reset->Command == 'E') &&
               (!pr || pr == reset->Arg1) && GetProtoObject(reset->Arg1))
            {
                break;
            }
        }

        if(reset && IsRoomReset(reset, aRoom, pArea))
        {
            return true;
        }

        return false;

    case 'B':
        switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
        case BIT_RESET_ROOM:
            return (aRoom->Vnum == pReset->Arg1);

        case BIT_RESET_MOBILE:
            for(reset = pReset->Previous; reset; reset = reset->Previous)
            {
                if(reset->Command == 'M' && GetProtoMobile(reset->Arg1))
                {
                    break;
                }
            }

            if(reset && IsRoomReset(reset, aRoom, pArea))
            {
                return true;
            }

            return false;

        case BIT_RESET_OBJECT:
            for(reset = pReset->Previous; reset; reset = reset->Previous)
                if((reset->Command == 'O' || reset->Command == 'P' ||
                    reset->Command == 'G' || reset->Command == 'E') &&
                   (!pReset->Arg1 || pReset->Arg1 == reset->Arg1) &&
                   GetProtoObject(reset->Arg1))
                {
                    break;
                }

            if(reset && IsRoomReset(reset, aRoom, pArea))
            {
                return true;
            }

            return false;
        }

        return false;

    case 'G':
    case 'E':
        for(reset = pReset->Previous; reset; reset = reset->Previous)
        {
            if(reset->Command == 'M' && GetProtoMobile(reset->Arg1))
            {
                break;
            }
        }

        if(reset && IsRoomReset(reset, aRoom, pArea))
        {
            return true;
        }

        return false;

    case 'D':
    case 'R':
        pRoom = GetRoom(pReset->Arg1);

        if(!pRoom || pRoom->Area != pArea || (aRoom && pRoom != aRoom))
        {
            return false;
        }

        return true;

    default:
        return false;
    }

    return false;
}

std::shared_ptr<Room> FindRoom(std::shared_ptr<Character> ch, const std::string &arg, std::shared_ptr<Room> pRoom)
{
    if(pRoom)
    {
        return pRoom;
    }

    if(!IsNumber(arg) && !arg.empty())
    {
        ch->Echo("Reset to which room?\r\n");
        return NULL;
    }

    if(arg.empty())
    {
        pRoom = ch->InRoom;
    }
    else
    {
        pRoom = GetRoom(strtol(arg.c_str(), nullptr, 10));
    }

    if(!pRoom)
    {
        ch->Echo("Room does not exist.\r\n");
        return NULL;
    }

    return pRoom;
}

/* Separate function for recursive purposes */
#define DEL_RESET(area, reset, rprev)           \
  do {                                          \
    rprev = reset->Previous;                        \
    DeleteReset(area, reset);                  \
    reset = rprev;                              \
    continue;                                   \
  } while(0)

static void DeleteReset(std::shared_ptr<Area> pArea, std::shared_ptr<Reset> pReset)
{
    if(pReset->Command == 'M')
    {
        for(std::shared_ptr<Reset> reset = pReset->Next, reset_prev; reset; reset = reset->Next)
        {
            /* Break when a new mob found */
            if(reset->Command == 'M')
            {
                break;
            }

            /* Delete anything mob is holding */
            if(reset->Command == 'G' || reset->Command == 'E')
            {
                DEL_RESET(pArea, reset, reset_prev);
            }

            if(reset->Command == 'B' &&
               (reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_MOBILE &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1))
            {
                DEL_RESET(pArea, reset, reset_prev);
            }
        }
    }
    else if(pReset->Command == 'O' || pReset->Command == 'P' ||
            pReset->Command == 'G' || pReset->Command == 'E')
    {
        for(std::shared_ptr<Reset> reset = pReset->Next, reset_prev; reset; reset = reset->Next)
        {
            if(reset->Command == 'T' &&
               (!reset->Arg3 || reset->Arg3 == pReset->Arg1))
            {
                DEL_RESET(pArea, reset, reset_prev);
            }

            if(reset->Command == 'H' &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1))
            {
                DEL_RESET(pArea, reset, reset_prev);
            }

            /* Delete nested objects, even if they are the same object. */
            if(reset->Command == 'P'
               && (reset->Arg3 > 0 || pReset->Command != 'P' || reset->MiscData - 1 == pReset->MiscData)
               && (!reset->Arg3 || reset->Arg3 == pReset->Arg1))
            {
                DEL_RESET(pArea, reset, reset_prev);
            }

            if(reset->Command == 'B' &&
               (reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_OBJECT &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1))
            {
                DEL_RESET(pArea, reset, reset_prev);
            }

            /* Break when a new object of same type is found */
            if((reset->Command == 'O' || reset->Command == 'P' ||
                reset->Command == 'G' || reset->Command == 'E') &&
               reset->Arg1 == pReset->Arg1)
            {
                break;
            }
        }
    }

    if(pReset == pArea->LastMobReset)
    {
        pArea->LastMobReset = NULL;
    }

    if(pReset == pArea->LastObjectReset)
    {
        pArea->LastObjectReset = NULL;
    }

    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
}
#undef DEL_RESET

static std::shared_ptr<Reset> FindObjectReset(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea,
                                              std::shared_ptr<Room> pRoom, const std::string &name)
{
    std::shared_ptr<Reset> reset = nullptr;

    if(name.empty())
    {
        for(reset = pArea->LastReset; reset; reset = reset->Previous)
        {
            if(!IsRoomReset(reset, pRoom, pArea))
            {
                continue;
            }

            switch(reset->Command)
            {
            default:
                continue;

            case 'O':
            case 'E':
            case 'G':
            case 'P':
                break;
            }

            break;
        }

        if(!reset)
        {
            ch->Echo("No object resets in list.\r\n");
        }

        return reset;
    }
    else
    {
        std::string arg;
        int cnt = 0, num = NumberArgument(name, arg);
        std::shared_ptr<ProtoObject> pObjTo;

        for(reset = pArea->FirstReset; reset; reset = reset->Next)
        {
            if(!IsRoomReset(reset, pRoom, pArea))
            {
                continue;
            }

            switch(reset->Command)
            {
            default:
                continue;

            case 'O':
            case 'E':
            case 'G':
            case 'P':
                break;
            }

            if((pObjTo = GetProtoObject(reset->Arg1)) &&
               IsName(arg, pObjTo->Name) && ++cnt == num)
            {
                break;
            }
        }

        if(!pObjTo || !reset)
        {
            ch->Echo("To object not in reset list.\r\n");
            return NULL;
        }
    }

    return reset;
}

static std::shared_ptr<Reset> FindMobileReset(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea,
                                              std::shared_ptr<Room> pRoom, const std::string &name)
{
    std::shared_ptr<Reset> reset = nullptr;

    if(name.empty())
    {
        for(reset = pArea->LastReset; reset; reset = reset->Previous)
        {
            if(!IsRoomReset(reset, pRoom, pArea))
            {
                continue;
            }

            switch(reset->Command)
            {
            default:
                continue;
            case 'M':
                break;
            }

            break;
        }

        if(!reset)
        {
            ch->Echo("No mobile resets in list.\r\n");
        }

        return reset;
    }
    else
    {
        std::string arg;
        int cnt = 0, num = NumberArgument(name, arg);
        std::shared_ptr<ProtoMobile> pMob;

        for(reset = pArea->FirstReset; reset; reset = reset->Next)
        {
            if(!IsRoomReset(reset, pRoom, pArea))
            {
                continue;
            }

            switch(reset->Command)
            {
            default:
                continue;

            case 'M':
                break;
            }

            if((pMob = GetProtoMobile(reset->Arg1)) &&
               IsName(arg, pMob->Name) && ++cnt == num)
            {
                break;
            }
        }

        if(!pMob || !reset)
        {
            ch->Echo("Mobile not in reset list.\r\n");
            return NULL;
        }
    }

    return reset;
}

static void EditResetShowSyntax(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    const char *nm = aRoom ? "rreset " : "reset ";
    const char *rn = aRoom ? "" : " [room#]";
    ch->Echo("Syntax: %s<list|edit|delete|add|insert|place%s>\r\n",
             nm, (aRoom ? "" : "|area"));
    ch->Echo("Syntax: %sremove <#>\r\n", nm);
    ch->Echo("Syntax: %smobile <mob#> [limit]%s\r\n", nm, rn);
    ch->Echo("Syntax: %sobject <obj#> [limit [room%s]]\r\n", nm, rn);
    ch->Echo("Syntax: %sobject <obj#> give <mob name> [limit]\r\n", nm);
    ch->Echo("Syntax: %sobject <obj#> equip <mob name> <location> [limit]\r\n", nm);
    ch->Echo("Syntax: %sobject <obj#> put <to_obj name> [limit]\r\n", nm);
    ch->Echo("Syntax: %shide <obj name>\r\n", nm);
    ch->Echo("Syntax: %strap <obj name> <type> <charges> <flags>\r\n", nm);
    ch->Echo("Syntax: %strap room <type> <charges> <flags>\r\n", nm);
    ch->Echo("Syntax: %sbit <set|toggle|remove> door%s <dir> <exit flags>\r\n", nm, rn);
    ch->Echo("Syntax: %sbit <set|toggle|remove> object <obj name> <extra flags>\r\n", nm);
    ch->Echo("Syntax: %sbit <set|toggle|remove> mobile <mob name> <affect flags>\r\n", nm);
    ch->Echo("Syntax: %sbit <set|toggle|remove> room%s <room flags>\r\n", nm, rn);
    ch->Echo("Syntax: %srandom <last dir>%s\r\n", nm, rn);

    if(!aRoom)
    {
        ch->Echo("\r\n[room#] will default to the room you are in, if unspecified.\r\n");
    }
}

static void EditResetArea(std::shared_ptr<Character> ch, std::string argument,
                          std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom,
                          const Plugin *plugin)
{
    if(!pArea->FirstReset)
    {
        ch->Echo("You don't have any resets defined.\r\n");
        return;
    }

    int num = pArea->NumberOfPlayers;
    pArea->NumberOfPlayers = 0;
    ResetArea(pArea);
    pArea->NumberOfPlayers = num;
    ch->Echo("Done.\r\n");
}

static void EditResetList(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    int start = 0, end = 0;
    std::string arg;
    argument = OneArgument(argument, arg);
    start = IsNumber(arg) ? ToLong(arg) : -1;

    argument = OneArgument(argument, arg);
    end = IsNumber(arg) ? ToLong(arg) : -1;

    ListResets(ch, pArea, aRoom, start, end);
}

static void EditResetEdit(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !IsNumber(arg))
    {
        ch->Echo("Usage: reset edit <number> <command>\r\n");
        return;
    }

    auto pReset = FindReset(pArea, aRoom, 0);

    if(pReset == nullptr)
    {
        ch->Echo("Reset not found.\r\n");
        return;
    }

    auto reset = ParseReset(pArea, argument, ch);

    if(reset == nullptr)
    {
        ch->Echo("Error in reset. Reset not changed.\r\n");
        return;
    }

    reset->Previous = pReset->Previous;
    reset->Next = pReset->Next;

    if(!pReset->Previous)
    {
        pArea->FirstReset = reset;
    }
    else
    {
        pReset->Previous->Next = reset;
    }

    if(!pReset->Next)
    {
        pArea->LastReset = reset;
    }
    else
    {
        pReset->Next->Previous = reset;
    }

    ch->Echo("Done.\r\n");
}

static void EditResetAdd(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    auto pReset = ParseReset(pArea, argument, ch);

    if(pReset == nullptr)
    {
        ch->Echo("Error in reset. Reset not added.\r\n");
        return;
    }

    AddReset(pArea, pReset->Command, pReset->MiscData, pReset->Arg1,
             pReset->Arg2, pReset->Arg3, plugin);
    ch->Echo("Done.\r\n");
}

static void EditResetPlace(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    auto pReset = ParseReset(pArea, argument, ch);

    if(pReset == nullptr)
    {
        ch->Echo("Error in reset. Reset not added.\r\n");
        return;
    }

    PlaceReset(pArea, pReset->Command, pReset->MiscData, pReset->Arg1,
               pReset->Arg2, pReset->Arg3, plugin);
    ch->Echo("Done.\r\n");
}

static void EditResetInsert(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !IsNumber(arg))
    {
        ch->Echo("Usage: reset insert <number> <command>\r\n");
        return;
    }

    int num = strtol(arg.c_str(), nullptr, 10);
    auto reset = FindReset(pArea, aRoom, num);

    if(reset == nullptr)
    {
        ch->Echo("Reset not found.\r\n");
        return;
    }

    auto pReset = ParseReset(pArea, argument, ch);

    if(pReset == nullptr)
    {
        ch->Echo("Error in reset. Reset not inserted.\r\n");
        return;
    }

    INSERT(pReset, reset, pArea->FirstReset, Next, Previous);
    ch->Echo("Done.\r\n");
}

static void EditResetDelete(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    if(argument.empty())
    {
        ch->Echo("Usage: reset delete <start> [end]\r\n");
        return;
    }

    bool found = false;
    std::string arg;
    argument = OneArgument(argument, arg);
    int start = IsNumber(arg) ? ToLong(arg) : -1;
    int end = IsNumber(arg) ? ToLong(arg) : -1;
    int num = 0;

    for(std::shared_ptr<Reset> pReset = pArea->FirstReset, reset; pReset; pReset = reset)
    {
        reset = pReset->Next;

        if(!IsRoomReset(pReset, aRoom, pArea))
        {
            continue;
        }

        if(start > ++num)
        {
            continue;
        }

        if((end != -1 && num > end) || (end == -1 && found))
        {
            return;
        }

        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);

        if(pReset == pArea->LastMobReset)
        {
            pArea->LastMobReset = NULL;
        }

        top_reset--;
        found = true;
    }

    if(!found)
    {
        ch->Echo("Reset not found.\r\n");
    }
    else
    {
        ch->Echo("Done.\r\n");
    }
}

static void EditResetRemove(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !IsNumber(arg))
    {
        ch->Echo("Delete which reset?\r\n");
        return;
    }

    int iarg = strtol(arg.c_str(), nullptr, 10);
    std::shared_ptr<Reset> pReset;
    int num = 0;

    for(pReset = pArea->FirstReset; pReset; pReset = pReset->Next)
    {
        if(IsRoomReset(pReset, aRoom, pArea) && ++num == iarg)
        {
            break;
        }
    }

    if(!pReset)
    {
        ch->Echo("Reset does not exist.\r\n");
        return;
    }

    DeleteReset(pArea, pReset);
    ch->Echo("Reset deleted.\r\n");
}

static void EditResetMobile(std::shared_ptr<Character> ch, std::string argument,
                            std::shared_ptr<Area> pArea, std::shared_ptr<Room> aRoom,
                            const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !IsNumber(arg))
    {
        ch->Echo("Reset which mobile vnum?\r\n");
        return;
    }

    auto pMob = GetProtoMobile(strtol(arg.c_str(), nullptr, 10));

    if(pMob == nullptr)
    {
        ch->Echo("Mobile does not exist.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);
    int num = 0;

    if(arg.empty())
    {
        num = 1;
    }
    else if(!IsNumber(arg))
    {
        ch->Echo("Reset how many mobiles?\r\n");
        return;
    }
    else
    {
        num = strtol(arg.c_str(), nullptr, 10);
    }

    auto pRoom = FindRoom(ch, argument, aRoom);

    if(pRoom == nullptr)
    {
        return;
    }

    auto pReset = MakeReset('M', 0, pMob->Vnum, num, pRoom->Vnum, plugin);
    LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
    ch->Echo("Mobile reset added.\r\n");
}

static void EditResetObject(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
                            std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !IsNumber(arg))
    {
        ch->Echo("Reset which object vnum?\r\n");
        return;
    }

    auto pObj = GetProtoObject(strtol(arg.c_str(), nullptr, 10));

    if(pObj == nullptr)
    {
        ch->Echo("Object does not exist.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(arg.empty())
        arg = "room";

    if(!StringPrefix(arg, "put"))
    {
        argument = OneArgument(argument, arg);
        auto reset = FindObjectReset(ch, pArea, aRoom, arg);

        if(reset == nullptr)
        {
            return;
        }

        /* Put in_objects after hide and trap resets */
        while(reset->Next && (reset->Next->Command == 'H'
                              || reset->Next->Command == 'T'
                              || reset->Next->Command == 'B'))
        {
            reset = reset->Next;
        }

        argument = OneArgument(argument, arg);
        vnum_t vnum = strtol(arg.c_str(), nullptr, 10);

        if(vnum < 1)
        {
            vnum = 1;
        }

        auto pReset = MakeReset('P', reset->MiscData + 1, pObj->Vnum, vnum, 0, plugin);
        /* Grumble.. insert puts pReset before reset, and we need it after,
           so we make a hackup and reverse all the list params.. :P.. */
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
        ch->Echo("Object reset in object created.\r\n");
    }
    else if(!StringPrefix(arg, "give"))
    {
        argument = OneArgument(argument, arg);
        auto reset = FindMobileReset(ch, pArea, aRoom, arg);

        if(reset == nullptr)
        {
            return;
        }

        while(reset->Next && reset->Next->Command == 'B')
        {
            reset = reset->Next;
        }

        argument = OneArgument(argument, arg);
        vnum_t vnum = strtol(arg.c_str(), nullptr, 10);

        if(vnum < 1)
        {
            vnum = 1;
        }

        auto pReset = MakeReset('G', 1, pObj->Vnum, vnum, 0, plugin);
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
        ch->Echo("Object reset to mobile created.\r\n");
    }
    else if(!StringPrefix(arg, "equip"))
    {
        argument = OneArgument(argument, arg);
        auto reset = FindMobileReset(ch, pArea, aRoom, arg);

        if(reset == nullptr)
        {
            return;
        }

        while(reset->Next && reset->Next->Command == 'B')
        {
            reset = reset->Next;
        }

        int num = GetWearLocation(argument);

        if(num < 0)
        {
            ch->Echo("Reset object to which location?\r\n");
            return;
        }

        for(auto pReset = reset->Next; pReset; pReset = pReset->Next)
        {
            if(pReset->Command == 'M')
            {
                break;
            }

            if(pReset->Command == 'E' && pReset->Arg3 == num)
            {
                ch->Echo("Mobile already has an item equipped there.\r\n");
                return;
            }
        }

        argument = OneArgument(argument, arg);
        vnum_t vnum = strtol(arg.c_str(), nullptr, 10);

        if(vnum < 1)
        {
            vnum = 1;
        }

        auto pReset = MakeReset('E', 1, pObj->Vnum, vnum, num, plugin);
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
        ch->Echo("Object reset equipped by mobile created.\r\n");
    }
    else if(arg.empty() || StrCmp(arg, "room") == 0 || IsNumber(arg))
    {
        if(StrCmp(arg, "room") == 0)
        {
            argument = OneArgument(argument, arg);
        }

        auto pRoom = FindRoom(ch, argument, aRoom);

        if(pRoom == nullptr)
        {
            return;
        }

        if(pRoom->Area != pArea)
        {
            ch->Echo("Cannot reset objects to other areas.\r\n");
            return;
        }

        vnum_t vnum = strtol(arg.c_str(), nullptr, 10);

        if(vnum < 1)
        {
            vnum = 1;
        }

        auto pReset = MakeReset('O', 0, pObj->Vnum, vnum, pRoom->Vnum, plugin);
        LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
        ch->Echo("Object reset added.\r\n");
    }
    else
    {
        ch->Echo("Reset object to where?\r\n");
    }
}

static void EditResetRandom(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
                            std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);
    DirectionType direction = GetDirection(arg);

    if(direction <= DIR_INVALID || direction > DIR_SOUTHWEST)
    {
        ch->Echo("Reset which random doors?\r\n");
        return;
    }

    if(direction == DIR_NORTH)
    {
        ch->Echo("There is no point in randomizing one door.\r\n");
        return;
    }

    auto pRoom = FindRoom(ch, argument, aRoom);

    if(pRoom->Area != pArea)
    {
        ch->Echo("Cannot randomize doors in other areas.\r\n");
        return;
    }

    auto pReset = MakeReset('R', 0, pRoom->Vnum, direction, 0, plugin);
    LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
    ch->Echo("Reset random doors created.\r\n");
}

static void EditResetTrap(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
                          std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string oname;
    std::string arg;
    int extra = 0;
    vnum_t vnum = INVALID_VNUM;
    argument = OneArgument(argument, oname);
    argument = OneArgument(argument, arg);
    int num = IsNumber(arg) ? ToLong(arg) : -1;
    argument = OneArgument(argument, arg);
    const int chrg = IsNumber(arg) ? ToLong(arg) : -1;
    const bool isobj = IsName(argument, "obj") == 0;
    std::shared_ptr<Reset> reset;

    if(isobj == (IsName(argument, "room") == 0))
    {
        ch->Echo("Reset: TRAP: Must specify ROOM or OBJECT\r\n");
        return;
    }

    if(!StrCmp(oname, "room") && !isobj)
    {
        vnum = (aRoom ? aRoom->Vnum : ch->InRoom->Vnum);
        extra = TRAP_ROOM;
    }
    else
    {
        if(IsNumber(oname) && !isobj)
        {
            vnum = ToLong(oname);

            if(!GetRoom(vnum))
            {
                ch->Echo("Reset: TRAP: no such room\r\n");
                return;
            }

            reset = nullptr;
            extra = TRAP_ROOM;
        }
        else
        {
            if(!(reset = FindObjectReset(ch, pArea, aRoom, oname)))
                return;

            vnum = INVALID_VNUM;
            extra = TRAP_OBJ;
        }
    }

    if(num < 1 || num > MAX_TRAPTYPE)
    {
        ch->Echo("Reset: TRAP: invalid trap type\r\n");
        return;
    }

    if(chrg < 0 || chrg > 10000)
    {
        ch->Echo("Reset: TRAP: invalid trap charges\r\n");
        return;
    }

    while(!argument.empty())
    {
        argument = OneArgument(argument, arg);
        int value = GetTrapFlag(arg);

        if(value < 0 || value > 31)
        {
            ch->Echo("Reset: TRAP: bad flag\r\n");
            return;
        }

        SetBit(extra, 1 << value);
    }

    auto pReset = MakeReset('T', extra, num, chrg, vnum, plugin);

    if(reset)
    {
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
    }
    else
    {
        LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
    }
    
    ch->Echo("Trap created.\r\n");
}

static void EditResetBit(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
                         std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::function<int(const std::string &)> getFlag;
    int flags = 0;
    std::string option;
    std::string arg;
    const char *parg = nullptr;
    int num = 0;
    std::shared_ptr<Room> pRoom;
    vnum_t vnum = INVALID_VNUM;
    std::shared_ptr<Reset> reset;

    argument = OneArgument(argument, option);

    if(option.empty())
    {
        ch->Echo("You must specify SET, REMOVE, or TOGGLE.\r\n");
        return;
    }

    if(!StringPrefix(option, "set"))
    {
        SetBit(num, BIT_RESET_SET);
    }
    else if(!StringPrefix(option, "toggle"))
    {
        SetBit(num, BIT_RESET_TOGGLE);
    }
    else if(StringPrefix(option, "remove"))
    {
        ch->Echo("You must specify SET, REMOVE, or TOGGLE.\r\n");
        return;
    }

    argument = OneArgument(argument, option);
    parg = argument.c_str();
    argument = OneArgument(argument, arg);

    if(option.empty())
    {
        ch->Echo("Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n");
        return;
    }
    else if(!StringPrefix(option, "door"))
    {
        SetBit(num, BIT_RESET_DOOR);

        if(aRoom)
        {
            pRoom = aRoom;
            argument = parg;
        }
        else if(!IsNumber(arg))
        {
            pRoom = ch->InRoom;
            argument = parg;
        }
        else if(!(pRoom = FindRoom(ch, arg, aRoom)))
        {
            return;
        }

        argument = OneArgument(argument, arg);

        if(arg.empty())
        {
            ch->Echo("Must specify direction.\r\n");
            return;
        }

        vnum = GetDirection(arg);
        SetBit(num, vnum << BIT_RESET_DOOR_THRESHOLD);
        vnum = pRoom->Vnum;
        getFlag = GetExitFlag;
        reset = nullptr;
    }
    else if(!StringPrefix(option, "object"))
    {
        SetBit(num, BIT_RESET_OBJECT);
        vnum = 0;
        getFlag = GetObjectFlag;

        if(!(reset = FindObjectReset(ch, pArea, aRoom, arg)))
        {
            return;
        }
    }
    else if(!StringPrefix(option, "mobile"))
    {
        SetBit(num, BIT_RESET_MOBILE);
        vnum = 0;
        getFlag = GetAffectFlag;

        if(!(reset = FindMobileReset(ch, pArea, aRoom, arg)))
        {
            return;
        }
    }
    else if(!StringPrefix(option, "room"))
    {
        SetBit(num, BIT_RESET_ROOM);

        if(aRoom)
        {
            pRoom = aRoom;
            argument = parg;
        }
        else if(!IsNumber(arg))
        {
            pRoom = ch->InRoom;
            argument = parg;
        }
        else if(!(pRoom = FindRoom(ch, arg, aRoom)))
        {
            return;
        }

        vnum = pRoom->Vnum;
        getFlag = GetRoomFlag;
        reset = nullptr;
    }
    else
    {
        ch->Echo("Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n");
        return;
    }

    while(!argument.empty())
    {
        argument = OneArgument(argument, arg);
        int value = getFlag(arg);

        if(value < 0)
        {
            ch->Echo("Reset: BIT: bad flag\r\n");
            return;
        }

        SetBit(flags, 1 << value);
    }

    if(!flags)
    {
        ch->Echo("Set which flags?\r\n");
        return;
    }

    auto pReset = MakeReset('B', 1, vnum, num, flags, plugin);

    if(reset)
    {
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
    }
    else
    {
        LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
    }
    
    ch->Echo("Bitvector reset created.\r\n");
}

static void EditResetHide(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
                          std::shared_ptr<Room> aRoom, const Plugin *plugin)
{
    std::string arg;
    argument = OneArgument(argument, arg);
    auto reset = FindObjectReset(ch, pArea, aRoom, arg);

    if(reset == nullptr)
    {
        return;
    }

    auto pReset = MakeReset('H', 1, 0, 0, 0, plugin);
    INSERT(pReset, reset, pArea->LastReset, Previous, Next);
    ch->Echo("Object hide reset created.\r\n");
}

void EditReset(std::shared_ptr<Character> ch, std::string argument, std::shared_ptr<Area> pArea,
               std::shared_ptr<Room> aRoom)
{
    const Plugin *plugin = ch->PCData->Build.Plugin.get();
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty() || !StrCmp(arg, "?"))
    {
        EditResetShowSyntax(ch, argument, pArea, aRoom, plugin);
    }
    else if(!aRoom && !StrCmp(arg, "area"))
    {
        EditResetArea(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "list"))
    {
        EditResetList(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "edit"))
    {
        EditResetEdit(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "add"))
    {
        EditResetAdd(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "place"))
    {
        EditResetPlace(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "insert"))
    {
        EditResetInsert(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "delete"))
    {
        EditResetDelete(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "remove"))
    {
        EditResetRemove(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StringPrefix(arg, "mobile"))
    {
        EditResetMobile(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StringPrefix(arg, "object"))
    {
        EditResetObject(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "random"))
    {
        EditResetRandom(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "trap"))
    {
        EditResetTrap(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "bit"))
    {
        EditResetBit(ch, argument, pArea, aRoom, plugin);
    }
    else if(!StrCmp(arg, "hide"))
    {
        EditResetHide(ch, argument, pArea, aRoom, plugin);
    }
    else
    {
        EditReset(ch, "", pArea, aRoom);
    }
}

static void AddObjectReset(std::shared_ptr<Area> pArea, char cm, std::shared_ptr<Object> obj, int v2, int v3, const Plugin *plugin)
{
    static int iNest;

    if((cm == 'O' || cm == 'P') && obj->Prototype->Vnum == OBJ_VNUM_TRAP)
    {
        if(cm == 'O')
        {
            AddReset(pArea, 'T', obj->Value[OVAL_TRAP_FLAGS], obj->Value[OVAL_TRAP_TYPE], obj->Value[OVAL_TRAP_CHARGE], v3, plugin);
        }

        return;
    }

    AddReset(pArea, cm, (cm == 'P' ? iNest : 1), obj->Prototype->Vnum,
             v2, v3, plugin);

    /* Only add hide for in-room objects that are hidden and cant be moved, as
       hide is an update reset, not a load-only reset. */
    if(cm == 'O'
       && obj->Flags.test(Flag::Obj::Hidden)
       && !obj->WearFlags.test(Flag::Wear::Take))
    {
        AddReset(pArea, 'H', 1, 0, 0, 0, plugin);
    }

    for(auto inobj : obj->Objects())
    {
        if(inobj->Prototype->Vnum == OBJ_VNUM_TRAP)
        {
            AddObjectReset(pArea, 'O', inobj, 0, 0, plugin);
        }
    }

    if(cm == 'P')
    {
        iNest++;
    }

    for(auto inobj : obj->Objects())
    {
        AddObjectReset(pArea, 'P', inobj, 1, 0, plugin);
    }

    if(cm == 'P')
    {
        iNest--;
    }
}

void InstallRoom(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom, bool dodoors,
                 const Plugin *plugin)
{
    for(std::shared_ptr<Character> rch : pRoom->Characters())
    {
        if(!IsNpc(rch))
        {
            continue;
        }

        AddReset(pArea, 'M', 1, rch->Prototype->Vnum, rch->Prototype->Count,
                 pRoom->Vnum, plugin);

        for(auto obj : rch->Objects())
        {
            if(obj->WearLoc == WEAR_NONE)
            {
                AddObjectReset(pArea, 'G', obj, 1, 0, plugin);
            }
            else
            {
                AddObjectReset(pArea, 'E', obj, 1, obj->WearLoc, plugin);
            }
        }
    }

    auto objectsToAddResetsTo = Filter(pRoom->Objects(),
                                       [](auto obj)
                                       {
                                           return obj->ItemType != ITEM_SPACECRAFT;
                                       });

    for(auto obj : objectsToAddResetsTo)
    {
        AddObjectReset(pArea, 'O', obj, 1, pRoom->Vnum, plugin);
    }

    if(dodoors)
    {
        for(std::shared_ptr<Exit> pexit : pRoom->Exits())
        {
            int state = 0;

            if(!pexit->Flags.test(Flag::Exit::IsDoor))
            {
                continue;
            }

            if(pexit->Flags.test(Flag::Exit::Closed))
            {
                if(pexit->Flags.test(Flag::Exit::Locked))
                {
                    state = 2;
                }
                else
                {
                    state = 1;
                }
            }

            AddReset(pArea, 'D', 0, pRoom->Vnum, pexit->Direction, state, plugin);
        }
    }
}

void WipeResets(std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom)
{
    for(auto pReset = pArea->FirstReset; pReset; )
    {
        if(pReset->Command != 'R' && IsRoomReset(pReset, pRoom, pArea))
        {
            /* Resets always go forward, so we can safely use the previous reset,
               providing it exists, or first_reset if it doesnt.  -- Altrag */
            auto prev = pReset->Previous;

            DeleteReset(pArea, pReset);
            pReset = (prev ? prev->Next : pArea->FirstReset);
        }
        else
        {
            pReset = pReset->Next;
        }
    }
}

static int GenerateItemLevel(std::shared_ptr<Area> pArea, std::shared_ptr<ProtoObject> pObjIndex)
{
    int olevel = 0;
    int min = umax(pArea->LevelRanges.Soft.Low, 1);
    int max = umin(pArea->LevelRanges.Soft.High, min + 15);

    if(pObjIndex->Level > 0)
    {
        olevel = umin(pObjIndex->Level, MAX_LEVEL);
    }
    else
    {
        switch(pObjIndex->ItemType)
        {
        default:
            olevel = 0;
            break;

        case ITEM_PILL:
            olevel = GetRandomNumberFromRange(min, max);
            break;

        case ITEM_POTION:
            olevel = GetRandomNumberFromRange(min, max);
            break;

        case ITEM_DEVICE:
            olevel = GetRandomNumberFromRange(min, max);
            break;

        case ITEM_ARMOR:
            olevel = GetRandomNumberFromRange(min + 4, max + 1);
            break;

        case ITEM_WEAPON:
            olevel = GetRandomNumberFromRange(min + 4, max + 1);
            break;
        }
    }

    return olevel;
}

struct BitSetter
{
public:
    void SetTarget(int *flags)
    {
        _legacyTarget = flags;
        _mode = Mode::Legacy;
    }

    void SetTarget(std::bitset<Flag::MAX> *flags)
    {
        _modernTarget = flags;
        _mode = Mode::Modern;
    }

    void Set(int bit)
    {
        if(_mode == Mode::Legacy)
        {
            SetBit(*_legacyTarget, bit);
        }
        else
        {
            (*_modernTarget).set(DecimalToBit(bit));
        }
    }

    void Remove(int bit)
    {
        if(_mode == Mode::Legacy)
        {
            RemoveBit(*_legacyTarget, bit);
        }
        else
        {
            (*_modernTarget).reset(DecimalToBit(bit));
        }
    }

    void Toggle(int bit)
    {
        if(_mode == Mode::Legacy)
        {
            ToggleBit(*_legacyTarget, bit);
        }
        else
        {
            (*_modernTarget).flip(DecimalToBit(bit));
        }
    }

private:
    enum class Mode
    {
        NotSet, Legacy, Modern
    };

    size_t DecimalToBit(int dec)
    {
        return log(dec) / log(2);
    }

    Mode _mode = Mode::NotSet;
    int *_legacyTarget = nullptr;
    std::bitset<Flag::MAX> *_modernTarget = nullptr;
};

/*
 * Reset one area.
 */
void ResetArea(std::shared_ptr<Area> pArea)
{
    assert(pArea != nullptr);

    std::shared_ptr<Character> mob = NULL;
    std::shared_ptr<Object> obj;
    std::shared_ptr<Object> lastobj;
    std::shared_ptr<Room> pRoomIndex;
    std::shared_ptr<ProtoMobile> pMobIndex;
    std::shared_ptr<ProtoObject> pObjIndex;
    std::shared_ptr<ProtoObject> pObjToIndex;
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Object> to_obj;
    int level = 0;
    BitSetter bitsetter;

    if(!pArea->FirstReset)
    {
        return;
    }

    for(std::shared_ptr<Reset> pReset = pArea->FirstReset, next_reset; pReset; pReset = next_reset)
    {
        next_reset = pReset->Next;

        switch(pReset->Command)
        {
        default:
            Log->Bug("%s: %s: bad command %c.", pArea->Filename.c_str(),
                     __FUNCTION__, pReset->Command);
            break;

        case 'M':
            if(!(pMobIndex = GetProtoMobile(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'M': bad mob vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(!(pRoomIndex = GetRoom(pReset->Arg3)))
            {
                Log->Bug("%s: %s: 'M': bad room vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg3);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(pMobIndex->Count >= pReset->Arg2)
            {
                mob = NULL;
                break;
            }

            mob = CreateMobile(pMobIndex);

            {
                auto pRoomPrev = GetRoom(pReset->Arg3 - 1);

                if(pRoomPrev && pRoomPrev->Flags.test(Flag::Room::PetShop))
                {
                    mob->Flags.set(Flag::Mob::Pet);
                }
            }

            if(IsRoomDark(pRoomIndex))
            {
                mob->AffectedBy.set(Flag::Affect::Infrared);
            }

            CharacterToRoom(mob, pRoomIndex);
            EconomizeMobileGold(mob);
            level = urange(0, mob->TopLevel() - 2, LEVEL_AVATAR);

            ImpScriptSpawnTrigger(mob);

            // Check if mob died in spawn trigger (then issue bug log,
            // because having a mob that dies the moment it spawned must
            // be an error.
            if(CharacterDiedRecently(mob))
            {
                Log->Bug("ResetArea: Mob %d died when running spawn trigger.", pReset->Arg1);
            }
            else if(mob->VipFlags != 0 && pArea->Planet)
            {
                pArea->Planet->Population++;
            }

            break;

        case 'G':
        case 'E':
            if(!(pObjIndex = GetProtoObject(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'E' or 'G': bad obj vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(!mob)
            {
                lastobj = NULL;
                break;
            }

            if(mob->Prototype->Shop)
            {
                int olevel = GenerateItemLevel(pArea, pObjIndex);
                obj = CreateObject(pObjIndex, olevel);
                obj->Flags.set(Flag::Obj::Inventory);
            }
            else
            {
                obj = CreateObject(pObjIndex, NumberFuzzy(level));
            }

            obj->Level = urange(0, obj->Level, LEVEL_AVATAR);
            obj = ObjectToCharacter(obj, mob);

            if(pReset->Command == 'E')
            {
                EquipCharacter(mob, obj, (WearLocation)pReset->Arg3);
            }

            lastobj = obj;
            break;

        case 'O':
            if(!(pObjIndex = GetProtoObject(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'O': bad obj vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(!(pRoomIndex = GetRoom(pReset->Arg3)))
            {
                Log->Bug("%s: %s: 'O': bad room vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg3);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(CountOccurrencesOfObjectInList(pObjIndex, pRoomIndex->Objects()) > 0)
            {
                obj = NULL;
                lastobj = NULL;
                break;
            }

            obj = CreateObject(pObjIndex, NumberFuzzy(GenerateItemLevel(pArea, pObjIndex)));
            obj->Level = umin(obj->Level, LEVEL_AVATAR);
            obj->Cost = 0;
            ObjectToRoom(obj, pRoomIndex);
            lastobj = obj;
            ImpScriptSpawnTrigger(obj);
            break;

        case 'P':
            if(!(pObjIndex = GetProtoObject(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'P': bad obj vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(pReset->Arg3 > 0)
            {
                if(!(pObjToIndex = GetProtoObject(pReset->Arg3)))
                {
                    Log->Bug("%s: %s: 'P': bad objto vnum %d.",
                             pArea->Filename.c_str(), __FUNCTION__, pReset->Arg3);

                    if(!bootup)
                    {
                        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                    }

                    continue;
                }

                if(pArea->NumberOfPlayers > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                   !to_obj->InRoom ||
                   CountOccurrencesOfObjectInList(pObjIndex, to_obj->Objects()) > 0)
                {
                    obj = NULL;
                    break;
                }

                lastobj = to_obj;
            }
            else
            {
                int iNest = 0;

                if(!lastobj)
                    break;

                to_obj = lastobj;

                for(iNest = 0; iNest < pReset->MiscData; iNest++)
                {
                    to_obj = !to_obj->Objects().empty() ? to_obj->Objects().back() : nullptr;

                    if(to_obj == nullptr)
                    {
                        Log->Bug("%s: %s: 'P': Invalid nesting obj %d.",
                                 pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);
                        iNest = -1;
                        break;
                    }
                }

                if(iNest < 0)
                {
                    continue;
                }
            }

            obj = CreateObject(pObjIndex, NumberFuzzy(umax(GenerateItemLevel(pArea, pObjIndex), to_obj->Level)));
            obj->Level = umin(obj->Level, LEVEL_AVATAR);
            ObjectToObject(obj, to_obj);
            break;

        case 'T':
            if(IsBitSet(pReset->MiscData, TRAP_OBJ))
            {
                /* We need to preserve obj for future 'T' and 'H' checks */
                std::shared_ptr<Object> pobj;

                if(pReset->Arg3 > 0)
                {
                    if(!(pObjToIndex = GetProtoObject(pReset->Arg3)))
                    {
                        Log->Bug("%s: %s: 'T': bad objto vnum %d.",
                                 pArea->Filename.c_str(), __FUNCTION__, pReset->Arg3);
                        if(!bootup)
                        {
                            UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                        }

                        continue;
                    }

                    if(pArea->NumberOfPlayers > 0 ||
                       !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                       (to_obj->CarriedBy && !IsNpc(to_obj->CarriedBy)) ||
                       IsObjectTrapped(to_obj))
                    {
                        break;
                    }
                }
                else
                {
                    if(!lastobj || !obj)
                    {
                        break;
                    }

                    to_obj = obj;
                }

                pobj = MakeTrap(pReset->Arg2, pReset->Arg1,
                                NumberFuzzy(to_obj->Level), pReset->MiscData);
                ObjectToObject(pobj, to_obj);
            }
            else
            {
                if(!(pRoomIndex = GetRoom(pReset->Arg3)))
                {
                    Log->Bug("%s: %s: 'T': bad room %d.",
                             pArea->Filename.c_str(), __FUNCTION__, pReset->Arg3);

                    if(!bootup)
                    {
                        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                    }

                    continue;
                }

                if(pArea->NumberOfPlayers > 0 ||
                   CountOccurrencesOfObjectInList(GetProtoObject(OBJ_VNUM_TRAP),
                                                  pRoomIndex->Objects()) > 0)
                {
                    break;
                }

                to_obj = MakeTrap(pReset->Arg1, pReset->Arg1, 10, pReset->MiscData);
                ObjectToRoom(to_obj, pRoomIndex);
            }

            break;

        case 'H':
            if(pReset->Arg1 > 0)
            {
                if(!(pObjToIndex = GetProtoObject(pReset->Arg1)))
                {
                    Log->Bug("%s: %s: 'H': bad objto vnum %d.",
                             pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                    if(!bootup)
                    {
                        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                    }

                    continue;
                }

                if(pArea->NumberOfPlayers > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                   !to_obj->InRoom ||
                   to_obj->InRoom->Area != pArea ||
                   to_obj->Flags.test(Flag::Obj::Hidden))
                {
                    break;
                }
            }
            else
            {
                if(!lastobj || !obj)
                {
                    break;
                }

                to_obj = obj;
            }

            to_obj->Flags.set(Flag::Obj::Hidden);
            break;

        case 'B':
            switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
            {
            case BIT_RESET_DOOR:
            {
                DirectionType doornum = DIR_INVALID;

                if(!(pRoomIndex = GetRoom(pReset->Arg1)))
                {
                    Log->Bug("%s: %s: 'B': door: bad room vnum %d.",
                             pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                    if(!bootup)
                    {
                        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                    }

                    continue;
                }

                doornum = (DirectionType)((pReset->Arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD);

                if(!(pexit = GetExit(pRoomIndex, doornum)))
                {
                    break;
                }

                bitsetter.SetTarget(&pexit->Flags);
            }

            break;

            case BIT_RESET_ROOM:
                if(!(pRoomIndex = GetRoom(pReset->Arg1)))
                {
                    Log->Bug("%s: %s: 'B': room: bad room vnum %d.",
                             pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                    if(!bootup)
                    {
                        UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                    }

                    continue;
                }

                bitsetter.SetTarget(&pRoomIndex->Flags);
                break;

            case BIT_RESET_OBJECT:
                if(pReset->Arg1 > 0)
                {
                    if(!(pObjToIndex = GetProtoObject(pReset->Arg1)))
                    {
                        Log->Bug("%s: %s: 'B': object: bad objto vnum %d.",
                                 pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                        if(!bootup)
                        {
                            UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                        }

                        continue;
                    }

                    if(!(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                       !to_obj->InRoom ||
                       to_obj->InRoom->Area != pArea)
                    {
                        continue;
                    }
                }
                else
                {
                    if(!lastobj || !obj)
                    {
                        continue;
                    }

                    to_obj = obj;
                }

                bitsetter.SetTarget(&to_obj->Flags);
                break;

            case BIT_RESET_MOBILE:
                if(!mob)
                {
                    continue;
                }

                bitsetter.SetTarget(&mob->AffectedBy);
                break;

            default:
                Log->Bug("%s: %s: 'B': bad options %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg2);
                continue;
            }

            if(IsBitSet(pReset->Arg2, BIT_RESET_SET))
            {
                bitsetter.Set(pReset->Arg3);
            }
            else if(IsBitSet(pReset->Arg2, BIT_RESET_TOGGLE))
            {
                bitsetter.Toggle(pReset->Arg3);
            }
            else
            {
                bitsetter.Remove(pReset->Arg3);
            }

            break;

        case 'D':
            if(!(pRoomIndex = GetRoom(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'D': bad room vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            if(!(pexit = GetExit(pRoomIndex, (DirectionType)pReset->Arg2)))
            {
                break;
            }

            switch(pReset->Arg3)
            {
            case 0:
                pexit->Flags.reset(Flag::Exit::Closed);
                pexit->Flags.reset(Flag::Exit::Locked);
                break;

            case 1:
                pexit->Flags.set(Flag::Exit::Closed);
                pexit->Flags.reset(Flag::Exit::Locked);

                if(pexit->Flags.test(Flag::Exit::Searchable))
                {
                    pexit->Flags.set(Flag::Exit::Secret);
                }
                break;

            case 2:
                pexit->Flags.set(Flag::Exit::Closed);
                pexit->Flags.set(Flag::Exit::Locked);

                if(pexit->Flags.test(Flag::Exit::Searchable))
                {
                    pexit->Flags.set(Flag::Exit::Secret);
                }

                break;

            }
            break;

        case 'R':
            if(!(pRoomIndex = GetRoom(pReset->Arg1)))
            {
                Log->Bug("%s: %s: 'R': bad room vnum %d.",
                         pArea->Filename.c_str(), __FUNCTION__, pReset->Arg1);

                if(!bootup)
                {
                    UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
                }

                continue;
            }

            RandomizeExits(pRoomIndex, pReset->Arg2 - 1);
            break;
        }
    }
}

static void ListResets(std::shared_ptr<Character> ch, std::shared_ptr<Area> pArea, std::shared_ptr<Room> pRoom,
                       int start, int end)
{
    std::shared_ptr<Room> room;
    std::shared_ptr<ProtoMobile> mob;
    std::shared_ptr<ProtoObject> obj;
    std::shared_ptr<ProtoObject> obj2;
    std::shared_ptr<ProtoObject> lastobj;
    std::shared_ptr<Reset> lo_reset;
    int num = 0;
    std::string rname;
    std::string mname;
    std::string oname;

    if(!ch || !pArea)
    {
        return;
    }

    for(auto pReset = pArea->FirstReset; pReset; pReset = pReset->Next)
    {
        char *pbuf = NULL;
        char buf[256];

        if(!IsRoomReset(pReset, pRoom, pArea))
        {
            continue;
        }

        ++num;
        sprintf(buf, "%2d) ", num);
        pbuf = buf + strlen(buf);

        switch(pReset->Command)
        {
        default:
            sprintf(pbuf, "*** BAD RESET: %c %d %d %d %d ***\r\n",
                    pReset->Command, pReset->MiscData, pReset->Arg1, pReset->Arg2,
                    pReset->Arg3);
            break;

        case 'M':
            if(!(mob = GetProtoMobile(pReset->Arg1)))
                mname = "Mobile: *BAD VNUM*";
            else
                mname = mob->Name;

            if(!(room = GetRoom(pReset->Arg3)))
                rname = "Room: *BAD VNUM*";
            else
                rname = room->Name;

            sprintf(pbuf, "%s (%d) -> %s (%d) [%d]", mname.c_str(), pReset->Arg1, rname.c_str(),
                    pReset->Arg3, pReset->Arg2);

            if(!room)
                mob = NULL;

            if((room = GetRoom(pReset->Arg3 - 1))
               && room->Flags.test(Flag::Room::PetShop))
            {
                strcat(buf, " (pet)\r\n");
            }
            else
            {
                strcat(buf, "\r\n");
            }

            break;

        case 'G':
        case 'E':
            if(!mob)
                mname = "* ERROR: NO MOBILE! *";

            if(!(obj = GetProtoObject(pReset->Arg1)))
                oname = "Object: *BAD VNUM*";
            else
                oname = obj->Name;

            sprintf(pbuf, "%s (%d) -> %s (%s) [%d]", oname.c_str(), pReset->Arg1, mname.c_str(),
                    (pReset->Command == 'G' ? "carry" : WearLocations[pReset->Arg3]),
                    pReset->Arg2);

            if(mob && mob->Shop)
                strcat(buf, " (shop)\r\n");
            else
                strcat(buf, "\r\n");

            lastobj = obj;
            lo_reset = pReset;
            break;

        case 'O':
            if(!(obj = GetProtoObject(pReset->Arg1)))
                oname = "Object: *BAD VNUM*";
            else
                oname = obj->Name;

            if(!(room = GetRoom(pReset->Arg3)))
                rname = "Room: *BAD VNUM*";
            else
                rname = room->Name;

            sprintf(pbuf, "(object) %s (%d) -> %s (%d) [%d]\r\n", oname.c_str(),
                    pReset->Arg1, rname.c_str(), pReset->Arg3, pReset->Arg2);

            if(!room)
                obj = NULL;

            lastobj = obj;
            lo_reset = pReset;
            break;

        case 'P':
            if(!(obj = GetProtoObject(pReset->Arg1)))
                oname = "Object1: *BAD VNUM*";
            else
                oname = obj->Name;

            obj2 = NULL;

            if(pReset->Arg3 > 0)
            {
                obj2 = GetProtoObject(pReset->Arg3);
                rname = (obj2 ? obj2->Name : "Object2: *BAD VNUM*");
                lastobj = obj2;
            }
            else if(!lastobj)
            {
                rname = "Object2: *NULL obj*";
            }
            else if(pReset->MiscData == 0)
            {
                rname = lastobj->Name;
                obj2 = lastobj;
            }
            else
            {
                int iNest;
                auto reset = lo_reset->Next;

                for(iNest = 0; iNest < pReset->MiscData; iNest++)
                {
                    for(; reset; reset = reset->Next)
                        if(reset->Command == 'O' || reset->Command == 'G' ||
                           reset->Command == 'E' || (reset->Command == 'P' &&
                                                     !reset->Arg3 && reset->MiscData == iNest))
                            break;

                    if(!reset || reset->Command != 'P')
                        break;
                }

                if(!reset)
                    rname = "Object2: *BAD NESTING*";
                else if(!(obj2 = GetProtoObject(reset->Arg1)))
                    rname = "Object2: *NESTED BAD VNUM*";
                else
                    rname = obj2->Name;
            }

            sprintf(pbuf, "(Put) %s (%d) -> %s (%ld) [%d] {nest %d}\r\n", oname.c_str(),
                    pReset->Arg1, rname.c_str(), (obj2 ? obj2->Vnum : pReset->Arg3),
                    pReset->Arg2, pReset->MiscData);
            break;

        case 'T':
            sprintf(pbuf, "TRAP: %d %d %d %d (%s)\r\n", pReset->MiscData, pReset->Arg1,
                    pReset->Arg2, pReset->Arg3,
                    FlagString(pReset->MiscData, TrapFlags).c_str());
            break;

        case 'H':
            if(pReset->Arg1 > 0)
                if(!(obj2 = GetProtoObject(pReset->Arg1)))
                    rname = "Object: *BAD VNUM*";
                else
                    rname = obj2->Name;
            else if(!obj)
                rname = "Object: *NULL obj*";
            else
                rname = oname;
            sprintf(pbuf, "Hide %s (%ld)\r\n", rname.c_str(),
                    (pReset->Arg1 > 0 ? pReset->Arg1 : obj ? obj->Vnum : 0));
            break;

        case 'B':
        {
            const char *const *flagarray = nullptr;

            strcpy(pbuf, "BIT: ");
            pbuf += 5;

            if(IsBitSet(pReset->Arg2, BIT_RESET_SET))
            {
                strcpy(pbuf, "Set: ");
                pbuf += 5;
            }
            else if(IsBitSet(pReset->Arg2, BIT_RESET_TOGGLE))
            {
                strcpy(pbuf, "Toggle: ");
                pbuf += 8;
            }
            else
            {
                strcpy(pbuf, "Remove: ");
                pbuf += 8;
            }

            switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
            {
            case BIT_RESET_DOOR:
            {
                DirectionType door;

                if(!(room = GetRoom(pReset->Arg1)))
                    rname = "Room: *BAD VNUM*";
                else
                    rname = room->Name;

                door = (DirectionType)((pReset->Arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD);
                door = (DirectionType)urange(0, door, MAX_DIR + 1);
                sprintf(pbuf, "Exit %s%s (%d), Room %s (%d)",
                        GetDirectionName(door),
                        (room && GetExit(room, door) ? "" : " (NO EXIT!)"), door,
                        rname.c_str(), pReset->Arg1);
            }

            flagarray = ExitFlags.data();
            break;

            case BIT_RESET_ROOM:
                if(!(room = GetRoom(pReset->Arg1)))
                    rname = "Room: *BAD VNUM*";
                else
                    rname = room->Name;

                sprintf(pbuf, "Room %s (%d)", rname.c_str(), pReset->Arg1);
                flagarray = RoomFlags.data();
                break;

            case BIT_RESET_OBJECT:
                if(pReset->Arg1 > 0)
                    if(!(obj2 = GetProtoObject(pReset->Arg1)))
                        rname = "Object: *BAD VNUM*";
                    else
                        rname = obj2->Name;
                else if(!obj)
                    rname = "Object: *NULL obj*";
                else
                    rname = oname;

                sprintf(pbuf, "Object %s (%ld)", rname.c_str(),
                        (pReset->Arg1 > 0 ? pReset->Arg1 : obj ? obj->Vnum : 0));
                flagarray = ObjectFlags.data();
                break;

            case BIT_RESET_MOBILE:
                if(pReset->Arg1 > 0)
                {
                    std::shared_ptr<ProtoMobile> mob2;

                    if(!(mob2 = GetProtoMobile(pReset->Arg1)))
                        rname = "Mobile: *BAD VNUM*";
                    else
                        rname = mob2->Name;
                }
                else if(!mob)
                    rname = "Mobile: *NULL mob*";
                else
                    rname = mname;
                sprintf(pbuf, "Mobile %s (%ld)", rname.c_str(),
                        (pReset->Arg1 > 0 ? pReset->Arg1 : mob ? mob->Vnum : 0));
                flagarray = AffectFlags.data();
                break;

            default:
                sprintf(pbuf, "bad type %d", pReset->Arg2 & BIT_RESET_TYPE_MASK);
                flagarray = NULL;
                break;
            }

            pbuf += strlen(pbuf);

            if(flagarray != NULL)
                sprintf(pbuf, "; flags: %s [%d]\r\n",
                        FlagString(pReset->Arg3, flagarray).c_str(), pReset->Arg3);
            else
                sprintf(pbuf, "; flags %d\r\n", pReset->Arg3);
        }
        break;

        case 'D':
        {
            const char *ef_name;

            pReset->Arg2 = urange(0, pReset->Arg2, MAX_DIR + 1);

            if(!(room = GetRoom(pReset->Arg1)))
                rname = "Room: *BAD VNUM*";
            else
                rname = room->Name;

            switch(pReset->Arg3)
            {
            default:
                ef_name = "(* ERROR *)";
                break;

            case 0:
                ef_name = "Open";
                break;

            case 1:
                ef_name = "Close";
                break;

            case 2:
                ef_name = "Close and lock";
                break;
            }

            sprintf(pbuf, "%s [%d] the %s%s [%d] door %s (%d)\r\n", ef_name,
                    pReset->Arg3, GetDirectionName((DirectionType)pReset->Arg2),
                    (room && GetExit(room, (DirectionType)pReset->Arg2) ? "" : " (NO EXIT!)"),
                    pReset->Arg2, rname.c_str(), pReset->Arg1);
        }
        break;

        case 'R':
            if(!(room = GetRoom(pReset->Arg1)))
                rname = "Room: *BAD VNUM*";
            else
                rname = room->Name;

            sprintf(pbuf, "Randomize exits 0 to %d -> %s (%d)\r\n", pReset->Arg2,
                    rname.c_str(), pReset->Arg1);
            break;
        }

        if(start == -1 || num >= start)
            ch->Echo("%s", buf);

        if(end != -1 && num >= end)
            break;
    }

    if(num == 0)
        ch->Echo("You don't have any resets defined.\r\n");
}

/* Setup put nesting levels, regardless of whether or not the resets will
   actually reset, or if they're bugged. */
void RenumberPutResets(std::shared_ptr<Area> pArea)
{
    for(std::shared_ptr<Reset> pReset = pArea->FirstReset, lastobj; pReset; pReset = pReset->Next)
    {
        switch(pReset->Command)
        {
        default:
            break;

        case 'G':
        case 'E':
        case 'O':
            lastobj = pReset;
            break;

        case 'P':
            if(pReset->Arg3 == 0)
            {
                if(!lastobj)
                    pReset->MiscData = 1000000;
                else if(lastobj->Command != 'P' || lastobj->Arg3 > 0)
                    pReset->MiscData = 0;
                else
                    pReset->MiscData = lastobj->MiscData + 1;

                lastobj = pReset;
            }
        }
    }
}

/*
 * Create a new reset (for online building)                     -Thoric
 */
std::shared_ptr<Reset> MakeReset(char letter, int extra, int arg1, int arg2, int arg3, const Plugin *plugin)
{
    auto pReset = std::make_shared<Reset>();
    pReset->Plugin = plugin;
    pReset->Command = letter;
    pReset->MiscData = extra;
    pReset->Arg1 = arg1;
    pReset->Arg2 = arg2;
    pReset->Arg3 = arg3;
    top_reset++;

    return pReset;
}

/*
 * Add a reset to an area                               -Thoric
 */
std::shared_ptr<Reset> AddReset(std::shared_ptr<Area> tarea,
                                char letter, int extra, int arg1, int arg2, int arg3,
                                const Plugin *plugin)
{
    assert(tarea != nullptr);

    letter = CharToUppercase(letter);
    auto pReset = MakeReset(letter, extra, arg1, arg2, arg3, plugin);
    
    switch(letter)
    {
    case 'M':
        tarea->LastMobReset = pReset;
        break;

    case 'H':
        if(arg1 > 0)
        {
            break;
        }

    case 'E':
    case 'G':
    case 'P':
    case 'O':
        tarea->LastObjectReset = pReset;
        break;

    case 'T':
        if(IsBitSet(extra, TRAP_OBJ) && arg1 == 0)
        {
            tarea->LastObjectReset = pReset;
        }

        break;
    }

    LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);
    return pReset;
}

/*
 * Place a reset into an area, insert sorting it                -Thoric
 */
std::shared_ptr<Reset> PlaceReset(std::shared_ptr<Area> tarea, char letter, int extra, int arg1, int arg2, int arg3,
                                  const Plugin *plugin)
{
    assert(tarea != nullptr);
    std::shared_ptr<Reset> tmp;
    std::shared_ptr<Reset> tmp2;

    letter = CharToUppercase(letter);
    std::shared_ptr<Reset> pReset = MakeReset(letter, extra, arg1, arg2, arg3, plugin);
    
    if(letter == 'M')
    {
        tarea->LastMobReset = pReset;
    }

    if(tarea->FirstReset)
    {
        switch(letter)
        {
        default:
            Log->Bug("%s: Bad reset type %c", __FUNCTION__, letter);
            return NULL;

        case 'D':
        case 'R':
            for(tmp = tarea->LastReset; tmp; tmp = tmp->Previous)
                if(tmp->Command == letter)
                    break;

            if(tmp)    /* organize by location */
            {
                for(; tmp && tmp->Command == letter && tmp->Arg1 > arg1; tmp = tmp->Previous)
                {
                    ;
                }
            }

            if(tmp)    /* organize by direction */
            {
                for(; tmp && tmp->Command == letter && tmp->Arg1 == /*tmp->*/ arg1 && tmp->Arg2 > arg2; tmp = tmp->Previous)
                {
                    ;
                }
            }

            if(tmp)
                INSERT(pReset, tmp, tarea->FirstReset, Next, Previous);
            else
                LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);

            return pReset;

        case 'M':       case 'O':
            /* find last reset of same type */
            for(tmp = tarea->LastReset; tmp; tmp = tmp->Previous)
                if(tmp->Command == letter)
                    break;

            tmp2 = tmp ? tmp->Next : NULL;

            /* organize by location */
            for(; tmp; tmp = tmp->Previous)
                if(tmp->Command == letter && tmp->Arg3 <= arg3)
                {
                    tmp2 = tmp->Next;

                    /* organize by vnum */
                    if(tmp->Arg3 == arg3)
                        for(; tmp; tmp = tmp->Previous)
                            if(tmp->Command == letter
                               && tmp->Arg3 == /*tmp->*/ arg3
                               && tmp->Arg1 <= arg1)
                            {
                                tmp2 = tmp->Next;
                                break;
                            }

                    break;
                }

            /* skip over E or G for that mob */
            if(tmp2 && letter == 'M')
            {
                for(; tmp2; tmp2 = tmp2->Next)
                    if(tmp2->Command != 'E' && tmp2->Command != 'G')
                        break;
            }
            else
                /* skip over P, T or H for that obj */
                if(tmp2 && letter == 'O')
                {
                    for(; tmp2; tmp2 = tmp2->Next)
                        if(tmp2->Command != 'P' && tmp2->Command != 'T'
                           && tmp2->Command != 'H')
                            break;
                }

            if(tmp2)
                INSERT(pReset, tmp2, tarea->FirstReset, Next, Previous);
            else
                LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);

            return pReset;

        case 'G':
        case 'E':
            /* find the last mob */
            if((tmp = tarea->LastMobReset) != NULL)
            {
                /*
                 * See if there are any resets for this mob yet,
                 * put E before G and organize by vnum
                 */
                if(tmp->Next)
                {
                    tmp = tmp->Next;

                    if(tmp && tmp->Command == 'E')
                    {
                        if(letter == 'E')
                            for(; tmp && tmp->Command == 'E' && tmp->Arg1 < arg1; tmp = tmp->Next);
                        else
                            for(; tmp && tmp->Command == 'E'; tmp = tmp->Next);
                    }
                    else
                        if(tmp && tmp->Command == 'G' && letter == 'G')
                            for(; tmp && tmp->Command == 'G' && tmp->Arg1 < arg1; tmp = tmp->Next);

                    if(tmp)
                        INSERT(pReset, tmp, tarea->FirstReset, Next, Previous);
                    else
                        LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);
                }
                else
                    LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);

                return pReset;
            }
            break;

        case 'P':       case 'T':   case 'H':
            /* find the object in question */
            if(((letter == 'P' && arg3 == 0)
                || (letter == 'T' && IsBitSet(extra, TRAP_OBJ) && arg1 == 0)
                || (letter == 'H' && arg1 == 0))
               && (tmp = tarea->LastObjectReset) != NULL)
            {
                if((tmp = tmp->Next) != NULL)
                    INSERT(pReset, tmp, tarea->FirstReset, Next, Previous);
                else
                    LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);

                return pReset;
            }

            for(tmp = tarea->LastReset; tmp; tmp = tmp->Previous)
                if((tmp->Command == 'O' || tmp->Command == 'G'
                    || tmp->Command == 'E' || tmp->Command == 'P')
                   && tmp->Arg1 == arg3)
                {
                    /*
                     * See if there are any resets for this object yet,
                     * put P before H before T and organize by vnum
                     */
                    if(tmp->Next)
                    {
                        tmp = tmp->Next;

                        if(tmp && tmp->Command == 'P')
                        {
                            if(letter == 'P' && tmp->Arg3 == arg3)
                            {
                                for(; tmp && tmp->Command == 'P'
                                    && tmp->Arg3 == arg3
                                    && tmp->Arg1 < arg1;
                                    tmp = tmp->Next)
                                {
                                    ;
                                }
                            }
                            else if(letter != 'T')
                            {
                                for(; tmp
                                    && tmp->Command == 'P'
                                    && tmp->Arg3 == arg3;
                                    tmp = tmp->Next)
                                {
                                    ;
                                }
                            }
                        }
                        else if(tmp && tmp->Command == 'H')
                        {
                            if(letter == 'H' && tmp->Arg3 == arg3)
                            {
                                for(; tmp
                                    && tmp->Command == 'H'
                                    && tmp->Arg3 == arg3
                                    && tmp->Arg1 < arg1;
                                    tmp = tmp->Next)
                                {
                                    ;
                                }
                            }
                            else if(letter != 'H')
                            {
                                for(; tmp
                                    && tmp->Command == 'H'
                                    && tmp->Arg3 == arg3;
                                    tmp = tmp->Next)
                                {
                                    ;
                                }
                            }
                        }
                        else if(tmp && tmp->Command == 'T' && letter == 'T')
                        {
                            for(; tmp
                                && tmp->Command == 'T'
                                && tmp->Arg3 == arg3
                                && tmp->Arg1 < arg1;
                                tmp = tmp->Next)
                            {
                                ;
                            }
                        }

                        if(tmp)
                        {
                            INSERT(pReset, tmp, tarea->FirstReset, Next, Previous);
                        }
                        else
                        {
                            LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);
                        }
                    }
                    else
                    {
                        LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);
                    }

                    return pReset;
                }

            break;
        }
        /* likely a bad reset if we get here... add it anyways */
    }

    LINK(pReset, tarea->FirstReset, tarea->LastReset, Next, Previous);
    return pReset;
}

std::string SPrintReset(std::shared_ptr<Character> ch, std::shared_ptr<Reset> pReset, short num, bool rlist)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char mobname[1024] = { '\0' };
    char roomname[1024] = { '\0' };
    char objname[1024] = { '\0' };
    static std::shared_ptr<Room> room;
    static std::shared_ptr<ProtoObject> obj, obj2;
    static std::shared_ptr<ProtoMobile> mob;
    vnum_t rvnum = INVALID_VNUM;

    if(ch->InRoom)
    {
        rvnum = ch->InRoom->Vnum;
    }

    if(num == 1)
    {
        room = nullptr;
        obj = nullptr;
        obj2 = nullptr;
        mob = nullptr;
    }

    switch(pReset->Command)
    {
    default:
        sprintf(buf, "%2d) *** BAD RESET: %c %d %d %d %d ***\r\n",
                num,
                pReset->Command,
                pReset->MiscData,
                pReset->Arg1,
                pReset->Arg2,
                pReset->Arg3);
        break;

    case 'M':
        mob = GetProtoMobile(pReset->Arg1);
        room = GetRoom(pReset->Arg3);

        if(mob)
            strcpy(mobname, mob->Name.c_str());
        else
            strcpy(mobname, "Mobile: *BAD VNUM*");

        if(room)
            strcpy(roomname, room->Name.c_str());
        else
            strcpy(roomname, "Room: *BAD VNUM*");

        sprintf(buf, "%2d) %s (%d) -> %s (%d) [%d]\r\n",
                num,
                mobname,
                pReset->Arg1,
                roomname,
                pReset->Arg3,
                pReset->Arg2);
        break;

    case 'E':
        if(!mob)
            strcpy(mobname, "* ERROR: NO MOBILE! *");

        if((obj = GetProtoObject(pReset->Arg1)) == NULL)
            strcpy(objname, "Object: *BAD VNUM*");
        else
            strcpy(objname, obj->Name.c_str());

        sprintf(buf, "%2d) %s (%d) -> %s (%s) [%d]\r\n",
                num,
                objname,
                pReset->Arg1,
                mobname,
                WearLocations[pReset->Arg3],
                pReset->Arg2);
        break;

    case 'H':
        if(pReset->Arg1 > 0
           && (obj = GetProtoObject(pReset->Arg1)) == NULL)
            strcpy(objname, "Object: *BAD VNUM*");
        else if(!obj)
            strcpy(objname, "Object: *NULL obj*");

        sprintf(buf, "%2d) Hide %s (%ld)\r\n",
                num,
                objname,
                obj ? obj->Vnum : pReset->Arg1);
        break;

    case 'G':
        if(!mob)
            strcpy(mobname, "* ERROR: NO MOBILE! *");

        if((obj = GetProtoObject(pReset->Arg1)) == NULL)
            strcpy(objname, "Object: *BAD VNUM*");
        else
            strcpy(objname, obj->Name.c_str());

        sprintf(buf, "%2d) %s (%d) -> %s (carry) [%d]\r\n",
                num,
                objname,
                pReset->Arg1,
                mobname,
                pReset->Arg2);
        break;

    case 'O':
        if((obj = GetProtoObject(pReset->Arg1)) == NULL)
            strcpy(objname, "Object: *BAD VNUM*");
        else
            strcpy(objname, obj->Name.c_str());

        room = GetRoom(pReset->Arg3);

        if(!room)
            strcpy(roomname, "Room: *BAD VNUM*");
        else
            strcpy(roomname, room->Name.c_str());

        sprintf(buf, "%2d) (object) %s (%d) -> %s (%d) [%d]\r\n",
                num,
                objname,
                pReset->Arg1,
                roomname,
                pReset->Arg3,
                pReset->Arg2);
        break;

    case 'P':
        obj2 = GetProtoObject(pReset->Arg1);

        if(obj2 == nullptr)
            strcpy(objname, "Object1: *BAD VNUM*");
        else
            strcpy(objname, obj2->Name.c_str());

        if(pReset->Arg3 > 0
           && (obj = GetProtoObject(pReset->Arg3)) == NULL)
            strcpy(roomname, "Object2: *BAD VNUM*");
        else if(!obj)
            strcpy(roomname, "Object2: *NULL obj*");
        else
            strcpy(roomname, obj->Name.c_str());

        sprintf(buf, "%2d) (Put) %s (%d) -> %s (%ld) [%d]\r\n",
                num,
                objname,
                pReset->Arg1,
                roomname,
                obj ? obj->Vnum : pReset->Arg3,
                pReset->Arg2);
        break;

    case 'D':
        if(pReset->Arg2 < 0 || pReset->Arg2 > MAX_DIR + 1)
            pReset->Arg2 = 0;

        if((room = GetRoom(pReset->Arg1)) == NULL)
        {
            strcpy(roomname, "Room: *BAD VNUM*");
            sprintf(objname, "%s (no exit)", GetDirectionName((DirectionType)pReset->Arg2));
        }
        else
        {
            strcpy(roomname, room->Name.c_str());
            sprintf(objname, "%s%s",
                    GetDirectionName((DirectionType)pReset->Arg2),
                    GetExit(room, (DirectionType)pReset->Arg2) ? "" : " (NO EXIT!)");
        }

        switch(pReset->Arg3)
        {
        default:
            strcpy(mobname, "(* ERROR *)");
            break;

        case 0:
            strcpy(mobname, "Open");
            break;

        case 1:
            strcpy(mobname, "Close");
            break;

        case 2:
            strcpy(mobname, "Close and lock");
            break;
        }

        sprintf(buf, "%2d) %s [%d] the %s [%d] door %s (%d)\r\n",
                num,
                mobname,
                pReset->Arg3,
                objname,
                pReset->Arg2,
                roomname,
                pReset->Arg1);
        break;

    case 'R':
        if((room = GetRoom(pReset->Arg1)) == NULL)
            strcpy(roomname, "Room: *BAD VNUM*");
        else
            strcpy(roomname, room->Name.c_str());

        sprintf(buf, "%2d) Randomize exits 0 to %d -> %s (%d)\r\n",
                num,
                pReset->Arg2,
                roomname,
                pReset->Arg1);
        break;

    case 'T':
        sprintf(buf, "%2d) TRAP: %d %d %d %d (%s)\r\n",
                num,
                pReset->MiscData,
                pReset->Arg1,
                pReset->Arg2,
                pReset->Arg3,
                FlagString(pReset->MiscData, TrapFlags).c_str());
        break;
    }

    if(rlist && (!room || (room && room->Vnum != rvnum)))
        return NULL;

    return buf;
}
