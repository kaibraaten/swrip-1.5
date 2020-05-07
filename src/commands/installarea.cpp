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
    std::string arg;
    char buf[MAX_STRING_LENGTH];
    int num = 0;

    argument = OneArgument(argument, arg);

    if (arg.empty())
    {
        ch->Echo("Syntax: installarea <filename> [Area title]\r\n");
        return;
    }

    for (auto tarea = Areas->FirstBuild; tarea; tarea = tarea->Next)
    {
        if (!StrCmp(tarea->Filename, arg))
        {
            if (!argument.empty())
            {
                tarea->Name = argument;
            }

            /* Fold area with install flag -- auto-removes prototype flags */
            ch->Echo("Saving and installing file...\r\n");
            FoldArea(tarea, tarea->Filename, true);

            /* Remove from prototype area list */
            UNLINK(tarea, Areas->FirstBuild, Areas->LastBuild, Next, Previous);

            /* Add to real area list */
            LINK(tarea, Areas->FirstArea, Areas->LastArea, Next, Previous);

            /* Fix up author if online */
            for (Character *author : PlayerCharacters->Entities())
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
            num = tarea->NumberOfPlayers;
            tarea->NumberOfPlayers = 0;
            ResetArea(tarea);
            tarea->NumberOfPlayers = num;
            ch->Echo("Renaming author's building file.\r\n");
            sprintf(buf, "%s%s.installed", BUILD_DIR, tarea->Filename.c_str());

            char old[MAX_STRING_LENGTH];
            sprintf(old, "%s%s", BUILD_DIR, tarea->Filename.c_str());
            rename(old, buf);
            ch->Echo("Done.\r\n");
            return;
        }
    }

    ch->Echo("No such area exists.\r\n");
}
