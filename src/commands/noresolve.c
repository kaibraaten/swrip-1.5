#include "mud.h"

void do_noresolve( Character *ch, char *argument )
{
  sysdata.NO_NAME_RESOLVING = !sysdata.NO_NAME_RESOLVING;

  if ( sysdata.NO_NAME_RESOLVING )
    SendToCharacter( "Name resolving disabled.\r\n", ch );
  else
    SendToCharacter( "Name resolving enabled.\r\n", ch );
}
