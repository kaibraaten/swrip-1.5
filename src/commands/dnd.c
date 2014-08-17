#include "character.h"
#include "mud.h"

void do_dnd( Character *ch, char *argument )
{
  if ( !IsNpc(ch) && ch->pcdata )
    {
      if ( IsBitSet(ch->pcdata->flags, PCFLAG_DND) )
	{
	  RemoveBit(ch->pcdata->flags, PCFLAG_DND);
	  send_to_char( "Your 'do not disturb' flag is now off.\r\n", ch );
	}
      else
	{
	  SetBit(ch->pcdata->flags, PCFLAG_DND);
	  send_to_char( "Your 'do not disturb' flag is now on.\r\n", ch );
	}
    }
  else
    {
      send_to_char( "huh?\r\n", ch );
    }
}
