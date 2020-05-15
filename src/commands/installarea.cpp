#include <utility/algorithms.hpp>
#include "log.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->Author and area->Name are cleaned up... it will be easier
 */
void do_installarea(Character *ch, std::string argument)
{
    std::string oldfilename;
    std::string newfilename;

    argument = OneArgument(argument, oldfilename);
    argument = OneArgument(argument, newfilename);
    std::string newtitle = argument;

    if (oldfilename.empty())
    {
        ch->Echo("Syntax: installarea <oldfilename> [newfilename] [Area title]\r\n");
        return;
    }

    auto tarea = Areas->FindProtoArea(oldfilename);

    if (tarea != nullptr)
    {
        if (!newtitle.empty())
        {
            tarea->Name = newtitle;
        }

        ch->Echo("Installing area...\r\n");
        Areas->Install(tarea, newfilename);
        ch->Echo("Done.\r\n");

        /* Fix up author if online */
        for (auto &author : PlayerCharacters)
        {
            if (author->PCData->Build.Area == tarea)
            {
                /* remove area from author */
                author->PCData->Build.Area = nullptr;
                /* clear out author vnums  */
                author->PCData->Build.VnumRanges.Room.First = INVALID_VNUM;
                author->PCData->Build.VnumRanges.Room.Last = INVALID_VNUM;
                author->PCData->Build.VnumRanges.Object.First = INVALID_VNUM;
                author->PCData->Build.VnumRanges.Object.Last = INVALID_VNUM;
                author->PCData->Build.VnumRanges.Mob.First = INVALID_VNUM;
                author->PCData->Build.VnumRanges.Mob.Last = INVALID_VNUM;
            }
        }

        top_area++;
        ch->Echo("Resetting new area.\r\n");
        auto num = tarea->NumberOfPlayers;
        tarea->NumberOfPlayers = 0;
        ResetArea(tarea);
        tarea->NumberOfPlayers = num;

        ch->Echo("Done.\r\n");
    }
    else
    {
        ch->Echo("No such area exists.\r\n");
    }
}
