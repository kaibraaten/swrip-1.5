#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "pcdata.hpp"

void do_bounties( Character *ch, char *argument )
{
  const List *bounties = GetEntities(BountyRepository);

  if ( ( GetTrustLevel(ch) < LEVEL_IMMORTAL)
       && (!IsClanned( ch )
           || !IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name)))
    {
      SendToCharacter( "\r\nOnly hunters can access that information!\r\n", ch );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  SendToCharacter( "\r\nBounty                      Reward          Poster\r\n", ch );

  if( ListSize(bounties) > 0)
    {
      ListIterator *iterator = AllocateListIterator(bounties);

      while(ListHasMoreElements(iterator))
        {
          const Bounty *bounty = (const Bounty*) GetListData(iterator);
          MoveToNextListElement(iterator);
          SetCharacterColor( AT_RED, ch );
          Echo( ch, "%-26s   %-14ld %-20s\r\n", bounty->Target, bounty->Reward, bounty->Poster );
        }

      FreeListIterator(iterator);
    }
  else
    {
      SetCharacterColor( AT_GREY, ch );
      SendToCharacter( "There are no bounties set at this time.\r\n", ch );
    }
}
