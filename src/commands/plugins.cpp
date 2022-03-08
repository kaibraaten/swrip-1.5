#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"

void do_plugins(std::shared_ptr<Character> ch, std::string argument)
{
    ch->Echo("Installed plugins:\r\n");
    ch->Echo("%s\r\n", std::string(80, '-').c_str());
    
    for(const auto &plugin : Plugins)
    {
        ch->Echo("%s (%s)\r\n", plugin->Name().c_str(), plugin->Id().c_str());
        ch->Echo("%s\r\n", std::string(80, '-').c_str());
    }

    if(Plugins.empty())
    {
        ch->Echo("No plugins installed.\r\n");
    }
}
