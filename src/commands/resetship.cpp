#include "mud.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "spaceobject.hpp"
#include "character.hpp"

void do_resetship( Character *ch, std::string argument )
{
  Ship *ship = GetShipAnywhere( argument );

  if (ship == NULL)
    {
      ch->Echo("&RNo such ship!");
      return;
    }

  ResetShip( ship );

  if ( ( ship->Class == SHIP_PLATFORM || ship->Type == MOB_SHIP || ship->Class == CAPITAL_SHIP )
       && !ship->Home.empty() )
    {
      InitializeVector( &ship->Position );
      ShipToSpaceobject(ship, GetSpaceobject(ship->Home) );

      if( ship->Spaceobject )
        {
          CopyVector( &ship->Position, &ship->Spaceobject->Position );
        }

      RandomizeVector( &ship->Position, -5000, 5000 );
      ship->State = SHIP_READY;
      ship->Autopilot = true;
      ship->AutoRecharge = true;
      ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
    }
}
