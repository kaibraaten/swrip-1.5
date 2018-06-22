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
  for ( ship = FirstShip; ship; ship = ship->Next )
    {
      if ( ship->Class <= SHIP_PLATFORM )
        continue;

      if (ship->Type == MOB_SHIP)
        continue;
      else if (ship->Type == SHIP_REBEL)
        SetPagerColor( AT_BLOOD, ch );
      else if (ship->Type == SHIP_IMPERIAL)
        SetPagerColor( AT_DGREEN, ch );
      else
        SetPagerColor( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
      PagerPrintf( ch, "%-35s%-15s ", buf, ship->Owner );

      if ( !StrCmp(ship->Owner, "Public") )
        {
          PagerPrintf( ch, "%ld to rent.\r\n", GetShipValue(ship)/100 );
        }
      else if ( StrCmp(ship->Owner, "") )
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
