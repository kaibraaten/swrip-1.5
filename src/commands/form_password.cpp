#include "mud.hpp"
#include "character.hpp"

void do_form_password( std::shared_ptr<Character> ch, std::string argument)
{
  ch->Echo("That text string encrypted would result in: %s",
           EncodeString(argument).c_str());
}

