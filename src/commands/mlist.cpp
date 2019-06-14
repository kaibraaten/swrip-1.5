#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protomob.hpp"

void do_mlist(Character *ch, std::string argument)
{
    vnum_t vnum = INVALID_VNUM;
    Area *tarea = NULL;
    std::string arg1;
    std::string arg2;
    int lrange = 0;
    int trange = 0;

    if (IsNpc(ch)
        || GetTrustLevel(ch) < LEVEL_CREATOR
        || (!ch->PCData->Build.Area && GetTrustLevel(ch) < LEVEL_GREATER))
    {
        ch->Echo("You don't have an assigned area.\r\n");
        return;
    }

    tarea = ch->PCData->Build.Area;
    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if (tarea)
    {
        if (arg1.empty())
            lrange = tarea->VnumRanges.Mob.First;
        else
            lrange = ToLong(arg1);

        if (arg2.empty())
            trange = tarea->VnumRanges.Mob.Last;
        else
            trange = ToLong(arg2);

        if ((lrange < tarea->VnumRanges.Mob.First || trange > tarea->VnumRanges.Mob.Last)
            && GetTrustLevel(ch) < LEVEL_GREATER)
        {
            ch->Echo("That is out of your vnum range.\r\n");
            return;
        }
    }
    else
    {
        lrange = (IsNumber(arg1) ? ToLong(arg1) : 1);
        trange = (IsNumber(arg2) ? ToLong(arg2) : 1);
    }

    for (vnum = lrange; vnum <= trange; vnum++)
    {
        std::shared_ptr<ProtoMobile> mob;

        if ((mob = GetProtoMobile(vnum)) == NULL)
            continue;

        ch->Echo("%5ld) %-20s '%s'\r\n", vnum,
            mob->Name.c_str(),
            mob->ShortDescr.c_str());
    }
}

