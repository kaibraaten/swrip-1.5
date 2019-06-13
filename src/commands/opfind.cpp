#include "mud.hpp"
#include "character.hpp"
#include "protoobject.hpp"

static void opfind_help(Character *ch);

/*
 * Search objects for obj progs containing a specified text string.
 */
void do_opfind(Character *ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    vnum_t lo_vnum = MIN_VNUM, hi_vnum = MAX_VNUM;

    argument = OneArgument(argument, arg1);   /* display_limit */
    argument = OneArgument(argument, arg2);

    if (arg1.empty() || arg2.empty() || !IsNumber(arg1))
    {
        opfind_help(ch);
        return;
    }

    int disp_limit = ToLong(arg1);
    disp_limit = umax(0, disp_limit);

    if (StrCmp(arg2, "mud"))
    {
        argument = OneArgument(argument, arg3);

        if (arg3.empty() || argument.empty()
            || !IsNumber(arg2) || !IsNumber(arg3))
        {
            opfind_help(ch);
            return;
        }
        else
        {
            lo_vnum = urange(MIN_VNUM, ToLong(arg2), MAX_VNUM);
            hi_vnum = urange(MIN_VNUM, ToLong(arg3), MAX_VNUM);

            if (lo_vnum > hi_vnum)
            {
                opfind_help(ch);
                return;
            }
        }
    }

    if (argument.empty())
    {
        opfind_help(ch);
        return;
    }

    int tot_hits = 0;
    int disp_cou = 0;

    for (vnum_t i = lo_vnum; i <= hi_vnum; i++)
    {
        std::shared_ptr<ProtoObject> obj = GetProtoObject(i);

        if (obj != nullptr && !obj->mprog.MudProgs().empty())
        {
            int tot_vnum = 0;

            for (auto pProg : obj->mprog.MudProgs())
            {
                tot_vnum += CountStringOccurances(pProg->comlist, argument);
            }

            tot_hits += tot_vnum;

            if (tot_vnum && ++disp_cou <= disp_limit)
            {
                ch->Echo("%5d %5ld %5d\r\n", disp_cou, i, tot_vnum);
            }
        }
    }

    ch->Echo("Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "opfind" command
 */
static void opfind_help(Character *ch)
{
    ch->Echo("Syntax:\r\n");
    ch->Echo("opfind n lo_vnum hi_vnum text \r\n"
        "   Search obj vnums between lo_vnum and hi_vnum \r\n"
        "   for obj progs that contain an occurrence of text. \r\n"
        "   Display a maxiumu of n lines.\r\n\r\n");
    ch->Echo("opfind n mud text \r\n"
        "   Search all the objs in the mud for\r\n"
        "   obj progs that contain an occurrence of text. \r\n"
        "   Display a maxiumu of n lines.\r\n\r\n");

    ch->Echo("Example:\r\n");
    ch->Echo("opfind 20 901 969 if isnpc \r\n"
        "   Search all obj progs in Olympus (vnums 901 thru 969)\r\n"
        "   and display all objects that contain the text \"if isnpc\".\r\n"
        "   Display a maximum of 20 lines.\r\n\r\n");
    ch->Echo("Example:\r\n");
    ch->Echo("opfind 100 mud mpslay \r\n"
        "   Search all obj progs in the entire mud\r\n"
        "   and display all objects that contain the text \"mpslay\".\r\n"
        "   Display a maximum of 100 lines.\r\n\r\n");
}
