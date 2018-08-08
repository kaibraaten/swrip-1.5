#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

static bool ShowShipTerse(Ship *ship, void *userData);
static bool ShowShipVerbose(Ship *ship, void *userData);

struct UserData
{
  Character *ch;
  bool unowned;
  bool mobship;
  bool checkowner;
  int type;
  int count;
  const char *argument;
};

void do_allships( Character *ch, char *argument )
{
  struct UserData data;
  data.ch = ch;
  data.unowned = false;
  data.mobship = false;
  data.checkowner = false;
  data.type = -1;
  data.count = 0;
  data.argument = argument;
 
  if ( !StrCmp( argument, "unowned" ) )
    {
      data.unowned = true;
    }
  else if ( !StrCmp( argument, "imperial" ) )
    {
      data.type = SHIP_IMPERIAL;
    }
  else if ( !StrCmp( argument, "rebel" ) )
    {
      data.type = SHIP_REBEL;
    }
  else if ( !StrCmp( argument, "civilian" ) )
    {
      data.type = SHIP_CIVILIAN;
    }
  else if ( !StrCmp( argument, "mob" ) )
    {
      data.mobship = true;
    }
  else if ( IsNullOrEmpty( argument ) )
    {
      ;
    }
  else
    {
      data.checkowner = true;
    }
  
  ch->Echo( "&Y\r\nThe following ships are currently formed:\r\n" );
  ch->Echo( "\r\n&WShip                               Owner&d\r\n" );

  if ( IsImmortal( ch ) && !data.unowned && !data.checkowner && data.type < 0)
    {
      ForEachShip(ShowShipTerse, ch);
    }
  
  if( !data.mobship )
    {
      ForEachShip(ShowShipVerbose, &data);
    }

  if ( data.count == 0 )
    {
      ch->Echo( "There are no ships currently formed.\r\n" );
      return;
    }
}

static bool ShowShipVerbose(Ship *ship, void *userData)
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  int shipType = ship->Type;
  struct UserData *data = (struct UserData*)userData;

  if ( ship->Class > SHIP_PLATFORM )
    {
      return true;
    }
	
  if( data->unowned && !IsNullOrEmpty( ship->Owner ) )
    {
      return true;
    }
	
  if( data->checkowner && StrCmp(ship->Owner, data->argument) )
    {
      return true;
    }
	
  if( data->type >= SHIP_CIVILIAN && shipType != data->type )
    {
      return true;
    }
	
  if (ship->Type == MOB_SHIP)
    {
      return true;
    }
  else if (ship->Type == SHIP_REBEL)
    {
      SetCharacterColor( AT_BLOOD, data->ch );
    }
  else if (ship->Type == SHIP_IMPERIAL)
    {
      SetCharacterColor( AT_DGREEN, data->ch );
    }
  else
    {
      SetCharacterColor( AT_BLUE, data->ch );
    }
	
  sprintf( buf, "%-10s(%-10s)", ship->Name, ship->PersonalName );
  data->ch->Echo( "&w%-35s %-15s\r\n", buf, ship->Owner );

  if (ship->Type == MOB_SHIP || ship->Class == SHIP_PLATFORM )
    {
      data->ch->Echo("\r\n");
      return true;
    }

  if ( !StrCmp(ship->Owner, "Public") )
    {
      data->ch->Echo( "%ld to rent.\r\n", GetRentalPrice(ship));
    }
  else if ( !IsNullOrEmpty( ship->Owner ) )
    {
      data->ch->Echo( "\r\n" );
    }
  else
    {
      data->ch->Echo( "&W%-10s%ld to buy.&R&w\r\n", "", GetShipValue(ship) );
    }

  data->count++;
  return true;
}

static bool ShowShipTerse(Ship *ship, void *userData)
{
  Character *ch = (Character*) userData;
  char buf[MAX_STRING_LENGTH];

  if (ship->Type == MOB_SHIP && ship->Class != SHIP_DEBRIS )
    {
      sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
      ch->Echo( "&w%-35s %-10s\r\n", buf, ship->Owner );
    }

  return true;
}

