#include "character.hpp"
#include "mud.hpp"

void do_wimpy( Character *ch, std::string arg )
{
  int wimpy = 0;

  if ( arg.empty() )
    wimpy = (int) ch->MaxHit / 5;
  else
    wimpy = std::stoi( arg );

  if ( wimpy < 0 )
    {
      ch->Echo("Your courage exceeds your wisdom.\r\n");
      return;
    }

  if ( wimpy > ch->MaxHit )
    {
      ch->Echo("Such cowardice ill becomes you.\r\n");
      return;
    }

  ch->Wimpy = wimpy;
  ch->Echo("Wimpy set to %d hit points.\r\n", wimpy );
}
