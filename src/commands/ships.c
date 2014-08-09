#include <string.h>
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_ships( Character *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  char pilottype[MAX_STRING_LENGTH];
  char pilottype2[MAX_STRING_LENGTH];
  int count = 0;
  bool owned = false, set = false;

  if ( !is_npc(ch) )
    {
      count = 0;
      send_to_pager( "&YThe following ships you have pilot access to:\r\n", ch );
      send_to_pager( "\r\n&WShip                                                   Owner\r\n",ch);
      for ( ship = first_ship; ship; ship = ship->next )
        {
          owned = false, set = false;
          if ( str_cmp(ship->owner, ch->name) )
            {
              if ( !check_pilot( ch, ship ) || !str_cmp(ship->owner, "public") || !str_cmp(ship->owner, "trainer") )
                continue;
            }

          if( ship->sclass > SHIP_PLATFORM )
	    continue;

          if (ship->type == MOB_SHIP)
            continue;
          else if (ship->type == SHIP_REBEL)
            set_pager_color( AT_BLOOD, ch );
          else if (ship->type == SHIP_IMPERIAL)
            set_pager_color( AT_DGREEN, ch );
          else
            set_pager_color( AT_BLUE, ch );

          if( !str_cmp(ship->owner, ch->name ) )
            {
              strcpy( pilottype2, "Owner" );
              owned = true;
              set = true;
            }

          if( !set && !str_cmp( ship->pilot, ch->name ) )
            {
              strcpy( pilottype2, "Pilot" );
              set = true;
            }

          if( !set && !str_cmp( ship->pilot, ch->name ) )
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

          sprintf( buf, "%s (%s)", ship->name, ship->personalname );

          if  ( ship->in_room )
            pager_printf( ch, "%-35s (%s) \n&R&W- %-24s&R&w \r\n", buf, ship->in_room->name, pilottype );
	  else
            pager_printf( ch, "%-35s (%.0f %.0f %.0f) \r\n&R&W- %-35s&R&w\r\n", buf, ship->pos.x, ship->pos.y, ship->pos.z, pilottype );

          count++;
        }

      if ( !count )
        {
          send_to_pager( "There are no ships owned by you.\r\n", ch );
        }
    }

  count = 0;
  send_to_pager( "&Y\r\nThe following ships are docked here:\r\n", ch );
  send_to_pager( "\r\n&WShip                               Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( ship->location != ch->in_room->vnum || ship->sclass > SHIP_PLATFORM)
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s (%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s %-15s", buf, ship->owner );

      if (ship->type == MOB_SHIP || ship->sclass == SHIP_PLATFORM )
        {
          pager_printf( ch, "\r\n");
          continue;
        }

      if ( !str_cmp(ship->owner, "Public") )
        {
          pager_printf( ch, "%ld to rent.\r\n", get_ship_value(ship)/100 );
        }
      else if ( str_cmp(ship->owner, "") )
        pager_printf( ch, "%s", "\r\n" );
      else
        pager_printf( ch, "%ld to buy.\r\n", get_ship_value(ship) );

      count++;
    }

  if ( !count )
    {
      send_to_pager( "There are no ships docked here.\r\n", ch );
    }
}
