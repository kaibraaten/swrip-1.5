#include "character.hpp"
#include "ship.h"
#include "mud.h"

void do_fuel(Character *ch, char *argument )
{
  Ship *ship, *eShip;
  int amount = 0;
  char arg1[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg1 );

  if (  (ship = GetShipFromHangar(ch->InRoom->Vnum))  == NULL )
    {
      if ( (ship = GetShipFromEntrance(ch->InRoom->Vnum)) == NULL )
        {
          SendToCharacter("&RYou must be in the hangar or the entrance of a ship to do that!\r\n",ch);
          return;
        }
    }

  if( IsNullOrEmpty( arg1 ) || !IsNumber(arg1) )
    {
      SendToCharacter( "Syntax: Fuel <amount> <ship>", ch);
      return;
    }

  if( IsNullOrEmpty( argument ) || !StrCmp(argument, "" ))
    {
      if( !ship->Docked )
        {
          for( eShip = FirstShip; eShip; eShip = eShip->Next )
            if( eShip->Docked && eShip->Docked == ship )
              break;
        }
      else
        eShip = ship->Docked;
    }

  if( !eShip || eShip == NULL )
    {
      SendToCharacter( "Ship not docked. Fuel what ship?", ch );
      return;
    }

  amount = atoi(arg1);

  if( amount >= ship->Thrusters.Energy.Current )
    {
      SendToCharacter( "&RError: Ordered energy over current stock. Sending everything but 1 unit.\r\n", ch );
      amount = ship->Thrusters.Energy.Current - 1;
    }

  if( amount + eShip->Thrusters.Energy.Current > eShip->Thrusters.Energy.Max )
    {
      SendToCharacter( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = eShip->Thrusters.Energy.Max - eShip->Thrusters.Energy.Current;
    }

  if( ship->Class != SHIP_PLATFORM )
    ship->Thrusters.Energy.Current -= amount;

  eShip->Thrusters.Energy.Current += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", eShip->Name, amount );
  EchoToCockpit( AT_YELLOW, ship, buf );
  SendToCharacter( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", ship->Thrusters.Energy.Current );
  EchoToCockpit( AT_YELLOW, ship, buf );
  SendToCharacter( buf, ch );
}
