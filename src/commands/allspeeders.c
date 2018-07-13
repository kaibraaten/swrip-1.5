#include "mud.h"
#include "ship.h"

static bool ShowShip(Ship *ship, void *userData);

struct UserData
{
  Character *ch;
  int count;
};

void do_allspeeders( Character *ch, char *argument )
{
  struct UserData data;
  data.ch = ch;
  data.count = 0;

  SendToPager( "&Y\r\nThe following sea/land/air vehicles are currently formed:\r\n", ch );

  SendToPager( "\r\n&WVehicle                            Owner\r\n", ch );

  ForEachShip(ShowShip, &data);

  if ( data.count == 0 )
    {
      SendToPager( "There are none currently formed.\r\n", ch );
      return;
    }
}

static bool ShowShip(Ship *ship, void *userData)
{
  struct UserData *data = (struct UserData*)userData;
  char buf[MAX_STRING_LENGTH] = { '\0' };

  if ( ship->Class <= SHIP_PLATFORM )
    return true;

  if (ship->Type == MOB_SHIP)
    return true;
  else if (ship->Type == SHIP_REBEL)
    SetPagerColor( AT_BLOOD, data->ch );
  else if (ship->Type == SHIP_IMPERIAL)
    SetPagerColor( AT_DGREEN, data->ch );
  else
    SetPagerColor( AT_BLUE, data->ch );

  sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
  PagerPrintf( data->ch, "%-35s%-15s ", buf, ship->Owner );

  if ( !StrCmp(ship->Owner, "Public") )
    {
      PagerPrintf( data->ch, "%ld to rent.\r\n", GetRentalPrice(ship));
    }
  else if ( StrCmp(ship->Owner, "") )
    PagerPrintf( data->ch, "%s", "\r\n" );
  else
    PagerPrintf( data->ch, "%ld to buy.\r\n", GetShipValue(ship) );

  data->count++;
  return true;
}
