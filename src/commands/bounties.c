#include "character.h"
#include "mud.h"

void do_bounties( Character *ch, char *argument )
{
  Bounty *bounty = NULL;
  int count = 0;

  if ( ( GetTrustLevel(ch) < LEVEL_IMMORTAL)
       && (!ch->pcdata || !ch->pcdata->clan
           || ( StrCmp(ch->pcdata->clan->name, "the hunters guild")
                && StrCmp(ch->pcdata->clan->name, "the assassins guild") ) ))
    {
      send_to_char( "\r\nOnly hunters can access that information!\r\n", ch );
      return;
    }

  set_char_color( AT_WHITE, ch );
  send_to_char( "\r\nBounty                      Amount          Poster\r\n", ch );

  for ( bounty = first_bounty; bounty; bounty = bounty->next )
    {
      set_char_color( AT_RED, ch );
      ch_printf( ch, "%-26s %-14ld %-20s\r\n", bounty->target, bounty->amount, bounty->poster );
      count++;
    }

  if ( !count )
    {
      set_char_color( AT_GREY, ch );
      send_to_char( "There are no bounties set at this time.\r\n", ch );
      return;
    }
}
