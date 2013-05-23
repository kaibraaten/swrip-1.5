#include "character.h"
#include "ships.h"
#include "mud.h"

void do_fuel(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship, *eShip;
  int amount = 0;
  char arg1[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg1 );

  if (  (ship = ship_from_hanger(ch->in_room->vnum))  == NULL )
    {
      if ( (ship = ship_from_entrance(ch->in_room->vnum)) == NULL )
        {
          send_to_char("&RYou must be in the hanger or the entrance of a ship to do that!\r\n",ch);
          return;
        }
    }

  if( arg1[0] == '\0' || !is_number(arg1) )
    {
      send_to_char( "Syntax: Fuel <amount> <ship>", ch);
      return;
    }

  if( argument[0] == '\0' || !str_cmp(argument, "" ))
    {
      if( !ship->docked )
        {
          for( eShip = first_ship; eShip; eShip = eShip->next )
            if( eShip->docked && eShip->docked == ship )
              break;
        }
      else
        eShip = ship->docked;
    }

  if( !eShip || eShip == NULL )
    {
      send_to_char( "Ship not docked. Fuel what ship?", ch );
      return;
    }

  amount = atoi(arg1);

  if( amount >= ship->energy )
    {
      send_to_char( "&RError: Ordered energy over current stock. Sending everything but 1 unit.\r\n", ch );
      amount = ship->energy - 1;
    }

  if( amount + eShip->energy > eShip->maxenergy )
    {
      send_to_char( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = eShip->maxenergy - eShip->energy;
    }

  if( ship->sclass != SHIP_PLATFORM )
    ship->energy -= amount;

  eShip->energy += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", eShip->name, amount );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", ship->energy );
  echo_to_cockpit( AT_YELLOW, ship, buf );
  send_to_char( buf, ch );
}
