#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "repos/shiprepository.hpp"

void do_renameship( Character *ch, std::string argument )
{
  Ship *ship = nullptr;
  const Clan *clan = nullptr;
  
  if ( (ship = GetShipFromCockpit( ch->InRoom->Vnum ) ) == NULL)
    {
      ch->Echo("You must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if( ( (clan = GetClan(ship->Owner)) == NULL ) || StrCmp( clan->Leadership.Leader, ch->Name ) )
    if( StrCmp( ship->Owner, ch->Name ) )
      {
        ch->Echo("&RImperial Database: &WYou do not own this ship.\r\n");
        return;
      }

  if( GetShipAnywhere( argument ) != NULL )
    {
      ch->Echo("&RImperial Database: &WA ship of that name already exists.\r\n");
      return;
    }


  if( ch->Gold < 50000 )
    {
      ch->Echo("&RImperial Database: &WYou do not have enough credits for this request.\r\n");
      return;
    }

  ch->Gold -= 50000;
  ship->PersonalName = argument;
  Ships->Save(ship);
  ch->Echo("&RImperial Database: &WTransaction Complete. Name changed.");
}
