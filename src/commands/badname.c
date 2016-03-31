#include "types.h"
#include "badname.h"
#include "mud.h"

void do_badname(Character *ch, char *arguments)
{
  int return_code = 0;

  if (arguments[0] == '\0')
    {
      SendToCharacter("Usage: badname <name>\r\n",ch);
      return;
    }

  return_code = AddBadName(arguments);

  switch( return_code )
    {
    case -1:
      SendToCharacter("Error opening badname file.\r\n",ch);
      break;

    case 0:
      SendToCharacter("That name is already in the badname file.\r\n",ch);
      break;

    case 1:
      SendToCharacter("Name successfully added to the badname file.\r\n",ch);
      break;

    default:
      SendToCharacter("If you're reading this, AddBadName is really messed up.\r\n", ch);
      break;
    }
}
