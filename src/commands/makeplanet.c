#include "mud.h"

void do_makeplanet( CHAR_DATA *ch, char *argument )
{
  char filename[256];
  PLANET_DATA *planet;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeplanet <planet name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, strlower(argument) );

  CREATE( planet, PLANET_DATA, 1 );
  LINK( planet, first_planet, last_planet, next, prev );
  planet->governed_by = NULL;
  planet->next_in_system = NULL;
  planet->prev_in_system = NULL;
  planet->spaceobject = NULL ;
  planet->first_area = NULL;
  planet->last_area = NULL;
  planet->first_guard = NULL;
  planet->last_guard = NULL;
  planet->name          = STRALLOC( argument );
  planet->flags               = 0;
}