#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"

void do_transship(Character *ch, char *argument)
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int arg3, origShipyard;
  Ship *ship;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  ship = GetShipAnywhere( arg1 );

  if ( !ship )
    {
      ch->Echo("No such ship.\r\n");
      return;
    }

  arg3 = atoi( arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("Usage: TransferShip <ship> <vnum>\r\n");
      return;
    }

  origShipyard = ship->Shipyard;

  ship->Shipyard = arg3;
  ship->State = SHIP_READY;

  if ( ship->Class == SHIP_PLATFORM && ship->Type != MOB_SHIP )
    {
      ch->Echo("Only nonmob midship/starfighters");
      return;
    }

  ExtractShip( ship );
  ShipToRoom( ship , ship->Shipyard );

  ship->Location = ship->Shipyard;
  ship->LastDock = ship->Shipyard;
  ship->State = SHIP_LANDED;
  ship->Shipyard = origShipyard;

  if (ship->Spaceobject)
    {
      ShipFromSpaceobject( ship, ship->Spaceobject );
    }

  Ships->Save(ship);
  ch->Echo("Ship Transfered.\r\n");
}

