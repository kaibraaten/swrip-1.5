#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_dnd( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) && ch->PCData )
    {
      if ( IsBitSet(ch->PCData->Flags, PCFLAG_DND) )
	{
	  RemoveBit(ch->PCData->Flags, PCFLAG_DND);
	  ch->Echo( "Your 'do not disturb' flag is now off.\r\n" );
	}
      else
	{
	  SetBit(ch->PCData->Flags, PCFLAG_DND);
	  ch->Echo( "Your 'do not disturb' flag is now on.\r\n" );
	}
    }
  else
    {
      ch->Echo( "Huh?\r\n" );
    }
}

