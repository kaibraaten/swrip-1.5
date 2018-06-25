#include "character.h"
#include "ship.h"
#include "mud.h"

static Ship *GetFuelTarget(const Ship *fuelSource);

void do_fuel(Character *ch, char *argument )
{
  Ship *fuelSource = NULL;
  Ship *fuelTarget = NULL;
  int amount = 0;
  char arg1[MAX_INPUT_LENGTH] = { '\0' };
  char buf[MAX_STRING_LENGTH] = { '\0' };

  argument = OneArgument( argument, arg1 );

  if ((fuelSource = GetShipFromHangar(ch->InRoom->Vnum)) == NULL
      && (fuelSource = GetShipFromEntrance(ch->InRoom->Vnum)) == NULL)
    {
      SendToCharacter("&RYou must be in the hangar or the entrance of a ship to do that!\r\n",ch);
      return;
    }

  if( IsNullOrEmpty( arg1 ) || !IsNumber(arg1) )
    {
      SendToCharacter( "Syntax: Fuel <amount> <ship>", ch);
      return;
    }

  if( IsNullOrEmpty( argument ) )
    {
      fuelTarget = GetFuelTarget(fuelSource);
    }

  if( fuelTarget == NULL )
    {
      SendToCharacter( "Ship not docked. Fuel what ship?", ch );
      return;
    }

  amount = atoi(arg1);

  if(fuelSource->Thrusters.Energy.Current <= amount)
    {
      SendToCharacter( "&RError: Ordered energy over current stock. Sending everything but 1 unit.&w\r\n", ch );
      amount = fuelSource->Thrusters.Energy.Current - 1;
    }

  if(fuelTarget->Thrusters.Energy.Max < fuelTarget->Thrusters.Energy.Current + amount)
    {
      SendToCharacter( "&rError: Ordered energy over target capacity. Filling tanks.\r\n", ch );
      amount = fuelTarget->Thrusters.Energy.Max - fuelTarget->Thrusters.Energy.Current;
    }

  if( fuelSource->Class != SHIP_PLATFORM )
    {
      fuelSource->Thrusters.Energy.Current -= amount;
    }

  fuelTarget->Thrusters.Energy.Current += amount;

  sprintf( buf, "&YFuel order filled: &O%s: %d\r\n", fuelTarget->Name, amount );
  EchoToCockpit( AT_YELLOW, fuelSource, buf );
  SendToCharacter( buf, ch );
  sprintf( buf, "&YFuel remaining: %d\r\n", fuelSource->Thrusters.Energy.Current );
  EchoToCockpit( AT_YELLOW, fuelSource, buf );
  SendToCharacter( buf, ch );
}

struct UserData
{
  const Ship * const fuelSource;
  Ship *fuelTarget;
};

static bool FindDockedShip(Ship *fuelTarget, void *userData)
{
  struct UserData *data = (struct UserData*)userData;

  if( fuelTarget->Docked == data->fuelSource )
    {
      data->fuelTarget = fuelTarget;
      return false;
    }

  return true;
}

static Ship *GetFuelTarget(const Ship *fuelSource)
{
  Ship *fuelTarget = NULL;

  if( fuelSource->Docked != NULL )
    {
      fuelTarget = fuelSource->Docked;
    }
  else
    {
      struct UserData data = { fuelSource, NULL };
      ForEachShip(FindDockedShip, &data);
      fuelTarget = data.fuelTarget;
    }

  return fuelTarget;
}
