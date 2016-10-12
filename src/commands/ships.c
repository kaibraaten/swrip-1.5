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
      for ( ship = first_ship; ship; ship = ship->next )
        {
          owned = false, set = false;
          if ( StrCmp(ship->owner, ch->Name) )
            {
              if ( !CheckPilot( ch, ship ) || !StrCmp(ship->owner, "public") || !StrCmp(ship->owner, "trainer") )
                continue;
            }

          if( ship->sclass > SHIP_PLATFORM )
	    continue;

          if (ship->type == MOB_SHIP)
            continue;
          else if (ship->type == SHIP_REBEL)
            SetPagerColor( AT_BLOOD, ch );
          else if (ship->type == SHIP_IMPERIAL)
            SetPagerColor( AT_DGREEN, ch );
          else
            SetPagerColor( AT_BLUE, ch );

          if( !StrCmp(ship->owner, ch->Name ) )
            {
              strcpy( pilottype2, "Owner" );
              owned = true;
              set = true;
            }

          if( !set && !StrCmp( ship->pilot, ch->Name ) )
            {
              strcpy( pilottype2, "Pilot" );
              set = true;
            }

          if( !set && !StrCmp( ship->pilot, ch->Name ) )
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
            sprintf( pilottype, "(%s) - %s", pilottype2, ship->owner );
          else
            sprintf( pilottype, "(%s)", pilottype2 );

          sprintf( buf, "%s (%s)", ship->Name, ship->personalname );

          if  ( ship->InRoom )
            PagerPrintf( ch, "%-35s (%s) \n&R&W- %-24s&R&w \r\n", buf, ship->InRoom->Name, pilottype );
	  else
            PagerPrintf( ch, "%-35s (%.0f %.0f %.0f) \r\n&R&W- %-35s&R&w\r\n", buf, ship->pos.x, ship->pos.y, ship->pos.z, pilottype );

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

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->location != ch->InRoom->Vnum || ship->sclass > SHIP_PLATFORM)
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        SetPagerColor( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        SetPagerColor( AT_DGREEN, ch );
      else
        SetPagerColor( AT_BLUE, ch );

      sprintf( buf, "%s (%s)", ship->Name, ship->personalname );
      PagerPrintf( ch, "%-35s %-15s", buf, ship->owner );

      if (ship->type == MOB_SHIP || ship->sclass == SHIP_PLATFORM )
        {
          PagerPrintf( ch, "\r\n");
          continue;
        }

      if ( !StrCmp(ship->owner, "Public") )
        {
          PagerPrintf( ch, "%ld to rent.\r\n", GetShipValue(ship)/100 );
        }
      else if ( StrCmp(ship->owner, "") )
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
