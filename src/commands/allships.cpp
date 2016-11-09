#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

void do_allships( Character *ch, std::string argument )
{
  Ship *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  int count = 0;
  bool unowned = false, mobship = false, checkowner = false;
  int type = -1;

  if ( !StrCmp( argument, "unowned" ) )
    {
      unowned = true;
    }
  else if ( !StrCmp( argument, "imperial" ) )
    {
      type = SHIP_IMPERIAL;
    }
  else if ( !StrCmp( argument, "rebel" ) )
    {
      type = SHIP_REBEL;
    }
  else if ( !StrCmp( argument, "civilian" ) )
    {
      type = SHIP_CIVILIAN;
    }
  else if ( !StrCmp( argument, "mob" ) )
    {
      mobship = true;
    }
  else if ( IsNullOrEmpty( argument ) )
    {
      ;
    }
  else
    {
      checkowner = true;
    }
  
  SendToPager( "&Y\r\nThe following ships are currently formed:\r\n", ch );
  SendToPager( "\r\n&WShip                               Owner&d\r\n", ch );

  if ( IsImmortal( ch ) && !unowned && !checkowner && type < 0)
    {
      for ( ship = FirstShip; ship; ship = ship->Next )
	{
	  if (ship->Type == MOB_SHIP && ship->Class != SHIP_DEBRIS )
	    {
	      sprintf( buf, "%s(%s)", ship->Name, ship->PersonalName );
	      PagerPrintf( ch, "&w%-35s %-10s\r\n", buf, ship->Owner );
	    }
	}
    }
  
  if( !mobship )
    {
      for ( ship = FirstShip; ship; ship = ship->Next )
	{
	  int shipType = ship->Type;
	  
	  if ( ship->Class > SHIP_PLATFORM )
	    {
	      continue;
	    }
	
	  if( unowned && !IsNullOrEmpty( ship->Owner ) )
	    {
	      continue;
	    }
	
	  if( checkowner && StrCmp(ship->Owner, argument) )
	    {
	      continue;
	    }
	
	  if( type >= SHIP_CIVILIAN && shipType != type )
	    {
	      continue;
	    }
	
	  if (ship->Type == MOB_SHIP)
	    {
	      continue;
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
	
	  sprintf( buf, "%-10s(%-10s)", ship->Name, ship->PersonalName );
	  PagerPrintf( ch, "&w%-35s %-15s\r\n", buf, ship->Owner );

	  if (ship->Type == MOB_SHIP || ship->Class == SHIP_PLATFORM )
	    {
	      PagerPrintf( ch, "\r\n");
	      continue;
	    }

	  if ( !StrCmp(ship->Owner, "Public") )
	    {
	      PagerPrintf( ch, "%ld to rent.\r\n", GetShipValue(ship)/100 );
	    }
	  else if ( !IsNullOrEmpty( ship->Owner ) )
	    {
	      PagerPrintf( ch, "%s", "\r\n" );
	    }
	  else
	    {
	      PagerPrintf( ch, "&W%-10s%ld to buy.&R&w\r\n", "", GetShipValue(ship) );
	    }

	  count++;
	}
    }
  
  if ( !count )
    {
      SendToPager( "There are no ships currently formed.\r\n", ch );
      return;
    }
}
