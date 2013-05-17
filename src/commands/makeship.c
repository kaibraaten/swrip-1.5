#include "ships.h"
#include "mud.h"

void do_makeship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeship <filename> <ship name>\r\n", ch );
      return;
    }

  CREATE( ship, SHIP_DATA, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  ship->name            = STRALLOC( argument );
  ship->personalname            = STRALLOC( argument );
  ship->description     = STRALLOC( "" );
  ship->owner   = STRALLOC( "" );
  ship->copilot       = STRALLOC( "" );
  ship->pilot         = STRALLOC( "" );
  ship->home          = STRALLOC( "" );
  ship->type          = SHIP_CIVILIAN;
  ship->spaceobject = NULL;
  ship->energy = ship->maxenergy;
  ship->hull = ship->maxhull;
  ship->in_room=NULL;
  ship->next_in_room=NULL;
  ship->prev_in_room=NULL;
  ship->currjump=NULL;
  ship->target0=NULL;
  ship->target1=NULL;
  ship->target2=NULL;

  ship->filename = str_dup( arg );
  save_ship( ship );
  write_ship_list();
}
