#include "mud.hpp"
#include "character.hpp"
#include "systemdata.hpp"

void do_noresolve( Character *ch, std::string arg )
{
  SysData.NoNameResolving = !SysData.NoNameResolving;

  if ( SysData.NoNameResolving )
    ch->Echo("Name resolving disabled.\r\n");
  else
    ch->Echo("Name resolving enabled.\r\n");
}

