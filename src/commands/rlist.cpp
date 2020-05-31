#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_rlist(Character *ch, std::string argument)
{
    vnum_t vnum = INVALID_VNUM;
    std::string arg1;
    std::string arg2;
    auto tarea = ch->PCData->Build.Area;
    vnum_t lrange = INVALID_VNUM;
    vnum_t trange = INVALID_VNUM;

    if (IsNpc(ch) || GetTrustLevel(ch) < LEVEL_AVATAR || !ch->PCData
        || (!ch->PCData->Build.Area && GetTrustLevel(ch) < LEVEL_GREATER))
    {
        ch->Echo("You don't have an assigned area.\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if (tarea)
    {
        if (arg1.empty())
            lrange = tarea->VnumRanges.Room.First;     /* here.            -Thoric */
        else
            lrange = ToLong(arg1);

        if (arg2.empty())
            trange = tarea->VnumRanges.Room.Last;
        else
            trange = ToLong(arg2);

        if(tarea->VnumRanges.Room.First == INVALID_VNUM
           || tarea->VnumRanges.Room.Last == INVALID_VNUM)
        {
            ch->Echo("This area has no rooms.\r\n");
            return;
        }
        
        if ((lrange < tarea->VnumRanges.Room.First || trange > tarea->VnumRanges.Room.Last)
            && GetTrustLevel(ch) < LEVEL_GREATER)
        {
            ch->Echo("That is out of your vnum range.\r\n");
            return;
        }
    }
    else
    {
        lrange = IsNumber(arg1) ? ToLong(arg1) : 1;
        trange = IsNumber(arg2) ? ToLong(arg2) : 1;
    }

    for (vnum = lrange; vnum <= trange; vnum++)
    {
        auto room = GetRoom(vnum);

        if (room == nullptr)
            continue;

        ch->Echo("&w%5ld) %s\r\n", vnum, GetRoomName(room).c_str());
    }
}
