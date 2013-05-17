#include "mud.h"

void do_speeders( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int count;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_NPC(ch) )
    {
      count = 0;
      send_to_pager( "&YThe following are owned by you or by your organization:\r\n", ch );
      send_to_pager( "\r\n&WVehicle                            Owner\r\n",ch);

      for ( ship = first_ship; ship; ship = ship->next )
        {
          if ( str_cmp(ship->owner, ch->name) )
            {
              if ( !ch->pcdata || !ch->pcdata->clan || str_cmp(ship->owner,ch->pcdata->clan->name) || ship->sclass <= SHIP_PLATFORM )
                continue;
            }

          if ( ship->location != ch->in_room->vnum || ship->sclass <= SHIP_PLATFORM)
            continue;

          if (ship->type == MOB_SHIP)
	    continue;
          else if (ship->type == SHIP_REBEL)
            set_pager_color( AT_BLOOD, ch );
          else if (ship->type == SHIP_IMPERIAL)
            set_pager_color( AT_DGREEN, ch );
          else
            set_pager_color( AT_BLUE, ch );

          sprintf( buf, "%s(%s)", ship->name, ship->personalname );
          pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

          count++;
        }

      if ( !count )
        {
          send_to_pager( "There are no land or air vehicles owned by you.\r\n", ch );
        }
    }

  count =0;
  send_to_pager( "&Y\r\nThe following vehicles are parked here:\r\n", ch );
  send_to_pager( "\r\n&WVehicle                            Owner          Cost/Rent\r\n", ch );

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if( ship->location != ch->in_room->vnum || ship->sclass <= SHIP_PLATFORM)
        continue;

      if (ship->type == MOB_SHIP)
        continue;
      else if (ship->type == SHIP_REBEL)
        set_pager_color( AT_BLOOD, ch );
      else if (ship->type == SHIP_IMPERIAL)
        set_pager_color( AT_DGREEN, ch );
      else
        set_pager_color( AT_BLUE, ch );

      sprintf( buf, "%s(%s)", ship->name, ship->personalname );
      pager_printf( ch, "%-35s%-15s ", buf, ship->owner );

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
      send_to_pager( "There are no sea, air or land vehicles here.\r\n", ch );
    }
}
