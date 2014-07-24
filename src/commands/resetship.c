#include "mud.h"
#include "ships.h"
#include "vector3_aux.h"

void do_resetship( Character *ch, char *argument )
{
  SHIP_DATA *ship = get_ship( argument );

  if (ship == NULL)
    {
      send_to_char("&RNo such ship!",ch);
      return;
    }

  resetship( ship );

  if ( ( ship->sclass == SHIP_PLATFORM || ship->type == MOB_SHIP || ship->sclass == CAPITAL_SHIP )
       && ship->home )
    {
      vector_init( &ship->pos );
      ship_to_spaceobject(ship, spaceobject_from_name(ship->home) );

      if( ship->spaceobject )
        {
          vector_copy( &ship->pos, &ship->spaceobject->pos );
        }

      vector_randomize( &ship->pos, -5000, 5000 );
      ship->shipstate = SHIP_READY;
      ship->autopilot = TRUE;
      ship->autorecharge = TRUE;
      ship->shield = ship->maxshield;
    }
}
