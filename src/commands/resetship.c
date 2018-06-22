#include "mud.h"
#include "ship.h"
#include "vector3_aux.h"
#include "spaceobject.h"

void do_resetship( Character *ch, char *argument )
{
  Ship *ship = GetShipAnywhere( argument );

  if (ship == NULL)
    {
      SendToCharacter("&RNo such ship!",ch);
      return;
    }

  ResetShip( ship );

  if ( ( ship->Class == SHIP_PLATFORM || ship->Type == MOB_SHIP || ship->Class == CAPITAL_SHIP )
       && ship->Home )
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
