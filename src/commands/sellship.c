#include "mud.h"

void do_sellship(CHAR_DATA *ch, char *argument )
{
  long         price;
  SHIP_DATA   *ship;

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( str_cmp( ship->owner , ch->name ) )
    {
      send_to_char( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = get_ship_value( ship );

  ch->gold += ( price - price/10 );
  ch_printf(ch, "&GYou receive %ld credits from selling your ship.\r\n" , price - price/10 );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  STRFREE( ship->owner );
  ship->owner = STRALLOC( "" );
  ship->pilot = STRALLOC( "" );
  ship->copilot = STRALLOC( "" );
  save_ship( ship );
}
