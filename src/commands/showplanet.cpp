#include "character.hpp"
#include "mud.hpp"
#include "spaceobject.hpp"
#include "planet.hpp"

void do_showplanet( Character *ch, std::string argument )
{
  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( argument.empty() )
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
           planet->Name.c_str(),
           planet->Spaceobject ? planet->Spaceobject->Name.c_str() : "None");
}

