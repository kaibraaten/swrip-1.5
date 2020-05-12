#include <utility/algorithms.hpp>
#include "area.hpp"
#include "mud.hpp"
#include "shop.hpp"
#include "reset.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "exit.hpp"
#include "character.hpp"
#include "repos/shoprepository.hpp"
#include "repos/objectrepository.hpp"
#include "legacy_arearepository.hpp"

#define AREA_DIR        DATA_DIR "areas/"

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];
static std::shared_ptr<Area> lastArea;

static void LoadAreaFile(std::shared_ptr<Area> tarea, const std::string &filename);
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

class LegacyAreaRepository : public AreaRepository
{
public:
    void Load() override;
    void Load(std::shared_ptr<Area> area) override;
    void Save() const override;
    void Save(const std::shared_ptr<Area>&) const override;
    void Save(const std::shared_ptr<Area>&, bool install) const override;
    std::string GetAreaFilename(std::shared_ptr<Area> area) const override;
};

void LegacyAreaRepository::Load(std::shared_ptr<Area> area)
{
    lastArea.reset();
    auto file = GetAreaFilename(area);
    auto proto = area->Flags.test(Flag::Area::Prototype);
    area->Flags.reset(Flag::Area::Prototype);
    LoadAreaFile(area, file);
    area->Flags[Flag::Area::Prototype] = proto;
    lastArea.reset();
}

void LegacyAreaRepository::Load()
{
    FILE *fpList = nullptr;

    if ((fpList = fopen(AREA_DIR AREA_LIST, "r")) == NULL)
    {
        ShutdownMud("Unable to open area list");
        exit(1);
    }

    lastArea.reset();
    
    for (; ; )
    {
        strcpy(strArea, ReadWord(fpList, Log, fBootDb));

        if (strArea[0] == '$')
            break;

        LoadAreaFile(lastArea, strArea);
    }

    lastArea.reset();
    
    fclose(fpList);
}

void LegacyAreaRepository::Save() const
{
    for(auto area : Areas)
    {
        Save(area);
    }
}

void LegacyAreaRepository::Save(const std::shared_ptr<Area> &area) const
{
    Save(area, false);
}

static bool IsInstalled(std::shared_ptr<Area> area)
{
    for(auto tmp : Areas->AreasInProgress())
    {
        if(tmp == area)
        {
            return false;
        }
    }

    return true;
}

void LegacyAreaRepository::Save(const std::shared_ptr<Area> &tarea, bool install) const
{
    std::shared_ptr<Room> room;
    std::shared_ptr<ProtoMobile> pMobIndex;
    std::shared_ptr<ProtoObject> pObjIndex;
    std::shared_ptr<Shop> pShop;
    std::shared_ptr<RepairShop> pRepair;
    char buf[MAX_STRING_LENGTH];
    FILE *fpout = NULL;
    vnum_t vnum = INVALID_VNUM;
    int val0 = 0, val1 = 0, val2 = 0, val3 = 0, val4 = 0, val5 = 0;
    bool complexmob = false;
    char backup[MAX_STRING_LENGTH];

    sprintf(buf, "Saving %s...", tarea->Filename.c_str());
    Log->LogStringPlus(buf, LOG_NORMAL, LEVEL_GREATER);

    if(IsInstalled(tarea))
    {
        sprintf(buf, "%s%s", AREA_DIR, tarea->Filename.c_str());
        sprintf(backup, "%s%s.bak", AREA_DIR, tarea->Filename.c_str());
    }
    else
    {
        sprintf(buf, "%s%s", BUILD_DIR, tarea->Filename.c_str());
        sprintf(backup, "%s%s.bak", BUILD_DIR, tarea->Filename.c_str());
    }
    
    rename(buf, backup);

    if ((fpout = fopen(buf, "w")) == NULL)
    {
        Log->Bug("%s: fopen", __FUNCTION__);
        perror(tarea->Filename.c_str());
        return;
    }

    fprintf(fpout, "#AREA   %s~\n\n\n\n", tarea->Name.c_str());

    fprintf(fpout, "#AUTHOR %s~\n\n", tarea->Author.c_str());
    fprintf(fpout, "#RANGES\n");
    fprintf(fpout, "%d %d %d %d\n", tarea->LevelRanges.Soft.Low,
        tarea->LevelRanges.Soft.High,
        tarea->LevelRanges.Hard.Low,
        tarea->LevelRanges.Hard.High);
    fprintf(fpout, "$\n\n");

    if (!tarea->ResetMessage.empty())        /* Rennard */
        fprintf(fpout, "#RESETMSG %s~\n\n", tarea->ResetMessage.c_str());

    if (tarea->ResetFrequency)
        fprintf(fpout, "#FLAGS\n%d %d\n\n",
            static_cast<int>(tarea->Flags.to_ulong()), tarea->ResetFrequency);
    else
        fprintf(fpout, "#FLAGS\n%d\n\n",
            static_cast<int>(tarea->Flags.to_ulong()));

    fprintf(fpout, "#ECONOMY %d %d\n\n", tarea->HighEconomy, tarea->LowEconomy);

    /* save mobiles */
    fprintf(fpout, "#MOBILES\n");

    for (vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
        }

        if ((pMobIndex = GetProtoMobile(vnum)) == NULL)
            continue;

        if (install)
            RemoveBit(pMobIndex->Flags, ACT_PROTOTYPE);

        if (pMobIndex->Stats.Str != 13
            || pMobIndex->Stats.Int != 13
            || pMobIndex->Stats.Wis != 13
            || pMobIndex->Stats.Dex != 13
            || pMobIndex->Stats.Con != 13 || pMobIndex->Stats.Cha != 13
            || pMobIndex->Stats.Lck != 13
            || pMobIndex->HitRoll != 0 || pMobIndex->DamRoll != 0
            || pMobIndex->Race != 0
            || pMobIndex->AttackFlags != 0 || pMobIndex->DefenseFlags != 0
            || pMobIndex->Height != 0 || pMobIndex->Weight != 0
            || pMobIndex->Speaks != 0 || pMobIndex->Speaking != 0
            || pMobIndex->NumberOfAttacks != 0
            || pMobIndex->VipFlags.any())
            complexmob = true;
        else
            complexmob = false;
        fprintf(fpout, "#%ld\n", vnum);
        fprintf(fpout, "%s~\n", pMobIndex->Name.c_str());
        fprintf(fpout, "%s~\n", pMobIndex->ShortDescr.c_str());
        fprintf(fpout, "%s~\n", StripCarriageReturn(pMobIndex->LongDescr).c_str());
        fprintf(fpout, "%s~\n", StripCarriageReturn(pMobIndex->Description).c_str());
        fprintf(fpout, "%d %d %d %c\n", pMobIndex->Flags,
            pMobIndex->AffectedBy,
            pMobIndex->Alignment,
            complexmob ? 'Z' : 'S');
        /* C changed to Z for swreality vip_flags  */

        fprintf(fpout, "%d %d %d ",
            pMobIndex->Level,
            0, //pMobIndex->MobThac0,
            pMobIndex->ArmorClass);
        fprintf(fpout, "%dd%d+%d ", pMobIndex->HitNoDice,
            pMobIndex->HitSizeDice,
            pMobIndex->HitPlus);
        fprintf(fpout, "%dd%d+%d\n", pMobIndex->DamNoDice,
            pMobIndex->DamSizeDice,
            pMobIndex->DamPlus);
        fprintf(fpout, "%d 0\n", pMobIndex->Gold);
        fprintf(fpout, "%d %d %d\n", pMobIndex->Position,
            pMobIndex->DefaultPosition,
            pMobIndex->Sex);
        
        if (complexmob)
        {
            fprintf(fpout, "%d %d %d %d %d %d %d\n",
                pMobIndex->Stats.Str,
                pMobIndex->Stats.Int,
                pMobIndex->Stats.Wis,
                pMobIndex->Stats.Dex,
                pMobIndex->Stats.Con,
                pMobIndex->Stats.Cha,
                pMobIndex->Stats.Lck);
            fprintf(fpout, "%d %d %d %d %d\n",
                pMobIndex->Saving.PoisonDeath,
                pMobIndex->Saving.Wand,
                pMobIndex->Saving.ParaPetri,
                pMobIndex->Saving.Breath,
                pMobIndex->Saving.SpellStaff);
            fprintf(fpout, "%d 0 %d %d %d %d %d\n",
                pMobIndex->Race,
                pMobIndex->Height,
                pMobIndex->Weight,
                pMobIndex->Speaks,
                pMobIndex->Speaking,
                pMobIndex->NumberOfAttacks);
            fprintf(fpout, "%d %d %d %d %d %d %d %d\n",
                pMobIndex->HitRoll,
                pMobIndex->DamRoll,
                0, //pMobIndex->BodyParts,
                pMobIndex->Resistant,
                pMobIndex->Immune,
                pMobIndex->Susceptible,
                pMobIndex->AttackFlags,
                pMobIndex->DefenseFlags);
            fprintf(fpout, "%d 0 0 0 0 0 0 0\n",
                static_cast<int>(pMobIndex->VipFlags.to_ulong()));
        }

        if (!pMobIndex->mprog.MudProgs().empty())
        {
            for (auto mprog : pMobIndex->mprog.MudProgs())
            {
                fprintf(fpout, "> %s %s~\n%s~\n",
                    MobProgTypeToName(mprog->type),
                         mprog->arglist, StripCarriageReturn(mprog->comlist).c_str());
            }

            fprintf(fpout, "|\n");
        }
    }
    fprintf(fpout, "#0\n\n\n");
    if (install && vnum < tarea->VnumRanges.Mob.Last)
        tarea->VnumRanges.Mob.Last = vnum - 1;

    /* save objects */
    fprintf(fpout, "#OBJECTS\n");
    for (vnum = tarea->VnumRanges.Object.First; vnum <= tarea->VnumRanges.Object.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
        }

        if ((pObjIndex = GetProtoObject(vnum)) == NULL)
            continue;

        if (install)
            RemoveBit(pObjIndex->Flags, ITEM_PROTOTYPE);

        fprintf(fpout, "#%ld\n", vnum);
        fprintf(fpout, "%s~\n", pObjIndex->Name.c_str());
        fprintf(fpout, "%s~\n", pObjIndex->ShortDescr.c_str());
        fprintf(fpout, "%s~\n", pObjIndex->Description.c_str());
        fprintf(fpout, "%s~\n", pObjIndex->ActionDescription.c_str());

        if (pObjIndex->Layers)
            fprintf(fpout, "%d %d %d %d\n", pObjIndex->ItemType,
                pObjIndex->Flags,
                pObjIndex->WearFlags,
                pObjIndex->Layers);
        else
            fprintf(fpout, "%d %d %d\n", pObjIndex->ItemType,
                pObjIndex->Flags,
                pObjIndex->WearFlags);

        val0 = pObjIndex->Value[0];
        val1 = pObjIndex->Value[1];
        val2 = pObjIndex->Value[2];
        val3 = pObjIndex->Value[3];
        val4 = pObjIndex->Value[4];
        val5 = pObjIndex->Value[5];

        switch (pObjIndex->ItemType)
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
            if (IS_VALID_SN(val1))
                val1 = SkillTable[val1]->Slot;

            if (IS_VALID_SN(val2))
                val2 = SkillTable[val2]->Slot;

            if (IS_VALID_SN(val3))
                val3 = SkillTable[val3]->Slot;
            break;
        case ITEM_DEVICE:
            if (IS_VALID_SN(val3))
                val3 = SkillTable[val3]->Slot;
            break;
        case ITEM_SALVE:
            if (IS_VALID_SN(val4))
                val4 = SkillTable[val4]->Slot;

            if (IS_VALID_SN(val5))
                val5 = SkillTable[val5]->Slot;
            break;

        default:
            break;
        }
        if (val4 || val5)
            fprintf(fpout, "%d %d %d %d %d %d\n", val0,
                val1,
                    val2,
                val3,
                val4,
                val5);
        else
            fprintf(fpout, "%d %d %d %d\n", val0,
                val1,
                val2,
                val3);

        fprintf(fpout, "%d %d %d\n", pObjIndex->Weight,
                pObjIndex->Cost,
                0 /* Used to be rent */);

        for (auto ed : pObjIndex->ExtraDescriptions())
            fprintf(fpout, "E\n%s~\n%s~\n",
                ed->Keyword.c_str(), StripCarriageReturn(ed->Description).c_str());

        for (auto paf : pObjIndex->Affects())
            fprintf(fpout, "A\n%d %d\n", paf->Location,
            ((paf->Location == APPLY_WEAPONSPELL
                || paf->Location == APPLY_WEARSPELL
                || paf->Location == APPLY_REMOVESPELL
                || paf->Location == APPLY_STRIPSN)
                && IS_VALID_SN(paf->Modifier))
                ? SkillTable[paf->Modifier]->Slot : paf->Modifier);

        if (!pObjIndex->mprog.MudProgs().empty())
        {
            for (auto mprog : pObjIndex->mprog.MudProgs())
            {
                fprintf(fpout, "> %s %s~\n%s~\n",
                    MobProgTypeToName(mprog->type),
                    mprog->arglist, StripCarriageReturn(mprog->comlist).c_str());
            }

            fprintf(fpout, "|\n");
        }
    }

    fprintf(fpout, "#0\n\n\n");

    if (install && vnum < tarea->VnumRanges.Object.Last)
        tarea->VnumRanges.Object.Last = vnum - 1;

    /* save rooms   */
    fprintf(fpout, "#ROOMS\n");

    for (vnum = tarea->VnumRanges.Room.First; vnum <= tarea->VnumRanges.Room.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
        }

        if ((room = GetRoom(vnum)) == NULL)
            continue;

        if (install)
        {
            /* remove prototype flag from room */
            room->Flags.reset(Flag::Room::Prototype);

            /* purge room of (prototyped) mobiles */
            std::list<Character*> charactersToExtract = Filter(room->Characters(),
                [](auto victim)
            {
                return IsNpc(victim);
            });

            for (Character *victim : charactersToExtract)
            {
                ExtractCharacter(victim, true);
            }

            /* purge room of (prototyped) objects */
            std::list<Object*> objectsToExtract(room->Objects());

            for (Object *obj : objectsToExtract)
            {
                 ExtractObject(obj);
            }
        }
        fprintf(fpout, "#%ld\n", vnum);
        fprintf(fpout, "%s~\n", room->Name.c_str());
        fprintf(fpout, "%s~\n", StripCarriageReturn(room->Description).c_str());
        if ((room->TeleDelay > 0 && room->TeleVnum > 0) || room->Tunnel > 0)
            fprintf(fpout, "0 %d %d %d %ld %d\n", static_cast<int>(room->Flags.to_ulong()),
                room->Sector,
                room->TeleDelay,
                room->TeleVnum,
                room->Tunnel);
        else
            fprintf(fpout, "0 %d %d\n", static_cast<int>(room->Flags.to_ulong()), room->Sector);

        for (std::shared_ptr<Exit> xit : room->Exits())
        {
            if (xit->Flags.test(Flag::Exit::Portal)) /* don't fold portals */
            {
                continue;
            }

            fprintf(fpout, "D%d\n", xit->Direction);
            fprintf(fpout, "%s~\n", StripCarriageReturn(xit->Description).c_str());
            fprintf(fpout, "%s~\n", StripCarriageReturn(xit->Keyword).c_str());

            std::bitset<Flag::MAX> flags = xit->Flags;
            flags.reset(Flag::Exit::Bashed);

            if (xit->Distance > 1)
                fprintf(fpout, "%d %ld %ld %d\n",
                    static_cast<int>(xit->Flags.to_ulong()),
                    xit->Key,
                    xit->Vnum,
                    xit->Distance);
            else
                fprintf(fpout, "%d %ld %ld\n",
                    static_cast<int>(xit->Flags.to_ulong()),
                    xit->Key,
                    xit->Vnum);
            }

        for (auto ed : room->ExtraDescriptions())
        {
            fprintf(fpout, "E\n%s~\n%s~\n",
                ed->Keyword.c_str(), StripCarriageReturn(ed->Description).c_str());
        }

        if (!room->mprog.MudProgs().empty())
        {
            for (auto mprog : room->mprog.MudProgs())
            {
                fprintf(fpout, "> %s %s~\n%s~\n",
                    MobProgTypeToName(mprog->type),
                    mprog->arglist, StripCarriageReturn(mprog->comlist).c_str());
            }

            fprintf(fpout, "|\n");
        }

        fprintf(fpout, "S\n");
    }

    fprintf(fpout, "#0\n\n\n");

    if (install && vnum < tarea->VnumRanges.Room.Last)
        tarea->VnumRanges.Room.Last = vnum - 1;

    /* save resets   */
    fprintf(fpout, "#RESETS\n");
    for (auto treset = tarea->FirstReset; treset; treset = treset->Next)
    {
        switch (treset->Command) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
            case 't': case 'T':
            fprintf(fpout, "%c %d %d %d %d\n", CharToUppercase(treset->Command),
                treset->MiscData, treset->Arg1, treset->Arg2, treset->Arg3);
            break;
        case 'g': case 'G':
        case 'r': case 'R':
            fprintf(fpout, "%c %d %d %d\n", CharToUppercase(treset->Command),
                treset->MiscData, treset->Arg1, treset->Arg2);
            break;
        }
    }
    fprintf(fpout, "S\n\n\n");

    /* save shops */
    fprintf(fpout, "#SHOPS\n");
    for (vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
        }

        if ((pMobIndex = GetProtoMobile(vnum)) == NULL)
            continue;

        if ((pShop = pMobIndex->Shop) == NULL)
            continue;

        fprintf(fpout, " %ld   %2d %2d %2d %2d %2d   %3d %3d",
            pShop->Keeper,
            pShop->BuyType[0],
            pShop->BuyType[1],
            pShop->BuyType[2],
            pShop->BuyType[3],
            pShop->BuyType[4],
            pShop->ProfitBuy,
            pShop->ProfitSell);
        fprintf(fpout, "        %2d %2d    ; %s\n",
            pShop->BusinessHours.Open,
            pShop->BusinessHours.Close,
                pMobIndex->ShortDescr.c_str());
    }
    fprintf(fpout, "0\n\n\n");

    /* save repair shops */
    fprintf(fpout, "#REPAIRS\n");
    for (vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
        }

        if ((pMobIndex = GetProtoMobile(vnum)) == NULL)
            continue;

        if ((pRepair = pMobIndex->RepairShop) == NULL)
            continue;

        fprintf(fpout, " %ld   %2d %2d %2d         %3d %3d",
            pRepair->Keeper,
            pRepair->FixType[0],
            pRepair->FixType[1],
            pRepair->FixType[2],
            pRepair->ProfitFix,
            pRepair->ShopType);
        fprintf(fpout, "        %2d %2d    ; %s\n",
            pRepair->BusinessHours.Open,
            pRepair->BusinessHours.Close,
            pMobIndex->ShortDescr.c_str());
    }
    fprintf(fpout, "0\n\n\n");

    /* save specials */
    fprintf(fpout, "#SPECIALS\n");
    
    for (vnum = tarea->VnumRanges.Mob.First; vnum <= tarea->VnumRanges.Mob.Last; vnum++)
    {
        if (vnum == INVALID_VNUM)
        {
            continue;
            }

        if ((pMobIndex = GetProtoMobile(vnum)) == NULL)
            continue;
        
        if (pMobIndex->spec_fun)
            fprintf(fpout, "M  %ld %s\n", pMobIndex->Vnum,
                    LookupSpecial(pMobIndex->spec_fun).c_str());
        
        if (pMobIndex->spec_2)
            fprintf(fpout, "M  %ld %s\n", pMobIndex->Vnum,
                    LookupSpecial(pMobIndex->spec_2).c_str());
    }
    fprintf(fpout, "S\n\n\n");

    /* END */
    fprintf(fpout, "#$\n");
    fclose(fpout);
}

////////////////////////////////////////
// Legacy code here

static void LoadAreaFile(std::shared_ptr<Area> tarea, const std::string &filename)
{
    char buf[MAX_STRING_LENGTH];

    if (fBootDb)
        tarea = lastArea;

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
                tarea = lastArea;
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
        fprintf(stderr, "%-14s: Rooms: %5ld - %-5ld Objs: %5ld - %-5ld Mobs: %5ld - %ld\n",
                tarea->Filename.c_str(),
                tarea->VnumRanges.Room.First, tarea->VnumRanges.Room.Last,
                tarea->VnumRanges.Object.First, tarea->VnumRanges.Object.Last,
                tarea->VnumRanges.Mob.First, tarea->VnumRanges.Mob.Last);

        SetBit(tarea->Status, AreaStatus::Loaded);
    }
    else
    {
        fprintf(stderr, "(%s)\n", filename.c_str());
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

    Areas->Add(pArea);
    lastArea = pArea;
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

std::string LegacyAreaRepository::GetAreaFilename(std::shared_ptr<Area> area) const
{
    const char *directory = area->Flags.test(Flag::Area::Prototype) ? BUILD_DIR : AREA_DIR;
    return FormatString("%s%s", directory, area->Filename.c_str());
}

/////////////////////////////////////
std::shared_ptr<AreaRepository> NewLegacyAreaRepository()
{
    return std::make_shared<LegacyAreaRepository>();
}
