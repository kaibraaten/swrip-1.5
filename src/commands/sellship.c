#include "mud.h"
#include "ship.h"
#include "character.h"

void do_sellship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;

  ship = GetShipInRoom( ch->in_room , argument );
  if ( !ship )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( StrCmp( ship->owner , ch->name ) )
    {
      SendToCharacter( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = GetShipValue( ship );

  ch->gold += ( price - price/10 );
  Echo(ch, "&GYou receive %ld credits from selling your ship.\r\n" , price - price/10 );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->owner );
  ship->owner = CopyString( "" );
  ship->pilot = CopyString( "" );
  ship->copilot = CopyString( "" );
  SaveShip( ship );
}
