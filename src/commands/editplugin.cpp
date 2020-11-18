#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "editor.hpp"

void do_editplugin(std::shared_ptr<Character> ch, std::string argument)
{
    std::string option;
    argument = OneArgument(argument, option);

    
    if(StrCmp(option, "create") == 0)
    {
        if(argument.empty())
        {
            ch->Echo("&RSupply an identifier.&d\r\n");
            return;
        }
        
        if(FindPlugin(argument))
        {
            ch->Echo("&RA plugin with that identifier already exists.&d\r\n");
            return;
        }

        auto plugin = CreatePlugin(argument);
        SavePlugin(plugin);
        ch->PCData->Build.Plugin = plugin;
        ch->Echo("&GOk.&d\r\n");
        return;
    }

    auto plugin = ch->PCData->Build.Plugin;
    
    if(plugin == nullptr)
    {
        ch->Echo("Use PASSIGN to edit a plugin.\r\n");
        return;
    }

    if(StrCmp(option, "save") == 0)
    {
        SavePlugin(plugin);
        ch->Echo("Ok.\r\n");
    }
    else if(StrCmp(option, "show") == 0)
    {
        ch->Echo("Show everything the plugin contains.\r\n");
    }
    else if(StrCmp(option, "name") == 0)
    {
        if(argument.empty())
        {
            ch->Echo("&RSupply a name.&d\r\n");
            return;
        }
        
        plugin->Name(argument);
        ch->Echo("Ok.\r\n");
    }
    else if(StrCmp(option, "description") == 0
            || StrCmp(option, "desc") == 0
            || StrCmp(option, "descr") == 0)
    {
        StartEditing(ch, plugin->Description(),
                     [plugin](const auto &txt)
                     {
                         plugin->Description(txt);
                     });
        SetEditorDesc(ch, "Plugin %s (%s) description.",
                      plugin->Name().c_str(), plugin->Id().c_str());
    }
    else
    {
        do_help(ch, "editplugin");
    }
}
