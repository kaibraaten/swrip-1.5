#include "mud.h"
#include "planet.h"

void do_makeplanet( Character *ch, char *argument )
{
  Planet *planet;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeplanet <planet name>\r\n", ch );
      return;
    }

  if( GetPlanet( argument ) )
    {
      Echo( ch, "&RThere's already another planet with that name.&d\r\n" );
      return;
    }

  AllocateMemory( planet, Planet, 1 );
  LINK( planet, FirstPlanet, LastPlanet, Next, Previous );
  planet->GovernedBy = NULL;
  planet->Spaceobject = NULL ;
  planet->FirstArea = NULL;
  planet->LastArea = NULL;
  planet->Name          = CopyString( argument );
  planet->Flags               = 0;
}
