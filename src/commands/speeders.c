#include "character.h"
#include "ship.h"
#include "mud.h"
#include "clan.h"

void do_speeders( Character *ch, char *argument )
{
  Ship *ship;
  int count;
  char buf[MAX_STRING_LENGTH];

  if ( !IsNpc(ch) )
    {
      count = 0;
      SendToPager( "&YThe following are owned by you or by your organization:\r\n", ch );
      SendToPager( "\r\n&WVehicle                            Owner\r\n",ch);

      for ( ship = first_ship; ship; ship = ship->Next )
        {
          if ( StrCmp(ship->Owner, ch->Name) )
            {
              if ( !IsClanned( ch )
		   || StrCmp(ship->Owner, ch->PCData->ClanInfo.Clan->Name)
		   || ship->ShipClass <= SHIP_PLATFORM )
                continue;
            }

          if ( ship->Location != ch->InRoom->Vnum || ship->ShipClass <= SHIP_PLATFORM)
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

          count++;
        }

      if ( !count )
        {
          SendToPager( "There are no land or air vehicles owned by you.\r\n", ch );
        }
    }

  count =0;
  SendToPager( "&Y\r\nThe following vehicles are parked here:\r\n", ch );
  SendToPager( "\r\n&WVehicle                            Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->Next )
    {
      if( ship->Location != ch->InRoom->Vnum || ship->ShipClass <= SHIP_PLATFORM)
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
      SendToPager( "There are no sea, air or land vehicles here.\r\n", ch );
    }
}
