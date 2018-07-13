#include "character.h"
#include "ship.h"
#include "mud.h"
#include "clan.h"

struct UserData
{
  const Character *ch;
  int count;
};

static bool ShowIfPilotable(Ship *ship, void *userData);
static bool ShowIfInRoom(Ship *ship, void *userData);

void do_speeders( Character *ch, char *argument )
{
  struct UserData data;

  data.ch = ch;
  data.count = 0;

  if ( !IsNpc(ch) )
    {
      SendToPager( "&YThe following are owned by you or by your organization:\r\n", ch );
      SendToPager( "\r\n&WVehicle                            Owner\r\n",ch);

      ForEachShip(ShowIfPilotable, &data);

      if ( data.count == 0 )
        {
          SendToPager( "There are no land or air vehicles owned by you.\r\n", ch );
        }
    }

  SendToPager( "&Y\r\nThe following vehicles are parked here:\r\n", ch );
  SendToPager( "\r\n&WVehicle                            Owner          Cost/Rent\r\n", ch );

  data.count = 0;
  ForEachShip(ShowIfInRoom, &data);

  if ( data.count == 0 )
    {
      SendToPager( "There are no sea, air or land vehicles here.\r\n", ch );
    }
}

static bool ShowIfPilotable(Ship *ship, void *userData)
{
  struct UserData *data = (struct UserData*) userData;
  const Character *ch = data->ch;
  char buf[MAX_STRING_LENGTH];

  if ( StrCmp(ship->Owner, ch->Name) )
    {
      if ( !IsClanned( ch )
           || StrCmp(ship->Owner, ch->PCData->ClanInfo.Clan->Name)
           || ship->Class <= SHIP_PLATFORM )
        {
          return true;
        }
    }

  if ( ship->Location != ch->InRoom->Vnum || ship->Class <= SHIP_PLATFORM)
    {
      return true;
    }

  if (ship->Type == MOB_SHIP)
    {
      return true;
    }
  else if (ship->Type == SHIP_REBEL)
    {
      SetPagerColor( AT_BLOOD, ch );
    }
  else if (ship->Type == SHIP_IMPERIAL)
    {
      SetPagerColor( AT_DGREEN, ch );
    }
  else
    {
      SetPagerColor( AT_BLUE, ch );
    }

  sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
  PagerPrintf( ch, "%-35s%-15s ", buf, ship->Owner );

  data->count++;
  return true;
}

static bool ShowIfInRoom(Ship *ship, void *userData)
{
  struct UserData *data = (struct UserData*) userData;
  const Character *ch = data->ch;
  char buf[MAX_STRING_LENGTH];

  if( ship->Location != ch->InRoom->Vnum || ship->Class <= SHIP_PLATFORM)
    return true;

  if (ship->Type == MOB_SHIP)
    return true;
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
      PagerPrintf( ch, "%ld to rent.\r\n", GetRentalPrice(ship));
    }
  else if ( StrCmp(ship->Owner, "") )
    PagerPrintf( ch, "%s", "\r\n" );
  else
    PagerPrintf( ch, "%ld to buy.\r\n", GetShipValue(ship) );

  data->count++;
  return true;
}
