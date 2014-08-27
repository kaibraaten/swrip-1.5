#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_request(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance = 0;
  Ship *ship;
  Ship *eShip = NULL;

  strcpy( arg, argument );

  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
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

  if ( arg[0] == '\0' )
    {
      SendToCharacter("&RRequest the opening of the baydoors of what ship?\r\n",ch);
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
      SendToCharacter("&RIf you have bay doors, why not open them yourself?\r\n",ch);
      return;
    }

  if ( eShip->room.hanger == 0 )
    {
      SendToCharacter("&RThat ship has no hanger!",ch);
      return;
    }

  if ( !IsShipAutoflying(eShip) )
    {
      SendToCharacter("&RThe other ship needs to have its autopilot turned on.\r\n",ch);
      return;
    }

  if( GetShipDistanceToShip(eShip, ship) > 100*((ship->comm)+(eShip->comm)+20))
    {
      SendToCharacter("&RThat ship is out of the range of your comm system.\r\n&w", ch);
      return;
    }

  if( GetShipDistanceToShip(eShip, ship) > 100*(ship->sensor+10)*((eShip->sclass)+1))
    {
      SendToCharacter("&RThat ship is too far away to remotely open bay doors.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_fake_signal]);
  if ( (eShip->sclass == SHIP_PLATFORM ? 1 : (GetRandomPercent() >= the_chance)) && !CheckPilot(ch,eShip) )
    {
      SendToCharacter("&RHey! That's not your ship!",ch);
      return;
    }

  if ( eShip->bayopen == true )
    {
      SendToCharacter("&RThat ship's bay doors are already open!\r\n",ch);
      return;
    }
  if ( the_chance && !CheckPilot(ch, eShip) )
    LearnFromSuccess(ch, gsn_fake_signal);

  SendToCharacter("&RYou open the bay doors of the remote ship.",ch);
  Act(AT_PLAIN,"$n flips a switch on the control panel.",ch,NULL,argument,TO_ROOM);
  eShip->bayopen = true;
  sprintf( buf ,"%s's bay doors open." , eShip->name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
}
