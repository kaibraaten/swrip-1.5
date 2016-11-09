#include "mud.hpp"

void do_form_password( Character *ch, std::string argument)
{
  Echo(ch, "That text string encrypted would result in: %s",
            EncodeString(argument));
}
