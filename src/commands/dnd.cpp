#include "character.hpp"
#include "mud.hpp"

void do_dnd( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) && ch->PCData )
    {
      if ( IsBitSet(ch->PCData->Flags, PCFLAG_DND) )
	{
	  RemoveBit(ch->PCData->Flags, PCFLAG_DND);
	  SendToCharacter( "Your 'do not disturb' flag is now off.\r\n", ch );
	}
      else
	{
	  SetBit(ch->PCData->Flags, PCFLAG_DND);
	  SendToCharacter( "Your 'do not disturb' flag is now on.\r\n", ch );
	}
    }
  else
    {
      SendToCharacter( "huh?\r\n", ch );
    }
}
