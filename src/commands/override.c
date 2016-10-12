#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_override(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Ship *ship;
  Ship *eShip = NULL;

  argument = OneArgument( argument, arg );
  strcpy ( arg2, argument);

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      SendToCharacter("&RYou can't do that until you've finished launching!\r\n",ch);
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("&ROverride the controls of what ship?\r\n", ch);
      return;
    }

  eShip = GetShipInRange(arg,ship);

  if ( eShip == NULL )
    {
      SendToCharacter("&RThat ship isn't here!\r\n",ch);
      return;
    }

  if ( eShip == ship )
    {
      SendToCharacter("&RYou are in the cockpit, just hit the controls!\r\n", ch);
      return;
    }

  if( GetShipDistanceToShip(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      SendToCharacter("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if ( !CheckPilot(ch,eShip) )
    {
      SendToCharacter("&RHey! That's not your ship!",ch);
      return;
    }

  if ( !StrCmp( arg2, "shields" ) )
    {
      if( eShip->shield == 0 )
        {
          eShip->autorecharge=true;
          SendToCharacter( "&GShields on. Confirmed.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->shield = 0;
          eShip->autorecharge=false;
          SendToCharacter("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !StrCmp( arg2, "closebay" ) )
    {
      eShip->bayopen=false;
      SendToCharacter( "&GBays Close. Confirmed.\r\n", ch);
      EchoToCockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->Name );
      EchoToNearbyShips( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !StrCmp( arg2, "stop" ) )
    {
      eShip->currspeed = 0;
      SendToCharacter( "&GBraking Thrusters. Confirmed.\r\n", ch);
      EchoToCockpit( AT_GREY , eShip , "Braking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->Name );
      EchoToNearbyShips( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !StrCmp( arg2, "autopilot" ) )
    {
      if ( ship->autopilot )
        {
          eShip->autopilot=false;
          SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->autopilot )
        {
          eShip->autopilot=true;
          SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !StrCmp( arg2, "openbay" ) )
    {
      SendToCharacter("&RYou open the bay doors of the remote ship.",ch);
      Act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->bayopen = true;
      sprintf( buf ,"%s's bay doors open." , eShip->Name );
      EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
      return;
    }

  SendToCharacter("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  SendToCharacter("         openbay   closebay  stop  \r\n", ch);
}
