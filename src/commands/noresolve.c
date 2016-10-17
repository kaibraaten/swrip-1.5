#include "mud.h"

void do_noresolve( Character *ch, char *argument )
{
  SysData.NoNameResolving = !SysData.NoNameResolving;

  if ( SysData.NoNameResolving )
    SendToCharacter( "Name resolving disabled.\r\n", ch );
  else
    SendToCharacter( "Name resolving enabled.\r\n", ch );
}
