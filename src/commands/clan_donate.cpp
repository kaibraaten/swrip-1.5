#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_clan_donate( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long amount = 0;

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "You don't seem to belong to an organization to donate to...\r\n", ch );
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
      SendToCharacter( "How much would you like to donate?\r\n", ch );
      return;
    }

  if ( amount < 0 )
    {
      Echo( ch,  "Nice try...\r\n" );
      return;
    }

  if ( amount > ch->Gold )
    {
      SendToCharacter( "You don't have that much!\r\n", ch );
      return;
    }

  Echo( ch,  "You donate %ld credits to %s's funds.\r\n", amount, clan->Name );

  clan->Funds += amount;
  ch->Gold -= amount;
  SaveCharacter( ch );
}
