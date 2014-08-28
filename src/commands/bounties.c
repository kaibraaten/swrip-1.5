#include "character.h"
#include "mud.h"

void do_bounties( Character *ch, char *argument )
{
  Bounty *bounty = NULL;
  int count = 0;

  if ( ( GetTrustLevel(ch) < LEVEL_IMMORTAL)
       && (!IsClanned( ch )
           || ( StrCmp(ch->pcdata->ClanInfo.Clan->name, "the hunters guild")
                && StrCmp(ch->pcdata->ClanInfo.Clan->name, "the assassins guild") ) ))
    {
      SendToCharacter( "\r\nOnly hunters can access that information!\r\n", ch );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  SendToCharacter( "\r\nBounty                      Amount          Poster\r\n", ch );

  for ( bounty = first_bounty; bounty; bounty = bounty->next )
    {
      SetCharacterColor( AT_RED, ch );
      Echo( ch, "%-26s %-14ld %-20s\r\n", bounty->target, bounty->amount, bounty->poster );
      count++;
    }

  if ( !count )
    {
      SetCharacterColor( AT_GREY, ch );
      SendToCharacter( "There are no bounties set at this time.\r\n", ch );
      return;
    }
}
