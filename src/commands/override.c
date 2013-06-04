#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_override(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *ship;
  SHIP_DATA *eShip = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      send_to_char("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&ROverride the controls of what ship?\r\n", ch);
      return;
    }

  eShip = get_ship_here(arg,ship);

  if ( eShip == NULL )
    {
      send_to_char("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      send_to_char("&RYou are in the cockpit, just hit the controls!\r\n", ch);
      return;
    }

  if( ship_distance_to_ship(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if ( !check_pilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( !str_cmp( arg2, "shields" ) )
    {
      if( eShip->shield == 0 )
        {
          eShip->autorecharge=TRUE;
          send_to_char( "&GShields on. Confirmed.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->shield = 0;
          eShip->autorecharge=FALSE;
          send_to_char("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !str_cmp( arg2, "closebay" ) )
    {
      eShip->bayopen=FALSE;
      send_to_char( "&GBays Close. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "stop" ) )
    {
      eShip->currspeed = 0;
      send_to_char( "&GBraking Thrusters. Confirmed.\r\n", ch);
      echo_to_cockpit( AT_GREY , eShip , "Braking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->name );
      echo_to_nearby_ships( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "autopilot" ) )
    {
      if ( ship->autopilot )
        {
          eShip->autopilot=FALSE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->autopilot )
        {
          eShip->autopilot=TRUE;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !str_cmp( arg2, "openbay" ) )
    {
      send_to_char("&RYou open the bay doors of the remote ship.",ch);
      act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->bayopen = TRUE;
      sprintf( buf ,"%s's bay doors open." , eShip->name );
      echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
      return;
    }

  send_to_char("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  send_to_char("         openbay   closebay  stop  \r\n", ch);
}
