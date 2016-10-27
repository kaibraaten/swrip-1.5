#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_ships( Character *ch, char *argument )
{
  Ship *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  char pilottype[MAX_STRING_LENGTH];
  char pilottype2[MAX_STRING_LENGTH];
  int count = 0;
  bool owned = false, set = false;

  if ( !IsNpc(ch) )
    {
      count = 0;
      SendToPager( "&YThe following ships you have pilot access to:\r\n", ch );
      SendToPager( "\r\n&WShip                                                   Owner\r\n",ch);
      for ( ship = first_ship; ship; ship = ship->Next )
        {
          owned = false, set = false;
          if ( StrCmp(ship->Owner, ch->Name) )
            {
              if ( !CheckPilot( ch, ship ) || !StrCmp(ship->Owner, "public") || !StrCmp(ship->Owner, "trainer") )
                continue;
            }

          if( ship->Class > SHIP_PLATFORM )
	    continue;

          if (ship->Type == MOB_SHIP)
            continue;
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
            PagerPrintf( ch, "%-35s (%s) \n&R&W- %-24s&R&w \r\n", buf, ship->InRoom->Name, pilottype );
	  else
            PagerPrintf( ch, "%-35s (%.0f %.0f %.0f) \r\n&R&W- %-35s&R&w\r\n", buf, ship->Position.x, ship->Position.y, ship->Position.z, pilottype );

          count++;
        }

      if ( !count )
        {
          SendToPager( "There are no ships owned by you.\r\n", ch );
        }
    }

  count = 0;
  SendToPager( "&Y\r\nThe following ships are docked here:\r\n", ch );
  SendToPager( "\r\n&WShip                               Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if ( ship->Location != ch->InRoom->Vnum || ship->Class > SHIP_PLATFORM)
        continue;

      if (ship->Type == MOB_SHIP)
        continue;
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
          continue;
        }

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
      SendToPager( "There are no ships docked here.\r\n", ch );
    }
}
