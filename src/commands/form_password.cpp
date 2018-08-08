#include "mud.hpp"
#include "character.hpp"

void do_form_password( Character *ch, char *argument)
{
  ch->Echo("That text string encrypted would result in: %s",
           EncodeString(argument));
}

