#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"

void do_savearea(Character *ch, std::string argument)
{
    std::shared_ptr<Area> tarea;

    if (IsNpc(ch) || GetTrustLevel(ch) < LEVEL_AVATAR || !ch->PCData
        || (argument.empty() && !ch->PCData->Build.Area))
    {
        ch->Echo("You don't have an assigned area to save.\r\n");
        return;
    }

    if (argument.empty())
    {
        tarea = ch->PCData->Build.Area;
    }
    else
    {
        if (GetTrustLevel(ch) < LEVEL_GREATER)
        {
            ch->Echo("You can only save your own area.\r\n");
            return;
        }

        tarea = Areas->FindProtoArea(argument);

        if (tarea == nullptr)
        {
            ch->Echo("Area not found.\r\n");
            return;
        }
    }

    if (tarea == nullptr)
    {
        ch->Echo("No area to save.\r\n");
        return;
    }

    Areas->Save(tarea);
    ch->Echo("Done.\r\n");
}

