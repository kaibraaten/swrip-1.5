#include "mud.h"

void do_makeplanet( Character *ch, char *argument )
{
  char filename[256];
  Planet *planet;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeplanet <planet name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, StringToLowercase(argument) );

  AllocateMemory( planet, Planet, 1 );
  LINK( planet, first_planet, last_planet, next, prev );
  planet->governed_by = NULL;
  planet->next_in_system = NULL;
  planet->prev_in_system = NULL;
  planet->spaceobject = NULL ;
  planet->first_area = NULL;
  planet->last_area = NULL;
  planet->first_guard = NULL;
  planet->last_guard = NULL;
  planet->Name          = CopyString( argument );
  planet->flags               = 0;
}
