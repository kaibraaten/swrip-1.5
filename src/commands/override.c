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
  Ship *ship;
  Ship *eShip = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
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

  if ( IsShipInHyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char("&ROverride the controls of what ship?\r\n", ch);
      return;
    }

  eShip = GetShipInRange(arg,ship);

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

  if( GetShipDistanceToShip(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if ( !CheckPilot(ch,eShip) )
    {
      send_to_char("&RHey! That's not your ship!",ch);
      return;
    }

  if ( !str_cmp( arg2, "shields" ) )
    {
      if( eShip->shield == 0 )
        {
          eShip->autorecharge=true;
          send_to_char( "&GShields on. Confirmed.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->shield = 0;
          eShip->autorecharge=false;
          send_to_char("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !str_cmp( arg2, "closebay" ) )
    {
      eShip->bayopen=false;
      send_to_char( "&GBays Close. Confirmed.\r\n", ch);
      EchoToCockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->name );
      EchoToNearbyShips( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "stop" ) )
    {
      eShip->currspeed = 0;
      send_to_char( "&GBraking Thrusters. Confirmed.\r\n", ch);
      EchoToCockpit( AT_GREY , eShip , "Braking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->name );
      EchoToNearbyShips( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !str_cmp( arg2, "autopilot" ) )
    {
      if ( ship->autopilot )
        {
          eShip->autopilot=false;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->autopilot )
        {
          eShip->autopilot=true;
          send_to_char( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !str_cmp( arg2, "openbay" ) )
    {
      send_to_char("&RYou open the bay doors of the remote ship.",ch);
      act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->bayopen = true;
      sprintf( buf ,"%s's bay doors open." , eShip->name );
      EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
      return;
    }

  send_to_char("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  send_to_char("         openbay   closebay  stop  \r\n", ch);
}
