/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "skill.hpp"
#include "shop.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"
#include "exit.hpp"
#include "repos/arearepository.hpp"

bool CanModifyRoom(const Character *ch, std::shared_ptr<Room> room)
{
    vnum_t vnum = room->Vnum;
    std::shared_ptr<Area> pArea;

    if (IsNpc(ch))
        return false;

    if (GetTrustLevel(ch) >= SysData.LevelToModifyProto)
        return true;

    if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
    {
        ch->Echo("You must have an assigned area to modify this room.\r\n");
        return false;
    }

    if (vnum >= pArea->VnumRanges.Room.First && vnum <= pArea->VnumRanges.Room.Last)
        return true;

    ch->Echo("That room is not in your allocated range.\r\n");
    return false;
}

bool CanModifyObject(const Character *ch, const Object *obj)
{
    vnum_t vnum = obj->Prototype->Vnum;
    std::shared_ptr<Area> pArea;

    if (IsNpc(ch))
        return false;

    if (GetTrustLevel(ch) >= SysData.LevelToModifyProto)
        return true;

    if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
    {
        ch->Echo("You must have an assigned area to modify this object.\r\n");
        return false;
    }

    if (vnum >= pArea->VnumRanges.Object.First && vnum <= pArea->VnumRanges.Object.Last)
        return true;

    ch->Echo("That object is not in your allocated range.\r\n");
    return false;
}

bool CanModifyCharacter(const Character *ch, const Character *mob)
{
    vnum_t vnum = INVALID_VNUM;
    std::shared_ptr<Area> pArea;

    if (mob == ch)
    {
        return true;
    }

    if (!IsNpc(mob))
    {
        if (GetTrustLevel(ch) >= SysData.LevelToModifyProto && GetTrustLevel(ch) >
            GetTrustLevel(mob))
        {
            return true;
        }
        else
        {
            ch->Echo("You can't do that.\r\n");
        }

        return false;
    }

    vnum = mob->Prototype->Vnum;

    if (IsNpc(ch))
    {
        return false;
    }

    if (GetTrustLevel(ch) >= SysData.LevelToModifyProto)
    {
        return true;
    }

    if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
    {
        ch->Echo("You must have an assigned area to modify this mobile.\r\n");
        return false;
    }

    if (vnum >= pArea->VnumRanges.Mob.First && vnum <= pArea->VnumRanges.Mob.Last)
    {
        return true;
    }

    ch->Echo("That mobile is not in your allocated range.\r\n");
    return false;
}

bool CanMedit(const Character *ch, std::shared_ptr<ProtoMobile> mob)
{
    vnum_t vnum = mob->Vnum;
    std::shared_ptr<Area> pArea;

    if (IsNpc(ch))
    {
        return false;
    }

    if (GetTrustLevel(ch) >= LEVEL_GREATER)
    {
        return true;
    }

    if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
    {
        ch->Echo("You must have an assigned area to modify this mobile.\r\n");
        return false;
    }

    if (vnum >= pArea->VnumRanges.Mob.First
        && vnum <= pArea->VnumRanges.Mob.Last)
    {
        return true;
    }

    ch->Echo("That mobile is not in your allocated range.\r\n");
    return false;
}

void FreeReset(std::shared_ptr<Area> are, std::shared_ptr<Reset> res)
{
    UNLINK(res, are->FirstReset, are->LastReset, Next, Previous);
}

std::shared_ptr<ExtraDescription> SetRExtra(std::shared_ptr<Room> room, const std::string &keywords)
{
    std::shared_ptr<ExtraDescription> ed;
    bool found = false;

    for (auto i = std::begin(room->ExtraDescriptions());
        i != std::end(room->ExtraDescriptions()); ++i)
    {
        ed = *i;

        if (IsName(keywords, ed->Keyword))
        {
            found = true;
            break;
        }
    }

    if (!found)
    {
        ed = std::make_shared<ExtraDescription>();
        room->Add(ed);
        ed->Keyword = keywords;
        top_ed++;
    }

    return ed;
}

bool DelRExtra(std::shared_ptr<Room> room, const std::string &keywords)
{
    std::shared_ptr<ExtraDescription> rmed;
    bool found = false;

    for (auto i = std::begin(room->ExtraDescriptions());
        i != std::end(room->ExtraDescriptions()); ++i)
    {
        rmed = *i;

        if (IsName(keywords, rmed->Keyword))
        {
            found = true;
            break;
        }
    }

    if (!found)
        return false;

    room->Remove(rmed);
    top_ed--;
    return true;
}

std::shared_ptr<ExtraDescription> SetOExtra(Object *obj, const std::string &keywords)
{
    auto ed = Find(obj->ExtraDescriptions(),
        [keywords](auto descr)
    {
        return IsName(keywords, descr->Keyword);
    });

    if (ed == nullptr)
    {
        ed = std::make_shared<ExtraDescription>();
        obj->Add(ed);
        ed->Keyword = keywords;
        top_ed++;
    }

    return ed;
}

bool DelOExtra(Object *obj, const std::string &keywords)
{
    auto rmed = Find(obj->ExtraDescriptions(),
        [keywords](auto ed)
    {
        return IsName(keywords, ed->Keyword);
    });

    if (rmed == nullptr)
    {
        return false;
    }

    obj->Remove(rmed);
    top_ed--;
    return true;
}

std::shared_ptr<ExtraDescription> SetOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords)
{
    auto ed = Find(obj->ExtraDescriptions(),
        [keywords](auto extra)
    {
        return IsName(keywords, extra->Keyword);
    });

    if (ed == nullptr)
    {
        ed = std::make_shared<ExtraDescription>();
        obj->Add(ed);
        ed->Keyword = keywords;
        top_ed++;
    }

    return ed;
}

bool DelOExtraProto(std::shared_ptr<ProtoObject> obj, const std::string &keywords)
{
    auto rmed = Find(obj->ExtraDescriptions(),
        [keywords](auto ed)
    {
        return IsName(keywords, ed->Keyword);
    });

    if (rmed == nullptr)
    {
        return false;
    }

    obj->Remove(rmed);
    top_ed--;
    return true;
}

/*
 * Parse a reset command string into a reset_data structure
 */
std::shared_ptr<Reset> ParseReset(std::shared_ptr<Area> tarea, std::string argument, const Character *ch)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::string arg4;
    char letter = '*';
    int extra = 0;
    int value = 0;
    std::shared_ptr<Room> room;
    std::shared_ptr<Exit> pexit;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);
    argument = OneArgument(argument, arg4);

    int val1 = strtol(arg2.c_str(), nullptr, 10);
    int val2 = strtol(arg3.c_str(), nullptr, 10);
    int val3 = strtol(arg4.c_str(), nullptr, 10);

    if (arg1.empty())
    {
        ch->Echo("Reset commands: mob obj give equip door rand trap hide.\r\n");
        return NULL;
    }

    if (!StrCmp(arg1, "hide"))
    {
        if (!arg2.empty() && !GetProtoObject(val1))
        {
            ch->Echo("Reset: HIDE: no such object\r\n");
            return NULL;
        }
        else
        {
            val1 = 0;
        }

        extra = 1;
        val2 = 0;
        val3 = 0;
        letter = 'H';
    }
    else if (arg2.empty())
    {
        ch->Echo("Reset: not enough arguments.\r\n");
        return NULL;
    }
    else if (val1 < MIN_VNUM || val1 > MAX_VNUM)
    {
        ch->Echo("Reset: value out of range. Must be between %ld and %s.\r\n",
            MIN_VNUM, PunctuateNumber(MAX_VNUM).c_str());
        return NULL;
    }
    else if (!StrCmp(arg1, "mob"))
    {
        if (!GetProtoMobile(val1))
        {
            ch->Echo("Reset: MOB: no such mobile\r\n");
            return NULL;
        }

        if (!GetRoom(val2))
        {
            ch->Echo("Reset: MOB: no such room\r\n");
            return NULL;
        }

        if (val3 < 1)
        {
            val3 = 1;
        }

        letter = 'M';
    }
    else if (!StrCmp(arg1, "obj"))
    {
        if (!GetProtoObject(val1))
        {
            ch->Echo("Reset: OBJ: no such object\r\n");
            return NULL;
        }

        if (!GetRoom(val2))
        {
            ch->Echo("Reset: OBJ: no such room\r\n");
            return NULL;
        }

        if (val3 < 1)
        {
            val3 = 1;
        }

        letter = 'O';
    }
    else if (!StrCmp(arg1, "give"))
    {
        if (!GetProtoObject(val1))
        {
            ch->Echo("Reset: GIVE: no such object\r\n");
            return NULL;
        }

        if (val2 < 1)
        {
            val2 = 1;
        }

        val3 = val2;
        val2 = 0;
        extra = 1;
        letter = 'G';
    }
    else if (!StrCmp(arg1, "equip"))
    {
        if (!GetProtoObject(val1))
        {
            ch->Echo("Reset: EQUIP: no such object\r\n");
            return NULL;
        }

        if (!IsNumber(arg3))
        {
            val2 = GetWearLocation(arg3);
        }

        if (val2 < 0 || val2 >= MAX_WEAR)
        {
            ch->Echo("Reset: EQUIP: invalid wear location\r\n");
            return NULL;
        }

        if (val3 < 1)
        {
            val3 = 1;
        }

        extra = 1;
        letter = 'E';
    }
    else if (!StrCmp(arg1, "put"))
    {
        if (!GetProtoObject(val1))
        {
            ch->Echo("Reset: PUT: no such object\r\n");
            return NULL;
        }

        if (val2 > 0 && !GetProtoObject(val2))
        {
            ch->Echo("Reset: PUT: no such container\r\n");
            return NULL;
        }

        extra = umax(val3, 0);
        argument = OneArgument(argument, arg4);
        val3 = (IsNumber(argument) ? strtol(arg4.c_str(), nullptr, 10) : 0);

        if (val3 < 0)
        {
            val3 = 0;
        }

        letter = 'P';
    }
    else if (!StrCmp(arg1, "door"))
    {
        if ((room = GetRoom(val1)) == NULL)
        {
            ch->Echo("Reset: DOOR: no such room\r\n");
            return NULL;
        }

        if (val2 < DIR_NORTH || val2 > DIR_SOUTHWEST)
        {
            ch->Echo("Reset: DOOR: invalid exit\r\n");
            return NULL;
        }

        if ((pexit = GetExit(room, (DirectionType)val2)) == NULL
            || !pexit->Flags.test(Flag::Exit::IsDoor))
        {
            ch->Echo("Reset: DOOR: no such door\r\n");
            return NULL;
        }

        if (val3 < 0 || val3 > 2)
        {
            ch->Echo("Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n");
            return NULL;
        }

        letter = 'D';
        value = val3;
        val3 = val2;
        val2 = value;
    }
    else if (!StrCmp(arg1, "rand"))
    {
        if (!GetRoom(val1))
        {
            ch->Echo("Reset: RAND: no such room\r\n");
            return NULL;
        }

        if (val2 < DIR_NORTH || val2 > DIR_SOUTHWEST)
        {
            ch->Echo("Reset: RAND: invalid max exit\r\n");
            return NULL;
        }

        val3 = val2;
        val2 = 0;
        letter = 'R';
    }
    else if (!StrCmp(arg1, "trap"))
    {
        if (val2 < 1 || val2 > MAX_TRAPTYPE)
        {
            ch->Echo("Reset: TRAP: invalid trap type\r\n");
            return NULL;
        }

        if (val3 < 0 || val3 > 10000)
        {
            ch->Echo("Reset: TRAP: invalid trap charges\r\n");
            return NULL;
        }

        while (!argument.empty())
        {
            argument = OneArgument(argument, arg4);
            value = GetTrapFlag(arg4);

            if (value >= 0 || value < (int)MAX_BIT)
            {
                SetBit(extra, 1 << value);
            }
            else
            {
                ch->Echo("Reset: TRAP: bad flag\r\n");
                return NULL;
            }
        }

        if (IsBitSet(extra, TRAP_ROOM) && IsBitSet(extra, TRAP_OBJ))
        {
            ch->Echo("Reset: TRAP: Must specify room OR object, not both!\r\n");
            return NULL;
        }

        if (IsBitSet(extra, TRAP_ROOM) && !GetRoom(val1))
        {
            ch->Echo("Reset: TRAP: no such room\r\n");
            return NULL;
        }

        if (IsBitSet(extra, TRAP_OBJ) && val1 > 0 && !GetProtoObject(val1))
        {
            ch->Echo("Reset: TRAP: no such object\r\n");
            return NULL;
        }

        if (!IsBitSet(extra, TRAP_ROOM) && !IsBitSet(extra, TRAP_OBJ))
        {
            ch->Echo("Reset: TRAP: Must specify ROOM or OBJECT\r\n");
            return NULL;
        }

        /* fix order */
        value = val1;
        val1 = val2;
        val2 = value;
        letter = 'T';
    }

    if (letter == '*')
        return NULL;
    else
        return MakeReset(letter, extra, val1, val3, val2);
}

void EditMobProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg,
    int mptype, const std::string &argument)
{
    if (mptype != -1)
    {
        mprg->type = 1 << mptype;

        if (mprg->arglist)
        {
            FreeMemory(mprg->arglist);
        }

        mprg->arglist = CopyString(argument);
    }

    ch->SubState = SUB_MPROG_EDIT;

    StartEditing(ch, mprg->comlist, &mprg->comlist, do_mpedit);
    SetEditorDesc(ch, "MOBPROG script");
}

void EditObjProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg,
    int mptype, const std::string &argument)
{
    if (mptype != -1)
    {
        mprg->type = 1 << mptype;

        if (mprg->arglist)
        {
            FreeMemory(mprg->arglist);
        }

        mprg->arglist = CopyString(argument);
    }

    ch->SubState = SUB_MPROG_EDIT;

    StartEditing(ch, mprg->comlist, &mprg->comlist, do_opedit);
    SetEditorDesc(ch, "OBJPROG script");
}

/*
 * RoomProg Support
 */
void EditRoomProg(Character *ch, std::shared_ptr<MPROG_DATA> mprg,
    int mptype, const std::string &argument)
{
    if (mptype != -1)
    {
        mprg->type = 1 << mptype;

        if (mprg->arglist)
        {
            FreeMemory(mprg->arglist);
        }

        mprg->arglist = CopyString(argument);
    }

    ch->SubState = SUB_MPROG_EDIT;

    StartEditing(ch, mprg->comlist, &mprg->comlist, do_rpedit);
    SetEditorDesc(ch, "ROOMPROG script");
}
