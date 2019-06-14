#include "character.hpp"
#include "reset.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_instazone(Character *ch, std::string argument)
{
    Area *pArea = NULL;
    int vnum = INVALID_VNUM;
    bool dodoors = false;

    if (IsNpc(ch) || GetTrustLevel(ch) < LEVEL_CREATOR || !ch->PCData ||
        !ch->PCData->Build.Area)
    {
        ch->Echo("You don't have an assigned area to create resets for.\r\n");
        return;
    }

    if (!StrCmp(argument, "nodoors"))
        dodoors = false;
    else
        dodoors = true;

    pArea = ch->PCData->Build.Area;

    if (pArea->FirstReset)
        WipeResets(pArea, NULL);

    for (vnum = pArea->VnumRanges.Room.First; vnum <= pArea->VnumRanges.Room.Last; vnum++)
    {
        auto pRoom = GetRoom(vnum);

        if (pRoom == nullptr || pRoom->Area != pArea)
            continue;
        InstallRoom(pArea, pRoom, dodoors);
    }

    ch->Echo("Area resets installed.\r\n");
}


