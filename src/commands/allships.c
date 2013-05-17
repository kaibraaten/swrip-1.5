#include "mud.h"

void do_allships( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  int count = 0;
  bool unowned = FALSE, mobship = FALSE, checkowner = FALSE;
  int type = -1;

  if ( !str_cmp( argument, "unowned" ) )
    unowned = TRUE;
  else if ( !str_cmp( argument, "imperial" ) )
    type = SHIP_IMPERIAL;
  else if ( !str_cmp( argument, "rebel" ) )
    type = SHIP_REBEL;
  else if ( !str_cmp( argument, "civilian" ) )
    type = SHIP_CIVILIAN;
  else if ( !str_cmp( argument, "mob" ) )
    mobship = TRUE;
  else if ( !argument || argument[0] == '\0' || !str_cmp( argument, "" ) )
    ;
  else
    checkowner = TRUE;

  count = 0;
  send_to_pager( "&Y\r\nThe following ships are currently formed:\r\n", ch );

  send_to_pager( "\r\n&WShip                               Owner\r\n", ch );

  if ( IS_IMMORTAL( ch ) && !unowned && !checkowner && type < 0)
    for ( ship = first_ship; ship; ship = ship->next )
      if (ship->type == MOB_SHIP && ship->sclass != SHIP_DEBRIS )
        {
          sprintf( buf, "%s(%s)", ship->name, ship->personalname );
          pager_printf( ch, "&w%-35s %-10s\r\n", buf, ship->owner );
          pager_printf( ch, "&w%-35s %-10s\r\n", buf, ship->owner );
        }

  if( !mobship )
    for ( ship = first_ship; ship; ship = ship->next )
      {
        if ( ship->sclass > SHIP_PLATFORM )
          continue;

        if( unowned && str_cmp(ship->owner, "") )
          continue;
        if( checkowner && str_cmp(ship->owner, argument) )
          continue;

        if( type >= 0 && ship->type != type )
          continue;

        if (ship->type == MOB_SHIP)
          continue;
        else if (ship->type == SHIP_REBEL)
          set_pager_color( AT_BLOOD, ch );
        else if (ship->type == SHIP_IMPERIAL)
          set_pager_color( AT_DGREEN, ch );
        else
          set_pager_color( AT_BLUE, ch );
        sprintf( buf, "%-10s(%-10s)", ship->name, ship->personalname );
        pager_printf( ch, "&w%-35s %-15s\r\n", buf, ship->owner );
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
          pager_printf( ch, "&W%-10s%ld to buy.&R&w\r\n", "", get_ship_value(ship) );

        count++;
      }

  if ( !count )
    {
      send_to_pager( "There are no ships currently formed.\r\n", ch );
      return;
    }
}
