#include "ship.h"
#include "mud.h"
#include "turret.h"

void do_makeship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int turret_num = 0;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( argument ) || IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: makeship <filename> <ship name>\r\n", ch );
      return;
    }

  AllocateMemory( ship, Ship, 1 );
  LINK( ship, FirstShip, LastShip, Next, Previous );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->WeaponSystems.Turret[turret_num] = AllocateTurret( ship );
    }

  ship->Name            = CopyString( argument );
  ship->PersonalName            = CopyString( argument );
  ship->Description     = CopyString( "" );
  ship->Owner   = CopyString( "" );
  ship->CoPilot       = CopyString( "" );
  ship->Pilot         = CopyString( "" );
  ship->Home          = CopyString( "" );
  ship->Type          = SHIP_CIVILIAN;

  ship->Filename = CopyString( arg );
  SaveShip( ship );
  WriteShipList();
}
