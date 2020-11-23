#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"
#include "vnumconverter.hpp"

void do_foldarea(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    bool fold_all_areas = false;
    bool found = false;

    argument = OneArgument(argument, arg);

    if (arg.empty())
    {
        ch->Echo("Usage: foldarea <filename> [remproto]\r\n");
        return;
    }

    if (!StrCmp(arg, "this"))
    {
        arg = ch->InRoom->Area->Filename;
    }

    fold_all_areas = !StrCmp(arg, "all");

    for (auto tarea : Areas)
    {
        if (!StrCmp(tarea->Filename, arg) || fold_all_areas)
        {
            auto vnumConverter = VnumConverter::Create(tarea);
            
            if (!StrCmp(argument, "remproto"))
            {
                Areas->Save(tarea, true, vnumConverter);
            }
            else
            {
                Areas->Save(tarea, false, vnumConverter);
            }
            
            found = true;
        }
    }

    if (found)
    {
        ch->Echo("Done.\r\n");
    }
    else
    {
        ch->Echo("No such area exists.\r\n");
    }
}

