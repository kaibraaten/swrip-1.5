#include "mud.h"
#include "ships.h"
#include "vector3_aux.h"

void do_resetship( Character *ch, char *argument )
{
  Ship *ship = GetShipAnywhere( argument );

  if (ship == NULL)
    {
      send_to_char("&RNo such ship!",ch);
      return;
    }

  ResetShip( ship );

  if ( ( ship->sclass == SHIP_PLATFORM || ship->type == MOB_SHIP || ship->sclass == CAPITAL_SHIP )
       && ship->home )
    {
      InitializeVector( &ship->pos );
      ShipToSpaceobject(ship, spaceobject_from_name(ship->home) );

      if( ship->spaceobject )
        {
          CopyVector( &ship->pos, &ship->spaceobject->pos );
        }

      RandomizeVector( &ship->pos, -5000, 5000 );
      ship->shipstate = SHIP_READY;
      ship->autopilot = true;
      ship->autorecharge = true;
      ship->shield = ship->maxshield;
    }
}
