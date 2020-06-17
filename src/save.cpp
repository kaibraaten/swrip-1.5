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

#ifdef __STRICT_ANSI__
/* To include the prototype for fchmod() */
#define _DEFAULT_SOURCE

#if defined(__NetBSD__)
#define _NETBSD_SOURCE
#endif

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <filesystem>
namespace fs = std::filesystem;

#include <cassert>
#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "shop.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "alias.hpp"
#include "repos/playerrepository.hpp"
#include "repos/objectrepository.hpp"
#include "repos/storeroomrepository.hpp"
#include "repos/vendorrepository.hpp"
#include "repos/homerepository.hpp"

/*
 * Increment with every major format change.
 */
#define SAVEVERSION     3

/*
 * Array to keep track of equipment temporarily.                -Thoric
 */
std::shared_ptr<Object> save_equipment[MAX_WEAR][8];
Character *quitting_char = NULL;
Character *loading_char = NULL;
Character *saving_char = NULL;

int file_ver = 0;

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];
extern int falling;

/*
 * Array of containers read for proper re-nesting of objects.
 */
static std::shared_ptr<Object> rgObjNest[MAX_NEST];

/*
 * Local functions.
 */
static bool HasAnyOvalues(std::shared_ptr<Object> obj);

/*
 * Un-equip character before saving to ensure proper    -Thoric
 * stats are saved in case of changes to or removal of EQ
 */
void DeEquipCharacter(Character *ch)
{
    for (int x = 0; x < MAX_WEAR; x++)
    {
        for (int y = 0; y < MAX_LAYERS; y++)
        {
            save_equipment[x][y] = NULL;
        }
    }

    for (auto obj : ch->Objects())
    {
        if (obj->WearLoc > WEAR_NONE && obj->WearLoc < MAX_WEAR)
        {
            int x = 0;

            for (x = 0; x < MAX_LAYERS; x++)
            {
                if (!save_equipment[obj->WearLoc][x])
                {
                    save_equipment[obj->WearLoc][x] = obj;
                    break;
                }
            }

            if (x == MAX_LAYERS)
            {
                Log->Bug("%s had on more than %d layers of clothing in one location (%d): %s",
                         ch->Name.c_str(), MAX_LAYERS, obj->WearLoc, obj->Name.c_str());
            }

            UnequipCharacter(ch, obj);
        }
    }
}

/*
 * Re-equip character                                   -Thoric
 */
void ReEquipCharacter(Character *ch)
{
    int x = 0;
    int y = 0;

    for (x = 0; x < MAX_WEAR; x++)
    {
        for (y = 0; y < MAX_LAYERS; y++)
        {
            if (save_equipment[x][y] != NULL)
            {
                if (quitting_char != ch)
                {
                    EquipCharacter(ch, save_equipment[x][y], (WearLocation)x);
                }

                save_equipment[x][y] = NULL;
            }
            else
            {
                break;
            }
        }
    }
}

void SaveHome(const Character *ch)
{
    for(auto home : Homes->FindHomesForResident(ch->Name))
    {
        Homes->Save(home);
    }
}

void SaveClone(Character *ch)
{
    assert(ch != nullptr);

    if (IsNpc(ch) || !IsAuthed(ch))
    {
        return;
    }

    if (ch->Desc && ch->Desc->Original)
    {
        ch = ch->Desc->Original;
    }

    DeEquipCharacter(ch);
    ch->PCData->Clones++;

    ch->PCData->SaveTime = current_time;
    PlayerCharacters->Save(ch);
    PlayerCharacters->MakeClone(ch);

    ch->PCData->Clones--;
    ReEquipCharacter(ch);
    PlayerCharacters->Save(ch);
    WriteCorpses(ch, "");
    quitting_char = NULL;
    saving_char = NULL;
}

static bool HasAnyOvalues(std::shared_ptr<Object> obj)
{
    int oval = 0;

    for (oval = 0; oval < MAX_OVAL; ++oval)
    {
        if (obj->Value[oval] != 0)
        {
            return true;
        }
    }

    return false;
}

/*
 * Write an object and its contents.
 */
void WriteObject(const Character *ch, std::shared_ptr<Object> obj, FILE *fp, int iNest, short os_type)
{
    short wear = 0, wear_loc = 0, x = 0;

    if (iNest >= MAX_NEST)
    {
        Log->Bug("WriteObject: iNest hit MAX_NEST %d", iNest);
        return;
    }

    /*
     * Slick recursion to write lists backwards,
     *   so loading them will load in forwards order.
     */
    for (auto content : Reverse(obj->Objects()))
    {
        WriteObject(ch, content, fp, iNest, OS_CARRY);
    }

    /*
     * Castrate storage characters.
     */
    if (obj->ItemType == ITEM_KEY && !obj->Flags.test(Flag::Obj::ClanObject))
    {
        return;
    }

    /*
     * Catch deleted objects                                      -Thoric
     */
    if (IsObjectExtracted(obj))
    {
        return;
    }

    /*
     * Do NOT save prototype items!                               -Thoric
     */
    if (obj->Flags.test(Flag::Obj::Prototype))
    {
        return;
    }

    /* Corpse saving. -- Altrag */
    fprintf(fp, (os_type == OS_CORPSE ? "#CORPSE\n" : "#OBJECT\n"));

    if (iNest)
    {
        fprintf(fp, "Nest         %d\n", iNest);
    }

    if (obj->Count > 1)
    {
        fprintf(fp, "Count        %d\n", obj->Count);
    }

    if (StrCmp(obj->Name, obj->Prototype->Name))
    {
        fprintf(fp, "Name         %s~\n", obj->Name.c_str());
    }

    if (StrCmp(obj->ShortDescr, obj->Prototype->ShortDescr))
    {
        fprintf(fp, "ShortDescr   %s~\n", obj->ShortDescr.c_str());
    }

    if (StrCmp(obj->Description, obj->Prototype->Description))
    {
        fprintf(fp, "Description  %s~\n", obj->Description.c_str());
    }

    if (StrCmp(obj->ActionDescription, obj->Prototype->ActionDescription))
    {
        fprintf(fp, "ActionDesc   %s~\n", obj->ActionDescription.c_str());
    }

    fprintf(fp, "Vnum         %ld\n", obj->Prototype->Vnum);

    if (os_type == OS_CORPSE && obj->InRoom)
    {
        fprintf(fp, "Room         %ld\n", obj->InRoom->Vnum);
    }

    if (obj->Flags != obj->Prototype->Flags)
    {
        fprintf(fp, "ExtraFlags   %ld\n", obj->Flags.to_ulong());
    }

    if (obj->WearFlags != obj->Prototype->WearFlags)
    {
        fprintf(fp, "WearFlags    %ld\n", obj->WearFlags.to_ulong());
    }

    wear_loc = -1;

    for (wear = 0; wear < MAX_WEAR; wear++)
    {
        for (x = 0; x < MAX_LAYERS; x++)
        {
            if (obj == save_equipment[wear][x])
            {
                wear_loc = wear;
                break;
            }
            else if (!save_equipment[wear][x])
            {
                break;
            }
        }
    }

    if (wear_loc != -1)
    {
        fprintf(fp, "WearLoc      %d\n", wear_loc);
    }

    if (obj->ItemType != obj->Prototype->ItemType)
    {
        fprintf(fp, "ItemType     %d\n", obj->ItemType);
    }

    if (obj->Weight != obj->Prototype->Weight)
    {
        fprintf(fp, "Weight       %d\n", obj->Weight);
    }

    if (obj->Level)
    {
        fprintf(fp, "Level        %d\n", obj->Level);
    }

    if (obj->Timer)
    {
        fprintf(fp, "Timer        %d\n", obj->Timer);
    }

    if (obj->Cost != obj->Prototype->Cost)
    {
        fprintf(fp, "Cost         %d\n", obj->Cost);
    }

    if (HasAnyOvalues(obj))
    {
        fprintf(fp, "Values       %d %d %d %d %d %d\n",
                obj->Value[0], obj->Value[1], obj->Value[2],
                obj->Value[3], obj->Value[4], obj->Value[5]);
    }

    switch (obj->ItemType)
    {
    case ITEM_PILL: /* was down there with staff and wand, wrongly - Scryn */
    case ITEM_POTION:
        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL1]))
        {
            fprintf(fp, "Spell 1      '%s'\n",
                    SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name.c_str());
        }

        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]))
        {
            fprintf(fp, "Spell 2      '%s'\n",
                    SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name.c_str());
        }

        if (IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]))
        {
            fprintf(fp, "Spell 3      '%s'\n",
                    SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name.c_str());
        }
        break;

    case ITEM_DEVICE:
        if (IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]))
        {
            fprintf(fp, "Spell 3      '%s'\n",
                    SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name.c_str());
        }
        break;

    case ITEM_SALVE:
        if (IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]))
        {
            fprintf(fp, "Spell 4      '%s'\n",
                    SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name.c_str());
        }

        if (IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]))
        {
            fprintf(fp, "Spell 5      '%s'\n",
                    SkillTable[obj->Value[OVAL_SALVE_SPELL2]]->Name.c_str());
        }

        break;

    default:
        break;
    }

    for (auto paf : obj->Affects())
    {
        /*
         * Save extra object affects                              -Thoric
         */
        if (paf->Type < 0 || paf->Type >= TopSN)
        {
            fprintf(fp, "Affect       %d %d %d %d %ld\n",
                    paf->Type,
                    paf->Duration,
                    ((paf->Location == APPLY_WEAPONSPELL
                      || paf->Location == APPLY_WEARSPELL
                      || paf->Location == APPLY_REMOVESPELL
                      || paf->Location == APPLY_STRIPSN)
                     && IS_VALID_SN(paf->Modifier))
                    ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                    paf->Location,
                    paf->AffectedBy.to_ulong()
                );
        }
        else
        {
            fprintf(fp, "AffectData   '%s' %d %d %d %ld\n",
                    SkillTable[paf->Type]->Name.c_str(),
                    paf->Duration,
                    ((paf->Location == APPLY_WEAPONSPELL
                      || paf->Location == APPLY_WEARSPELL
                      || paf->Location == APPLY_REMOVESPELL
                      || paf->Location == APPLY_STRIPSN)
                     && IS_VALID_SN(paf->Modifier))
                    ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                    paf->Location,
                    paf->AffectedBy.to_ulong()
                );
        }
    }

    for (auto ed : obj->ExtraDescriptions())
    {
        fprintf(fp, "ExtraDescr   %s~ %s~\n",
                ed->Keyword.c_str(), ed->Description.c_str());
    }

    fprintf(fp, "End\n\n");

    for (auto content : Reverse(obj->Objects()))
    {
        WriteObject(ch, content, fp, iNest + 1, OS_CARRY);
    }
}

void ReadObject(Character *ch, FILE *fp, short os_type)
{
    int iNest = 0;
    bool fNest = true; /* Yes, these should             */
    bool fVnum = true; /* indeed be initialized as true */
    std::shared_ptr<Room> room;
    auto obj = std::make_shared<Object>();

    for (; ; )
    {
        const char *word = feof(fp) ? "End" : ReadWord(fp, Log, fBootDb);
        bool fMatch = false;

        switch (CharToUppercase(word[0]))
        {
        case '*':
            fMatch = true;
            ReadToEndOfLine(fp, Log, fBootDb);
            break;

        case 'A':
            if (!StrCmp(word, "Affect") || !StrCmp(word, "AffectData"))
            {
                std::shared_ptr<Affect> paf = std::make_shared<Affect>();
                int pafmod = 0;

                if (!StrCmp(word, "Affect"))
                {
                    paf->Type = ReadInt(fp, Log, fBootDb);
                }
                else
                {
                    int sn = LookupSkill(ReadWord(fp, Log, fBootDb));

                    if (sn < 0)
                    {
                        Log->Bug("%s (%d): unknown skill sn %d.",
                                 __FUNCTION__, __LINE__, sn);
                    }
                    else
                    {
                        paf->Type = sn;
                    }
                }

                paf->Duration = ReadInt(fp, Log, fBootDb);
                pafmod = ReadInt(fp, Log, fBootDb);
                paf->Location = ReadInt(fp, Log, fBootDb);
                paf->AffectedBy = ReadInt(fp, Log, fBootDb);

                if (paf->Location == APPLY_WEAPONSPELL
                    || paf->Location == APPLY_WEARSPELL
                    || paf->Location == APPLY_REMOVESPELL)
                {
                    paf->Modifier = SkillNumberFromSlot(pafmod);
                }
                else
                {
                    paf->Modifier = pafmod;
                }

                obj->Add(paf);
                fMatch = true;
                break;
            }

            KEY("Actiondesc", obj->ActionDescription, ReadStringToTilde(fp, Log, fBootDb));
            break;

        case 'C':
            KEY("Cost", obj->Cost, ReadInt(fp, Log, fBootDb));
            KEY("Count", obj->Count, ReadInt(fp, Log, fBootDb));
            break;

        case 'D':
            KEY("Description", obj->Description, ReadStringToTilde(fp, Log, fBootDb));
            break;

        case 'E':
            KEY("ExtraFlags", obj->Flags, ReadInt(fp, Log, fBootDb));

            if (!StrCmp(word, "ExtraDescr"))
            {
                auto ed = std::make_shared<ExtraDescription>();

                ed->Keyword = ReadStringToTilde(fp, Log, fBootDb);
                ed->Description = ReadStringToTilde(fp, Log, fBootDb);
                obj->Add(ed);
                fMatch = true;
            }

            if (!StrCmp(word, "End"))
            {
                if (!fNest || !fVnum)
                {
                    Log->Bug("Fread_obj: incomplete object.");
                    return;
                }
                else
                {
                    short wear_loc = obj->WearLoc;

                    if (obj->Name.empty())
                        obj->Name = obj->Prototype->Name;

                    if (obj->Description.empty())
                        obj->Description = obj->Prototype->Description;

                    if (obj->ShortDescr.empty())
                        obj->ShortDescr = obj->Prototype->ShortDescr;

                    if (obj->ActionDescription.empty())
                        obj->ActionDescription = obj->Prototype->ActionDescription;

                    Objects->Add(obj);
                    obj->Prototype->Count += obj->Count;

                    if (!obj->Serial)
                    {
                        cur_obj_serial = umax((cur_obj_serial + 1) & (BV30 - 1), 1);
                        obj->Serial = obj->Prototype->Serial = cur_obj_serial;
                    }

                    if (fNest)
                        rgObjNest[iNest] = obj;

                    numobjsloaded += obj->Count;
                    ++physicalobjects;

                    if (file_ver > 1 || obj->WearLoc < -1
                        || obj->WearLoc >= MAX_WEAR)
                    {
                        obj->WearLoc = WEAR_NONE;
                    }

                    /* Corpse saving. -- Altrag */
                    if (os_type == OS_CORPSE)
                    {
                        if (!room)
                        {
                            Log->Bug("Fread_obj: Corpse without room");
                            room = GetRoom(ROOM_VNUM_LIMBO);
                        }

                        obj = ObjectToRoom(obj, room);
                    }
                    else if (iNest == 0 || rgObjNest[iNest] == NULL)
                    {
                        int slot = 0;
                        bool reslot = false;

                        if (file_ver > 1
                            && wear_loc > -1
                            && wear_loc < MAX_WEAR)
                        {
                            int x = 0;

                            for (x = 0; x < MAX_LAYERS; x++)
                            {
                                if (!save_equipment[wear_loc][x])
                                {
                                    save_equipment[wear_loc][x] = obj;
                                    slot = x;
                                    reslot = true;
                                    break;
                                }
                            }

                            if (x == MAX_LAYERS)
                            {
                                Log->Bug("Fread_obj: too many layers %d", wear_loc);
                            }
                        }

                        obj = ObjectToCharacter(obj, ch);

                        if (reslot)
                        {
                            save_equipment[wear_loc][slot] = obj;
                        }
                    }
                    else
                    {
                        if (rgObjNest[iNest - 1])
                        {
                            SeparateOneObjectFromGroup(rgObjNest[iNest - 1]);
                            obj = ObjectToObject(obj, rgObjNest[iNest - 1]);
                        }
                        else
                        {
                            Log->Bug("Fread_obj: nest layer missing %d", iNest - 1);
                        }
                    }

                    if (fNest)
                    {
                        rgObjNest[iNest] = obj;
                    }

                    return;
                }
            }
            break;

        case 'I':
            KEY("ItemType", obj->ItemType, (ItemTypes)ReadInt(fp, Log, fBootDb));
            break;

        case 'L':
            KEY("Level", obj->Level, ReadInt(fp, Log, fBootDb));
            break;

        case 'N':
            KEY("Name", obj->Name, ReadStringToTilde(fp, Log, fBootDb));

            if (!StrCmp(word, "Nest"))
            {
                iNest = ReadInt(fp, Log, fBootDb);

                if (iNest < 0 || iNest >= MAX_NEST)
                {
                    Log->Bug("Fread_obj: bad nest %d.", iNest);
                    iNest = 0;
                    fNest = false;
                }

                fMatch = true;
            }
            break;

        case 'R':
            KEY("Room", room, GetRoom(ReadInt(fp, Log, fBootDb)));

        case 'S':
            KEY("ShortDescr", obj->ShortDescr, ReadStringToTilde(fp, Log, fBootDb));

            if (!StrCmp(word, "Spell"))
            {
                int iValue = ReadInt(fp, Log, fBootDb);
                int sn = LookupSkill(ReadWord(fp, Log, fBootDb));

                if (iValue < 0 || iValue > 5)
                {
                    Log->Bug("Fread_obj: bad iValue %d.", iValue);
                }
                else if (sn < 0)
                {
                    Log->Bug("%s (%d): unknown skill sn %d.",
                             __FUNCTION__, __LINE__, sn);
                }
                else
                {
                    obj->Value[iValue] = sn;
                }

                fMatch = true;
                break;
            }

            break;

        case 'T':
            KEY("Timer", obj->Timer, ReadInt(fp, Log, fBootDb));
            break;

        case 'V':
            if (!StrCmp(word, "Values"))
            {
                int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0;
                const char *ln = ReadLine(fp, Log, fBootDb);

                sscanf(ln, "%d %d %d %d %d %d", &x1, &x2, &x3, &x4, &x5, &x6);

                obj->Value[0] = x1;
                obj->Value[1] = x2;
                obj->Value[2] = x3;
                obj->Value[3] = x4;
                obj->Value[4] = x5;
                obj->Value[5] = x6;
                fMatch = true;
                break;
            }

            if (!StrCmp(word, "Vnum"))
            {
                vnum_t vnum = ReadInt(fp, Log, fBootDb);

                if ((obj->Prototype = GetProtoObject(vnum)) == NULL)
                {
                    fVnum = false;
                    Log->Bug("Fread_obj: bad vnum %ld.", vnum);
                }
                else
                {
                    fVnum = true;
                    obj->Cost = obj->Prototype->Cost;
                    obj->Weight = obj->Prototype->Weight;
                    obj->ItemType = obj->Prototype->ItemType;
                    obj->WearFlags = obj->Prototype->WearFlags;
                    obj->Flags = obj->Prototype->Flags;
                }

                fMatch = true;
                break;
            }
            break;

        case 'W':
            KEY("WearFlags", obj->WearFlags, ReadInt(fp, Log, fBootDb));
            KEY("WearLoc", obj->WearLoc, (WearLocation)ReadInt(fp, Log, fBootDb));
            KEY("Weight", obj->Weight, ReadInt(fp, Log, fBootDb));
            break;

        }

        if (!fMatch)
        {
            Log->Bug("Fread_obj: no match.");
            Log->Bug("%s", word);
            ReadToEndOfLine(fp, Log, fBootDb);

            while (!obj->ExtraDescriptions().empty())
            {
                auto ed = obj->ExtraDescriptions().front();
                obj->Remove(ed);
            }

            while (!obj->Affects().empty())
            {
                std::shared_ptr<Affect> paf = obj->Affects().front();
                obj->Remove(paf);
            }

            return;
        }
    }
}

void SetAlarm(long seconds)
{
#ifndef _WIN32
    alarm(seconds);
#endif
}

void WriteCorpses(const Character *ch, std::string name)
{
    FILE *fp = NULL;

    /* Name and ch support so that we dont have to have a char to save their
       corpses.. (ie: decayed corpses while offline) */
    if (ch && IsNpc(ch))
    {
        Log->Bug("Write_corpses: writing NPC corpse.");
        return;
    }

    if (ch)
    {
        name = ch->Name;
    }

    /* Go by vnum, less chance of screwups. -- Altrag */
    for (auto corpse : Objects)
    {
        if (corpse->Prototype->Vnum == OBJ_VNUM_CORPSE_PC
            && corpse->InRoom != NULL && corpse->Value[OVAL_CORPSE_SKINNED] != 1
            && !StrCmp(corpse->ShortDescr.c_str() + 14, name))
        {
            if (!fp)
            {
                char buf[127];

                sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name).c_str());

                if (!(fp = fopen(buf, "w")))
                {
                    Log->Bug("Write_corpses: Cannot open file.");
                    perror(buf);
                    return;
                }
            }

            WriteObject(ch, corpse, fp, 0, OS_CORPSE);
        }
    }

    if (fp)
    {
        fprintf(fp, "#END\n\n");
        fclose(fp);
    }
    else
    {
        char buf[127];

        sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name).c_str());
        remove(buf);
    }
}

void LoadCorpses()
{
    try
    {
        falling = 1; /* Arbitrary, must be >0 though. */

        for(const auto &entry : fs::directory_iterator(CORPSE_DIR))
        {
            const char *filename = entry.path().filename().string().c_str();

            if (filename[0] != '.')
            {
                sprintf(strArea, "%s%s", CORPSE_DIR, filename);
                fprintf(stderr, "Corpse -> %s\n", strArea);
                fpArea = fopen(strArea, "r");

                if (fpArea == nullptr)
                {
                    perror(strArea);
                    continue;
                }

                for (; ; )
                {
                    const char letter = ReadChar(fpArea, Log, fBootDb);

                    if (letter == '*')
                    {
                        ReadToEndOfLine(fpArea, Log, fBootDb);
                        continue;
                    }

                    if (letter != '#')
                    {
                        Log->Bug("%s: # not found.", __FUNCTION__);
                        break;
                    }

                    const char *word = ReadWord(fpArea, Log, fBootDb);

                    if (!StrCmp(word, "CORPSE"))
                    {
                        ReadObject(nullptr, fpArea, OS_CORPSE);
                    }
                    else if (!StrCmp(word, "OBJECT"))
                    {
                        ReadObject(nullptr, fpArea, OS_CARRY);
                    }
                    else if (!StrCmp(word, "END"))
                    {
                        break;
                    }
                    else
                    {
                        Log->Bug("%s: bad section.", __FUNCTION__);
                        break;
                    }
                }

                fclose(fpArea);
            }
        }
    }
    catch(const fs::filesystem_error&)
    {
        Log->Bug("%s: can't open CORPSE_DIR", __FUNCTION__);
        perror(CORPSE_DIR);
    }

    fpArea = nullptr;
    strcpy(strArea, "$");
    falling = 0;
}

void LoadStorerooms()
{
    Storerooms->Load();
}

void SaveStoreroom(std::shared_ptr<Room> room)
{
    Storerooms->Save(room);
}

void LoadVendors()
{
    Vendors->Load();
}
