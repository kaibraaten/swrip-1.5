#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"

void do_plugins(std::shared_ptr<Character> ch, std::string argument)
{
    ch->Echo("&Rplugins not implemented.&d\r\n");
}
