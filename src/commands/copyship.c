#include "ships.h"
#include "mud.h"

void do_copyship( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship = NULL;
  SHIP_DATA *old = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: copyship <oldshipname> <filename> <newshipname>\r\n", ch );
      return;
    }

  old = get_ship ( arg );

  if (!old)
    {
      send_to_char( "Thats not a ship!\r\n", ch );
      return;
    }

  CREATE( ship, SHIP_DATA, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  ship->name            = STRALLOC( argument );
  ship->description     = STRALLOC( "" );
  ship->owner   = STRALLOC( "" );
  ship->copilot       = STRALLOC( "" );
  ship->pilot         = STRALLOC( "" );
  ship->home          = STRALLOC( "" );
  ship->type          = old->type;
  ship->sclass         = old->sclass;
  ship->lasers        = old->lasers;
  ship->maxshield        = old->maxshield;
  ship->maxhull        = old->maxhull;
  ship->maxenergy        = old->maxenergy  ;
  ship->hyperspeed        = old->hyperspeed  ;
  ship->realspeed        = old->realspeed  ;
  ship->manuever        = old->manuever  ;
  ship->in_room=NULL;
  ship->next_in_room=NULL;
  ship->prev_in_room=NULL;
  ship->currjump=NULL;
  ship->target0=NULL;
  ship->target1=NULL;
  ship->target2=NULL;

  ship->filename         = str_dup(arg2);
  save_ship( ship );
  write_ship_list();
}
