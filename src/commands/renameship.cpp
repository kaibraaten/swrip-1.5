#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "clan.hpp"

void do_renameship( Character *ch, char *argument )
{
  Ship *ship;
  Clan *clan;
  if ( (ship = GetShipFromCockpit( ch->InRoom->Vnum ) ) == NULL)
    {
      SendToCharacter( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = GetClan(ship->Owner)) == NULL ) || StrCmp( clan->Leadership.Leader, ch->Name ) )
    if( StrCmp( ship->Owner, ch->Name ) )
      {
        SendToCharacter( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( GetShipAnywhere( argument ) != NULL )
    {
      SendToCharacter( "&RImperial Database: &WA ship already exists of that name.\r\n", ch);
      return;
    }


  if( ch->Gold < 50000 )
    {
      SendToCharacter( "&RImperial Database: &WYou do not have enough credits for this request.\r\n", ch);
      return;
    }

  ch->Gold -= 50000;
  FreeMemory( ship->PersonalName );
  ship->PersonalName            = CopyString( argument );
  Ships->Save(ship);
  SendToCharacter( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}
