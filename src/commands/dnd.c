#include "character.h"
#include "mud.h"

void do_dnd( Character *ch, char *argument )
{
  if ( !is_npc(ch) && ch->pcdata )
    {
      if ( IS_SET(ch->pcdata->flags, PCFLAG_DND) )
	{
	  REMOVE_BIT(ch->pcdata->flags, PCFLAG_DND);
	  send_to_char( "Your 'do not disturb' flag is now off.\r\n", ch );
	}
      else
	{
	  SET_BIT(ch->pcdata->flags, PCFLAG_DND);
	  send_to_char( "Your 'do not disturb' flag is now on.\r\n", ch );
	}
    }
  else
    {
      send_to_char( "huh?\r\n", ch );
    }
}
