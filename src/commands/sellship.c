#include "mud.h"
#include "ships.h"
#include "character.h"

void do_sellship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;

  ship = GetShipInRoom( ch->in_room , argument );
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

  price = GetShipValue( ship );

  ch->gold += ( price - price/10 );
  ch_printf(ch, "&GYou receive %ld credits from selling your ship.\r\n" , price - price/10 );

  act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  DISPOSE( ship->owner );
  ship->owner = str_dup( "" );
  ship->pilot = str_dup( "" );
  ship->copilot = str_dup( "" );
  SaveShip( ship );
}
