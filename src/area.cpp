#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "area.hpp"
#include "mud.hpp"
#include "shop.hpp"
#include "reset.hpp"
#include "skill.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "exit.hpp"
#include "repos/shoprepository.hpp"
#include "repos/objectrepository.hpp"
#include "repos/arearepository.hpp"

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];

static void LoadArea(FILE *fp);
static void LoadAuthor(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadEconomy(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadResetMessage(std::shared_ptr<Area> tarea, FILE *fp); /* Rennard */
static void LoadFlags(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadMobiles(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadObjects(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadResets(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadRooms(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadShops(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadRepairs(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadSpecials(std::shared_ptr<Area> tarea, FILE *fp);
static void LoadRanges(std::shared_ptr<Area> tarea, FILE *fp);
static int MudProgNameToType(const char* name);
static void MobProgReadPrograms(FILE* fp, std::shared_ptr<ProtoMobile> pMobIndex);
static void ObjProgReadPrograms(FILE* fp, std::shared_ptr<ProtoObject> pObjIndex);
static void RoomProgReadPrograms(FILE* fp, std::shared_ptr<Room> pRoomIndex);

void LoadAreaFile(std::shared_ptr<Area> tarea, const std::string &filename)
{
    char buf[MAX_STRING_LENGTH];

    if (fBootDb)
        tarea = Areas->LastArea;

    if (!fBootDb && !tarea)
    {
        Log->Bug("%s: null area!", __FUNCTION__);
        return;
    }

    sprintf(buf, "%s%s", AREA_DIR, filename.c_str());

    if ((fpArea = fopen(buf, "r")) == NULL)
    {
        Log->Bug("%s: error loading file (can't open) %s", __FUNCTION__, filename.c_str());
        return;
    }

    for (; ; )
    {
        if (ReadChar(fpArea, Log, fBootDb) != '#')
        {
            Log->Bug("%s", tarea->Filename.c_str());
            Log->Bug("%s: # not found.", __FUNCTION__);
            exit(1);
        }

        std::string word = ReadWord(fpArea, Log, fBootDb);

        if (word[0] == '$')
        {
            break;
        }
        else if (!StrCmp(word, "AREA"))
        {
            if (fBootDb)
            {
                LoadArea(fpArea);
                tarea = Areas->LastArea;
            }
            else
            {
                tarea->Name = ReadStringToTilde(fpArea, Log, fBootDb);
            }
        }
        else if (!StrCmp(word, "AUTHOR")) LoadAuthor(tarea, fpArea);
        else if (!StrCmp(word, "FLAGS")) LoadFlags(tarea, fpArea);
        else if (!StrCmp(word, "RANGES")) LoadRanges(tarea, fpArea);
        else if (!StrCmp(word, "ECONOMY")) LoadEconomy(tarea, fpArea);
        else if (!StrCmp(word, "RESETMSG")) LoadResetMessage(tarea, fpArea);
        /* Rennard */
        else if (!StrCmp(word, "MOBILES")) LoadMobiles(tarea, fpArea);
        else if (!StrCmp(word, "OBJECTS")) LoadObjects(tarea, fpArea);
        else if (!StrCmp(word, "RESETS")) LoadResets(tarea, fpArea);
        else if (!StrCmp(word, "ROOMS")) LoadRooms(tarea, fpArea);
        else if (!StrCmp(word, "SHOPS")) LoadShops(tarea, fpArea);
        else if (!StrCmp(word, "REPAIRS")) LoadRepairs(tarea, fpArea);
        else if (!StrCmp(word, "SPECIALS")) LoadSpecials(tarea, fpArea);
        else
        {
            Log->Bug("%s", tarea->Filename.c_str());
            Log->Bug("%s: bad section name.", __FUNCTION__);

            if (fBootDb)
            {
                exit(1);
            }
            else
            {
                fclose(fpArea);
                fpArea = NULL;
                return;
            }
        }
    }

    fclose(fpArea);
    fpArea = NULL;

    if (tarea)
    {
        if (fBootDb)
            SortArea(tarea, false);

        fprintf(stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld Mobs: %5ld - %ld\n",
            tarea->Filename.c_str(),
            tarea->VnumRanges.Room.First, tarea->VnumRanges.Room.Last,
            tarea->VnumRanges.Object.First, tarea->VnumRanges.Object.Last,
            tarea->VnumRanges.Mob.First, tarea->VnumRanges.Mob.Last);

        SetBit(tarea->Status, AREA_LOADED);
    }
    else
    {
        fprintf(stderr, "(%s)\n", filename.c_str());
    }
}

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

void SortArea(std::shared_ptr<Area> pArea, bool proto)
{
    std::shared_ptr<Area> area;
    std::shared_ptr<Area> first_sort, last_sort;
    bool found = false;

    if (!pArea)
    {
        Log->Bug("%s: NULL pArea", __FUNCTION__);
        return;
    }

    if (proto)
    {
        first_sort = Areas->FirstBSort;
        last_sort = Areas->LastBSort;
    }
    else
    {
        first_sort = Areas->FirstASort;
        last_sort = Areas->LastASort;
    }

    pArea->NextSort = NULL;
    pArea->PreviousSort = NULL;

    if (!first_sort)
    {
        pArea->PreviousSort = NULL;
        pArea->NextSort = NULL;
        first_sort = pArea;
        last_sort = pArea;
        found = true;
    }
    else
    {
        for (area = first_sort; area; area = area->NextSort)
        {
            if (pArea->VnumRanges.Room.First < area->VnumRanges.Room.First)
            {
                if (!area->PreviousSort)
                {
                    first_sort = pArea;
                }
                else
                {
                    area->PreviousSort->NextSort = pArea;
                }

                pArea->PreviousSort = area->PreviousSort;
                pArea->NextSort = area;
                area->PreviousSort = pArea;
                found = true;
                break;
            }
        }
    }

    if (!found)
    {
        pArea->PreviousSort = last_sort;
        pArea->NextSort = NULL;
        last_sort->NextSort = pArea;
        last_sort = pArea;
    }

    if (proto)
    {
        Areas->FirstBSort = first_sort;
        Areas->LastBSort = last_sort;
    }
    else
    {
        Areas->FirstASort = first_sort;
        Areas->LastASort = last_sort;
    }
}

static void LoadArea(FILE *fp)
{
    auto pArea = std::make_shared<Area>();

    pArea->Name = ReadStringToTilde(fp, Log, fBootDb);
    pArea->Author = "unknown";
    pArea->Filename = strArea;
    pArea->Age = 15;
    pArea->LevelRanges.Soft.High = MAX_LEVEL;
    pArea->LevelRanges.Hard.High = MAX_LEVEL;

    LINK(pArea, Areas->FirstArea, Areas->LastArea, Next, Previous);
    top_area++;
}

static void LoadAuthor(std::shared_ptr<Area> tarea, FILE *fp)
{
    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    tarea->Author = ReadStringToTilde(fp, Log, fBootDb);
}

static void LoadEconomy(std::shared_ptr<Area> tarea, FILE *fp)
{
    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    tarea->HighEconomy = ReadInt(fp, Log, fBootDb);
    tarea->LowEconomy = ReadInt(fp, Log, fBootDb);
}

static void LoadResetMessage(std::shared_ptr<Area> tarea, FILE *fp)
{
    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    tarea->ResetMessage = ReadStringToTilde(fp, Log, fBootDb);
}

static void LoadFlags(std::shared_ptr<Area> tarea, FILE *fp)
{
    const char *ln = NULL;
    int x1 = 0, x2 = 0;

    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    ln = ReadLine(fp, Log, fBootDb);
    sscanf(ln, "%d %d", &x1, &x2);
    tarea->Flags = x1;
    tarea->ResetFrequency = x2;

    if (x2)
        tarea->Age = x2;
}

static void LoadMobiles(std::shared_ptr<Area> tarea, FILE *fp)
{
    std::shared_ptr<ProtoMobile> pMobIndex;
    const char *ln = NULL;
    int x1, x2, x3, x4, x5, x6, x7, x8;

    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    for (; ; )
    {
        char buf[MAX_STRING_LENGTH];
        vnum_t vnum = INVALID_VNUM;
        int iHash = 0;
        bool oldmob = false;
        bool tmpBootDb = false;
        char letter = ReadChar(fp, Log, fBootDb);

        if (letter != '#')
        {
            Log->Bug("%s: # not found.", __FUNCTION__);

            if (fBootDb)
            {
                ShutdownMud("# not found");
                exit(1);
            }
            else
            {
                return;
            }
        }

        vnum = ReadInt(fp, Log, fBootDb);

        if (vnum == INVALID_VNUM)
            break;

        tmpBootDb = fBootDb;
        fBootDb = false;

        if (GetProtoMobile(vnum))
        {
            if (tmpBootDb)
            {
                Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
                ShutdownMud("duplicate vnum");
                exit(1);
            }
            else
            {
                pMobIndex = GetProtoMobile(vnum);
                sprintf(buf, "Cleaning mobile: %ld", vnum);
                Log->LogStringPlus(buf, LOG_BUILD, SysData.LevelOfLogChannel);
                CleanMobile(pMobIndex);
                oldmob = true;
            }
        }
        else
        {
            oldmob = false;
            pMobIndex = std::make_shared<ProtoMobile>(vnum);
        }

        fBootDb = tmpBootDb;

        if (fBootDb)
        {
            if (!tarea->VnumRanges.Mob.First)
                tarea->VnumRanges.Mob.First = vnum;

            if (vnum > tarea->VnumRanges.Mob.Last)
                tarea->VnumRanges.Mob.Last = vnum;
        }

        pMobIndex->Name = ReadStringToTilde(fp, Log, fBootDb);
        pMobIndex->ShortDescr = ReadStringToTilde(fp, Log, fBootDb);
        pMobIndex->LongDescr = ReadStringToTilde(fp, Log, fBootDb);
        pMobIndex->Description = ReadStringToTilde(fp, Log, fBootDb);

        pMobIndex->LongDescr[0] = CharToUppercase(pMobIndex->LongDescr[0]);
        pMobIndex->Description[0] = CharToUppercase(pMobIndex->Description[0]);

        pMobIndex->Flags = ReadInt(fp, Log, fBootDb) | ACT_NPC;
        pMobIndex->AffectedBy = ReadInt(fp, Log, fBootDb);
        pMobIndex->Shop.reset();
        pMobIndex->RepairShop.reset();
        pMobIndex->Alignment = ReadInt(fp, Log, fBootDb);
        letter = ReadChar(fp, Log, fBootDb);
        pMobIndex->Level = ReadInt(fp, Log, fBootDb);

        /*pMobIndex->MobThac0 = */   ReadInt(fp, Log, fBootDb);
        pMobIndex->ArmorClass = ReadInt(fp, Log, fBootDb);
        pMobIndex->HitNoDice = ReadInt(fp, Log, fBootDb);
        /* 'd'            */         ReadChar(fp, Log, fBootDb);
        pMobIndex->HitSizeDice = ReadInt(fp, Log, fBootDb);
        /* '+'            */         ReadChar(fp, Log, fBootDb);
        pMobIndex->HitPlus = ReadInt(fp, Log, fBootDb);
        pMobIndex->DamNoDice = ReadInt(fp, Log, fBootDb);
        /* 'd'            */         ReadChar(fp, Log, fBootDb);
        pMobIndex->DamSizeDice = ReadInt(fp, Log, fBootDb);
        /* '+'            */         ReadChar(fp, Log, fBootDb);
        pMobIndex->DamPlus = ReadInt(fp, Log, fBootDb);
        pMobIndex->Gold = ReadInt(fp, Log, fBootDb);
        pMobIndex->exp = ReadInt(fp, Log, fBootDb);
        pMobIndex->Position = (PositionType)ReadInt(fp, Log, fBootDb);
        pMobIndex->DefaultPosition = (PositionType)ReadInt(fp, Log, fBootDb);

        /*
         * Back to meaningful values.
         */
        pMobIndex->Sex = (SexType)ReadInt(fp, Log, fBootDb);

        if (letter != 'S' && letter != 'C' && letter != 'Z')
        {
            Log->Bug("%s: vnum %ld: letter '%c' not Z, S or C.", __FUNCTION__, vnum,
                letter);
            ShutdownMud("bad mob data");
            exit(1);
        }

        if (letter == 'C' || letter == 'Z')
        {
            pMobIndex->Stats.Str = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Int = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Wis = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Dex = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Con = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Cha = ReadInt(fp, Log, fBootDb);
            pMobIndex->Stats.Lck = ReadInt(fp, Log, fBootDb);
            pMobIndex->Saving.PoisonDeath = ReadInt(fp, Log, fBootDb);
            pMobIndex->Saving.Wand = ReadInt(fp, Log, fBootDb);
            pMobIndex->Saving.ParaPetri = ReadInt(fp, Log, fBootDb);
            pMobIndex->Saving.Breath = ReadInt(fp, Log, fBootDb);
            pMobIndex->Saving.SpellStaff = ReadInt(fp, Log, fBootDb);

            ln = ReadLine(fp, Log, fBootDb);
            x1 = x2 = x3 = x4 = x5 = x6 = x7 = 0;
            sscanf(ln, "%d %d %d %d %d %d %d",
                &x1, &x2, &x3, &x4, &x5, &x6, &x7);

            pMobIndex->Race = x1;
            pMobIndex->Height = x3;
            pMobIndex->Weight = x4;
            pMobIndex->Speaks = x5;
            pMobIndex->Speaking = x6;
            pMobIndex->NumberOfAttacks = x7;

            if (!pMobIndex->Speaks)
                pMobIndex->Speaks = RaceTable[pMobIndex->Race].Language | LANG_COMMON;

            if (!pMobIndex->Speaking)
                pMobIndex->Speaking = RaceTable[pMobIndex->Race].Language;

            ln = ReadLine(fp, Log, fBootDb);
            x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = 0;
            sscanf(ln, "%d %d %d %d %d %d %d %d",
                &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8);

            pMobIndex->HitRoll = x1;
            pMobIndex->DamRoll = x2;
            pMobIndex->Resistant = x4;
            pMobIndex->Immune = x5;
            pMobIndex->Susceptible = x6;
            pMobIndex->AttackFlags = x7;
            pMobIndex->DefenseFlags = x8;
        }

        if (letter == 'Z') /*  STar Wars Reality Complex Mob  */
        {
            ln = ReadLine(fp, Log, fBootDb);
            x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = 0;
            sscanf(ln, "%d %d %d %d %d %d %d %d",
                &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8);
            pMobIndex->VipFlags = x1;
        }

        letter = ReadChar(fp, Log, fBootDb);

        if (letter == '>')
        {
            ungetc(letter, fp);
            MobProgReadPrograms(fp, pMobIndex);
        }
        else
        {
            ungetc(letter, fp);
        }

        if (!oldmob)
        {
            iHash = vnum % MAX_KEY_HASH;
            pMobIndex->Next = MobIndexHash[iHash];
            MobIndexHash[iHash] = pMobIndex;
            top_mob_index++;
        }
    }
}

static void LoadObjects(std::shared_ptr<Area> tarea, FILE *fp)
{
    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
        {
            return;
        }
    }

    for (; ; )
    {
        std::shared_ptr<ProtoObject> pObjIndex;
        const char *ln = nullptr;
        int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0;
        char buf[MAX_STRING_LENGTH] = { '\0' };
        vnum_t vnum = INVALID_VNUM;
        int iHash = 0;
        bool tmpBootDb = false;
        bool oldobj = false;
        char letter = ReadChar(fp, Log, fBootDb);

        if (letter != '#')
        {
            Log->Bug("%s: # not found.", __FUNCTION__);

            if (fBootDb)
            {
                ShutdownMud("# not found");
                exit(1);
            }
            else
            {
                return;
            }
        }

        vnum = ReadInt(fp, Log, fBootDb);

        if (vnum == INVALID_VNUM)
            break;

        tmpBootDb = fBootDb;
        fBootDb = false;

        if (GetProtoObject(vnum))
        {
            if (tmpBootDb)
            {
                Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
                ShutdownMud("duplicate vnum");
                exit(1);
            }
            else
            {
                pObjIndex = GetProtoObject(vnum);
                sprintf(buf, "Cleaning object: %ld", vnum);
                Log->LogStringPlus(buf, LOG_BUILD, SysData.LevelOfLogChannel);
                CleanObject(pObjIndex);
                oldobj = true;
            }
        }
        else
        {
            oldobj = false;
            pObjIndex = std::make_shared<ProtoObject>(vnum);
        }

        fBootDb = tmpBootDb;

        if (fBootDb)
        {
            if (!tarea->VnumRanges.Object.First)
                tarea->VnumRanges.Object.First = vnum;

            if (vnum > tarea->VnumRanges.Object.Last)
                tarea->VnumRanges.Object.Last = vnum;
        }

        pObjIndex->Name = ReadStringToTilde(fp, Log, fBootDb);
        pObjIndex->ShortDescr = ReadStringToTilde(fp, Log, fBootDb);
        pObjIndex->Description = ReadStringToTilde(fp, Log, fBootDb);
        pObjIndex->ActionDescription = ReadStringToTilde(fp, Log, fBootDb);

        pObjIndex->Description[0] = CharToUppercase(pObjIndex->Description[0]);

        ln = ReadLine(fp, Log, fBootDb);
        x1 = x2 = x3 = x4 = 0;
        sscanf(ln, "%d %d %d %d",
            &x1, &x2, &x3, &x4);
        pObjIndex->ItemType = (ItemTypes)x1;
        pObjIndex->Flags = x2;
        pObjIndex->WearFlags = x3;
        pObjIndex->Layers = x4;

        ln = ReadLine(fp, Log, fBootDb);
        x1 = x2 = x3 = x4 = x5 = x6 = 0;
        sscanf(ln, "%d %d %d %d %d %d",
            &x1, &x2, &x3, &x4, &x5, &x6);
        pObjIndex->Value[0] = x1;
        pObjIndex->Value[1] = x2;
        pObjIndex->Value[2] = x3;
        pObjIndex->Value[3] = x4;
        pObjIndex->Value[4] = x5;
        pObjIndex->Value[5] = x6;
        pObjIndex->Weight = ReadInt(fp, Log, fBootDb);
        pObjIndex->Weight = umax(1, pObjIndex->Weight);
        pObjIndex->Cost = ReadInt(fp, Log, fBootDb);
        ReadInt(fp, Log, fBootDb); /* Used to be rent */

        for (; ; )
        {
            letter = ReadChar(fp, Log, fBootDb);

            if (letter == 'A')
            {
                std::shared_ptr<Affect> paf = std::make_shared<Affect>();

                paf->Type = -1;
                paf->Duration = -1;
                paf->Location = ReadInt(fp, Log, fBootDb);

                if (paf->Location == APPLY_WEAPONSPELL
                    || paf->Location == APPLY_WEARSPELL
                    || paf->Location == APPLY_REMOVESPELL
                    || paf->Location == APPLY_STRIPSN)
                    paf->Modifier = SkillNumberFromSlot(ReadInt(fp, Log, fBootDb));
                else
                    paf->Modifier = ReadInt(fp, Log, fBootDb);

                paf->AffectedBy = 0;
                pObjIndex->Add(paf);
                top_affect++;
            }

            else if (letter == 'E')
            {
                std::shared_ptr<ExtraDescription> ed = std::make_shared<ExtraDescription>();
                ed->Keyword = ReadStringToTilde(fp, Log, fBootDb);
                ed->Description = ReadStringToTilde(fp, Log, fBootDb);
                pObjIndex->Add(ed);
                top_ed++;
            }
            else if (letter == '>')
            {
                ungetc(letter, fp);
                ObjProgReadPrograms(fp, pObjIndex);
            }

            else
            {
                ungetc(letter, fp);
                break;
            }
        }

        /*
         * Translate spell "slot numbers" to internal "skill numbers."
         */
        switch (pObjIndex->ItemType)
        {
        case ITEM_PILL:
        case ITEM_POTION:
            pObjIndex->Value[OVAL_PILL_SPELL1] = SkillNumberFromSlot(pObjIndex->Value[OVAL_PILL_SPELL1]);
            pObjIndex->Value[OVAL_PILL_SPELL2] = SkillNumberFromSlot(pObjIndex->Value[OVAL_PILL_SPELL2]);
            pObjIndex->Value[OVAL_PILL_SPELL3] = SkillNumberFromSlot(pObjIndex->Value[OVAL_PILL_SPELL3]);
            break;

        case ITEM_DEVICE:
            pObjIndex->Value[OVAL_DEVICE_SPELL] = SkillNumberFromSlot(pObjIndex->Value[OVAL_DEVICE_SPELL]);
            break;

        case ITEM_SALVE:
            pObjIndex->Value[OVAL_SALVE_SPELL1] = SkillNumberFromSlot(pObjIndex->Value[OVAL_SALVE_SPELL1]);
            pObjIndex->Value[OVAL_SALVE_SPELL2] = SkillNumberFromSlot(pObjIndex->Value[OVAL_SALVE_SPELL2]);
            break;

        default:
            break;
        }

        if (!oldobj)
        {
            iHash = vnum % MAX_KEY_HASH;
            pObjIndex->Next = ObjectIndexHash[iHash];
            ObjectIndexHash[iHash] = pObjIndex;
            top_obj_index++;
        }
    }
}

static void LoadResets(std::shared_ptr<Area> tarea, FILE *fp)
{
    /*bool not01 = false;*/
    int count = 0;

    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);

        if (fBootDb)
        {
            ShutdownMud("No #AREA");
            exit(1);
        }
        else
            return;
    }

    if (tarea->FirstReset)
    {
        if (fBootDb)
        {
            Log->Bug("%s: WARNING: resets already exist for this area.", __FUNCTION__);

            for (auto rtmp = tarea->FirstReset; rtmp; rtmp = rtmp->Next)
                ++count;
        }
        else
        {
            /*
             * Clean out the old resets
             */
            char buf[MAX_STRING_LENGTH];
            sprintf(buf, "Cleaning resets: %s", tarea->Name.c_str());
            Log->LogStringPlus(buf, LOG_BUILD, SysData.LevelOfLogChannel);
            CleanResets(tarea);
        }
    }

    for (; ; )
    {
        char letter;
        int extra, arg1, arg2, arg3;

        if ((letter = ReadChar(fp, Log, fBootDb)) == 'S')
            break;

        if (letter == '*')
        {
            ReadToEndOfLine(fp, Log, fBootDb);
            continue;
        }

        extra = ReadInt(fp, Log, fBootDb);
        arg1 = ReadInt(fp, Log, fBootDb);
        arg2 = ReadInt(fp, Log, fBootDb);
        arg3 = (letter == 'G' || letter == 'R') ? 0 : ReadInt(fp, Log, fBootDb);
        ReadToEndOfLine(fp, Log, fBootDb);

        ++count;

        /* finally, add the reset */
        AddReset(tarea, letter, extra, arg1, arg2, arg3);
    }

    RenumberPutResets(tarea);
}

static void LoadRooms(std::shared_ptr<Area> tarea, FILE *fp)
{
    std::shared_ptr<Room> pRoomIndex;
    const char *ln = nullptr;

    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);
        ShutdownMud("No #AREA");
        exit(1);
    }

    for (; ; )
    {
        vnum_t vnum = INVALID_VNUM;
        DirectionType door = DIR_NORTH;
        int iHash = 0;
        bool tmpBootDb = false;
        bool oldroom = false;
        int x1, x2, x3, x4, x5, x6;
        char letter = ReadChar(fp, Log, fBootDb);

        if (letter != '#')
        {
            Log->Bug("%s: # not found.", __FUNCTION__);

            if (fBootDb)
            {
                ShutdownMud("# not found");
                exit(1);
            }
            else
            {
                return;
            }
        }

        vnum = ReadInt(fp, Log, fBootDb);

        if (vnum == INVALID_VNUM)
            break;

        tmpBootDb = fBootDb;
        fBootDb = false;

        if (GetRoom(vnum) != NULL)
        {
            if (tmpBootDb)
            {
                Log->Bug("%s: vnum %ld duplicated.", __FUNCTION__, vnum);
                ShutdownMud("duplicate vnum");
                exit(1);
            }
            else
            {
                char buf[MAX_STRING_LENGTH];
                pRoomIndex = GetRoom(vnum);
                sprintf(buf, "Cleaning room: %ld", vnum);
                Log->LogStringPlus(buf, LOG_BUILD, SysData.LevelOfLogChannel);
                CleanRoom(pRoomIndex);
                oldroom = true;
            }
        }
        else
        {
            oldroom = false;
            pRoomIndex = std::make_shared<Room>();
        }

        fBootDb = tmpBootDb;
        pRoomIndex->Area = tarea;
        pRoomIndex->Vnum = vnum;

        if (fBootDb)
        {
            if (!tarea->VnumRanges.Room.First)
                tarea->VnumRanges.Room.First = vnum;

            if (vnum > tarea->VnumRanges.Room.Last)
                tarea->VnumRanges.Room.Last = vnum;
        }

        pRoomIndex->Name = ReadStringToTilde(fp, Log, fBootDb);
        pRoomIndex->Description = ReadStringToTilde(fp, Log, fBootDb);

        /* Area number                      ReadInt( fp, Log ); */
        ln = ReadLine(fp, Log, fBootDb);
        x1 = x2 = x3 = x4 = x5 = x6 = 0;
        sscanf(ln, "%d %d %d %d %d %d",
            &x1, &x2, &x3, &x4, &x5, &x6);

        pRoomIndex->Flags = x2;
        pRoomIndex->Sector = (SectorType)x3;
        pRoomIndex->TeleDelay = x4;
        pRoomIndex->TeleVnum = x5;
        pRoomIndex->Tunnel = x6;

        if (pRoomIndex->Sector <= SECT_INVALID || pRoomIndex->Sector >= SECT_MAX)
        {
            Log->Bug("%s: vnum %ld has bad sector_type %d.", __FUNCTION__, vnum,
                pRoomIndex->Sector);
            pRoomIndex->Sector = SECT_CITY;
        }

        for (; ; )
        {
            letter = ReadChar(fp, Log, fBootDb);

            if (letter == 'S')
                break;

            if (letter == 'D')
            {
                door = (DirectionType)ReadInt(fp, Log, fBootDb);

                if (door < DIR_NORTH || door > DIR_SOMEWHERE)
                {
                    Log->Bug("%s: vnum %ld has bad door number %d.", __FUNCTION__, vnum,
                        door);

                    if (fBootDb)
                        exit(1);
                }
                else
                {
                    char *description = ReadStringToTilde(fp, Log, fBootDb);
                    char *keyword = ReadStringToTilde(fp, Log, fBootDb);

                    std::shared_ptr<Exit> pexit = MakeExit(pRoomIndex, NULL, door, keyword);
                    FreeMemory(keyword);

                    pexit->Description = description;
                    FreeMemory(description);

                    pexit->Flags = 0;
                    ln = ReadLine(fp, Log, fBootDb);
                    x1 = x2 = x3 = x4 = 0;
                    sscanf(ln, "%d %d %d %d",
                        &x1, &x2, &x3, &x4);

                    int locks = x1;
                    pexit->Key = x2;
                    pexit->Vnum = x3;
                    pexit->Direction = door;
                    pexit->Distance = x4;

                    switch (locks)
                    {
                    case 1:
                        pexit->Flags = CreateBitSet<Flag::MAX>({ Flag::Exit::IsDoor });
                        break;

                    case 2:
                        pexit->Flags = CreateBitSet<Flag::MAX>({ Flag::Exit::IsDoor, Flag::Exit::PickProof });
                        break;

                    default:
                        pexit->Flags = locks;
                        break;
                    }
                }
            }
            else if (letter == 'E')
            {
                std::shared_ptr<ExtraDescription> ed = std::make_shared<ExtraDescription>();
                ed->Keyword = ReadStringToTilde(fp, Log, fBootDb);
                ed->Description = ReadStringToTilde(fp, Log, fBootDb);
                pRoomIndex->Add(ed);
                top_ed++;
            }
            else if (letter == '>')
            {
                ungetc(letter, fp);
                RoomProgReadPrograms(fp, pRoomIndex);
            }
            else
            {
                Log->Bug("%s: vnum %ld has flag '%c' not 'DES'.", __FUNCTION__, vnum,
                    letter);
                ShutdownMud("Room flag not DES");
                exit(1);
            }
        }

        if (!oldroom)
        {
            iHash = vnum % MAX_KEY_HASH;
            pRoomIndex->Next = RoomIndexHash[iHash];
            RoomIndexHash[iHash] = pRoomIndex;
            top_room++;
        }
    }
}

static void LoadShops(std::shared_ptr<Area> tarea, FILE *fp)
{
    for (; ; )
    {
        std::shared_ptr<Shop> pShop = std::make_shared<Shop>();

        pShop->Keeper = ReadInt(fp, Log, fBootDb);

        if (pShop->Keeper == INVALID_VNUM)
            break;

        for (int iTrade = 0; iTrade < MAX_TRADE; iTrade++)
            pShop->BuyType[iTrade] = (ItemTypes)ReadInt(fp, Log, fBootDb);

        pShop->ProfitBuy = ReadInt(fp, Log, fBootDb);
        pShop->ProfitSell = ReadInt(fp, Log, fBootDb);
        pShop->ProfitBuy = urange(pShop->ProfitSell + 5, pShop->ProfitBuy, 1000);
        pShop->ProfitSell = urange(0, pShop->ProfitSell, pShop->ProfitBuy - 5);
        pShop->BusinessHours.Open = ReadInt(fp, Log, fBootDb);
        pShop->BusinessHours.Close = ReadInt(fp, Log, fBootDb);
        ReadToEndOfLine(fp, Log, fBootDb);
        auto pMobIndex = GetProtoMobile(pShop->Keeper);
        pMobIndex->Shop = pShop;

        Shops->Add(pShop);
    }
}

/*
 * Load a repair shop section.                                  -Thoric
 */
static void LoadRepairs(std::shared_ptr<Area> tarea, FILE *fp)
{
    for (; ; )
    {
        std::shared_ptr<RepairShop> rShop = std::make_shared<RepairShop>();
        rShop->Keeper = ReadInt(fp, Log, fBootDb);

        if (rShop->Keeper == INVALID_VNUM)
            break;

        for (int iFix = 0; iFix < MAX_FIX; iFix++)
            rShop->FixType[iFix] = (ItemTypes)ReadInt(fp, Log, fBootDb);

        rShop->ProfitFix = ReadInt(fp, Log, fBootDb);
        rShop->ShopType = ReadInt(fp, Log, fBootDb);
        rShop->BusinessHours.Open = ReadInt(fp, Log, fBootDb);
        rShop->BusinessHours.Close = ReadInt(fp, Log, fBootDb);
        ReadToEndOfLine(fp, Log, fBootDb);
        auto pMobIndex = GetProtoMobile(rShop->Keeper);
        pMobIndex->RepairShop = rShop;

        RepairShops->Add(rShop);
    }
}

/*
 * Load spec proc declarations.
 */
static void LoadSpecials(std::shared_ptr<Area> tarea, FILE *fp)
{
    for (; ; )
    {
        std::shared_ptr<ProtoMobile> pMobIndex;
        char letter = ReadChar(fp, Log, fBootDb);

        switch (letter)
        {
        default:
            Log->Bug("%s: letter '%c' not *MS.", __FUNCTION__, letter);
            exit(1);

        case 'S':
            return;

        case '*':
            break;

        case 'M':
            pMobIndex = GetProtoMobile(ReadInt(fp, Log, fBootDb));

            if (!pMobIndex->spec_fun)
            {
                pMobIndex->spec_fun = SpecialLookup(ReadWord(fp, Log, fBootDb));

                if (pMobIndex->spec_fun == 0)
                {
                    Log->Bug("%s: 'M': vnum %ld.", __FUNCTION__, pMobIndex->Vnum);
                    exit(1);
                }
            }
            else if (!pMobIndex->spec_2)
            {
                pMobIndex->spec_2 = SpecialLookup(ReadWord(fp, Log, fBootDb));

                if (pMobIndex->spec_2 == 0)
                {
                    Log->Bug("%s: 'M': vnum %ld.", __FUNCTION__, pMobIndex->Vnum);
                    exit(1);
                }
            }

            break;
        }

        ReadToEndOfLine(fp, Log, fBootDb);
    }
}

/*
 * Load soft / hard area ranges.
 */
static void LoadRanges(std::shared_ptr<Area> tarea, FILE *fp)
{
    if (!tarea)
    {
        Log->Bug("%s: no #AREA seen yet.", __FUNCTION__);
        ShutdownMud("No #AREA");
        exit(1);
    }

    for (; ; )
    {
        int x1, x2, x3, x4;
        const char *ln = ReadLine(fp, Log, fBootDb);

        if (ln[0] == '$')
            break;

        x1 = x2 = x3 = x4 = 0;
        sscanf(ln, "%d %d %d %d",
            &x1, &x2, &x3, &x4);

        tarea->LevelRanges.Soft.Low = x1;
        tarea->LevelRanges.Soft.High = x2;
        tarea->LevelRanges.Hard.Low = x3;
        tarea->LevelRanges.Hard.High = x4;
    }
}

/* mud prog functions */

/* This routine reads in scripts of MUDprograms from a file */

static int MudProgNameToType(const char *name)
{
    if (!StrCmp(name, "act_prog"))    return ACT_PROG;
    if (!StrCmp(name, "speech_prog"))     return SPEECH_PROG;
    if (!StrCmp(name, "rand_prog"))     return RAND_PROG;
    if (!StrCmp(name, "fight_prog"))     return FIGHT_PROG;
    if (!StrCmp(name, "hitprcnt_prog"))     return HITPRCNT_PROG;
    if (!StrCmp(name, "death_prog"))     return DEATH_PROG;
    if (!StrCmp(name, "entry_prog"))     return ENTRY_PROG;
    if (!StrCmp(name, "greet_prog"))     return GREET_PROG;
    if (!StrCmp(name, "all_greet_prog"))     return ALL_GREET_PROG;
    if (!StrCmp(name, "give_prog"))     return GIVE_PROG;
    if (!StrCmp(name, "bribe_prog"))     return BRIBE_PROG;
    if (!StrCmp(name, "time_prog"))      return TIME_PROG;
    if (!StrCmp(name, "hour_prog"))      return HOUR_PROG;
    if (!StrCmp(name, "wear_prog"))      return WEAR_PROG;
    if (!StrCmp(name, "remove_prog"))      return REMOVE_PROG;
    if (!StrCmp(name, "sac_prog"))      return SAC_PROG;
    if (!StrCmp(name, "look_prog"))      return LOOK_PROG;
    if (!StrCmp(name, "exa_prog"))      return EXA_PROG;
    if (!StrCmp(name, "zap_prog"))      return ZAP_PROG;
    if (!StrCmp(name, "get_prog"))      return GET_PROG;
    if (!StrCmp(name, "drop_prog"))      return DROP_PROG;
    if (!StrCmp(name, "damage_prog"))      return DAMAGE_PROG;
    if (!StrCmp(name, "repair_prog"))      return REPAIR_PROG;
    if (!StrCmp(name, "greet_prog"))      return GREET_PROG;
    if (!StrCmp(name, "randiw_prog"))      return RANDIW_PROG;
    if (!StrCmp(name, "speechiw_prog"))      return SPEECHIW_PROG;
    if (!StrCmp(name, "pull_prog"))     return PULL_PROG;
    if (!StrCmp(name, "push_prog"))     return PUSH_PROG;
    if (!StrCmp(name, "sleep_prog"))      return SLEEP_PROG;
    if (!StrCmp(name, "rest_prog"))     return REST_PROG;
    if (!StrCmp(name, "rfight_prog"))      return FIGHT_PROG;
    if (!StrCmp(name, "enter_prog"))      return ENTRY_PROG;
    if (!StrCmp(name, "leave_prog"))      return LEAVE_PROG;
    if (!StrCmp(name, "rdeath_prog"))     return DEATH_PROG;
    if (!StrCmp(name, "script_prog"))     return SCRIPT_PROG;
    if (!StrCmp(name, "use_prog"))     return USE_PROG;
    return(ERROR_PROG);
}

/* This procedure is responsible for reading any in_file MUDprograms.
 */

static void MobProgReadPrograms(FILE *fp, std::shared_ptr<ProtoMobile> pMobIndex)
{
    char letter = 0;
    bool done = false;

    if ((letter = ReadChar(fp, Log, fBootDb)) != '>')
    {
        Log->Bug("%s: vnum %ld MUDPROG char", __FUNCTION__, pMobIndex->Vnum);
        exit(1);
    }

    std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();
    pMobIndex->mprog.Add(mprg);

    while (!done)
    {
        mprg->type = MudProgNameToType(ReadWord(fp, Log, fBootDb));

        switch (mprg->type)
        {
        case ERROR_PROG:
            Log->Bug("%s: vnum %ld MUDPROG type.", __FUNCTION__, pMobIndex->Vnum);
            exit(1);
            break;

        default:
            pMobIndex->mprog.progtypes = pMobIndex->mprog.progtypes | mprg->type;
            mprg->arglist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);
            mprg->comlist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);

            switch (letter = ReadChar(fp, Log, fBootDb))
            {
            case '>':
                mprg = std::make_shared<MPROG_DATA>();
                pMobIndex->mprog.Add(mprg);
                break;

            case '|':
                ReadToEndOfLine(fp, Log, fBootDb);
                done = true;
                break;

            default:
                Log->Bug("%s: vnum %ld bad MUDPROG.", __FUNCTION__, pMobIndex->Vnum);
                exit(1);
                break;
            }

            break;
        }
    }
}

/* This procedure is responsible for reading any in_file OBJprograms.
 */

static void ObjProgReadPrograms(FILE *fp, std::shared_ptr<ProtoObject> pObjIndex)
{
    char letter = 0;
    bool done = false;

    if ((letter = ReadChar(fp, Log, fBootDb)) != '>')
    {
        Log->Bug("%s: vnum %ld OBJPROG char", __FUNCTION__, pObjIndex->Vnum);
        exit(1);
    }

    std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();
    pObjIndex->mprog.Add(mprg);

    while (!done)
    {
        mprg->type = MudProgNameToType(ReadWord(fp, Log, fBootDb));

        switch (mprg->type)
        {
        case ERROR_PROG:
            Log->Bug("%s: vnum %ld OBJPROG type.", __FUNCTION__, pObjIndex->Vnum);
            exit(1);
            break;

        default:
            pObjIndex->mprog.progtypes = pObjIndex->mprog.progtypes | mprg->type;
            mprg->arglist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);
            mprg->comlist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);

            switch (letter = ReadChar(fp, Log, fBootDb))
            {
            case '>':
                mprg = std::make_shared<MPROG_DATA>();
                pObjIndex->mprog.Add(mprg);
                break;

            case '|':
                ReadToEndOfLine(fp, Log, fBootDb);
                done = true;
                break;

            default:
                Log->Bug("%s: vnum %ld bad OBJPROG.", __FUNCTION__, pObjIndex->Vnum);
                exit(1);
                break;
            }
            break;
        }
    }

    return;
}

/* This procedure is responsible for reading any in_file ROOMprograms.
 */

static void RoomProgReadPrograms(FILE *fp, std::shared_ptr<Room> pRoomIndex)
{
    char letter = 0;
    bool done = false;

    if ((letter = ReadChar(fp, Log, fBootDb)) != '>')
    {
        Log->Bug("%s: vnum %ld ROOMPROG char", __FUNCTION__, pRoomIndex->Vnum);
        exit(1);
    }

    std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();
    pRoomIndex->mprog.Add(mprg);

    while (!done)
    {
        mprg->type = MudProgNameToType(ReadWord(fp, Log, fBootDb));

        switch (mprg->type)
        {
        case ERROR_PROG:
            Log->Bug("%s: vnum %ld ROOMPROG type.", __FUNCTION__, pRoomIndex->Vnum);
            exit(1);
            break;

        default:
            pRoomIndex->mprog.progtypes = pRoomIndex->mprog.progtypes | mprg->type;
            mprg->arglist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);
            mprg->comlist = ReadStringToTilde(fp, Log, fBootDb);
            ReadToEndOfLine(fp, Log, fBootDb);

            switch (letter = ReadChar(fp, Log, fBootDb))
            {
            case '>':
                mprg = std::make_shared<MPROG_DATA>();
                pRoomIndex->mprog.Add(mprg);
                break;

            case '|':
                ReadToEndOfLine(fp, Log, fBootDb);
                done = true;
                break;

            default:
                Log->Bug("%s: vnum %ld bad ROOMPROG.", __FUNCTION__, pRoomIndex->Vnum);
                exit(1);
                break;
            }

            break;
        }
    }
}

std::shared_ptr<Area> GetArea(const std::string &name)
{
    std::shared_ptr<Area> area;

    for (area = Areas->FirstArea; area; area = area->Next)
    {
        if (!StrCmp(area->Filename, name) || !StrCmp(area->Name, name))
        {
            break;
        }
    }

    return area;
}

/*
 * Repopulate areas periodically.
 */
void AreaUpdate()
{
    for (auto area = Areas->FirstArea; area; area = area->Next)
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

    UNLINK(pArea, Areas->FirstBuild, Areas->LastBuild, Next, Previous);
    UNLINK(pArea, Areas->FirstASort, Areas->LastASort, NextSort, PreviousSort);
}

void FreeArea(std::shared_ptr<Area> are)
{
    while (are->FirstReset)
        FreeReset(are, are->FirstReset);
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
        bool created = false;
        std::shared_ptr<Area> tarea = ch->PCData->Build.Area;

        auto filename = FormatString("%s.lua", Capitalize(ch->Name).c_str());

        if (tarea == nullptr)
        {
            for (auto tmp = Areas->FirstBuild; tmp; tmp = tmp->Next)
            {
                if (!StrCmp(filename, tmp->Filename))
                {
                    tarea = tmp;
                    break;
                }
            }
        }

        if (tarea == nullptr)
        {
            auto logBuf = FormatString("Creating area entry for %s", ch->Name.c_str());
            Log->LogStringPlus(logBuf, LOG_NORMAL, ch->TopLevel);
            tarea = std::make_shared<Area>();
            LINK(tarea, Areas->FirstBuild, Areas->LastBuild, Next, Previous);
            tarea->Name = FormatString("{PROTO} %s's area in progress", ch->Name.c_str());
            tarea->Filename = filename;
            tarea->Author = ch->Name;

            created = true;
        }
        else
        {
            auto logBuf = FormatString("Updating area entry for %s", ch->Name.c_str());
            Log->LogStringPlus(logBuf, LOG_NORMAL, ch->TopLevel);
        }

        tarea->VnumRanges.Room.First = ch->PCData->Build.VnumRanges.Room.First;
        tarea->VnumRanges.Object.First = ch->PCData->Build.VnumRanges.Object.First;
        tarea->VnumRanges.Mob.First = ch->PCData->Build.VnumRanges.Mob.First;
        tarea->VnumRanges.Room.Last = ch->PCData->Build.VnumRanges.Room.Last;
        tarea->VnumRanges.Object.Last = ch->PCData->Build.VnumRanges.Object.Last;
        tarea->VnumRanges.Mob.Last = ch->PCData->Build.VnumRanges.Mob.Last;
        ch->PCData->Build.Area = tarea;

        if (created)
        {
            SortArea(tarea, true);
        }
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
