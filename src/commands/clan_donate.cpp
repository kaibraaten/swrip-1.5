#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/playerrepository.hpp"

void do_clan_donate( Character *ch, std::string argument )
{
  Clan *clan = NULL;
  long amount = 0;

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "You don't seem to belong to an organization to donate to...\r\n" );
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->InRoom || !IsBitSet(ch->InRoom->Flags, ROOM_BANK) )
        {
          ch->Echo( "You must be in a bank or have a comlink to do that!\r\n" );
          return;
        }
    }

  clan = ch->PCData->ClanInfo.Clan;
  amount = std::stoi( argument );

  if ( amount == 0 )
    {
      ch->Echo( "How much would you like to donate?\r\n" );
      return;
    }

  if ( amount < 0 )
    {
      ch->Echo( "Nice try.\r\n" );
      return;
    }

  if ( ch->Gold < amount )
    {
      ch->Echo( "You don't have that much!\r\n" );
      return;
    }

  ch->Echo( "You donate %ld credits to %s's funds.\r\n", amount, clan->Name.c_str() );

  clan->Funds += amount;
  ch->Gold -= amount;
  PlayerCharacters->Save( ch );
}

