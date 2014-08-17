#include "mud.h"
#include "ships.h"
#include "character.h"

void do_renameship( Character *ch, char *argument )
{
  Ship *ship;
  CLAN_DATA *clan;
  if ( (ship = GetShipFromCockpit( ch->in_room->vnum ) ) == NULL)
    {
      send_to_char( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = get_clan(ship->owner)) == NULL ) || StrCmp( clan->leadership.leader, ch->name ) )
    if( StrCmp( ship->owner, ch->name ) )
      {
        send_to_char( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( GetShipAnywhere( argument ) != NULL )
    {
      send_to_char( "&RImperial Database: &WA ship already exists of that name.\r\n", ch);
      return;
    }


  if( ch->gold < 50000 )
    {
      send_to_char( "&RImperial Database: &WYou do not have enough credits for this request.\r\n", ch);
      return;
    }

  ch->gold -= 50000;
  FreeMemory( ship->personalname );
  ship->personalname            = CopyString( argument );
  SaveShip( ship );
  send_to_char( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}
