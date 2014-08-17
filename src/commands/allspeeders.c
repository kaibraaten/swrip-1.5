#include "mud.h"
#include "ships.h"

void do_allspeeders( Character *ch, char *argument )
{
  Ship *ship;
  int count = 0;
  char buf[MAX_STRING_LENGTH];

  count = 0;
  send_to_pager( "&Y\r\nThe following sea/land/air vehicles are currently formed:\r\n", ch );

  send_to_pager( "\r\n&WVehicle                            Owner\r\n", ch );
  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->sclass <= SHIP_PLATFORM )
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

      if ( !StrCmp(ship->owner, "Public") )
        {
          pager_printf( ch, "%ld to rent.\r\n", GetShipValue(ship)/100 );
        }
      else if ( StrCmp(ship->owner, "") )
        pager_printf( ch, "%s", "\r\n" );
      else
        pager_printf( ch, "%ld to buy.\r\n", GetShipValue(ship) );

      count++;
    }

  if ( !count )
    {
      send_to_pager( "There are none currently formed.\r\n", ch );
      return;
    }
}
