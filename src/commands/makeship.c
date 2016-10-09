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
  LINK( ship, first_ship, last_ship, next, prev );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->turret[turret_num] = AllocateTurret( ship );
    }

  ship->name            = CopyString( argument );
  ship->personalname            = CopyString( argument );
  ship->description     = CopyString( "" );
  ship->owner   = CopyString( "" );
  ship->copilot       = CopyString( "" );
  ship->pilot         = CopyString( "" );
  ship->home          = CopyString( "" );
  ship->type          = SHIP_CIVILIAN;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;

  ship->filename = CopyString( arg );
  SaveShip( ship );
  WriteShipList();
}
