#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

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

  ch->Echo( "&Y\r\nThe following sea/land/air vehicles are currently formed:\r\n" );

  ch->Echo( "\r\n&WVehicle                            Owner\r\n" );

  ForEachShip(ShowShip, &data);

  if ( data.count == 0 )
    {
      ch->Echo( "There are none currently formed.\r\n" );
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
    SetCharacterColor( AT_BLOOD, data->ch );
  else if (ship->Type == SHIP_IMPERIAL)
    SetCharacterColor( AT_DGREEN, data->ch );
  else
    SetCharacterColor( AT_BLUE, data->ch );

  sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
  data->ch->Echo( "%-35s%-15s ", buf, ship->Owner );

  if ( !StrCmp(ship->Owner, "Public") )
    {
      data->ch->Echo( "%ld to rent.\r\n", GetRentalPrice(ship));
    }
  else if ( StrCmp(ship->Owner, "") )
    {
      data->ch->Echo( "\r\n" );
    }
  else
    {
      data->ch->Echo( "%ld to buy.\r\n", GetShipValue(ship) );
    }
  
  data->count++;
  return true;
}

