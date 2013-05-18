#include "mud.h"

void do_renameship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  CLAN_DATA *clan;
  if ( (ship = ship_from_cockpit( ch->in_room->vnum ) ) == NULL)
    {
      send_to_char( "You must be in the cockpit of a ship to do that!\r\n", ch);
      return;
    }

  if( ( (clan = get_clan(ship->owner)) == NULL ) || str_cmp( clan->leader, ch->name ) )
    if( str_cmp( ship->owner, ch->name ) )
      {
        send_to_char( "&RImperial Database: &WYou do not own this ship.\r\n", ch);
        return;
      }

  if( get_ship( argument ) != NULL )
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
  STRFREE( ship->personalname );
  ship->personalname            = STRALLOC( argument );
  save_ship( ship );
  send_to_char( "&RImperial Database: &WTransaction Complete. Name changed.", ch );
}
