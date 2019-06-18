#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_loadarea(Character *ch, std::string argument)
{
    std::shared_ptr<Area> tarea;
    char filename[256];
    int  tmp = 0;

    if (IsNpc(ch) || GetTrustLevel(ch) < LEVEL_AVATAR || !ch->PCData
        || (!argument.empty() && !ch->PCData->Build.Area))
    {
        ch->Echo("You don't have an assigned area to load.\r\n");
        return;
    }

    if (argument.empty())
    {
        tarea = ch->PCData->Build.Area;
    }
    else
    {
        bool found = false;

        for (tarea = FirstBuild; tarea; tarea = tarea->Next)
        {
            if (!StrCmp(tarea->Filename, argument))
            {
                found = true;
                break;
            }
        }

        if (IsNpc(ch)
            || (GetTrustLevel(ch) < LEVEL_GREATER
                && tarea && !IsName(tarea->Filename, ch->PCData->Bestowments)))
        {
            ch->Echo("You can only load areas you have permission for.\r\n");
            return;
        }

        if (!found)
        {
            ch->Echo("Area not found.\r\n");
            return;
        }
    }

    if (!tarea)
    {
        ch->Echo("No area to load.\r\n");
        return;
    }

    /* Stops char from loading when already loaded - Scryn 8/11 */
    if (IsBitSet(tarea->Status, AREA_LOADED))
    {
        ch->Echo("Your area is already loaded.\r\n");
        return;
    }

    sprintf(filename, "%s%s", BUILD_DIR, tarea->Filename.c_str());
    ch->Echo("Loading...\r\n");
    LoadAreaFile(tarea, filename);
    ch->Echo("Linking exits...\r\n");
    FixAreaExits(tarea);

    if (tarea->FirstReset)
    {
        tmp = tarea->NumberOfPlayers;
        tarea->NumberOfPlayers = 0;
        ch->Echo("Resetting area...\r\n");
        ResetArea(tarea);
        tarea->NumberOfPlayers = tmp;
    }

    ch->Echo("Done.\r\n");
}
