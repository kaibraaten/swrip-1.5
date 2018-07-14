#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"

void do_clan_withdraw( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long amount = 0;

  if ( !IsClanned( ch ) )
    {
      Echo( ch, "You don't seem to belong to an organization to withdraw funds from...\r\n" );
      return;
    }

  if ( (ch->PCData && ch->PCData->Bestowments
        && IsName("withdraw", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader  ))
    {
      ;
    }
  else
    {
      SendToCharacter( "&RYour organization hasn't seen fit to bestow you with that ability." ,ch );
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->InRoom || !IsBitSet(ch->InRoom->Flags, ROOM_BANK) )
        {
          SendToCharacter( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  clan = ch->PCData->ClanInfo.Clan;
  amount = atoi( argument );

  if ( !amount )
    {
      SendToCharacter( "How much would you like to withdraw?\r\n", ch );
      return;
    }

  if ( amount > clan->Funds )
    {
      Echo( ch,  "%s doesn't have that much!\r\n", clan->Name );
      return;
    }

  if ( amount < 0 )
    {
      Echo( ch,  "Nice try...\r\n" );
      return;
    }

  Echo( ch,  "You withdraw %ld credits from %s's funds.\r\n", amount, clan->Name );

  clan->Funds -= amount;
  ch->Gold += amount;
  SaveCharacter( ch );
}
