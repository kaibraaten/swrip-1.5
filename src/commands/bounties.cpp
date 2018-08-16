#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "pcdata.hpp"

void do_bounties( Character *ch, char *argument )
{
  if ( ( GetTrustLevel(ch) < LEVEL_IMMORTAL)
       && (!IsClanned( ch )
           || !IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name)))
    {
      ch->Echo( "\r\nOnly bounty hunters can access that information!\r\n" );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  ch->Echo( "\r\nBounty                      Reward          Poster\r\n" );

  if( Bounties->Count() > 0)
    {
      for(const Bounty *bounty : Bounties->Entities())
        {
          SetCharacterColor( AT_RED, ch );
          ch->Echo( "%-26s   %-14ld %-20s\r\n", bounty->Target, bounty->Reward, bounty->Poster );
        }
    }
  else
    {
      SetCharacterColor( AT_GREY, ch );
      ch->Echo( "There are no bounties set at this time.\r\n" );
    }
}
