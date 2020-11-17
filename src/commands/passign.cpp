#include "mud.hpp"
#include "plugins.hpp"
#include "character.hpp"

void do_passign(std::shared_ptr<Character> ch, std::string argument)
{
    ch->Echo("&Rpassign not implemented.&d\r\n");
}
