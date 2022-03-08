#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protoobject.hpp"

void do_olist(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;

    /*
     * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
     */
    if (IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->PCData
        || (!ch->PCData->Build.Area && GetTrustLevel(ch) < LEVEL_GREATER))
    {
        ch->Echo("You don't have an assigned area.\r\n");
        return;
    }

    auto tarea = ch->PCData->Build.Area;
    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    int lrange = 0;
    int trange = 0;

    if (tarea)
    {
        if (arg1.empty())
            lrange = tarea->VnumRanges.Object.First;     /* here.            -Thoric */
        else
            lrange = ToLong(arg1);

        if (arg2.empty())
            trange = tarea->VnumRanges.Object.Last;
        else
            trange = ToLong(arg2);

        if(tarea->VnumRanges.Object.First == INVALID_VNUM
           || tarea->VnumRanges.Object.Last == INVALID_VNUM)
        {
            ch->Echo("This area has no objects.\r\n");
            return;
        }
        
        if ((lrange < tarea->VnumRanges.Object.First || trange > tarea->VnumRanges.Object.Last)
            && GetTrustLevel(ch) < LEVEL_GREATER)
        {
            ch->Echo("That is out of your vnum range.\r\n");
            return;
        }
    }
    else
    {
        lrange = (IsNumber(arg1) ? ToLong(arg1) : 1);
        trange = (IsNumber(arg2) ? ToLong(arg2) : 3);
    }

    for (vnum_t vnum = lrange; vnum <= trange && vnum != INVALID_VNUM; ++vnum)
    {
        auto obj = GetProtoObject(vnum);

        if (obj == nullptr)
        {
            continue;
        }

        ch->Echo("%5ld) %-20s (%s)\r\n", vnum,
            obj->Name.c_str(),
            obj->ShortDescr.c_str());
    }
}

