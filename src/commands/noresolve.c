#include "mud.h"

void do_noresolve( Character *ch, char *argument )
{
  sysdata.NoNameResolving = !sysdata.NoNameResolving;

  if ( sysdata.NoNameResolving )
    SendToCharacter( "Name resolving disabled.\r\n", ch );
  else
    SendToCharacter( "Name resolving enabled.\r\n", ch );
}
