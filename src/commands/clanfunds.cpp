#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_clanfunds( Character *ch, std::string argument )
{
  if ( !IsClanned( ch ) )
    {
      ch->Echo("You don't seem to belong to an organization.\r\n");
      return;
    }

  if ( !HasComlink( ch )
       && !ch->InRoom->Flags.test( Flag::Room::Bank ) )
    {
      ch->Echo( "You must be in a bank or have a comlink to do that!\r\n" );
      return;
    }

  std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

  if ( clan->Funds == 0 )
    {
      ch->Echo("%s has no funds at its disposal.", clan->Name.c_str());
      return;
    }

  ch->Echo("%s has %ld credits at its disposal.\r\n", clan->Name.c_str(), clan->Funds);
}

