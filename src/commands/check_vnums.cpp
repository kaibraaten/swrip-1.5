#include <string.h>
#include "mud.hpp"
#include "area.hpp"
#include "character.hpp"
#include "repos/arearepository.hpp"

/* Check to make sure range of vnums is free - Scryn 2/27/96 */
void do_check_vnums(Character *ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    char buf2[MAX_STRING_LENGTH];
    std::string arg1;
    std::string arg2;
    bool room = false, mob = false, obj = false, all = false, area_conflict = false;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if (arg1.empty())
    {
        ch->Echo("Please specify room, mob, object, or all as your first argument.\r\n");
        return;
    }

    if (!StrCmp(arg1, "room"))
        room = true;
    else if (!StrCmp(arg1, "mob"))
        mob = true;
    else if (!StrCmp(arg1, "object"))
        obj = true;
    else if (!StrCmp(arg1, "all"))
        all = true;
    else
    {
        ch->Echo("Please specify room, mob, or object as your first argument.\r\n");
        return;
    }

    if (arg2.empty())
    {
        ch->Echo("Please specify the low end of the range to be searched.\r\n");
        return;
    }

    if (argument.empty())
    {
        ch->Echo("Please specify the high end of the range to be searched.\r\n");
        return;
    }

    const vnum_t low_range = ToLong(arg2);
    const vnum_t high_range = ToLong(argument);

    if (low_range < MIN_VNUM || low_range > MAX_VNUM)
    {
        ch->Echo("Invalid argument for bottom of range.\r\n");
        return;
    }

    if (high_range < MIN_VNUM || high_range > MAX_VNUM)
    {
        ch->Echo("Invalid argument for top of range.\r\n");
        return;
    }

    if (high_range < low_range)
    {
        ch->Echo("Bottom of range must be below top of range.\r\n");
        return;
    }

    if (all)
    {
        sprintf(buf, "room %ld %ld", low_range, high_range);
        do_check_vnums(ch, buf);
        sprintf(buf, "mob %ld %ld", low_range, high_range);
        do_check_vnums(ch, buf);
        sprintf(buf, "object %ld %ld", low_range, high_range);
        do_check_vnums(ch, buf);
        return;
    }

    SetCharacterColor(AT_PLAIN, ch);

    for (auto pArea : Areas)
    {
        area_conflict = false;

        if (room)
        {
            if (low_range < pArea->VnumRanges.Room.First && pArea->VnumRanges.Room.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Room.Last && pArea->VnumRanges.Room.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Room.First)
                && (low_range <= pArea->VnumRanges.Room.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Room.Last)
                && (high_range >= pArea->VnumRanges.Room.First))
                area_conflict = true;
        }

        if (mob)
        {
            if (low_range < pArea->VnumRanges.Mob.First && pArea->VnumRanges.Mob.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Mob.Last && pArea->VnumRanges.Mob.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Mob.First)
                && (low_range <= pArea->VnumRanges.Mob.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Mob.Last)
                && (high_range >= pArea->VnumRanges.Mob.First))
                area_conflict = true;
        }

        if (obj)
        {
            if (low_range < pArea->VnumRanges.Object.First && pArea->VnumRanges.Object.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Object.Last && pArea->VnumRanges.Object.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Object.First)
                && (low_range <= pArea->VnumRanges.Object.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Object.Last)
                && (high_range >= pArea->VnumRanges.Object.First))
                area_conflict = true;
        }

        if (area_conflict)
        {
            ch->Echo("Conflict:%-15s| ",
                !pArea->Filename.empty() ? pArea->Filename.c_str() : "(invalid)");

            if (room)
                sprintf(buf2, "Rooms: %5ld - %-5ld\r\n", pArea->VnumRanges.Room.First,
                    pArea->VnumRanges.Room.Last);

            if (mob)
                sprintf(buf2, "Mobs: %5ld - %-5ld\r\n", pArea->VnumRanges.Mob.First,
                    pArea->VnumRanges.Mob.Last);

            if (obj)
                sprintf(buf2, "Objects: %5ld - %-5ld\r\n", pArea->VnumRanges.Object.First,
                    pArea->VnumRanges.Object.Last);

            ch->Echo("%s", buf2);
        }
    }

    for (auto pArea : Areas->AreasInProgress())
    {
        area_conflict = false;

        if (room)
        {
            if (low_range < pArea->VnumRanges.Room.First && pArea->VnumRanges.Room.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Room.Last && pArea->VnumRanges.Room.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Room.First)
                && (low_range <= pArea->VnumRanges.Room.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Room.Last)
                && (high_range >= pArea->VnumRanges.Room.First))
                area_conflict = true;
        }

        if (mob)
        {
            if (low_range < pArea->VnumRanges.Mob.First && pArea->VnumRanges.Mob.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Mob.Last && pArea->VnumRanges.Mob.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Mob.First)
                && (low_range <= pArea->VnumRanges.Mob.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Mob.Last)
                && (high_range >= pArea->VnumRanges.Mob.First))
                area_conflict = true;
        }

        if (obj)
        {
            if (low_range < pArea->VnumRanges.Object.First && pArea->VnumRanges.Object.First < high_range)
                area_conflict = true;

            if (low_range < pArea->VnumRanges.Object.Last && pArea->VnumRanges.Object.Last < high_range)
                area_conflict = true;

            if ((low_range >= pArea->VnumRanges.Object.First)
                && (low_range <= pArea->VnumRanges.Object.Last))
                area_conflict = true;

            if ((high_range <= pArea->VnumRanges.Object.Last)
                && (high_range >= pArea->VnumRanges.Object.First))
                area_conflict = true;
        }

        if (area_conflict)
        {
            sprintf(buf, "Conflict:%-15s| ",
                !pArea->Filename.empty() ? pArea->Filename.c_str() : "(invalid)");

            if (room)
                sprintf(buf2, "Rooms: %5ld - %-5ld\r\n", pArea->VnumRanges.Room.First,
                    pArea->VnumRanges.Room.Last);

            if (mob)
                sprintf(buf2, "Mobs: %5ld - %-5ld\r\n", pArea->VnumRanges.Mob.First,
                    pArea->VnumRanges.Mob.Last);

            if (obj)
                sprintf(buf2, "Objects: %5ld - %-5ld\r\n", pArea->VnumRanges.Object.First,
                    pArea->VnumRanges.Object.Last);

            ch->Echo("%s", buf2);
        }
    }
}

