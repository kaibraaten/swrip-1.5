#include "mud.h"
#include "ship.h"
#include "character.h"
#include "clan.h"

void do_renameship( Character *ch, char *argument )
{
  Ship *ship;
  Clan *clan;
  if ( (ship = GetShipFromCockpit( ch->in_room->vnum ) ) == NULL)
    {
      SendToCharacter( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = GetClan(ship->owner)) == NULL ) || StrCmp( clan->leadership.leader, ch->name ) )
    if( StrCmp( ship->owner, ch->name ) )
      {
        SendToCharacter( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( GetShipAnywhere( argument ) != NULL )
    {
      SendToCharacter( "&RImperial Database: &WA ship already exists of that name.\r\n", ch);
      return;
    }


  if( ch->gold < 50000 )
    {
      SendToCharacter( "&RImperial Database: &WYou do not have enough credits for this request.\r\n", ch);
      return;
    }

  ch->gold -= 50000;
  FreeMemory( ship->personalname );
  ship->personalname            = CopyString( argument );
  SaveShip( ship );
  SendToCharacter( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}
