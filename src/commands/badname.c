#include "mud.h"

void do_badname(CHAR_DATA *ch, char *arguments)
{
  int return_code = 0;

  if (arguments[0] == '\0')
    {
      send_to_char("Usage: badname <name>\r\n",ch);
      return;
    }

  return_code = add_bad_name(arguments);

  switch( return_code )
    {
    case -1:
      send_to_char("Error opening badname file.\r\n",ch);
      break;

    case 0:
      send_to_char("That name is already in the badname file.\r\n",ch);
      break;

    case 1:
      send_to_char("Name successfully added to the badname file.\r\n",ch);
      break;

    default:
      send_to_char("If you're reading this, add_bad_name is really messed up.\r\n", ch);
      break;
    }
}
