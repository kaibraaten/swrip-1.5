#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "repos/arearepository.hpp"

void do_loadarea(Character *ch, std::string argument)
{
    std::shared_ptr<Area> tarea;

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
        for(auto tmp : Areas->AreasInProgress())
        {
            if (!StrCmp(tarea->Filename, argument))
            {
                tarea = tmp;
                break;
            }
        }

        if (IsNpc(ch)
            || (GetTrustLevel(ch) < LEVEL_GREATER
                && tarea != nullptr && !IsName(tarea->Filename, ch->PCData->Bestowments)))
        {
            ch->Echo("You can only load areas you have permission for.\r\n");
            return;
        }

        if (tarea == nullptr)
        {
            ch->Echo("Area not found.\r\n");
            return;
        }
    }

    if (tarea == nullptr)
    {
        ch->Echo("No area to load.\r\n");
        return;
    }

    /* Stops char from loading when already loaded - Scryn 8/11 */
    if (IsBitSet(tarea->Status, AreaStatus::Loaded))
    {
        ch->Echo("Your area is already loaded.\r\n");
        return;
    }

    ch->Echo("Loading...\r\n");
    Areas->Load(tarea);
    ch->Echo("Linking exits...\r\n");
    FixAreaExits(tarea);

    if (tarea->FirstReset)
    {
        int numpl = tarea->NumberOfPlayers;
        tarea->NumberOfPlayers = 0;
        ch->Echo("Resetting area...\r\n");
        ResetArea(tarea);
        tarea->NumberOfPlayers = numpl;
    }

    ch->Echo("Done.\r\n");
}
