#include "ships.h"
#include "mud.h"
#include "turret.h"

void do_makeship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int turret_num = 0;

  argument = one_argument( argument, arg );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeship <filename> <ship name>\r\n", ch );
      return;
    }

  CREATE( ship, SHIP_DATA, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->turret[turret_num] = create_turret( ship );
    }

  ship->name            = STRALLOC( argument );
  ship->personalname            = STRALLOC( argument );
  ship->description     = STRALLOC( "" );
  ship->owner   = STRALLOC( "" );
  ship->copilot       = STRALLOC( "" );
  ship->pilot         = STRALLOC( "" );
  ship->home          = STRALLOC( "" );
  ship->type          = SHIP_CIVILIAN;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;

  ship->filename = str_dup( arg );
  save_ship( ship );
  write_ship_list();
}
