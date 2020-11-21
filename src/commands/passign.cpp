#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "area.hpp"
#include "repos/arearepository.hpp"
#include "log.hpp"

static std::shared_ptr<Area> FindPluginZone()
{
    return Find(Areas->Entities(),
                [](const auto &area)
                {
                    return area->Flags.test(Flag::Area::PluginZone);
                });
}

void do_passign(std::shared_ptr<Character> ch, std::string argument)
{
    auto plugin = FindPlugin(argument);

    if(plugin != nullptr)
    {
        ch->PCData->Build.Plugin = plugin;
        ch->Echo("Current plugin: %s\r\n", plugin->Name().c_str());
        auto zone = FindPluginZone();

        if(zone != nullptr)
        {
            ch->PCData->Build.Area = zone;
        }
        else
        {
            Log->Bug("No plugin zone found!");
        }
    }
    else if(StrCmp(argument, "none") == 0)
    {
        ch->PCData->Build.Plugin = nullptr;
        ch->PCData->Build.Area = nullptr;
        ch->Echo("No current plugin.\r\n");
    }
    else if(argument.empty())
    {
        do_help(ch, "passign");
    }
    else
    {
        ch->Echo("Plugin not found.\r\n");
    }
}
