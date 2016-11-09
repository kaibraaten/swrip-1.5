#include <string.h>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

void do_override(Character *ch, std::string argument)
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

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->Spaceobject )
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

  if( GetShipDistanceToShip(eShip, ship) > 100*((ship->Instruments.Comm)+(eShip->Instruments.Comm)+20))
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
      if( eShip->Defenses.Shield.Current == 0 )
        {
          eShip->AutoRecharge = true;
          SendToCharacter( "&GShields on. Confirmed.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Shields ON. Autorecharge ON.");
          return;
        }
      else
        {
          eShip->Defenses.Shield.Current = 0;
          eShip->AutoRecharge = false;
          SendToCharacter("Shields down. Confirmed", ch);
          return;
        }
    }
  if ( !StrCmp( arg2, "closebay" ) )
    {
      eShip->BayOpen=false;
      SendToCharacter( "&GBays Close. Confirmed.\r\n", ch);
      EchoToCockpit( AT_YELLOW , eShip , "Bays Open");
      sprintf( buf ,"%s's bay doors close." , eShip->Name );
      EchoToNearbyShips( AT_YELLOW, eShip, buf , NULL );
      return;
    }

  if ( !StrCmp( arg2, "stop" ) )
    {
      eShip->Thrusters.Speed.Current = 0;
      SendToCharacter( "&GBreaking Thrusters. Confirmed.\r\n", ch);
      EchoToCockpit( AT_GREY , eShip , "Breaking thrusters fire and the ship stops");
      sprintf( buf ,"%s decelerates." , eShip->Name );
      EchoToNearbyShips( AT_GREY, eShip, buf , NULL );
      return;
    }

  if ( !StrCmp( arg2, "autopilot" ) )
    {
      if ( ship->Autopilot )
        {
          eShip->Autopilot=false;
          SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot OFF.");
          return;
        }
      else if ( !ship->Autopilot )
        {
          eShip->Autopilot=true;
          SendToCharacter( "&GYou toggle the autopilot.\r\n", ch);
          EchoToCockpit( AT_YELLOW , eShip , "Autopilot ON.");
          return;
        }
    }

  if ( !StrCmp( arg2, "openbay" ) )
    {
      SendToCharacter("&RYou open the bay doors of the remote ship.",ch);
      Act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
      eShip->BayOpen = true;
      sprintf( buf ,"%s's bay doors open." , eShip->Name );
      EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
      return;
    }

  SendToCharacter("Choices: shields - Toggle shields   autopilot - Toggle autopilot\r\n", ch);
  SendToCharacter("         openbay   closebay  stop  \r\n", ch);
}
