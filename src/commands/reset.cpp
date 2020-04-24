#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"

void do_reset(Character *ch, std::string argument)
{
    std::shared_ptr<Area> pArea;
    std::string arg;
    std::string parg = OneArgument(argument, arg);

    if (GetTrustLevel(ch) > LEVEL_GREATER)
    {
        char fname[80];

        sprintf(fname, "%s.are", Capitalize(arg).c_str());

        for (pArea = Areas->FirstBuild; pArea; pArea = pArea->Next)
        {
            if (!StrCmp(fname, pArea->Filename))
            {
                argument = parg;
                break;
            }
        }

        if (!pArea)
            pArea = ch->PCData->Build.Area;

        if (!pArea)
            pArea = ch->InRoom->Area;
    }
    else
    {
        pArea = ch->PCData->Build.Area;
    }

    if (!pArea)
    {
        ch->Echo("You do not have an assigned area.\r\n");
        return;
    }

    EditReset(ch, argument, pArea, NULL);
}
