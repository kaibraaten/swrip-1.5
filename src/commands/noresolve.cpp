#include "mud.hpp"
#include "character.hpp"

void do_noresolve( Character *ch, char *argument )
{
  SysData.NoNameResolving = !SysData.NoNameResolving;

  if ( SysData.NoNameResolving )
    ch->Echo("Name resolving disabled.\r\n");
  else
    ch->Echo("Name resolving enabled.\r\n");
}

