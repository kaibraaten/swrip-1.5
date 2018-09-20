#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "repos/shiprepository.hpp"

void do_transship(Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  vnum_t arg3 = 0;
  vnum_t origShipyard = INVALID_VNUM;
  Ship *ship = nullptr;

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

  arg3 = ToLong( arg2 );

  if ( arg1.empty() || arg2.empty() )
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
  ch->Echo("Ship transferred.\r\n");
}
