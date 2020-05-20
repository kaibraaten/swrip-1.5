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
 * ------------------------------------------------------------------------ *
 *  The MUDprograms are heavily based on the original MOBprogram code that  *
 *  was written by N'Atas-ha.                                               *
 *  Much has been added, including the capability to put a "program" on     *
 *  rooms and objects, not to mention many more triggers and ifchecks, as   *
 *  well as "script" support.                                               *
 *                                                                          *
 *  Error reporting has been changed to specify whether the offending       *
 *  program is on a mob, a room or and object, along with the vnum.         *
 *                                                                          *
 *  Mudprog parsing has been rewritten (in MudProgDriver). Mprog_process_if  *
 *  and mprog_process_cmnd have been removed, mprog_do_command is new.      *
 *  Full support for nested ifs is in.                                      *
 ****************************************************************************/

#include <unordered_map>
#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "race.hpp"

 /* Defines by Narn for new mudprog parsing, used as
    return values from mprog_do_command. */
#define COMMANDOK    1
#define IFTRUE       2
#define IFFALSE      3
#define ORTRUE       4
#define ORFALSE      5
#define FOUNDELSE    6
#define FOUNDENDIF   7
#define IFIGNORED    8
#define ORIGNORED    9

    /* Ifstate defines, used to create and access ifstate array
       in MudProgDriver. */
#define MAX_IFS     20          /* should always be generous */
#define IN_IF        0
#define IN_ELSE      1
#define DO_IF        2
#define DO_ELSE      3

#define MAX_PROG_NEST   20

bool MOBtrigger = false;

/*
 *  Mudprogram additions
 */
Character *supermob = nullptr;
static std::list<std::shared_ptr<act_prog_data>> room_act_list;
static std::list<std::shared_ptr<act_prog_data>> obj_act_list;
std::list<std::shared_ptr<act_prog_data>> mob_act_list;

/*
 * Local function prototypes
 */
static int MudProgDoCommand(char *cmnd, Character *mob, Character *actor,
    Object *obj, void *vo, Character *rndm,
    bool ignore, bool ignore_ors);
static char *MudProgNextCommand(char* clist);
static bool MudProgCompareStrings(const std::string &lhs, const std::string &opr, const std::string &rhs, Character *mob);
static bool MudProgCompareNumbers(int lhs, const std::string &opr, int rhs, Character *mob);
static int MudProgDoIfCheck(const std::string &ifcheck, Character *mob, Character* actor,
    Object* obj, void* vo, Character* rndm);
static void MudProgTranslate(char ch, char* t, Character *mob,
    Character* actor, Object* obj,
    void* vo, Character* rndm);
static void MudProgDriver(std::string com_list, Character* mob,
    Character* actor, Object* obj,
    void* vo, bool single_step);
static bool MudProgKeywordCheck(const std::string &argu, const std::string &argl);
static void ObjProgWordlistCheck(const std::string &arg, Character *mob, Character *actor, Object *obj, void *vo, int type, Object *iobj);
static void MudProgSetSupermob(Object *obj);
static bool ObjProgPercentCheck(Character *mob, Character *actor, Object *obj, void *vo, int type);
static void RoomProgPercentCheck(Character *mob, Character *actor, Object *obj, void *vo, int type);
static void RoomProgWordlistCheck(const std::string &arg, Character *mob, Character *actor,
    Object *obj, void *vo, int type, std::shared_ptr<Room> room);
static void MobileActAdd(Character *mob);
static void ObjectActAdd(Object *obj);
static void RoomActAdd(std::shared_ptr<Room> room);

/***************************************************************************
 * Local function code and brief comments.
 */

void InitializeSupermob()
{
    supermob = CreateMobile(GetProtoMobile(MOB_VNUM_SUPERMOB));
    auto office = GetRoom(ROOM_VNUM_POLY);
    CharacterToRoom(supermob, office);
}

/* Used to get sequential lines of a multi line string (separated by "\n\r")
 * Thus its like OneArgument(), but a trifle different. It is destructive
 * to the multi line string argument, and thus clist must not be shared.
 */
static char *MudProgNextCommand(char *clist)
{
    char *pointer = clist;

    while (*pointer != '\n' && *pointer != '\r' && !IsNullOrEmpty(pointer))
        pointer++;

    if (*pointer == '\r')
        *pointer++ = '\0';

    if (*pointer == '\n')
        *pointer++ = '\0';

    if (*pointer == '\r')
        *pointer++ = '\0';

    if (*pointer == '\n')
        *pointer++ = '\0';

    return pointer;
}

/* These two functions do the basic evaluation of ifcheck operators.
 *  It is important to note that the string operations are not what
 *  you probably expect.  Equality is exact and division is substring.
 *  remember that lhs has been stripped of leading space, but can
 *  still have trailing spaces so be careful when editing since:
 *  "guard" and "guard " are not equal.
 */
static bool MudProgCompareStrings(const std::string &lhs, const std::string &opr,
    const std::string &rhs, Character *mob)
{
    if (!StrCmp(opr, "=="))
        return !StrCmp(lhs, rhs);

    if (!StrCmp(opr, "!="))
        return StrCmp(lhs, rhs);

    if (!StrCmp(opr, "/"))
        return !StringInfix(rhs, lhs);

    if (!StrCmp(opr, "!/"))
        return StringInfix(rhs, lhs);

    sprintf(log_buf, "Improper MOBprog operator '%s'", opr.c_str());
    ProgBug(log_buf, mob);
    return false;
}

static bool MudProgCompareNumbers(int lhs, const std::string &opr, int rhs, Character *mob)
{
    if (!StrCmp(opr, "=="))
        return lhs == rhs;

    if (!StrCmp(opr, "!="))
        return lhs != rhs;

    if (!StrCmp(opr, ">"))
        return lhs > rhs;

    if (!StrCmp(opr, "<"))
        return lhs < rhs;

    if (!StrCmp(opr, "<="))
        return lhs <= rhs;

    if (!StrCmp(opr, ">="))
        return lhs >= rhs;

    if (!StrCmp(opr, "&"))
        return lhs & rhs;

    if (!StrCmp(opr, "|"))
        return lhs | rhs;

    sprintf(log_buf, "Improper MOBprog operator '%s'", opr.c_str());
    ProgBug(log_buf, mob);

    return false;
}

static int IfCheckRandom(const std::string &cvar)
{
    return GetRandomPercent() <= strtol(cvar.c_str(), nullptr, 10);
}

static int IfCheckEconomy(Character* mob, const std::string &cvar, const std::string &opr, const std::string &rval)
{
    const int idx = strtol(cvar.c_str(), nullptr, 10);
    std::shared_ptr<Room> room;

    if (!idx)
    {
        if (!mob->InRoom)
        {
            ProgBug("'economy' ifcheck: mob in NULL room with no room vnum "
                    "argument", mob);
            return BERR;
        }

        room = mob->InRoom;
    }
    else
    {
        room = GetRoom(idx);
    }

    if (!room)
    {
        ProgBug("Bad room vnum passed to 'economy'", mob);
        return BERR;
    }

    return MudProgCompareNumbers((room->Area->HighEconomy > 0 ? 1000000000 : 0)
                                 + room->Area->LowEconomy, opr, atoi(rval.c_str()), mob);
}

static int IfCheckMobInRoom(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    int vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("Bad vnum to 'mobinroom'", mob);
        return BERR;
    }

    lhsvl = Count(mob->InRoom->Characters(),
                     [vnum](auto oMob)
                     {
                         return IsNpc(oMob) && oMob->Prototype->Vnum == vnum;
                     });
    rhsvl = atoi(rval.c_str());

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckTimesKilled(Character* mob, const std::string &cvar, const std::string &opr, const std::string &rval, const Character* chkchar)
{
    std::shared_ptr<ProtoMobile> pMob;

    if (chkchar)
    {
        pMob = chkchar->Prototype;
    }
    else if ((pMob = GetProtoMobile(atoi(cvar.c_str()))) == nullptr)
    {
        ProgBug("TimesKilled ifcheck: bad vnum", mob);
        return BERR;
    }

    return MudProgCompareNumbers(pMob->Killed, opr, atoi(rval.c_str()), mob);
}

static int IfCheckOVnumHere(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    const vnum_t vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("OvnumHere: bad vnum", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    for (const Object *pObj : mob->InRoom->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOTypeHere(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    ItemTypes type = ITEM_NONE;

    if (IsNumber(cvar))
        type = (ItemTypes)atoi(cvar.c_str());
    else
        type = GetObjectType(cvar);

    if (type < 0 || type > MAX_ITEM_TYPE)
    {
        ProgBug("OtypeHere: bad type", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    for (const Object *pObj : mob->InRoom->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOVnumRoom(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    const vnum_t vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("OvnumRoom: bad vnum", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->InRoom->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOTypeRoom(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    ItemTypes type = ITEM_NONE;

    if (IsNumber(cvar))
    {
        type = (ItemTypes)atoi(cvar.c_str());
    }
    else
    {
        type = GetObjectType(cvar);
    }

    if (type < 0 || type > MAX_ITEM_TYPE)
    {
        ProgBug("OtypeRoom: bad type", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->InRoom->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOVnumCarry(Character *mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    int vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("OvnumCarry: bad vnum", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOTypeCarry(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    ItemTypes type = ITEM_NONE;

    if (IsNumber(cvar))
    {
        type = (ItemTypes)atoi(cvar.c_str());
    }
    else
    {
        type = GetObjectType(cvar);
    }

    if (type < 0 || type > MAX_ITEM_TYPE)
    {
        ProgBug("OtypeCarry: bad type", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (CanSeeObject(mob, pObj) && pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOVnumWear(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    int vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("OvnumWear: bad vnum", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (pObj->WearLoc != WEAR_NONE && CanSeeObject(mob, pObj) &&
            pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
    {
        rhsvl = 1;
    }

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOTypeWear(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    ItemTypes type = ITEM_NONE;

    if (IsNumber(cvar))
        type = static_cast<ItemTypes>(atoi(cvar.c_str()));
    else
        type = GetObjectType(cvar);

    if (type < 0 || type > MAX_ITEM_TYPE)

    {
        ProgBug("OtypeWear: bad type", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (pObj->WearLoc != WEAR_NONE && CanSeeObject(mob, pObj) &&
            pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
        rhsvl = 1;

    if (opr.empty())
        opr = "==";

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOVnumInventory(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    int vnum = atoi(cvar.c_str());

    if (vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ProgBug("OvnumInv: bad vnum", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (pObj->WearLoc == WEAR_NONE && CanSeeObject(mob, pObj) &&
            pObj->Prototype->Vnum == vnum)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
        rhsvl = 1;

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckOTypeInventory(Character* mob, const std::string &cvar, std::string opr, const std::string &rval, int lhsvl, int rhsvl)
{
    ItemTypes type = ITEM_NONE;

    if (IsNumber(cvar))
    {
        type = (ItemTypes)atoi(cvar.c_str());
    }
    else
    {
        type = GetObjectType(cvar);
    }

    if (type < 0 || type > MAX_ITEM_TYPE)
    {
        ProgBug("OtypeInv: bad type", mob);
        return BERR;
    }

    lhsvl = 0;

    for (const Object *pObj : mob->Objects())
    {
        if (pObj->WearLoc == WEAR_NONE && CanSeeObject(mob, pObj) &&
            pObj->ItemType == type)
        {
            lhsvl++;
        }
    }

    rhsvl = IsNumber(rval) ? atoi(rval.c_str()) : -1;

    if (rhsvl < 1)
        rhsvl = 1;

    if (opr.empty())
    {
        opr = "==";
    }

    return MudProgCompareNumbers(lhsvl, opr, rhsvl, mob);
}

static int IfCheckIsAffected(const Character* mob, const std::string &rval, const Character* chkchar)
{
    int value = GetAffectFlag(rval);

    if (value < 0 || static_cast<size_t>(value) >= Flag::MAX)
    {
        ProgBug("Unknown affect being checked", mob);
        return BERR;
    }

    return IsAffectedBy(chkchar, 1 << value);
}

static int IfCheckIsCarrying(const Character* mob, const std::string &opr, const std::string &rval, const Character* chkchar)
{
    int vnum = atoi(rval.c_str());

    if (vnum < 1 || vnum > 2097152000)
    {
        ProgBug("iscarrying: bad vnum", mob);
        return BERR;
    }

    if (StrCmp(opr, "=="))
    {
        ProgBug("iscarrying: bad check: only == supported", mob);
        return BERR;
    }

    for (const Object *pObj : chkchar->Objects())
        if (pObj->Prototype->Vnum == vnum)
            return true;

    return false;
}

static int IfCheckIsWearing(const Character* mob, const std::string &opr, const Character* chkchar, vnum_t vnum)
{
    if (vnum < 1 || vnum > 2097152000)
    {
        ProgBug("iswearing: bad vnum", mob);
        return BERR;
    }

    if (StrCmp(opr, "=="))
    {
        ProgBug("iswearing: bad check: only == supported", mob);
        return BERR;
    }

    for (int iWear = 0; iWear < MAX_WEAR; iWear++)
    {
        for (const Object *pObj : chkchar->Objects())
        {
            if (pObj->WearLoc == (WearLocation)iWear)
            {
                if (pObj->Prototype->Vnum == vnum)
                {
                    return true;
                }
            }
        }
    }

    return false;
}

/* This function performs the evaluation of the if checks.  It is
 * here that you can add any ifchecks which you so desire. Hopefully
 * it is clear from what follows how one would go about adding your
 * own. The syntax for an if check is: ifcheck ( arg ) [opr val]
 * where the parenthesis are required and the opr and val fields are
 * optional but if one is there then both must be. The spaces are all
 * optional. The evaluation of the opr expressions is farmed out
 * to reduce the redundancy of the mammoth if statement list.
 * If there are errors, then return BERR otherwise return boolean 1,0
 * Redone by Altrag.. kill all that big copy-code that performs the
 * same action on each variable..
 */
static int MudProgDoIfCheck(const std::string &ifcheck, Character *mob, Character *actor,
    Object *obj, void *vo, Character *rndm)
{
    char cvar[MAX_INPUT_LENGTH] = {'\0'};
    char chck[MAX_INPUT_LENGTH] = {'\0'};
    char opr[MAX_INPUT_LENGTH] = {'\0'};
    char rval[MAX_INPUT_LENGTH] = {'\0'};
    const char *point = ifcheck.c_str();
    char *pchck = chck;
    Character *chkchar = nullptr;
    Object *chkobj = nullptr;
    int lhsvl = 0, rhsvl = 0;

    if (!*point)
    {
        ProgBug("Null ifcheck", mob);
        return BERR;
    }

    while (*point == ' ')
        point++;

    while (*point != '(')
    {
        if (IsNullOrEmpty(point))
        {
            ProgBug("Ifcheck syntax error", mob);
            return BERR;
        }
        else if (*point == ' ')
        {
            point++;
        }
        else
        {
            *pchck++ = *point++;
        }
    }

    *pchck = '\0';
    point++;
    pchck = cvar;

    while (*point != ')')
    {
        if (IsNullOrEmpty(point))
        {
            ProgBug("Ifcheck syntax error", mob);
            return BERR;
        }
        else if (*point == ' ')
        {
            point++;
        }
        else
        {
            *pchck++ = *point++;
        }
    }

    point++;
    *pchck = '\0';

    while (*point == ' ')
    {
        point++;
    }

    if (!*point)
    {
        opr[0] = '\0';
        rval[0] = '\0';
    }
    else
    {
        pchck = opr;

        while (*point != ' ' && !isalnum(*point))
        {
            if (IsNullOrEmpty(point))
            {
                ProgBug("Ifcheck operator without value", mob);
                return BERR;
            }
            else
            {
                *pchck++ = *point++;
            }
        }

        *pchck = '\0';

        while (*point == ' ')
        {
            point++;
        }

        pchck = rval;

        while (!IsNullOrEmpty(point))
        {
            *pchck++ = *point++;
        }

        *pchck = '\0';
    }

    /* chck contains check, cvar is the variable in the (), opr is the
     * operator if there is one, and rval is the value if there was an
     * operator.
     */
    if (cvar[0] == '$')
    {
        switch (cvar[1])
        {
        case 'i':
            chkchar = mob;
            break;

        case 'n':
            chkchar = actor;
            break;

        case 't':
            chkchar = (Character *)vo;
            break;

        case 'r':
            chkchar = rndm;
            break;

        case 'o':
            chkobj = obj;
            break;

        case 'p':
            chkobj = (Object *)vo;
            break;

        default:
            char message[MAX_STRING_LENGTH];
            sprintf(message, "Bad argument '%c' to '%s'", cvar[0], chck);
            ProgBug(message, mob);
            return BERR;
        }

        if (!chkchar && !chkobj)
        {
            return BERR;
        }
    }

    if (!StrCmp(chck, "rand"))
    {
        return IfCheckRandom(cvar);
    }
    else if (!StrCmp(chck, "economy"))
    {
        return IfCheckEconomy(mob, cvar, opr, rval);
    }
    else if (!StrCmp(chck, "mobinroom"))
    {
        return IfCheckMobInRoom(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "timeskilled"))
    {
        return IfCheckTimesKilled(mob, cvar, opr, rval, chkchar);
    }
    else if (!StrCmp(chck, "ovnumhere"))
    {
        return IfCheckOVnumHere(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "otypehere"))
    {
        return IfCheckOTypeHere(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "ovnumroom"))
    {
        return IfCheckOVnumRoom(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "otyperoom"))
    {
        return IfCheckOTypeRoom(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "ovnumcarry"))
    {
        return IfCheckOVnumCarry(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "otypecarry"))
    {
        return IfCheckOTypeCarry(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "ovnumwear"))
    {
        return IfCheckOVnumWear(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "otypewear"))
    {
        return IfCheckOTypeWear(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "ovnuminv"))
    {
        return IfCheckOVnumInventory(mob, cvar, opr, rval, lhsvl, rhsvl);
    }
    else if (!StrCmp(chck, "otypeinv"))
    {
        return IfCheckOTypeInventory(mob, cvar, opr, rval, lhsvl, rhsvl);
    }

    if (chkchar)
    {
        if (!StrCmp(chck, "ismobinvis"))
        {
            return IsNpc(chkchar) && IsBitSet(chkchar->Flags, ACT_MOBINVIS);
        }
        else if (!StrCmp(chck, "mobinvislevel"))
        {
            return IsNpc(chkchar) ?
                       MudProgCompareNumbers(chkchar->MobInvis, opr, atoi(rval), mob) : false;
        }
        else if (!StrCmp(chck, "ispc"))
        {
            return IsNpc(chkchar) ? false : true;
        }
        else if (!StrCmp(chck, "isnpc"))
        {
            return IsNpc(chkchar) ? true : false;
        }
        else if (!StrCmp(chck, "ismounted"))
        {
            return chkchar->Position == POS_MOUNTED;
        }
        else if (!StrCmp(chck, "isgood"))
        {
            return IsGood(chkchar) ? true : false;
        }
        else if (!StrCmp(chck, "isneutral"))
        {
            return IsNeutral(chkchar) ? true : false;
        }
        else if (!StrCmp(chck, "isevil"))
        {
            return IsEvil(chkchar) ? true : false;
        }
        else if (!StrCmp(chck, "isfight"))
        {
            return GetFightingOpponent(chkchar) ? true : false;
        }
        else if (!StrCmp(chck, "isimmort"))
        {
            return GetTrustLevel(chkchar) >= LEVEL_IMMORTAL;
        }
        else if (!StrCmp(chck, "ischarmed"))
        {
            return IsAffectedBy(chkchar, Flag::Affect::Charm);
        }
        else if (!StrCmp(chck, "isfollow"))
        {
            return chkchar->Master != nullptr &&
                chkchar->Master->InRoom == chkchar->InRoom;
        }
        else if (!StrCmp(chck, "isaffected"))
        {
            return IfCheckIsAffected(mob, rval, chkchar);
        }
        else if (!StrCmp(chck, "hitprcnt"))
        {
            return MudProgCompareNumbers(chkchar->HitPoints.Current / chkchar->HitPoints.Max,
                opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "inroom"))
        {
            return MudProgCompareNumbers(chkchar->InRoom->Vnum, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "wasinroom"))
        {
            return MudProgCompareNumbers(chkchar->WasInRoom->Vnum, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "sex"))
        {
            return MudProgCompareNumbers(chkchar->Sex, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "position"))
        {
            return MudProgCompareNumbers(chkchar->Position, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "ishelled"))
        {
            return IsNpc(actor) ? false :
                MudProgCompareNumbers(chkchar->PCData->ReleaseDate, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "level"))
        {
            return MudProgCompareNumbers(GetTrustLevel(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "goldamt"))
        {
            return MudProgCompareNumbers(chkchar->Gold, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "race"))
        {
            if (IsNpc(chkchar))
            {
                return MudProgCompareStrings(NpcRace[chkchar->Race], opr, rval, mob);
            }

            return MudProgCompareStrings(RaceTable[chkchar->Race].Name, opr,
                rval, mob);
        }
        else if (!StrCmp(chck, "droid"))
        {
            return IsDroid(chkchar);
        }
        else if(!StrCmp(chck, "isjedi"))
        {
            return IsJedi(chkchar);
        }
        else if (!StrCmp(chck, "class"))
        {
            if(IsNpc(chkchar))
            {
                return false;
            }

            std::string abilityName = AbilityName[chkchar->Ability.Main];

            return MudProgCompareStrings(abilityName, opr, rval, mob);
        }
        else if (!StrCmp(chck, "clan"))
        {
            const auto clan = IsNpc(chkchar) ? nullptr : chkchar->PCData->ClanInfo.Clan;

            if (IsNpc(chkchar) || !clan)
                return false;

            bool inClan = MudProgCompareStrings(clan->Name, opr, rval, mob);

            if(!inClan && clan->MainClan)
            {
                inClan = MudProgCompareStrings(clan->MainClan->Name, opr, rval, mob);
            }

            return inClan;
        }
        else if (!StrCmp(chck, "clantype"))
        {
            if (IsNpc(chkchar) || !IsClanned(chkchar))
            {
                return false;
            }

            return MudProgCompareNumbers(chkchar->PCData->ClanInfo.Clan->Type, opr, atoi(rval),
                mob);
        }
        else if (!StrCmp(chck, "str"))
        {
            return MudProgCompareNumbers(GetCurrentStrength(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "wis"))
        {
            return MudProgCompareNumbers(GetCurrentWisdom(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "int"))
        {
            return MudProgCompareNumbers(GetCurrentIntelligence(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "dex"))
        {
            return MudProgCompareNumbers(GetCurrentDexterity(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "con"))
        {
            return MudProgCompareNumbers(GetCurrentConstitution(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "cha"))
        {
            return MudProgCompareNumbers(GetCurrentCharisma(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "lck"))
        {
            return MudProgCompareNumbers(GetCurrentLuck(chkchar), opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "iscarrying"))
        {
            return IfCheckIsCarrying(mob, opr, rval, chkchar);
        }
        else if (!StrCmp(chck, "iswearing"))
        {
            int vnum = atoi(rval);
            return IfCheckIsWearing(mob, opr, chkchar, vnum);
        }
    }

    if (chkobj)
    {
        if (!StrCmp(chck, "objtype"))
        {
            return MudProgCompareNumbers(chkobj->ItemType, opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval0"))
        {
            return MudProgCompareNumbers(chkobj->Value[0], opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval1"))
        {
            return MudProgCompareNumbers(chkobj->Value[1], opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval2"))
        {
            return MudProgCompareNumbers(chkobj->Value[2], opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval3"))
        {
            return MudProgCompareNumbers(chkobj->Value[3], opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval4"))
        {
            return MudProgCompareNumbers(chkobj->Value[4], opr, atoi(rval), mob);
        }
        else if (!StrCmp(chck, "objval5"))
        {
            return MudProgCompareNumbers(chkobj->Value[5], opr, atoi(rval), mob);
        }
    }

    /* The following checks depend on the fact that cval[1] can only contain
       one character, and that NULL checks were made previously. */
    if (!StrCmp(chck, "number"))
    {
        if (chkchar)
        {
            if (!IsNpc(chkchar))
                return false;

            lhsvl = chkchar == mob ? chkchar->Gold : chkchar->Prototype->Vnum;
            return MudProgCompareNumbers(lhsvl, opr, atoi(rval), mob);
        }

        return MudProgCompareNumbers(chkobj->Prototype->Vnum, opr, atoi(rval), mob);
    }

    if (!StrCmp(chck, "name"))
    {
        if (chkchar)
            return MudProgCompareStrings(chkchar->Name, opr, rval, mob);

        return MudProgCompareStrings(chkobj->Name, opr, rval, mob);
    }

    /* Ok... all the ifchecks are done, so if we didnt find ours then something
     * odd happened.  So report the bug and abort the MUDprogram (return error)
     */
    ProgBug("Unknown ifcheck", mob);
    return BERR;
}

/* This routine handles the variables for command expansion.
 * If you want to add any go right ahead, it should be fairly
 * clear how it is done and they are quite easy to do, so you
 * can be as creative as you want. The only catch is to check
 * that your variables exist before you use them. At the moment,
 * using $t when the secondary target refers to an object
 * i.e. >prog_act drops~<nl>if ispc($t)<nl>sigh<nl>endif<nl>~<nl>
 * probably makes the mud crash (vice versa as well) The cure
 * would be to change Act() so that vo becomes vict & v_obj.
 * but this would require a lot of small changes all over the code.
 */

 /*
  *  There's no reason to make the mud crash when a variable's
  *  fubared.  I added some ifs.  I'm willing to trade some
  *  performance for stability. -Haus
  *
  *  Narn's fubar ***ANNIHILATES*** you!  Hmm, could we add that
  *  as a weapon type? -Narn
  *
  *  Added char_died and obj_extracted checks    -Thoric
  */
static void MudProgTranslate(char ch, char *t, Character *mob, Character *actor,
    Object *obj, void *vo, Character *rndm)
{
    static const char *he_she[] = { "it",  "he",  "she" };
    static const char *him_her[] = { "it",  "him", "her" };
    static const char *his_her[] = { "its", "his", "her" };
    Character   *vict = (Character *)vo;
    Object    *v_obj = (Object  *)vo;

    *t = '\0';

    switch (ch)
    {
    case 'i':
        if (mob && !CharacterDiedRecently(mob))
        {
            if (!mob->Name.empty())
            {
                std::string name;
                OneArgument(mob->Name, name);
                strcpy(t, name.c_str());
            }
        }
        else
        {
            strcpy(t, "someone");
        }

        break;

    case 'I':
        if (mob && !CharacterDiedRecently(mob))
        {
            if (!mob->ShortDescr.empty())
            {
                strcpy(t, mob->ShortDescr.c_str());
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "someone");
        }
        break;

    case 'n':
        if (actor && !CharacterDiedRecently(actor))
        {
            std::string name;
            OneArgument(actor->Name, name);
            strcpy(t, name.c_str());

            if (!IsNpc(actor))
                *t = CharToUppercase(*t);
        }
        else
        {
            strcpy(t, "someone");
        }

        break;

    case 'N':
        if (actor && !CharacterDiedRecently(actor))
        {
            if (CanSeeCharacter(mob, actor))
            {
                if (IsNpc(actor))
                {
                    strcpy(t, actor->ShortDescr.c_str());
                }
                else
                {
                    strcpy(t, actor->Name.c_str());
                    strcat(t, actor->PCData->Title.c_str());
                }
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "someone");
        }
        break;

    case 't':
        if (vict && !CharacterDiedRecently(vict))
        {
            std::string name;
            OneArgument(vict->Name, name);
            strcpy(t, name.c_str());

            if (!IsNpc(vict))
            {
                *t = CharToUppercase(*t);
            }
        }
        else
        {
            strcpy(t, "someone");
        }

        break;

    case 'T':
        if (vict && !CharacterDiedRecently(vict))
        {
            if (CanSeeCharacter(mob, vict))
            {
                if (IsNpc(vict))
                {
                    strcpy(t, vict->ShortDescr.c_str());
                }
                else
                {
                    strcpy(t, vict->Name.c_str());
                    strcat(t, " ");
                    strcat(t, vict->PCData->Title.c_str());
                }
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "someone");
        }
        break;

    case 'r':
        if (rndm && !CharacterDiedRecently(rndm))
        {
            std::string name;
            OneArgument(rndm->Name, name);
            strcpy(t, name.c_str());

            if (!IsNpc(rndm))
            {
                *t = CharToUppercase(*t);
            }
        }
        else
        {
            strcpy(t, "someone");
        }
        break;

    case 'R':
        if (rndm && !CharacterDiedRecently(rndm))
        {
            if (CanSeeCharacter(mob, rndm))
            {
                if (IsNpc(rndm))
                {
                    strcpy(t, rndm->ShortDescr.c_str());
                }
                else
                {
                    strcpy(t, rndm->Name.c_str());
                    strcat(t, " ");
                    strcat(t, rndm->PCData->Title.c_str());
                }
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "someone");
        }
        break;

    case 'e':
        if (actor && !CharacterDiedRecently(actor))
        {
            if (CanSeeCharacter(mob, actor))
            {
                strcpy(t, he_she[actor->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'm':
        if (actor && !CharacterDiedRecently(actor))
        {
            if (CanSeeCharacter(mob, actor))
            {
                strcpy(t, him_her[actor->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 's':
        if (actor && !CharacterDiedRecently(actor))
        {
            if (CanSeeCharacter(mob, actor))
            {
                strcpy(t, his_her[actor->Sex]);
            }
            else
            {
                strcpy(t, "someone's");
            }
        }
        else
        {
            strcpy(t, "its'");
        }
        break;

    case 'E':
        if (vict && !CharacterDiedRecently(vict))
        {
            if (CanSeeCharacter(mob, vict))
            {
                strcpy(t, he_she[vict->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'M':
        if (vict && !CharacterDiedRecently(vict))
        {
            if (CanSeeCharacter(mob, vict))
            {
                strcpy(t, him_her[vict->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'S':
        if (vict && !CharacterDiedRecently(vict))
        {
            if (CanSeeCharacter(mob, vict))
            {
                strcpy(t, his_her[vict->Sex]);
            }
            else
            {
                strcpy(t, "someone's");
            }
        }
        else
        {
            strcpy(t, "its'");
        }
        break;

    case 'j':
        if (mob && !CharacterDiedRecently(mob))
        {
            strcpy(t, he_she[mob->Sex]);
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'k':
        if (mob && !CharacterDiedRecently(mob))
        {
            strcpy(t, him_her[mob->Sex]);
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'l':
        if (mob && !CharacterDiedRecently(mob))
        {
            strcpy(t, his_her[mob->Sex]);
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'J':
        if (rndm && !CharacterDiedRecently(rndm))
        {
            if (CanSeeCharacter(mob, rndm))
            {
                strcpy(t, he_she[rndm->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "it");
        }
        break;

    case 'K':
        if (rndm && !CharacterDiedRecently(rndm))
        {
            if (CanSeeCharacter(mob, rndm))
            {
                strcpy(t, him_her[rndm->Sex]);
            }
            else
            {
                strcpy(t, "someone's");
            }
        }
        else
        {
            strcpy(t, "its'");
        }
        break;

    case 'L':
        if (rndm && !CharacterDiedRecently(rndm))
        {
            if (CanSeeCharacter(mob, rndm))
            {
                strcpy(t, his_her[rndm->Sex]);
            }
            else
            {
                strcpy(t, "someone");
            }
        }
        else
        {
            strcpy(t, "its");
        }
        break;

    case 'o':
        if (obj && !IsObjectExtracted(obj))
        {
            if (CanSeeObject(mob, obj))
            {
                std::string name;
                OneArgument(obj->Name, name);
                strcpy(t, name.c_str());
            }
            else
            {
                strcpy(t, "something");
            }
        }
        else
        {
            strcpy(t, "something");
        }
        break;

    case 'O':
        if (obj && !IsObjectExtracted(obj))
        {
            if (CanSeeObject(mob, obj))
            {
                strcpy(t, obj->ShortDescr.c_str());
            }
            else
            {
                strcpy(t, "something");
            }
        }
        else
        {
            strcpy(t, "something");
        }
        break;

    case 'p':
        if (v_obj && !IsObjectExtracted(v_obj))
        {
            if (CanSeeObject(mob, v_obj))
            {
                std::string name;
                OneArgument(v_obj->Name, name);
                strcpy(t, name.c_str());
            }
            else
            {
                strcpy(t, "something");
            }
        }
        else
        {
            strcpy(t, "something");
        }
        break;

    case 'P':
        if (v_obj && !IsObjectExtracted(v_obj))
        {
            if (CanSeeObject(mob, v_obj))
            {
                strcpy(t, v_obj->ShortDescr.c_str());
            }
            else
            {
                strcpy(t, "something");
            }
        }
        else
        {
            strcpy(t, "something");
        }
        break;

    case 'a':
        if (obj && !IsObjectExtracted(obj))
        {
            strcpy(t, AOrAn(obj->Name).c_str());
        }
        else
        {
            strcpy(t, "a");
        }
        break;

    case 'A':
        if (v_obj && !IsObjectExtracted(v_obj))
        {
            strcpy(t, AOrAn(v_obj->Name).c_str());
        }
        else
        {
            strcpy(t, "a");
        }
        break;

    case '$':
        strcpy(t, "$");
        break;

    default:
        ProgBug("Bad $var", mob);
        break;
    }
}

/*  The main focus of the MOBprograms.  This routine is called
 *  whenever a trigger is successful.  It is responsible for parsing
 *  the command list and figuring out what to do. However, like all
 *  complex procedures, everything is farmed out to the other guys.
 *
 *  This function rewritten by Narn for Realms of Despair, Dec/95.
 *
 */
static void MudProgDriver(std::string com_list, Character *mob, Character *actor,
    Object *obj, void *vo, bool single_step)
{
    char tmpcmndlst[MAX_STRING_LENGTH];
    char *command_list = nullptr;
    char *cmnd = nullptr;
    Character *rndm = nullptr;
    int count = 0;
    int ignorelevel = 0;
    int iflevel = 0, result = 0;
    bool ifstate[MAX_IFS][DO_ELSE + 1];
    static int prog_nest = 0;

    if (IsAffectedBy(mob, Flag::Affect::Charm))
    {
        return;
    }

    /* Next couple of checks stop program looping. -- Altrag */
    if (mob == actor)
    {
        ProgBug("triggering oneself.", mob);
        return;
    }

    if (++prog_nest > MAX_PROG_NEST)
    {
        ProgBug("max_prog_nest exceeded.", mob);
        --prog_nest;
        return;
    }

    /* Make sure all ifstate bools are set to false */
    for (iflevel = 0; iflevel < MAX_IFS; iflevel++)
    {
        for (count = 0; count < DO_ELSE; count++)
        {
            ifstate[iflevel][count] = false;
        }
    }

    iflevel = 0;

    /*
     * get a random visible player who is in the room with the mob.
     *
     *  If there isn't a random player in the room, rndm stays NULL.
     *  If you do a $r, $R, $j, or $k with rndm = NULL, you'll crash
     *  in MudProgTranslate.
     *
     *  Adding appropriate error checking in MudProgTranslate.
     *    -Haus
     *
     * This used to ignore players MAX_LEVEL - 3 and higher (standard
     * Merc has 4 immlevels).  Thought about changing it to ignore all
     * imms, but decided to just take it out.  If the mob can see you,
     * you may be chosen as the random player. -Narn
     *
     */

    count = 0;

    for (Character *vch : mob->InRoom->Characters())
    {
        if (!IsNpc(vch))
        {
            if (GetRandomNumberFromRange(0, count) == 0)
            {
                rndm = vch;
            }

            count++;
        }
    }

    strcpy(tmpcmndlst, com_list.c_str());
    command_list = tmpcmndlst;

    if (single_step)
    {
        if (mob->mprog.mpscriptpos > (int)strlen(tmpcmndlst))
        {
            mob->mprog.mpscriptpos = 0;
        }
        else
        {
            command_list += mob->mprog.mpscriptpos;
        }

        if (IsNullOrEmpty(command_list))
        {
            command_list = tmpcmndlst;
            mob->mprog.mpscriptpos = 0;
        }
    }

    /* From here on down, the function is all mine.  The original code
       did not support nested ifs, so it had to be redone.  The max
       logiclevel (MAX_IFS) is defined at the beginning of this file,
       use it to increase/decrease max allowed nesting.  -Narn
    */

    while (true)
    {
        /* With these two lines, cmnd becomes the current line from the prog,
           and command_list becomes everything after that line. */
        cmnd = command_list;
        command_list = MudProgNextCommand(command_list);

        /* Are we at the end? */
        if (IsNullOrEmpty(cmnd))
        {
            if (ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE])
            {
                ProgBug("Missing endif", mob);
            }

            --prog_nest;
            return;
        }

        /* Evaluate/execute the command, check what happened. */
        result = MudProgDoCommand(cmnd, mob, actor, obj, vo, rndm,
                                  (ifstate[iflevel][IN_IF] && !ifstate[iflevel][DO_IF])
                                  || (ifstate[iflevel][IN_ELSE] && !ifstate[iflevel][DO_ELSE]),
                                  ignorelevel > 0);

        /* Script prog support  -Thoric */
        if (single_step)
        {
            mob->mprog.mpscriptpos = command_list - tmpcmndlst;
            --prog_nest;
            return;
        }

        /* This is the complicated part.  Act on the returned value from
           MudProgDoCommand according to the current logic state. */
        switch (result)
        {
        case COMMANDOK:
            /* Ok, this one's a no-brainer. */
            continue;
            break;

        case IFTRUE:
            /* An if was evaluated and found true.  Note that we are in an
               if section and that we want to execute it. */
            iflevel++;

            if (iflevel == MAX_IFS)
            {
                ProgBug("Maximum nested ifs exceeded", mob);
                --prog_nest;
                return;
            }

            ifstate[iflevel][IN_IF] = true;
            ifstate[iflevel][DO_IF] = true;
            break;

        case IFFALSE:
            /* An if was evaluated and found false.  Note that we are in an
               if section and that we don't want to execute it unless we find
               an or that evaluates to true. */
            iflevel++;

            if (iflevel == MAX_IFS)
            {
                ProgBug("Maximum nested ifs exceeded", mob);
                --prog_nest;
                return;
            }

            ifstate[iflevel][IN_IF] = true;
            ifstate[iflevel][DO_IF] = false;
            break;

        case ORTRUE:
            /* An or was evaluated and found true.  We should already be in an
               if section, so note that we want to execute it. */
            if (!ifstate[iflevel][IN_IF])
            {
                ProgBug("Unmatched or", mob);
                --prog_nest;
                return;
            }

            ifstate[iflevel][DO_IF] = true;
            break;

        case ORFALSE:
            /* An or was evaluated and found false.  We should already be in an
               if section, and we don't need to do much.  If the if was true or
               there were/will be other ors that evaluate(d) to true, they'll set
               do_if to true. */
            if (!ifstate[iflevel][IN_IF])
            {
                ProgBug("Unmatched or", mob);
                --prog_nest;
                return;
            }

            continue;
            break;

        case FOUNDELSE:
            /* Found an else.  Make sure we're in an if section, bug out if not.
               If this else is not one that we wish to ignore, note that we're now
               in an else section, and look at whether or not we executed the if
               section to decide whether to execute the else section.  Ca marche
               bien. */
            if (ignorelevel > 0)
            {
                continue;
            }

            if (ifstate[iflevel][IN_ELSE])
            {
                ProgBug("Found else in an else section", mob);
                --prog_nest;
                return;
            }

            if (!ifstate[iflevel][IN_IF])
            {
                ProgBug("Unmatched else", mob);
                --prog_nest;
                return;
            }

            ifstate[iflevel][IN_ELSE] = true;
            ifstate[iflevel][DO_ELSE] = !ifstate[iflevel][DO_IF];
            ifstate[iflevel][IN_IF] = false;
            ifstate[iflevel][DO_IF] = false;

            break;

        case FOUNDENDIF:
            /* Hmm, let's see... FOUNDENDIF must mean that we found an endif.
               So let's make sure we were expecting one, return if not.  If this
               endif matches the if or else that we're executing, note that we are
               now no longer executing an if.  If not, keep track of what we're
               ignoring. */
            if (!(ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE]))
            {
                ProgBug("Unmatched endif", mob);
                --prog_nest;
                return;
            }

            if (ignorelevel > 0)
            {
                ignorelevel--;
                continue;
            }

            ifstate[iflevel][IN_IF] = false;
            ifstate[iflevel][DO_IF] = false;
            ifstate[iflevel][IN_ELSE] = false;
            ifstate[iflevel][DO_ELSE] = false;

            iflevel--;
            break;

        case IFIGNORED:
            if (!(ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE]))
            {
                ProgBug("Parse error, ignoring if while not in if or else", mob);
                --prog_nest;
                return;
            }

            ignorelevel++;
            break;

        case ORIGNORED:
            if (!(ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE]))
            {
                ProgBug("Unmatched or", mob);
                --prog_nest;
                return;
            }

            if (ignorelevel == 0)
            {
                ProgBug("Parse error, mistakenly ignoring or", mob);
                --prog_nest;
                return;
            }

            break;

        case BERR:
            --prog_nest;
            return;
            break;
        }
    }

    --prog_nest;
}

/* This function replaces mprog_process_cmnd.  It is called from
 * MudProgDriver, once for each line in a mud prog.  This function
 * checks what the line is, executes if/or checks and calls Interpret
 * to perform the the commands.  Written by Narn, Dec 95.
 */
static int MudProgDoCommand(char *cmnd, Character *mob, Character *actor,
    Object *obj, void *vo, Character *rndm,
    bool ignore, bool ignore_ors)
{
    /* Isolate the first word of the line, it gives us a clue what
       we want to do. */
    std::string firstword;
    std::string ifcheck = OneArgument(cmnd, firstword);
    int validif = 0;

    if (!StrCmp(firstword, "if"))
    {
        /* Ok, we found an if.  According to the boolean 'ignore', either
           ignore the ifcheck and report that back to MudProgDriver or do
           the ifcheck and report whether it was successful. */
        if (ignore)
            return IFIGNORED;
        else
            validif = MudProgDoIfCheck(ifcheck, mob, actor, obj, vo, rndm);

        if (validif == 1)
            return IFTRUE;

        if (validif == 0)
            return IFFALSE;

        return BERR;
    }

    if (!StrCmp(firstword, "or"))
    {
        /* Same behavior as with ifs, but use the boolean 'ignore_ors' to
           decide which way to go. */
        if (ignore_ors)
            return ORIGNORED;
        else
            validif = MudProgDoIfCheck(ifcheck, mob, actor, obj, vo, rndm);

        if (validif == 1)
            return ORTRUE;

        if (validif == 0)
            return ORFALSE;

        return BERR;
    }

    /* For else and endif, just report back what we found.  Mprog_driver
       keeps track of logiclevels. */
    if (!StrCmp(firstword, "else"))
    {
        return FOUNDELSE;
    }

    if (!StrCmp(firstword, "endif"))
    {
        return FOUNDENDIF;
    }

    /* Ok, didn't find an if, an or, an else or an endif.
       If the command is in an if or else section that is not to be
       performed, the boolean 'ignore' is set to true and we just
       return.  If not, we try to execute the command. */

    if (ignore)
        return COMMANDOK;

    /* If the command is 'break', that's all folks. */
    if (!StrCmp(firstword, "break"))
        return BERR;

    char buf[MAX_INPUT_LENGTH] = { '\0' };
    char *point = buf;
    const char *str = cmnd;

    /* This chunk of code taken from mprog_process_cmnd. */
    while (!IsNullOrEmpty(str))
    {
        if (*str != '$')
        {
            *point++ = *str++;
            continue;
        }

        str++;
        char tmp[MAX_INPUT_LENGTH] = { '\0' };
        MudProgTranslate(*str, tmp, mob, actor, obj, vo, rndm);
        const char *i = tmp;
        ++str;

        while ((*point = *i) != '\0')
        {
            ++point, ++i;
        }
    }

    *point = '\0';

    Interpret(mob, buf);

    /* If the mob is mentally unstable and does things like fireball
       itself, let's make sure it's still alive. */
    if (CharacterDiedRecently(mob))
    {
        return BERR;
    }

    return COMMANDOK;
}

/***************************************************************************
 * Global function code and brief comments.
 */

static bool MudProgKeywordCheck(const std::string &argu, const std::string &argl)
{
    std::string word;
    char arg1[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    size_t i = 0;
    char *arg = nullptr, *arglist = nullptr;
    char *start = nullptr, *end = nullptr;

    strcpy(arg1, ToLower(argu).c_str());
    arg = arg1;
    strcpy(arg2, ToLower(argl).c_str());
    arglist = arg2;

    for (i = 0; i < strlen(arglist); i++)
        arglist[i] = CharToLowercase(arglist[i]);

    for (i = 0; i < strlen(arg); i++)
        arg[i] = CharToLowercase(arg[i]);

    if (arglist[0] == 'p' && arglist[1] == ' ')
    {
        arglist += 2;

        while ((start = strstr(arg, arglist)))
        {
            if ((start == arg || *(start - 1) == ' ')
                && (*(end = start + strlen(arglist)) == ' '
                    || *end == '\n'
                    || *end == '\r'
                    || *end == '\0'))
            {
                return true;
            }
            else
            {
                arg = start + 1;
            }
        }
    }
    else
    {
        std::string stl_arglist = OneArgument(arglist, word);

        for (; !word.empty(); stl_arglist = OneArgument(arglist, word))
        {
            strcpy(arglist, stl_arglist.c_str());

            while ((start = strstr(arg, word.c_str())))
            {
                if ((start == arg || *(start - 1) == ' ')
                    && (*(end = start + word.size()) == ' '
                        || *end == '\n'
                        || *end == '\r'
                        || *end == '\0'))
                {
                    return true;
                }
                else
                {
                    arg = start + 1;
                }
            }
        }
    }

    return false;
}

/* The next two routines are the basic trigger types. Either trigger
 *  on a certain percent, or trigger on a keyword or word phrase.
 *  To see how this works, look at the various trigger routines..
 */
void MobProgWordlistCheck(const std::string &arg, Character *mob, Character *actor,
    Object *obj, void *vo, int type)
{
    for (auto mprg : mob->Prototype->mprog.MudProgs())
    {
        if (mprg->type & type)
        {
            char temp1[MAX_STRING_LENGTH];
            strcpy(temp1, mprg->arglist);
            char *list = temp1;

            for (size_t i = 0; i < strlen(list); i++)
            {
                list[i] = CharToLowercase(list[i]);
            }

            char temp2[MAX_INPUT_LENGTH];
            strcpy(temp2, arg.c_str());
            char *dupl = temp2;

            for (size_t i = 0; i < strlen(dupl); i++)
            {
                dupl[i] = CharToLowercase(dupl[i]);
            }

            if (list[0] == 'p' && list[1] == ' ')
            {
                char *start = nullptr;
                list += 2;

                while ((start = strstr(dupl, list)))
                {
                    const char *end = start + strlen(list);

                    if ((start == dupl || *(start - 1) == ' ')
                        && (*end == ' '
                            || *end == '\n'
                            || *end == '\r'
                            || *end == '\0'))
                    {
                        MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                        break;
                    }
                    else
                    {
                        dupl = start + 1;
                    }
                }
            }
            else
            {
                std::string word;
                std::string stl_list = OneArgument(list, word);

                for (; !word.empty(); stl_list = OneArgument(list, word))
                {
                    strcpy(list, stl_list.c_str());

                    char *start = nullptr;

                    while ((start = strstr(dupl, word.c_str())))
                    {
                        char *end = start + word.size();

                        if ((start == dupl || *(start - 1) == ' ')
                            && (*end == ' '
                                || *end == '\n'
                                || *end == '\r'
                                || *end == '\0'))
                        {
                            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                            break;
                        }
                        else
                        {
                            dupl = start + 1;
                        }
                    }
                }
            }
        }
    }
}

void MobProgPercentCheck(Character *mob, Character *actor, Object *obj,
    void *vo, int type)
{
    for (auto mprg : mob->Prototype->mprog.MudProgs())
    {
        if (mprg->type & type
            && GetRandomPercent() <= atoi(mprg->arglist))
        {
            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);

            if (type != GREET_PROG && type != ALL_GREET_PROG)
                break;
        }
    }
}

static void mprog_time_check(Character *mob, Character *actor, Object *obj,
    void *vo, int type)
{
    for (auto mprg : mob->Prototype->mprog.MudProgs())
    {
        bool trigger_time = time_info.Hour == atoi(mprg->arglist);

        if (!trigger_time)
        {
            if (mprg->triggered)
                mprg->triggered = false;

            continue;
        }

        if (mprg->type & type
            && (!mprg->triggered || mprg->type & HOUR_PROG))
        {
            mprg->triggered = true;
            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
        }
    }
}

static void MobileActAdd(Character *mob)
{
    if (Find(room_act_list, [mob](const auto runner) { return runner->vo == mob; }) != nullptr)
    {
        return;
    }

    std::shared_ptr<act_prog_data> runner = std::make_shared<act_prog_data>();
    runner->vo = mob;
    mob_act_list.push_front(runner);
}

/* The triggers.. These are really basic, and since most appear only
 * once in the code (hmm. i think they all do) it would be more efficient
 * to substitute the code in and make the mprog_xxx_check routines global.
 * However, they are all here in one nice place at the moment to make it
 * easier to see what they look like. If you do substitute them back in,
 * make sure you remember to modify the variable names to the ones in the
 * trigger calls.
 */
void MobProgActTrigger(const std::string &buf, Character *mob, Character *ch,
    Object *obj, void *vo)
{
    if (IsNpc(mob)
        && IsBitSet(mob->Prototype->mprog.progtypes, ACT_PROG))
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if (IsNpc(ch) && ch->Prototype == mob->Prototype)
            return;

        bool found = false;

        /* make sure this is a matching trigger */
        for (auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if (mprg->type & ACT_PROG
                && MudProgKeywordCheck(buf, mprg->arglist))
            {
                found = true;
                break;
            }
        }

        if (!found)
        {
            return;
        }

        std::shared_ptr<MPROG_ACT_LIST> tmp_act = std::make_shared<MPROG_ACT_LIST>();

        mob->mprog.Add(tmp_act);

        tmp_act->buf = CopyString(buf);
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;
        mob->mprog.mpactnum++;
        MobileActAdd(mob);
    }
}

void MobProgBribeTrigger(Character *mob, Character *ch, int amount)
{
    if (IsNpc(mob)
        && mob->Prototype->mprog.progtypes & BRIBE_PROG)
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if (IsNpc(ch) && ch->Prototype == mob->Prototype)
            return;

        Object *obj = CreateObject(GetProtoObject(OBJ_VNUM_MONEY_SOME), 0);
        char buf[MAX_STRING_LENGTH];
        sprintf(buf, obj->ShortDescr.c_str(), amount);
        obj->ShortDescr = buf;
        obj->Value[OVAL_MONEY_AMOUNT] = amount;
        obj = ObjectToCharacter(obj, mob);
        mob->Gold -= amount;

        for (auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if (mprg->type & BRIBE_PROG
                && amount >= atoi(mprg->arglist))
            {
                MudProgDriver(mprg->comlist, mob, ch, obj, nullptr, false);
                break;
            }
        }
    }
}

void MobProgDeathTrigger(Character *killer, Character *mob)
{
    if (IsNpc(mob) && killer != mob
        && mob->Prototype->mprog.progtypes & DEATH_PROG)
    {
        MobProgPercentCheck(mob, killer, nullptr, nullptr, DEATH_PROG);
    }
}

void MobProgEntryTrigger(Character *mob)
{
    if (IsNpc(mob)
        && mob->Prototype->mprog.progtypes & ENTRY_PROG)
    {
        MobProgPercentCheck(mob, nullptr, nullptr, nullptr, ENTRY_PROG);
    }
}

void MobProgFightTrigger(Character *mob, Character *ch)
{
    if (IsNpc(mob)
        && mob->Prototype->mprog.progtypes & FIGHT_PROG)
    {
        MobProgPercentCheck(mob, ch, nullptr, nullptr, FIGHT_PROG);
    }
}

void MobProgGiveTrigger(Character *mob, Character *ch, Object *obj)
{
    if (IsNpc(mob)
        && mob->Prototype->mprog.progtypes & GIVE_PROG)
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if (IsNpc(ch) && ch->Prototype == mob->Prototype)
        {
            return;
        }

        for (auto mprg : mob->Prototype->mprog.MudProgs())
        {
            std::string buf;
            OneArgument(mprg->arglist, buf);

            if (mprg->type & GIVE_PROG
                && (!StrCmp(obj->Name, mprg->arglist)
                    || !StrCmp("all", buf)))
            {

                MudProgDriver(mprg->comlist, mob, ch, obj, nullptr, false);
                break;
            }
        }
    }
}

void MobProgGreetTrigger(Character *ch)
{
    std::list<Character*> copyOfCharacterList(ch->InRoom->Characters());

    for (Character *vmob : copyOfCharacterList)
    {
        if (!IsNpc(vmob)
            || vmob->Fighting
            || !IsAwake(vmob))
        {
            continue;
        }

        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if (IsNpc(ch) && ch->Prototype == vmob->Prototype)
        {
            continue;
        }

        if (vmob->Prototype->mprog.progtypes & GREET_PROG)
        {
            MobProgPercentCheck(vmob, ch, nullptr, nullptr, GREET_PROG);
        }
        else if (vmob->Prototype->mprog.progtypes & ALL_GREET_PROG)
        {
            MobProgPercentCheck(vmob, ch, nullptr, nullptr, ALL_GREET_PROG);
        }
    }
}

void MobProgHitPercentTrigger(Character *mob, Character *ch)
{
    if (IsNpc(mob)
        && mob->Prototype->mprog.progtypes & HITPRCNT_PROG)
    {
        for (auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if (mprg->type & HITPRCNT_PROG
                && 100 * mob->HitPoints.Current / mob->HitPoints.Max < atoi(mprg->arglist))
            {
                MudProgDriver(mprg->comlist, mob, ch, nullptr, nullptr, false);
                break;
            }
        }
    }
}

void MobProgRandomTrigger(Character *mob)
{
    if (mob->Prototype->mprog.progtypes & RAND_PROG)
        MobProgPercentCheck(mob, nullptr, nullptr, nullptr, RAND_PROG);
}

void MobProgTimeTrigger(Character *mob)
{
    if (mob->Prototype->mprog.progtypes & TIME_PROG)
        mprog_time_check(mob, nullptr, nullptr, nullptr, TIME_PROG);
}

void MobProgHourTrigger(Character *mob)
{
    if (mob->Prototype->mprog.progtypes & HOUR_PROG)
        mprog_time_check(mob, nullptr, nullptr, nullptr, HOUR_PROG);
}

void MobProgSpeechTrigger(const std::string &txt, Character *actor)
{
    std::list<Character*> copyOfCharacterList(actor->InRoom->Characters());

    for (Character *vmob : copyOfCharacterList)
    {
        if (IsNpc(vmob) && vmob->Prototype->mprog.progtypes & SPEECH_PROG)
        {
            if (IsNpc(actor) && actor->Prototype == vmob->Prototype)
                continue;

            MobProgWordlistCheck(txt, vmob, actor, nullptr, nullptr, SPEECH_PROG);
        }
    }
}

void MobProgScriptTrigger(Character *mob)
{
    if (mob->Prototype->mprog.progtypes & SCRIPT_PROG)
    {
        for (auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if (mprg->type & SCRIPT_PROG)
            {
                if (IsNullOrEmpty(mprg->arglist)
                    || mob->mprog.mpscriptpos != 0
                    || atoi(mprg->arglist) == time_info.Hour)
                {
                    MudProgDriver(mprg->comlist, mob, nullptr, nullptr, nullptr, true);
                }
            }
        }
    }
}

/*
 *  Mudprogram additions begin here
 */
void MudProgSetSupermob(Object *obj)
{
    std::shared_ptr<Room> room;
    Object *in_obj;
    char buf[200];

    if (!supermob)
        supermob = CreateMobile(GetProtoMobile(MOB_VNUM_SUPERMOB));

    if (!obj)
        return;

    for (in_obj = obj; in_obj->InObject; in_obj = in_obj->InObject)
        ;

    if (in_obj->CarriedBy)
    {
        room = in_obj->CarriedBy->InRoom;
    }
    else
    {
        room = obj->InRoom;
    }

    if (!room)
        return;

    supermob->ShortDescr = obj->ShortDescr;
    supermob->mprog.mpscriptpos = obj->mprog.mpscriptpos;

    /* Added by Jenny to allow bug messages to show the vnum
       of the object, and not just supermob's vnum */
    sprintf(buf, "Object #%ld", obj->Prototype->Vnum);
    supermob->Description = buf;

    if (room != nullptr)
    {
        CharacterFromRoom(supermob);
        CharacterToRoom(supermob, room);
    }
}

void ReleaseSupermob(void)
{
    CharacterFromRoom(supermob);
    CharacterToRoom(supermob, GetRoom(ROOM_VNUM_POLY));
}

static bool ObjProgPercentCheck(Character *mob, Character *actor, Object *obj,
    void *vo, int type)
{
    bool executed = false;

    for (auto mprg : obj->Prototype->mprog.MudProgs())
    {
        if (mprg->type & type
            && GetRandomPercent() <= atoi(mprg->arglist))
        {
            executed = true;
            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);

            if (type != GREET_PROG)
                break;
        }
    }

    return executed;
}

/*
 * Triggers follow
 */
void ObjProgGreetTrigger(Character *ch)
{
    std::list<Object*> objectsWithGreetTrigger = Filter(ch->InRoom->Objects(),
        [](auto vobj)
    {
        return vobj->Prototype->mprog.progtypes & GREET_PROG;
    });

    for (Object *vobj : objectsWithGreetTrigger)
    {
        MudProgSetSupermob(vobj);  /* not very efficient to do here */
        ObjProgPercentCheck(supermob, ch, vobj, nullptr, GREET_PROG);
        ReleaseSupermob();
    }
}

void ObjProgSpeechTrigger(const std::string &txt, Character *ch)
{
    auto objectsWithSpeechTrigger = Filter(ch->InRoom->Objects(),
        [](auto vobj)
    {
        return vobj->Prototype->mprog.progtypes & SPEECH_PROG;
    });

    /* supermob is set and released in ObjProgWordlistCheck */
    for (Object *vobj : objectsWithSpeechTrigger)
    {
        ObjProgWordlistCheck(txt, supermob, ch, vobj, nullptr, SPEECH_PROG, vobj);
    }
}

/*
 * Called at top of obj_update
 * make sure to put an if(!obj) continue
 * after it
 */
void ObjProgRandomTrigger(Object *obj)
{
    if (!obj || !obj->Prototype)
        return;

    if (obj->Prototype->mprog.progtypes & RAND_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, nullptr, obj, nullptr, RAND_PROG);
        ReleaseSupermob();
    }
}

/*
 * in wear_obj, between each successful EquipCharacter
 * the subsequent return
 */
void ObjProgWearTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & WEAR_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, WEAR_PROG);
        ReleaseSupermob();
    }
}

bool ObjProgUseTrigger(Character *ch, Object *obj, Character *vict,
    Object *targ, void *vo)
{
    bool executed = false;

    if (obj->Prototype->mprog.progtypes & USE_PROG)
    {
        MudProgSetSupermob(obj);

        if (obj->ItemType == ITEM_STAFF)
        {
            if (vict)
            {
                executed = ObjProgPercentCheck(supermob, ch, obj, vict, USE_PROG);
            }
            else
            {
                executed = ObjProgPercentCheck(supermob, ch, obj, targ, USE_PROG);
            }
        }
        else
        {
            executed = ObjProgPercentCheck(supermob, ch, obj, nullptr, USE_PROG);
        }

        ReleaseSupermob();
    }

    return executed;
}

/*
 * call in RemoveObject, right after UnequipCharacter
 * do a if(!ch) return right after, and return true (?)
 * if !ch
 */
void ObjProgRemoveTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & REMOVE_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, REMOVE_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in do_sac, right before ExtractObject
 */
void ObjProgSacTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & SAC_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, SAC_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in do_get, right before CheckObjectForTrap
 * do a if(!ch) return right after
 */
void ObjProgGetTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & GET_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, GET_PROG);
        ReleaseSupermob();
    }
}

/*
 * called in DamageObject in act_obj.c
 */
void ObjProgDamageTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & DAMAGE_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, DAMAGE_PROG);
        ReleaseSupermob();
    }
}

/*
 * called in do_repair in shops.c
 */
void ObjProgRepairTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & REPAIR_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, REPAIR_PROG);
        ReleaseSupermob();
    }
}

/*
 * call twice in do_drop, right after the Act( AT_ACTION,...)
 * do a if(!ch) return right after
 */
void ObjProgDropTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & DROP_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, DROP_PROG);
        ReleaseSupermob();
    }
}

/*
 * call towards end of do_examine, right before CheckObjectForTrap
 */
void ObjProgExamineTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & EXA_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, EXA_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in fight.c, group_gain, after (?) the ObjectToRoom
 */
void ObjProgZapTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & ZAP_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, ZAP_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void ObjProgPullTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & PULL_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, PULL_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void ObjProgPushTrigger(Character *ch, Object *obj)
{
    if (obj->Prototype->mprog.progtypes & PUSH_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, PUSH_PROG);
        ReleaseSupermob();
    }
}

void ObjProgActTrigger(const std::string &buf, Object *mobj, Character *ch,
    Object *obj, void *vo)
{
    if (mobj->Prototype->mprog.progtypes & ACT_PROG)
    {
        std::shared_ptr<MPROG_ACT_LIST> tmp_act = std::make_shared<MPROG_ACT_LIST>();

        mobj->mprog.Add(tmp_act);

        tmp_act->buf = CopyString(buf);
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;
        mobj->mprog.mpactnum++;
        ObjectActAdd(mobj);
    }
}

static void ObjProgWordlistCheck(const std::string &arg, Character *mob, Character *actor,
    Object *obj, void *vo, int type, Object *iobj)
{
    for (auto mprg : iobj->Prototype->mprog.MudProgs())
    {
        if (mprg->type & type)
        {
            char temp1[MAX_STRING_LENGTH];
            char temp2[MAX_INPUT_LENGTH];
            char *list = nullptr;
            char *start = nullptr;
            char *dupl = nullptr;
            const char *end = nullptr;
            size_t i = 0;

            strcpy(temp1, mprg->arglist);
            list = temp1;

            for (i = 0; i < strlen(list); i++)
            {
                list[i] = CharToLowercase(list[i]);
            }

            strcpy(temp2, arg.c_str());
            dupl = temp2;

            for (i = 0; i < strlen(dupl); i++)
            {
                dupl[i] = CharToLowercase(dupl[i]);
            }

            if (list[0] == 'p' && list[1] == ' ')
            {
                list += 2;

                while ((start = strstr(dupl, list)))
                {
                    if ((start == dupl || *(start - 1) == ' ')
                        && (*(end = start + strlen(list)) == ' '
                            || *end == '\n'
                            || *end == '\r'
                            || *end == '\0'))
                    {
                        MudProgSetSupermob(iobj);
                        MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                        ReleaseSupermob();
                        break;
                    }
                    else
                    {
                        dupl = start + 1;
                    }
                }
            }
            else
            {
                std::string word;
                std::string stl_list = OneArgument(list, word);

                for (; !word.empty(); stl_list = OneArgument(list, word))
                {
                    strcpy(list, stl_list.c_str());

                    while ((start = strstr(dupl, word.c_str())))
                    {
                        if ((start == dupl || *(start - 1) == ' ')
                            && (*(end = start + word.size()) == ' '
                                || *end == '\n'
                                || *end == '\r'
                                || *end == '\0'))
                        {
                            MudProgSetSupermob(iobj);
                            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                            ReleaseSupermob();
                            break;
                        }
                        else
                        {
                            dupl = start + 1;
                        }
                    }
                }
            }
        }
    }
}

/*
 *  room_prog support starts here
 *
 */
void RoomProgSetSupermob(std::shared_ptr<Room> room)
{
    char buf[200];

    if (room)
    {
        supermob->ShortDescr = room->Name;
        supermob->Name = room->Name;
        supermob->mprog.mpscriptpos = room->mprog.mpscriptpos;

        /* Added by Jenny to allow bug messages to show the vnum
           of the room, and not just supermob's vnum */
        sprintf(buf, "Room #%ld", room->Vnum);
        supermob->Description = buf;

        CharacterFromRoom(supermob);
        CharacterToRoom(supermob, room);
    }
}

static void RoomProgPercentCheck(Character *mob, Character *actor, Object *obj,
    void *vo, int type)
{
    if (!mob->InRoom)
        return;

    for (auto mprg : mob->InRoom->mprog.MudProgs())
    {
        if (mprg->type & type
            && GetRandomPercent() <= atoi(mprg->arglist))
        {
            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);

            if (type != ENTER_PROG)
                break;
        }
    }
}

/*
 * Triggers follow
 */


 /*
  *  Hold on this
  * Unhold. -- Alty
  */
void RoomProgActTrigger(const std::string &buf, std::shared_ptr<Room> room, Character *ch,
    Object *obj, void *vo)
{
    if (room->mprog.progtypes & ACT_PROG)
    {
        std::shared_ptr<MPROG_ACT_LIST> tmp_act = std::make_shared<MPROG_ACT_LIST>();

        tmp_act->buf = CopyString(buf);
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;

        room->mprog.Add(tmp_act);

        room->mprog.mpactnum++;
        RoomActAdd(room);
    }
}

/*
 *
 */
void RoomProgLeaveTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & LEAVE_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, LEAVE_PROG);
        ReleaseSupermob();
    }
}

void RoomProgEnterTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & ENTER_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, ENTER_PROG);
        ReleaseSupermob();
    }
}

void RoomProgSleepTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & SLEEP_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, SLEEP_PROG);
        ReleaseSupermob();
    }
}

void RoomProgRestTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & REST_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, REST_PROG);
        ReleaseSupermob();
    }
}

void RoomProgFightTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & RFIGHT_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, RFIGHT_PROG);
        ReleaseSupermob();
    }
}

void RoomProgDeathTrigger(Character *killer, Character *ch)
{
    if (ch->InRoom->mprog.progtypes & RDEATH_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, RDEATH_PROG);
        ReleaseSupermob();
    }
}

void RoomProgSpeechTrigger(const std::string &txt, Character *ch)
{
    if (ch->InRoom->mprog.progtypes & SPEECH_PROG)
    {
        /* supermob is set and released in RoomProgWordlistCheck */
        RoomProgWordlistCheck(txt, supermob, ch, nullptr, nullptr, SPEECH_PROG, ch->InRoom);
    }
}

void RoomProgRandomTrigger(Character *ch)
{

    if (ch->InRoom->mprog.progtypes & RAND_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, RAND_PROG);
        ReleaseSupermob();
    }
}

static void RoomProgWordlistCheck(const std::string &arg, Character *mob, Character *actor,
    Object *obj, void *vo, int type, std::shared_ptr<Room> room)
{
    if (actor != nullptr && !CharacterDiedRecently(actor) && actor->InRoom)
    {
        room = actor->InRoom;
    }

    for (auto mprg : room->mprog.MudProgs())
    {
        if (mprg->type & type)
        {
            char temp1[MAX_STRING_LENGTH];
            char temp2[MAX_INPUT_LENGTH];
            char *list = nullptr;
            char *start = nullptr;
            char *dupl = nullptr;
            const char *end = nullptr;
            size_t i = 0;

            strcpy(temp1, mprg->arglist);
            list = temp1;

            for (i = 0; i < strlen(list); i++)
            {
                list[i] = CharToLowercase(list[i]);
            }

            strcpy(temp2, arg.c_str());
            dupl = temp2;

            for (i = 0; i < strlen(dupl); i++)
            {
                dupl[i] = CharToLowercase(dupl[i]);
            }

            if (list[0] == 'p' && list[1] == ' ')
            {
                list += 2;

                while ((start = strstr(dupl, list)))
                {
                    if ((start == dupl || *(start - 1) == ' ')
                        && (*(end = start + strlen(list)) == ' '
                            || *end == '\n'
                            || *end == '\r'
                            || *end == '\0'))
                    {
                        RoomProgSetSupermob(room);
                        MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                        ReleaseSupermob();
                        break;
                    }
                    else
                    {
                        dupl = start + 1;
                    }
                }
            }
            else
            {
                std::string word;
                std::string stl_list = OneArgument(list, word);

                for (; !word.empty(); stl_list = OneArgument(list, word))
                {
                    strcpy(list, stl_list.c_str());

                    while ((start = strstr(dupl, word.c_str())))
                    {
                        if ((start == dupl || *(start - 1) == ' ')
                            && (*(end = start + word.size()) == ' '
                                || *end == '\n'
                                || *end == '\r'
                                || *end == '\0'))
                        {
                            RoomProgSetSupermob(room);
                            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
                            ReleaseSupermob();
                            break;
                        }
                        else
                        {
                            dupl = start + 1;
                        }
                    }
                }
            }
        }
    }
}

static void RoomProgTimeCheck(Character *mob, Character *actor, Object *obj,
    void *vo, int type)
{
    Room *room = (Room *)vo;

    for (auto mprg : room->mprog.MudProgs())
    {
        bool trigger_time = time_info.Hour == atoi(mprg->arglist);

        if (!trigger_time)
        {
            if (mprg->triggered)
                mprg->triggered = false;

            continue;
        }

        if (mprg->type & type
            && (!mprg->triggered || mprg->type & HOUR_PROG))
        {
            mprg->triggered = true;
            MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
        }
    }
}

void RoomProgTimeTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & TIME_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgTimeCheck(supermob, nullptr, nullptr, ch->InRoom.get(), TIME_PROG);
        ReleaseSupermob();
    }
}

void RoomProgHourTrigger(Character *ch)
{
    if (ch->InRoom->mprog.progtypes & HOUR_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgTimeCheck(supermob, nullptr, nullptr, ch->InRoom.get(), HOUR_PROG);
        ReleaseSupermob();
    }
}

/* Written by Jenny, Nov 29/95 */
void ProgBug(const std::string &str, const Character *mob)
{
    /* Check if we're dealing with supermob, which means the bug occurred
       in a room or obj prog. */
    if (mob->Prototype->Vnum == MOB_VNUM_SUPERMOB)
    {
        /* It's supermob.  In MudProgSetSupermob and RoomProgSetSupermob, the description
           was set to indicate the object or room, so we just need to show
           the description in the bug message. */
        Log->Bug("%s, %s.", str.c_str(),
            mob->Description.empty() ? "(unknown)" : mob->Description.c_str());
    }
    else
    {
        Log->Bug("%s, Mob #%ld.", str.c_str(), mob->Prototype->Vnum);
    }
}


/* Room act prog updates.  Use a separate list cuz we dont really wanna go
   thru 5-10000 rooms every pulse.. can we say lag? -- Alty */

static void RoomActAdd(std::shared_ptr<Room> room)
{
    if (Find(room_act_list, [room](const auto runner) { return runner->room == room; }) != nullptr)
    {
        return;
    }

    std::shared_ptr<act_prog_data> runner = std::make_shared<act_prog_data>();
    runner->room = room;
    room_act_list.push_front(runner);
}

void RoomActUpdate()
{
    while (!room_act_list.empty())
    {
        std::shared_ptr<act_prog_data> runner = room_act_list.front();
        std::shared_ptr<Room> room = runner->room;

        auto actLists(room->mprog.ActLists());

        for (auto mpact : actLists)
        {
            if (mpact->ch->InRoom == room)
            {
                RoomProgWordlistCheck(mpact->buf, supermob, mpact->ch, mpact->obj,
                    mpact->vo, ACT_PROG, room);
            }

            room->mprog.Remove(mpact);
            FreeMemory(mpact->buf);
        }

        room->mprog.mpactnum = 0;
        room_act_list.remove(runner);
    }
}

static void ObjectActAdd(Object *obj)
{
    if (Find(room_act_list, [obj](const auto runner) { return runner->vo == obj; }) != nullptr)
    {
        return;
    }

    std::shared_ptr<act_prog_data> runner = std::make_shared<act_prog_data>();
    runner->vo = obj;
    obj_act_list.push_front(runner);
}

void ObjectActUpdate()
{
    while (!obj_act_list.empty())
    {
        std::shared_ptr<act_prog_data> runner = obj_act_list.front();
        Object *obj = (Object*)runner->vo;

        auto actLists(obj->mprog.ActLists());

        for (auto mpact : actLists)
        {
            ObjProgWordlistCheck(mpact->buf, supermob, mpact->ch, mpact->obj,
                mpact->vo, ACT_PROG, obj);
            obj->mprog.Remove(mpact);
            FreeMemory(mpact->buf);
        }

        obj->mprog.mpactnum = 0;
        obj_act_list.remove(runner);
    }
}

std::unordered_map<int, const char * const> MudProgTypes =
{
    { ACT_PROG, "act_prog" },
    { SPEECH_PROG, "speech_prog" },
    { RAND_PROG, "rand_prog" },
    { FIGHT_PROG, "fight_prog" },
    { HITPRCNT_PROG, "hitprcnt_prog" },
    { DEATH_PROG, "death_prog" },
    { ENTRY_PROG, "entry_prog" },
    { GREET_PROG, "greet_prog" },
    { ALL_GREET_PROG, "all_greet_prog" },
    { GIVE_PROG, "give_prog" },
    { BRIBE_PROG, "bribe_prog" },
    { HOUR_PROG, "hour_prog" },
    { TIME_PROG, "time_prog" },
    { WEAR_PROG, "wear_prog" },
    { REMOVE_PROG, "remove_prog" },
    { SAC_PROG, "sac_prog" },
    { LOOK_PROG, "look_prog" },
    { EXA_PROG, "exa_prog" },
    { ZAP_PROG, "zap_prog" },
    { GET_PROG, "get_prog" },
    { DROP_PROG, "drop_prog" },
    { REPAIR_PROG, "repair_prog" },
    { DAMAGE_PROG, "damage_prog" },
    { PULL_PROG, "pull_prog" },
    { PUSH_PROG, "push_prog" },
    { SCRIPT_PROG, "script_prog" },
    { SLEEP_PROG, "sleep_prog" },
    { REST_PROG, "rest_prog" },
    { LEAVE_PROG, "leave_prog" },
    { USE_PROG, "use_prog" },
    { ERROR_PROG, "ERROR_PROG" }
};

const char *MobProgTypeToName(int type)
{
    try
    {
        return MudProgTypes.at(type);
    }
    catch(const std::out_of_range &ex)
    {
        return "ERROR_PROG";
    }
}

int MobProgNameToType(const std::string &name)
{
    for(auto tuple : MudProgTypes)
    {
        if(StrCmp(tuple.second, name) == 0)
        {
            return tuple.first;
        }
    }

    return ERROR_PROG;
}

Character *GetCharacterInRoomMudProg(Character *ch, std::string argument)
{
    std::string arg;
    int count = 0;
    vnum_t vnum = INVALID_VNUM;
    int number = NumberArgument(argument, arg);

    if (!StrCmp(arg, "self"))
    {
        return ch;
    }

    if (GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber(arg))
    {
        vnum = ToLong(arg);
    }

    count = 0;

    for (Character *rch : ch->InRoom->Characters())
    {
        if (NiftyIsName(arg, rch->Name)
            || (IsNpc(rch) && vnum == rch->Prototype->Vnum))
        {
            if (number == 0 && !IsNpc(rch))
            {
                return rch;
            }
            else if (++count == number)
            {
                return rch;
            }
        }
    }

    if (vnum != INVALID_VNUM)
    {
        return nullptr;
    }

    count = 0;

    for (Character *rch : ch->InRoom->Characters())
    {
        if (!NiftyIsNamePrefix(arg, rch->Name))
        {
            continue;
        }

        if (number == 0 && !IsNpc(rch))
        {
            return rch;
        }
        else if (++count == number)
        {
            return rch;
        }
    }

    return nullptr;
}

