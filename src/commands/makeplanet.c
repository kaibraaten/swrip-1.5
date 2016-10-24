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
  LINK( planet, FirstPlanet, LastPlanet, Next, Previous );
  planet->GovernedBy = NULL;
  planet->Spaceobject = NULL ;
  planet->FirstArea = NULL;
  planet->LastArea = NULL;
  planet->Name          = CopyString( argument );
  planet->Flags               = 0;
}
