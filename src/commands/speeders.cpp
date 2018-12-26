#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

struct UserData
{
  const Character *ch;
  int count;
};

static bool ShowIfPilotable(std::shared_ptr<Ship> ship, void *userData);
static bool ShowIfInRoom(std::shared_ptr<Ship> ship, void *userData);

void do_speeders( Character *ch, std::string argument )
{
  struct UserData data;

  data.ch = ch;
  data.count = 0;

  if ( !IsNpc(ch) )
    {
      ch->Echo("&YThe following are owned by you or by your organization:\r\n");
      ch->Echo("\r\n&WVehicle                            Owner\r\n");

      ForEachShip(ShowIfPilotable, &data);

      if ( data.count == 0 )
        {
          ch->Echo("There are no land or air vehicles owned by you.\r\n");
        }
    }

  ch->Echo("&Y\r\nThe following vehicles are parked here:\r\n");
  ch->Echo("\r\n&WVehicle                            Owner          Cost/Rent\r\n");

  data.count = 0;
  ForEachShip(ShowIfInRoom, &data);

  if ( data.count == 0 )
    {
      ch->Echo("There are no sea, air or land vehicles here.\r\n");
    }
}

static bool ShowIfPilotable(std::shared_ptr<Ship> ship, void *userData)
{
  UserData *data = (UserData*) userData;
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
      SetCharacterColor( AT_BLOOD, ch );
    }
  else if (ship->Type == SHIP_IMPERIAL)
    {
      SetCharacterColor( AT_DGREEN, ch );
    }
  else
    {
      SetCharacterColor( AT_BLUE, ch );
    }

  sprintf( buf, "%s(%s)", ship->Name.c_str(), ship->PersonalName.c_str() );
  ch->Echo("%-35s%-15s ", buf, ship->Owner.c_str() );

  data->count++;
  return true;
}

static bool ShowIfInRoom(std::shared_ptr<Ship> ship, void *userData)
{
  struct UserData *data = (struct UserData*) userData;
  const Character *ch = data->ch;
  char buf[MAX_STRING_LENGTH];

  if( ship->Location != ch->InRoom->Vnum || ship->Class <= SHIP_PLATFORM)
    return true;

  if (ship->Type == MOB_SHIP)
    return true;
  else if (ship->Type == SHIP_REBEL)
    SetCharacterColor( AT_BLOOD, ch );
  else if (ship->Type == SHIP_IMPERIAL)
    SetCharacterColor( AT_DGREEN, ch );
  else
    SetCharacterColor( AT_BLUE, ch );

  sprintf( buf, "%s(%s)", ship->Name.c_str(), ship->PersonalName.c_str() );
  ch->Echo("%-35s%-15s ", buf, ship->Owner.c_str() );

  if ( !StrCmp(ship->Owner, "Public") )
    {
      ch->Echo("%ld to rent.\r\n", GetRentalPrice(ship));
    }
  else if ( ship->Owner.empty() )
    ch->Echo("%s", "\r\n" );
  else
    ch->Echo("%ld to buy.\r\n", GetShipValue(ship) );

  data->count++;
  return true;
}
