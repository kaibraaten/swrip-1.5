#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_clanfunds( Character *ch, char *argument )
{
  if ( !IsClanned( ch ) )
    {
      ch->Echo("You don't seem to belong to an organization.\r\n");
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

  const Clan *clan = ch->PCData->ClanInfo.Clan;

  if ( clan->Funds == 0 )
    {
      ch->Echo("%s has no funds at its disposal.",clan->Name);
      return;
    }

  ch->Echo("%s has %ld credits at its disposal.\r\n",clan->Name, clan->Funds);
}

