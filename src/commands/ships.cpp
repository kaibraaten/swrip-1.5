#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

struct UserData
{
  const Character *ch;
  int count;
};

static bool ShowIfPilotable(Ship *ship, void *userData);
static bool ShowIfInRoom(Ship *ship, void *userData);

void do_ships( Character *ch, char *argument )
{
  struct UserData data;

  data.ch = ch;
  data.count = 0;

  if ( !IsNpc(ch) )
    {
      SendToPager( "&YThe following ships you have pilot access to:\r\n", ch );
      SendToPager( "\r\n&WShip                                                   Owner\r\n",ch);

      ForEachShip(ShowIfPilotable, &data);

      if ( data.count == 0 )
        {
          SendToPager( "There are no ships owned by you.\r\n", ch );
        }
    }

  SendToPager( "&Y\r\nThe following ships are docked here:\r\n", ch );
  SendToPager( "\r\n&WShip                               Owner          Cost/Rent\r\n", ch );

  data.count = 0;
  ForEachShip(ShowIfInRoom, &data);

  if ( data.count == 0 )
    {
      SendToPager( "There are no ships docked here.\r\n", ch );
    }
}

static bool ShowIfInRoom(Ship *ship, void *userData)
{
  struct UserData *data = (struct UserData*) userData;
  const Character *ch = data->ch;
  char buf[MAX_STRING_LENGTH];

  if ( ship->Location != ch->InRoom->Vnum || ship->Class > SHIP_PLATFORM)
    return true;

  if (ship->Type == MOB_SHIP)
    return true;
  else if (ship->Type == SHIP_REBEL)
    SetPagerColor( AT_BLOOD, ch );
  else if (ship->Type == SHIP_IMPERIAL)
    SetPagerColor( AT_DGREEN, ch );
  else
    SetPagerColor( AT_BLUE, ch );

  sprintf( buf, "%s (%s)", ship->Name, ship->PersonalName );
  PagerPrintf( ch, "%-35s %-15s", buf, ship->Owner );

  if (ship->Type == MOB_SHIP || ship->Class == SHIP_PLATFORM )
    {
      PagerPrintf( ch, "\r\n");
      return true;
    }

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

static bool ShowIfPilotable(Ship *ship, void *userData)
{
  struct UserData *data = (struct UserData*) userData;
  const Character *ch = data->ch;

  bool owned = false, set = false;
  char pilottype[MAX_STRING_LENGTH] = { '\0' };
  char pilottype2[MAX_STRING_LENGTH] = { '\0' };
  char buf[MAX_STRING_LENGTH];

  if ( StrCmp(ship->Owner, ch->Name) )
    {
      if ( !CheckPilot( ch, ship )
           || !StrCmp(ship->Owner, "public")
           || !StrCmp(ship->Owner, "trainer") )
        return true;
    }

  if( ship->Class > SHIP_PLATFORM )
    return true;

  if (ship->Type == MOB_SHIP)
    return true;
  else if (ship->Type == SHIP_REBEL)
    SetPagerColor( AT_BLOOD, ch );
  else if (ship->Type == SHIP_IMPERIAL)
    SetPagerColor( AT_DGREEN, ch );
  else
    SetPagerColor( AT_BLUE, ch );

  if( !StrCmp(ship->Owner, ch->Name ) )
    {
      strcpy( pilottype2, "Owner" );
      owned = true;
      set = true;
    }

  if( !set && !StrCmp( ship->Pilot, ch->Name ) )
    {
      strcpy( pilottype2, "Pilot" );
      set = true;
    }

  if( !set && !StrCmp( ship->CoPilot, ch->Name ) )
    {
      strcpy( pilottype2, "Co-Pilot" );
      set = true;
    }

  if( !set )
    {
      strcpy( pilottype2, "Clan-Pilot" );
      set = true;
    }

  if( !owned )
    sprintf( pilottype, "(%s) - %s", pilottype2, ship->Owner );
  else
    sprintf( pilottype, "(%s)", pilottype2 );

  sprintf( buf, "%s (%s)", ship->Name, ship->PersonalName );

  if  ( ship->InRoom )
    PagerPrintf( ch, "%-35s (%s) \n&R&W- %-24s&R&w \r\n",
                 buf, ship->InRoom->Name, pilottype );
  else
    PagerPrintf( ch, "%-35s (%.0f %.0f %.0f) \r\n&R&W- %-35s&R&w\r\n",
                 buf, ship->Position.x, ship->Position.y, ship->Position.z, pilottype );

  data->count++;
  return true;
}
