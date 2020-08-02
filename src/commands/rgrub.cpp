#include "mud.hpp"
#include "grub.hpp"
#include "character.hpp"
#include "room.hpp"

static int rgrub_int_comp(const void *i, const void *j);
static void rgrub_help(std::shared_ptr<Character> ch);

void do_rgrub(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::string arg4;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);
    argument = OneArgument(argument, arg4);

    if (!StrCmp(arg1, "st"))
    {
#define RGRUB_ST_MAX_SIZE 5000
        int match = 0, lo = 0, hi = 0, hit_cou = 0, cou = 0, vnum[RGRUB_ST_MAX_SIZE];

        if (arg2.empty())
        {
            rgrub_help(ch);
            return;
        }
        else
        {
            match = ToLong(arg2);
        }

        hit_cou = 0;                                 /* number of vnums found */
        lo = !arg3.empty() ? ToLong(arg3) : 0;
        hi = !arg4.empty() ? ToLong(arg4) : MAX_VNUM;

        ch->Echo("\r\nRoom Vnums\r\n");

        for(auto pRoom : Rooms)
        {
            if (pRoom->Vnum >= lo && pRoom->Vnum <= hi)
            {
                if (match == (int)pRoom->Sector && hit_cou < RGRUB_ST_MAX_SIZE)
                    vnum[hit_cou++] = pRoom->Vnum;
            }
        }

        qsort(vnum, hit_cou, sizeof(int), rgrub_int_comp);      /* sort vnums    */

        for (cou = 0; cou < hit_cou; cou++)
            ch->Echo("%5d %6d\r\n", cou + 1, vnum[cou]);   /* display vnums */

        return;
    }
    else
    {
        rgrub_help(ch);
        return;
    }
}

/*
 * Sort function used by rgrub to sort integers
 */

static int rgrub_int_comp(const void *i, const void *j)
{
    return *(int*)i - *(int*)j;
}

/*
 * Displays the help screen for the "rgrub" command
 */
static void rgrub_help(std::shared_ptr<Character> ch)
{
    ch->Echo("Syntax:\r\n");
    ch->Echo("rgrub st n lo hi - sector type search.\r\n"
        "   list room vnums between lo and hi that match n.\r\n");
    ch->Echo("   e.g. rgrub st 6 901 969 - list all rooms in Olympus\r\n"
        "      that are sectortype 6.\r\n");
    ch->Echo("   e.g. rgrub st 2 - list all rooms sectortype 2.\r\n");
}
