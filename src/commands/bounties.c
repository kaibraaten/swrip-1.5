#include "character.h"
#include "mud.h"
#include "clan.h"
#include "bounty.h"

void do_bounties( Character *ch, char *argument )
{
  int count = 0;
  const LinkList *bounties = GetEntities(BountyRepository);
  ListIterator *iterator = NULL;

  if ( ( GetTrustLevel(ch) < LEVEL_IMMORTAL)
       && (!IsClanned( ch )
           || ( StrCmp(ch->PCData->ClanInfo.Clan->Name, "the hunters guild")
                && StrCmp(ch->PCData->ClanInfo.Clan->Name, "the assassins guild") ) ))
    {
      SendToCharacter( "\r\nOnly hunters can access that information!\r\n", ch );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  SendToCharacter( "\r\nBounty                      Reward          Poster\r\n", ch );

  iterator = AllocateIterator(bounties);

  while(HasMoreElements(iterator))
    {
      const Bounty *bounty = (const Bounty*) GetData(iterator);
      MoveToNextElement(iterator);
      SetCharacterColor( AT_RED, ch );
      Echo( ch, "%-26s   %-14ld %-20s\r\n", bounty->Target, bounty->Reward, bounty->Poster );
      count++;
    }

  FreeIterator(iterator);

  if ( count == 0 )
    {
      SetCharacterColor( AT_GREY, ch );
      SendToCharacter( "There are no bounties set at this time.\r\n", ch );
      return;
    }
}
