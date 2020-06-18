#include "character.hpp"
#include "mud.hpp"

void do_wimpy( std::shared_ptr<Character> ch, std::string arg )
{
  int wimpy = 0;

  if ( arg.empty() )
    wimpy = (int) ch->HitPoints.Max / 5;
  else
    wimpy = ToLong( arg );

  if ( wimpy < 0 )
    {
      ch->Echo("Your courage exceeds your wisdom.\r\n");
      return;
    }

  if ( wimpy > ch->HitPoints.Max )
    {
      ch->Echo("Such cowardice ill becomes you.\r\n");
      return;
    }

  ch->Wimpy = wimpy;
  ch->Echo("Wimpy set to %d hit points.\r\n", wimpy );
}
