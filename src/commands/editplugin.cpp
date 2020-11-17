#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_editplugin(std::shared_ptr<Character> ch, std::string argument)
{
    std::string option;
    argument = OneArgument(argument, option);

    if(StrCmp(option, "create") == 0)
    {
        if(FindPlugin(argument))
        {
            ch->Echo("&RA plugin with that name already exists.&d\r\n");
            return;
        }

        auto plugin = CreatePlugin(argument);
        SavePlugin(plugin);
        ch->PCData->Build.Plugin = plugin;
        ch->Echo("&GOk.&d\r\n");
    }
    else
    {
        do_help(ch, "editplugin");
    }
}
