#include "character.h"
#include "mud.h"
#include "ship.h"

void do_transship(Character *ch, char *argument)
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int arg3, origShipyard;
  Ship *ship;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  ship = GetShipAnywhere( arg1 );

  if ( !ship )
    {
      SendToCharacter( "No such ship.\r\n", ch );
      return;
    }

  arg3 = atoi( arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Usage: TransferShip <ship> <vnum>\r\n", ch );
      return;
    }

  origShipyard = ship->shipyard;

  ship->shipyard = arg3;
  ship->shipstate = SHIP_READY;

  if ( ship->sclass == SHIP_PLATFORM && ship->type != MOB_SHIP )
    {
      SendToCharacter( "Only nonmob midship/starfighters", ch );
      return;
    }

  ExtractShip( ship );
  ShipToRoom( ship , ship->shipyard );

  ship->location = ship->shipyard;
  ship->lastdoc = ship->shipyard;
  ship->shipstate = SHIP_LANDED;
  ship->shipyard = origShipyard;

  if (ship->spaceobject)
    ShipFromSpaceobject( ship, ship->spaceobject );

  SaveShip(ship);
  SendToCharacter( "Ship Transfered.\r\n", ch );
}
