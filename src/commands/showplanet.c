#include "character.h"
#include "mud.h"
#include "spaceobject.h"

void do_showplanet( Character *ch, char *argument )
{
  const Planet *planet = NULL;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: showplanet <planet>\r\n", ch );
      return;
    }

  planet = GetPlanet( argument );

  if ( !planet )
    {
      SendToCharacter( "No such planet.\r\n", ch );
      return;
    }

  Echo( ch, "%s\r\nStarsystem: %s\r\n",
	planet->Name,
	planet->Spaceobject ? planet->Spaceobject->Name : "None");
}
