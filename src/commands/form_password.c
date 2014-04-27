#include "mud.h"

void do_form_password( CHAR_DATA *ch, char *argument)
{
  ch_printf(ch, "That text string encrypted would result in: %s",
            encode_string(argument));
}
