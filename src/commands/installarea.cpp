#include <filesystem>
#include "log.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"

namespace fs = std::filesystem;

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->Author and area->Name are cleaned up... it will be easier
 */
void do_installarea(Character *ch, std::string argument)
{
    std::string arg;

    argument = OneArgument(argument, arg);

    if (arg.empty())
    {
        ch->Echo("Syntax: installarea <filename> [Area title]\r\n");
        return;
    }

    for (auto tarea : Areas->AreasInProgress())
    {
        if (!StrCmp(tarea->Filename, arg))
        {
            try
            {
                if (!argument.empty())
                {
                    tarea->Name = argument;
                }

                ch->Echo("Renaming author's building file.\r\n");
                fs::rename(Areas->GetAreaFilename(tarea),
                           Areas->GetAreaFilename(tarea) + ".installed");
                
                Areas->Remove(tarea);
                tarea->Flags.reset(Flag::Area::Prototype);
                Areas->Add(tarea);
                
                /* Fold area with install flag -- auto-removes prototype flags */
                ch->Echo("Saving and installing file...\r\n");
                Areas->Save(tarea, true);


                /* Fix up author if online */
                for (Character *author : PlayerCharacters)
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
            catch(const fs::filesystem_error &ex)
            {
                Log->Bug("%s:%d:%s() - %s",
                         __FILE__, __LINE__, __FUNCTION__, ex.what());
            }
            
            return;
        }
    }

    ch->Echo("No such area exists.\r\n");
}
