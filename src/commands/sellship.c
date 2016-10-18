#include "mud.h"
#include "ship.h"
#include "character.h"

void do_sellship(Character *ch, char *argument )
{
  long         price;
  Ship   *ship;

  ship = GetShipInRoom( ch->InRoom , argument );
  if ( !ship )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( StrCmp( ship->Owner , ch->Name ) )
    {
      SendToCharacter( "&RThat isn't your ship!" ,ch );
      return;
    }

  price = GetShipValue( ship );

  ch->Gold += ( price - price/10 );
  Echo(ch, "&GYou receive %ld credits from selling your ship.\r\n" , price - price/10 );

  Act( AT_PLAIN, "$n walks over to a terminal and makes a credit transaction.",ch,
       NULL, argument , TO_ROOM );

  FreeMemory( ship->Owner );
  ship->Owner = CopyString( "" );
  ship->Pilot = CopyString( "" );
  ship->CoPilot = CopyString( "" );
  SaveShip( ship );
}
