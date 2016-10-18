#include "character.h"
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
          SendToCharacter("&RYou must be in the hanger or the entrance of a ship to do that!\r\n",ch);
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
          for( eShip = first_ship; eShip; eShip = eShip->Next )
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

  if( amount >= ship->Energy )
    {
      SendToCharacter( "&RError: Ordered energy over current stock. Sending everything but 1 unit.\r\n", ch );
      amount = ship->Energy - 1;
    }

  if( amount + eShip->Energy > eShip->MaxEnergy )
    {
      SendToCharacter( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = eShip->MaxEnergy - eShip->Energy;
    }

  if( ship->ShipClass != SHIP_PLATFORM )
    ship->Energy -= amount;

  eShip->Energy += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", eShip->Name, amount );
  EchoToCockpit( AT_YELLOW, ship, buf );
  SendToCharacter( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", ship->Energy );
  EchoToCockpit( AT_YELLOW, ship, buf );
  SendToCharacter( buf, ch );
}
