#include "turret.h"
#include "ship.h"
#include "mud.h"

void do_copyship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  Ship *old = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int turret_num = 0;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: copyship <oldshipname> <filename> <newshipname>\r\n", ch );
      return;
    }

  old = GetShipAnywhere ( arg );

  if (!old)
    {
      SendToCharacter( "Thats not a ship!\r\n", ch );
      return;
    }

  AllocateMemory( ship, Ship, 1 );
  LINK( ship, first_ship, last_ship, Next, Previous );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->WeaponSystems.Turret[turret_num] = AllocateTurret( ship );
    }

  ship->Name            = CopyString( argument );
  ship->Description     = CopyString( "" );
  ship->Owner   = CopyString( "" );
  ship->CoPilot       = CopyString( "" );
  ship->Pilot         = CopyString( "" );
  ship->Home          = CopyString( "" );
  ship->Type          = old->Type;
  ship->ShipClass         = old->ShipClass;
  ship->WeaponSystems.NumberOfLasers = old->WeaponSystems.NumberOfLasers;
  ship->MaxShield        = old->MaxShield;
  ship->MaxHull        = old->MaxHull;
  ship->MaxEnergy        = old->MaxEnergy  ;
  ship->Hyperspeed        = old->Hyperspeed  ;
  ship->RealSpeed        = old->RealSpeed  ;
  ship->Maneuver        = old->Maneuver  ;

  ship->Filename         = CopyString(arg2);
  SaveShip( ship );
  WriteShipList();
}
