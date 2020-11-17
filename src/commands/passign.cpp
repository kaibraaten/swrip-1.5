#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_passign(std::shared_ptr<Character> ch, std::string argument)
{
    auto plugin = FindPlugin(argument);

    if(plugin != nullptr)
    {
        ch->PCData->Build.Plugin = plugin;
        ch->Echo("Current plugin: %s\r\n", plugin->Name().c_str());
    }
    else if(StrCmp(argument, "none") == 0)
    {
        ch->PCData->Build.Plugin = nullptr;
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
