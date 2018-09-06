#include "character.hpp"
#include "mud.hpp"

void do_holylight( Character *ch, std::string argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet(ch->Flags, PLR_HOLYLIGHT) )
    {
      RemoveBit(ch->Flags, PLR_HOLYLIGHT);
      ch->Echo("Holy light mode off.\r\n");
    }
  else
    {
      SetBit(ch->Flags, PLR_HOLYLIGHT);
      ch->Echo("Holy light mode on.\r\n");
    }
}
