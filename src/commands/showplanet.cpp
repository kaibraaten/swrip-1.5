#include "character.hpp"
#include "mud.hpp"
#include "spaceobject.hpp"
#include "planet.hpp"

void do_showplanet( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: showplanet <planet>\r\n");
      return;
    }

  const Planet *planet = Planets->FindByName(argument);

  if ( planet == nullptr )
    {
      ch->Echo("No such planet.\r\n");
      return;
    }

  ch->Echo("%s\r\nStarsystem: %s\r\n",
	planet->Name,
	planet->Spaceobject ? planet->Spaceobject->Name : "None");
}

