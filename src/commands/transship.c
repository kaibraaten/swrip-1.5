#include "character.h"
#include "mud.h"
#include "ships.h"

void do_transship(Character *ch, char *argument)
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int arg3, origShipyard;
  Ship *ship;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  ship = get_ship( arg1 );
  if ( !ship )
    {
      send_to_char( "No such ship.\r\n", ch );
      return;
    }

  arg3 = atoi( arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Usage: transship <ship> <vnum>\r\n", ch );
      return;
    }

  origShipyard = ship->shipyard;

  ship->shipyard = arg3;
  ship->shipstate = SHIP_READY;

  if ( ship->sclass == SHIP_PLATFORM && ship->type != MOB_SHIP )
    {
      send_to_char( "Only nonmob midship/starfighters", ch );
      return;
    }

  extract_ship( ship );
  ship_to_room( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    ship_from_spaceobject( ship, ship->spaceobject );

  save_ship(ship);
  send_to_char( "Ship Transfered.\r\n", ch );
}
