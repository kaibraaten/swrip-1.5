#include "mud.h"

void do_form_password( Character *ch, char *argument)
{
  ChPrintf(ch, "That text string encrypted would result in: %s",
            EncodeString(argument));
}
