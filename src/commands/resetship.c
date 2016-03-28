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

  if ( ( ship->sclass == SHIP_PLATFORM || ship->type == MOB_SHIP || ship->sclass == CAPITAL_SHIP )
       && ship->home )
    {
      InitializeVector( &ship->pos );
      ShipToSpaceobject(ship, GetSpaceobjectFromName(ship->home) );

      if( ship->spaceobject )
        {
          CopyVector( &ship->pos, &ship->spaceobject->Position );
        }

      RandomizeVector( &ship->pos, -5000, 5000 );
      ship->shipstate = SHIP_READY;
      ship->autopilot = true;
      ship->autorecharge = true;
      ship->shield = ship->maxshield;
    }
}
