#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "systemdata.hpp"
#include "repos/arearepository.hpp"

void do_aassign(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Area> tarea;

    if (IsNpc(ch))
    {
        return;
    }

    if (argument.empty())
    {
        ch->Echo("Syntax: aassign <filename>\r\n");
        return;
    }

    if (!StrCmp("none", argument)
        || !StrCmp("null", argument)
        || !StrCmp("clear", argument))
    {
        ch->PCData->Build.Area = nullptr;
        AssignAreaTo(ch);

        if (!ch->PCData->Build.Area)
        {
            ch->Echo("Area pointer cleared.\r\n");
        }
        else
        {
            ch->Echo("Originally assigned area restored.\r\n");
        }

        return;
    }

    if (GetTrustLevel(ch) >= LEVEL_GREATER
        || (IsName(argument, ch->PCData->Bestowments)
            && GetTrustLevel(ch) >= SysData.LevelToModifyProto))
    {
        tarea = Areas->Find(argument);
    }

    if (!tarea)
    {
        tarea = Areas->FindProtoArea(argument);

        if (tarea
            && GetTrustLevel(ch) < LEVEL_GREATER
            && !IsName(tarea->Filename, ch->PCData->Bestowments))
        {
            ch->Echo("You do not have permission to use that area.\r\n");
            return;
        }
    }

    if (!StrCmp(argument, "this"))
    {
        tarea = ch->InRoom->Area;
    }

    if (!tarea)
    {
        if (GetTrustLevel(ch) >= SysData.LevelToModifyProto)
        {
            ch->Echo("No such area. Use 'zones'.\r\n");
        }
        else
        {
            ch->Echo("No such area. Use 'newzones'.\r\n");
        }

        return;
    }

    ch->PCData->Build.Area = tarea;
    ch->Echo("Assigning you: %s\r\n", tarea->Name.c_str());
}
