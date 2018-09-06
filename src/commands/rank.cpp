#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"

void do_rank( Character *ch, std::string argument )
{
  if ( IsNpc(ch) )
    return;

  if ( argument.empty() )
    {
      ch->Echo("Usage: rank <string>\r\n");
      ch->Echo("   or: rank none\r\n");
      return;
    }

  if ( !StrCmp( argument, "none" ) )
    ch->PCData->Rank.erase();
  else
    ch->PCData->Rank = argument;

  ch->Echo("Ok.\r\n");
}

