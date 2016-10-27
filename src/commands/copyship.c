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
  ship->Class         = old->Class;
  ship->WeaponSystems.Laser.Count = old->WeaponSystems.Laser.Count;
  ship->Defenses.Shield.Max = old->Defenses.Shield.Max;
  ship->Defenses.Hull.Max = old->Defenses.Hull.Max;
  ship->Thrusters.Energy.Max        = old->Thrusters.Energy.Max  ;
  ship->Hyperdrive.Speed        = old->Hyperdrive.Speed  ;
  ship->Thrusters.Speed.Max        = old->Thrusters.Speed.Max  ;
  ship->Maneuver        = old->Maneuver  ;

  ship->Filename         = CopyString(arg2);
  SaveShip( ship );
  WriteShipList();
}
