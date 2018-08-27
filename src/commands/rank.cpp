#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"

void do_rank( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: rank <string>.\r\n");
      ch->Echo("   or: rank none.\r\n");
      return;
    }

  SmashTilde( argument );
  FreeMemory( ch->PCData->Rank );

  if ( !StrCmp( argument, "none" ) )
    ch->PCData->Rank = CopyString( "" );
  else
    ch->PCData->Rank = CopyString( argument );

  ch->Echo("Ok.\r\n");
}

