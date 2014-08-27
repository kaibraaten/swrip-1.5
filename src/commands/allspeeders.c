#include "mud.h"
#include "ship.h"

void do_allspeeders( Character *ch, char *argument )
{
  Ship *ship;
  int count = 0;
  char buf[MAX_STRING_LENGTH];

  count = 0;
  SendToPager( "&Y\r\nThe following sea/land/air vehicles are currently formed:\r\n", ch );

  SendToPager( "\r\n&WVehicle                            Owner\r\n", ch );
  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->sclass <= SHIP_PLATFORM )
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        SetPagerColor( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        SetPagerColor( AT_DGREEN, ch );
      else
        SetPagerColor( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      PagerPrintf( ch, "%-35s%-15s ", buf, ship->owner );

      if ( !StrCmp(ship->owner, "Public") )
        {
          PagerPrintf( ch, "%ld to rent.\r\n", GetShipValue(ship)/100 );
        }
      else if ( StrCmp(ship->owner, "") )
        PagerPrintf( ch, "%s", "\r\n" );
      else
        PagerPrintf( ch, "%ld to buy.\r\n", GetShipValue(ship) );

      count++;
    }

  if ( !count )
    {
      SendToPager( "There are none currently formed.\r\n", ch );
      return;
    }
}
