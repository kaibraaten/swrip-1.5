#include <string.h>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_request(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance = 0;
  Ship *ship = NULL;
  Ship *eShip = NULL;

  strcpy( arg, argument );

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!");
      return;
    }

  if ( !ship->Spaceobject )
    {
      ch->Echo("&RYou can't do that until you've finished launching!\r\n");
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("&RRequest the opening of the baydoors of what ship?\r\n");
      return;
    }

  eShip = GetShipInRange(arg,ship);

  if ( eShip == NULL )
    {
      ch->Echo("&RThat ship isn't here!\r\n");
      return;
    }

  if ( eShip == ship )
    {
      ch->Echo("&RIf you have bay doors, why not open them yourself?\r\n");
      return;
    }

  if ( eShip->Rooms.Hangar == INVALID_VNUM )
    {
      ch->Echo("&RThat ship.hppas no hangar!");
      return;
    }

  if ( !IsShipAutoflying(eShip) )
    {
      ch->Echo("&RThe other ship needs to have its autopilot turned on.\r\n");
      return;
    }

  if( GetShipDistanceToShip(eShip, ship) > 100*((ship->Instruments.Comm)+(eShip->Instruments.Comm)+20))
    {
      ch->Echo("&RThat ship is out of the range of your comm system.\r\n&w");
      return;
    }

  if( GetShipDistanceToShip(eShip, ship) > 100*(ship->Instruments.Sensor+10)*((eShip->Class)+1))
    {
      ch->Echo("&RThat ship is too far away to remotely open bay doors.\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->Learned[gsn_fake_signal]);
  if ( (eShip->Class == SHIP_PLATFORM ? 1 : (GetRandomPercent() >= the_chance)) && !CheckPilot(ch,eShip) )
    {
      ch->Echo("&RHey! That's not your ship!");
      return;
    }

  if ( eShip->BayOpen == true )
    {
      ch->Echo("&RThat ship's bay doors are already open!\r\n");
      return;
    }
  if ( the_chance && !CheckPilot(ch, eShip) )
    LearnFromSuccess(ch, gsn_fake_signal);

  ch->Echo("&RYou open the bay doors of the remote ship.");
  Act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
  eShip->BayOpen = true;
  sprintf( buf ,"%s's bay doors open." , eShip->Name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}

