#include "ships.h"
#include "mud.h"
#include "turret.h"

void do_makeship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int turret_num = 0;

  argument = one_argument( argument, arg );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeship <filename> <ship name>\r\n", ch );
      return;
    }

  CREATE( ship, Ship, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->turret[turret_num] = AllocateTurret( ship );
    }

  ship->name            = str_dup( argument );
  ship->personalname            = str_dup( argument );
  ship->description     = str_dup( "" );
  ship->owner   = str_dup( "" );
  ship->copilot       = str_dup( "" );
  ship->pilot         = str_dup( "" );
  ship->home          = str_dup( "" );
  ship->type          = SHIP_CIVILIAN;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;

  ship->filename = str_dup( arg );
  SaveShip( ship );
  WriteShipList();
}
