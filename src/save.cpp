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
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "alias.hpp"
#include "race.hpp"
#include "repos/playerrepository.hpp"
#include "repos/objectrepository.hpp"

/*
 * Increment with every major format change.
 */
#define SAVEVERSION     3

 /*
  * Array to keep track of equipment temporarily.                -Thoric
  */
Object *save_equipment[MAX_WEAR][8];
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
static Object *rgObjNest[MAX_NEST];

/*
 * Local functions.
 */
static bool HasAnyOvalues(const Object *obj);
static void WriteCharacter(const Character *ch, FILE *fp);

void SaveHome(Character *ch)
{
    if (ch->PlayerHome)
    {
        FILE *fp = NULL;
        char filename[256];
        short templvl = 0;

        sprintf(filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->Name[0]),
            Capitalize(ch->Name).c_str());

        if ((fp = fopen(filename, "w")))
        {
            templvl = ch->TopLevel;
            ch->TopLevel = LEVEL_AVATAR;           /* make sure EQ doesn't get lost */

            for (const Object *obj : Reverse(ch->PlayerHome->Objects()))
            {
                WriteObject(ch, obj, fp, 0, OS_CARRY);
            }

            fprintf(fp, "#END\n");
            ch->TopLevel = templvl;
            fclose(fp);
        }
    }
}

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

    for (Object *obj : ch->Objects())
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

void SaveClone(Character *ch)
{
    assert(ch != nullptr);

    char strsave[MAX_INPUT_LENGTH];
    char strback[MAX_INPUT_LENGTH];
    FILE *fp = NULL;

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
    sprintf(strsave, "%s%c/%s.clone", PLAYER_DIR, tolower(ch->Name[0]),
        Capitalize(ch->Name).c_str());

    /*
     * Auto-backup pfile (can cause lag with high disk access situtations
     */
    if (SysData.SaveFlags.test(Flag::AutoSave::Backup))
    {
        sprintf(strback, "%s%c/%s", BACKUP_DIR, tolower(ch->Name[0]),
            Capitalize(ch->Name).c_str());
        rename(strsave, strback);
    }

    if ((fp = fopen(strsave, "w")) == NULL)
    {
        Log->Bug("Save_char_obj: fopen");
        perror(strsave);
    }
    else
    {
        WriteCharacter(ch, fp);

        if (ch->PCData && !ch->PCData->Comments().empty())
        {
            WriteComments(ch, fp);
        }

        fprintf(fp, "#END\n");
        fclose(fp);
    }

    ch->PCData->Clones--;
    ReEquipCharacter(ch);

    WriteCorpses(ch, "");
    quitting_char = NULL;
    saving_char = NULL;
}

/*
 * Write the char.
 */
static void WriteCharacter(const Character *ch, FILE *fp)
{
    int sn = 0;
    int drug = 0;
    const Skill *skill = NULL;

    fprintf(fp, "#%s\n", IsNpc(ch) ? "MOB" : "PLAYER");

    fprintf(fp, "Version      %d\n", SAVEVERSION);
    fprintf(fp, "Name         %s~\n", ch->Name.c_str());

    if (!ch->ShortDescr.empty())
    {
        fprintf(fp, "ShortDescr   %s~\n", ch->ShortDescr.c_str());
    }

    if (!ch->LongDescr.empty())
    {
        fprintf(fp, "LongDescr    %s~\n", ch->LongDescr.c_str());
    }

    if (!ch->Description.empty())
    {
        fprintf(fp, "Description  %s~\n", ch->Description.c_str());
    }

    fprintf(fp, "Sex          %d\n", ch->Sex);
    fprintf(fp, "Race         %d\n", ch->Race);
    fprintf(fp, "MainAbility  %d\n", ch->Ability.Main);
    fprintf(fp, "Languages    %d %d\n", ch->Speaks, ch->Speaking);
    fprintf(fp, "Toplevel     %d\n", ch->TopLevel);

    if (ch->Trust)
    {
        fprintf(fp, "Trust        %d\n", ch->Trust);
    }

    fprintf(fp, "Played       %d\n",
        ch->PCData->Played + (int)(current_time - ch->PCData->Logon));
    fprintf(fp, "Room         %ld\n",
        (ch->InRoom == GetRoom(ROOM_VNUM_LIMBO)
            && ch->WasInRoom)
        ? ch->WasInRoom->Vnum
        : ch->InRoom->Vnum);

    if (ch->PlayerHome != NULL)
    {
        fprintf(fp, "PlrHome      %ld\n", ch->PlayerHome->Vnum);
    }

    fprintf(fp, "HpManaMove   %d %d 0 0 %d %d\n",
        ch->HitPoints.Current, ch->HitPoints.Max,
        ch->Fatigue.Current, ch->Fatigue.Max);
    fprintf(fp, "Force        %d %d %d %d\n",
        ch->PermStats.Frc, ch->StatMods.Frc,
        ch->Mana.Current, ch->Mana.Max);
    fprintf(fp, "Gold         %d\n", ch->Gold);
    fprintf(fp, "Bank         %ld\n", ch->PCData->Bank);

    {
        int ability;
        for (ability = 0; ability < MAX_ABILITY; ability++)
            fprintf(fp, "Ability        %d %d %ld\n",
                ability, GetAbilityLevel(ch, ability), GetAbilityXP(ch, ability));
    }

    fprintf(fp, "Clones         %d\n", ch->PCData->Clones);
    fprintf(fp, "Salary_time         %ld\n", ch->PCData->ClanInfo.SalaryDate);
    fprintf(fp, "Salary         %d\n", ch->PCData->ClanInfo.Salary);
    fprintf(fp, "Jailvnum         %ld\n", ch->PCData->JailVnum);

    if (ch->Flags)
    {
        fprintf(fp, "Act          %d\n", ch->Flags);
    }

    if (ch->AffectedBy)
    {
        fprintf(fp, "AffectedBy   %d\n", ch->AffectedBy);
    }

    fprintf(fp, "Position     %d\n",
        ch->Position == POS_FIGHTING ? POS_STANDING : ch->Position);

    fprintf(fp, "SavingThrows %d %d %d %d %d\n",
        ch->Saving.PoisonDeath,
        ch->Saving.Wand,
        ch->Saving.ParaPetri,
        ch->Saving.Breath,
        ch->Saving.SpellStaff);
    fprintf(fp, "Alignment    %d\n", ch->Alignment);
    fprintf(fp, "Hitroll      %d\n", ch->HitRoll);
    fprintf(fp, "Damroll      %d\n", ch->DamRoll);
    fprintf(fp, "Armor        %d\n", ch->ArmorClass);

    if (ch->Wimpy)
    {
        fprintf(fp, "Wimpy        %d\n", ch->Wimpy);
    }

    if (ch->Deaf)
    {
        fprintf(fp, "Deaf         %d\n", ch->Deaf);
    }

    if (ch->Resistant)
    {
        fprintf(fp, "Resistant    %d\n", ch->Resistant);
    }

    if (ch->Immune)
    {
        fprintf(fp, "Immune       %d\n", ch->Immune);
    }

    if (ch->Susceptible)
    {
        fprintf(fp, "Susceptible  %d\n", ch->Susceptible);
    }

    if (ch->PCData && ch->PCData->RestoreTime)
    {
        fprintf(fp, "Restore_time %ld\n", ch->PCData->RestoreTime);
    }

    if (ch->MentalState != -10)
    {
        fprintf(fp, "Mentalstate  %d\n", ch->MentalState);
    }

    if (IsNpc(ch))
    {
        fprintf(fp, "Vnum         %ld\n", ch->Prototype->Vnum);
        fprintf(fp, "Mobinvis     %d\n", ch->MobInvis);
    }
    else
    {
        fprintf(fp, "Password     %s~\n", ch->PCData->Password.c_str());
        fprintf(fp, "Lastplayed   %d\n", (int)current_time);

        if (!ch->PCData->BamfIn.empty())
        {
            fprintf(fp, "Bamfin       %s~\n", ch->PCData->BamfIn.c_str());
        }

        if (!ch->PCData->Email.empty())
        {
            fprintf(fp, "Email       %s~\n", ch->PCData->Email.c_str());
        }

        if (!ch->PCData->BamfOut.empty())
        {
            fprintf(fp, "Bamfout      %s~\n", ch->PCData->BamfOut.c_str());
        }

        if (!ch->PCData->Rank.empty())
        {
            fprintf(fp, "Rank         %s~\n", ch->PCData->Rank.c_str());
        }

        if (!ch->PCData->Bestowments.empty())
        {
            fprintf(fp, "Bestowments  %s~\n", ch->PCData->Bestowments.c_str());
        }

        fprintf(fp, "Title        %s~\n", ch->PCData->Title.c_str());

        if (!ch->PCData->HomePage.empty())
        {
            fprintf(fp, "Homepage     %s~\n", ch->PCData->HomePage.c_str());
        }

        if (!ch->PCData->Bio.empty())
        {
            fprintf(fp, "Bio          %s~\n", ch->PCData->Bio.c_str());
        }

        if (!ch->PCData->AuthedBy.empty())
        {
            fprintf(fp, "AuthedBy     %s~\n", ch->PCData->AuthedBy.c_str());
        }

        if (ch->PCData->MinSnoop)
        {
            fprintf(fp, "Minsnoop     %d\n", ch->PCData->MinSnoop);
        }

        if (!ch->PCData->Prompt.empty())
        {
            fprintf(fp, "Prompt       %s~\n", ch->PCData->Prompt.c_str());
        }

        for (auto alias : ch->PCData->Aliases())
        {
            if (alias->Name.empty() || alias->Command.empty())
            {
                continue;
            }

            fprintf(fp, "Alias        %s~ %s~\n", alias->Name.c_str(), alias->Command.c_str());
        }

        fprintf(fp, "Addiction   ");

        for (drug = 0; drug <= 9; drug++)
        {
            fprintf(fp, " %d", ch->PCData->Addiction[drug]);
        }

        fprintf(fp, "\n");
        fprintf(fp, "Druglevel   ");

        for (drug = 0; drug < 10; drug++)
        {
            fprintf(fp, " %d", ch->PCData->DrugLevel[drug]);
        }

        fprintf(fp, "\n");

        if (ch->PCData->WantedOn.any())
        {
            fprintf(fp, "Wanted       %d\n",
                static_cast<int>(ch->PCData->WantedOn.to_ulong()));
        }

        if (IsImmortal(ch) || ch->PCData->Build.Area)
        {
            fprintf(fp, "WizInvis     %d\n", ch->PCData->WizInvis);

            if (ch->PCData->Build.VnumRanges.Room.First && ch->PCData->Build.VnumRanges.Room.Last)
            {
                fprintf(fp, "RoomRange    %ld %ld\n", ch->PCData->Build.VnumRanges.Room.First,
                    ch->PCData->Build.VnumRanges.Room.Last);
            }

            if (ch->PCData->Build.VnumRanges.Object.First && ch->PCData->Build.VnumRanges.Object.Last)
            {
                fprintf(fp, "ObjRange     %ld %ld\n", ch->PCData->Build.VnumRanges.Object.First,
                    ch->PCData->Build.VnumRanges.Object.Last);
            }

            if (ch->PCData->Build.VnumRanges.Mob.First && ch->PCData->Build.VnumRanges.Mob.Last)
            {
                fprintf(fp, "MobRange     %ld %ld\n", ch->PCData->Build.VnumRanges.Mob.First,
                    ch->PCData->Build.VnumRanges.Mob.Last);
            }
        }

        if (ch->PCData->ClanInfo.Clan != nullptr)
        {
            fprintf(fp, "Clan         %s~\n", ch->PCData->ClanInfo.Clan->Name.c_str());
        }

        fprintf(fp, "Flags        %d\n", static_cast<int>(ch->PCData->Flags.to_ulong()));

        if (ch->PCData->ReleaseDate > current_time)
        {
            fprintf(fp, "Helled       %d %s~\n",
                (int)ch->PCData->ReleaseDate, ch->PCData->HelledBy.c_str());
        }

        if (ch->PCData->PKills)
        {
            fprintf(fp, "PKills       %d\n", ch->PCData->PKills);
        }

        if (ch->PCData->PDeaths)
        {
            fprintf(fp, "PDeaths      %d\n", ch->PCData->PDeaths);
        }

        if (!ch->PCData->AliasFocus.empty())
        {
            fprintf(fp, "Targ %s~\n", ch->PCData->AliasFocus.c_str());
        }

        if (GetTimer(ch, TIMER_PKILLED)
            && (GetTimer(ch, TIMER_PKILLED) > 0))
        {
            fprintf(fp, "PTimer       %d\n", GetTimer(ch, TIMER_PKILLED));
        }

        fprintf(fp, "MKills       %d\n", ch->PCData->MKills);
        fprintf(fp, "MDeaths      %d\n", ch->PCData->MDeaths);

        if (ch->PCData->IllegalPk)
        {
            fprintf(fp, "IllegalPK    %d\n", ch->PCData->IllegalPk);
        }

        fprintf(fp, "AttrPerm     %d %d %d %d %d %d %d\n",
            ch->PermStats.Str,
            ch->PermStats.Int,
            ch->PermStats.Wis,
            ch->PermStats.Dex,
            ch->PermStats.Con,
            ch->PermStats.Cha,
            ch->PermStats.Lck);

        fprintf(fp, "AttrMod      %d %d %d %d %d %d %d\n",
            ch->StatMods.Str,
            ch->StatMods.Int,
            ch->StatMods.Wis,
            ch->StatMods.Dex,
            ch->StatMods.Con,
            ch->StatMods.Cha,
            ch->StatMods.Lck);

        fprintf(fp, "Condition    %d %d %d %d\n",
            ch->PCData->Condition[0],
            ch->PCData->Condition[1],
            ch->PCData->Condition[2],
            ch->PCData->Condition[3]);

        if (ch->Desc && !ch->Desc->Remote.Hostname.empty())
        {
            fprintf(fp, "Site         %s\n", ch->Desc->Remote.Hostname.c_str());
        }
        else
        {
            fprintf(fp, "Site         (Link-Dead)\n");
        }

        for (sn = 1; sn < TopSN; sn++)
        {
            if (!SkillTable[sn]->Name.empty() && ch->PCData->Learned[sn] > 0)
            {
                switch (SkillTable[sn]->Type)
                {
                default:
                    fprintf(fp, "Skill        %d '%s'\n",
                        ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str());
                    break;

                case SKILL_SPELL:
                    fprintf(fp, "Spell        %d '%s'\n",
                        ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str());
                    break;

                case SKILL_WEAPON:
                    fprintf(fp, "Weapon       %d '%s'\n",
                        ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str());
                    break;

                case SKILL_TONGUE:
                    fprintf(fp, "Tongue       %d '%s'\n",
                        ch->PCData->Learned[sn], SkillTable[sn]->Name.c_str());
                    break;
                }
            }
        }
    }

    for (auto paf : ch->Affects())
    {
        if (paf->Type >= 0 && (skill = GetSkill(paf->Type)) == NULL)
        {
            continue;
        }

        if (paf->Type >= 0 && paf->Type < TYPE_PERSONAL)
        {
            fprintf(fp, "AffectData   '%s' %3d %3d %3d %10d\n",
                skill->Name.c_str(),
                paf->Duration,
                paf->Modifier,
                paf->Location,
                paf->AffectedBy
            );
        }
        else
        {
            fprintf(fp, "Affect       %3d %3d %3d %3d %10d\n",
                paf->Type,
                paf->Duration,
                paf->Modifier,
                paf->Location,
                paf->AffectedBy
            );
        }
    }

    for_each(ch->PCData->Killed.begin(), ch->PCData->Killed.end(),
        [fp](auto killed) { fprintf(fp, "Killed       %ld %d\n",
            killed.Vnum,
            killed.Count); });

    ImcSaveCharacter(ch, fp);

    fprintf(fp, "End\n\n");
}

static bool HasAnyOvalues(const Object *obj)
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
void WriteObject(const Character *ch, const Object *obj, FILE *fp, int iNest, short os_type)
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
    for (const Object *content : Reverse(obj->Objects()))
    {
        WriteObject(ch, content, fp, iNest, OS_CARRY);
    }

    /*
     * Castrate storage characters.
     */
    if (obj->ItemType == ITEM_KEY && !IsBitSet(obj->Flags, ITEM_CLANOBJECT))
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
    if (IsBitSet(obj->Flags, ITEM_PROTOTYPE))
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
        fprintf(fp, "ExtraFlags   %d\n", obj->Flags);
    }

    if (obj->WearFlags != obj->Prototype->WearFlags)
    {
        fprintf(fp, "WearFlags    %d\n", obj->WearFlags);
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
            fprintf(fp, "Affect       %d %d %d %d %d\n",
                paf->Type,
                paf->Duration,
                ((paf->Location == APPLY_WEAPONSPELL
                    || paf->Location == APPLY_WEARSPELL
                    || paf->Location == APPLY_REMOVESPELL
                    || paf->Location == APPLY_STRIPSN)
                    && IS_VALID_SN(paf->Modifier))
                ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                paf->Location,
                paf->AffectedBy
            );
        }
        else
        {
            fprintf(fp, "AffectData   '%s' %d %d %d %d\n",
                SkillTable[paf->Type]->Name.c_str(),
                paf->Duration,
                ((paf->Location == APPLY_WEAPONSPELL
                    || paf->Location == APPLY_WEARSPELL
                    || paf->Location == APPLY_REMOVESPELL
                    || paf->Location == APPLY_STRIPSN)
                    && IS_VALID_SN(paf->Modifier))
                ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                paf->Location,
                paf->AffectedBy
            );
        }
    }

    for (auto ed : obj->ExtraDescriptions())
    {
        fprintf(fp, "ExtraDescr   %s~ %s~\n",
            ed->Keyword.c_str(), ed->Description.c_str());
    }

    fprintf(fp, "End\n\n");

    for (const Object *content : Reverse(obj->Objects()))
    {
        WriteObject(ch, content, fp, iNest + 1, OS_CARRY);
    }
}

void ReadObject(Character *ch, FILE *fp, short os_type)
{
    int iNest = 0;
    bool fNest = true; /* Yes, these should             */
    bool fVnum = true; /* indeed be initialized as true */
    Room *room = NULL;

    Object *obj = new Object();

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
                    delete obj;
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

            delete obj;
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
    for (const Object *corpse : Objects)
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
    catch(const fs::filesystem_error &ex)
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
    try
    {
        char buf[MAX_INPUT_LENGTH];
        falling = 1;

        for(const auto &entry : fs::directory_iterator(STOREROOM_DIR))
        {
            const char *filename = entry.path().filename().string().c_str();

            if (filename[0] != '.')
            {
                sprintf(strArea, "%s%s", STOREROOM_DIR, filename);
                fprintf(stderr, "Storeroom -> %s\n", strArea);

                if (!(fpArea = fopen(strArea, "r")))
                {
                    perror(strArea);
                    continue;
                }

                Room *storeroom = GetRoom(atoi(filename));

                if (!storeroom)
                {
                    fpArea = NULL;
                    strcpy(strArea, "$");
                    falling = 0;
                    return;
                }

                if (!storeroom->Flags.test(Flag::Room::ClanStoreroom))
                {
                    sprintf(buf, "%s%ld", STOREROOM_DIR, storeroom->Vnum);
                    remove(buf);
                }

                RoomProgSetSupermob(storeroom);

                for (int iNest = 0; iNest < MAX_NEST; iNest++)
                {
                    rgObjNest[iNest] = nullptr;
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
                        Log->Bug("LoadStorerooms: # not found.");
                        Log->Bug("%s", filename);
                        break;
                    }

                    const char *word = ReadWord(fpArea, Log, fBootDb);

                    if (!StrCmp(word, "OBJECT")) /* Objects      */
                    {
                        ReadObject(supermob, fpArea, OS_CARRY);
                    }
                    else if (!StrCmp(word, "END"))       /* Done         */
                    {
                        break;
                    }
                    else
                    {
                        Log->Bug("LoadStorerooms: bad section.");
                        Log->Bug("%s", filename);
                        break;
                    }
                }

                fclose(fpArea);

                std::list<Object*> carriedBySupermob(supermob->Objects());

                for (Object *tobj : carriedBySupermob)
                {
                    ObjectFromCharacter(tobj);

                    if (tobj->ItemType != ITEM_MONEY)
                    {
                        ObjectToRoom(tobj, storeroom);
                    }
                }

                ReleaseSupermob();
            }
        }
    }
    catch(const fs::filesystem_error &ex)
    {
        Log->Bug("Load_storeroom: can't open STOREROOM_DIR");
        perror(STOREROOM_DIR);
    }

    fpArea = NULL;
    strcpy(strArea, "$");
    falling = 0;
}

void SaveStoreroom(const Room *room)
{
    assert(room != nullptr);

    char strsave[MAX_INPUT_LENGTH];
    FILE *fp = NULL;

    sprintf(strsave, "%s%ld", STOREROOM_DIR, room->Vnum);

    if ((fp = fopen(strsave, "w")) == NULL)
    {
        perror(strsave);
        Log->Bug("Save_storeroom: fopen");
        Log->Bug("%s", strsave);

    }
    else
    {
        for (const Object *obj : room->Objects())
        {
            WriteObject(nullptr, obj, fp, 0, OS_CARRY);
        }

        fprintf(fp, "#END\n");
        fclose(fp);
    }
}

void LoadVendors()
{
    try
    {
        Character *mob = NULL;
        falling = 1;

        for(const auto &entry : fs::directory_iterator(VENDOR_DIR))
        {
            const char *filename = entry.path().filename().string().c_str();

            if (filename[0] != '.')
            {
                sprintf(strArea, "%s%s", VENDOR_DIR, filename);
                fprintf(stderr, "Vendor -> %s\n", strArea);
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
                        Log->Bug("Load_vendor: # not found.");
                        break;
                    }

                    const char *word = ReadWord(fpArea, Log, fBootDb);

                    if (!StrCmp(word, "VENDOR"))
                    {
                        mob = ReadVendor(fpArea);
                    }
                    else if (!StrCmp(word, "OBJECT"))
                    {
                        ReadObject(mob, fpArea, OS_CARRY);
                    }
                    else if (!StrCmp(word, "END"))
                    {
                        break;
                    }
                }

                fclose(fpArea);
            }
        }
    }
    catch(const fs::filesystem_error &ex)
    {
        Log->Bug("Load_vendors: can't open VENDOR_DIR");
        perror(VENDOR_DIR);
    }

    fpArea = NULL;
    strcpy(strArea, "$");
    falling = 0;
}
