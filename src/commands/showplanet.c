#include "character.h"
#include "mud.h"

void do_showplanet( Character *ch, char *argument )
{
  Planet *planet;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
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

  Echo( ch, "%s\r\nFilename: %s\r\nStarsystem: %s\r\n",
             planet->name,
             planet->filename,
             planet->spaceobject ? planet->spaceobject->name : "None");
}
