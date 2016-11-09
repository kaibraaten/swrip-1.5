#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"

void do_transship(Character *ch, std::string argument)
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

  origShipyard = ship->Shipyard;

  ship->Shipyard = arg3;
  ship->State = SHIP_READY;

  if ( ship->Class == SHIP_PLATFORM && ship->Type != MOB_SHIP )
    {
      SendToCharacter( "Only nonmob midship/starfighters", ch );
      return;
    }

  ExtractShip( ship );
  ShipToRoom( ship , ship->Shipyard );

  ship->Location = ship->Shipyard;
  ship->LastDock = ship->Shipyard;
  ship->State = SHIP_LANDED;
  ship->Shipyard = origShipyard;

  if (ship->Spaceobject)
    ShipFromSpaceobject( ship, ship->Spaceobject );

  SaveShip(ship);
  SendToCharacter( "Ship Transfered.\r\n", ch );
}
