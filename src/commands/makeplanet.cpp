#include "mud.hpp"
#include "planet.hpp"
#include "character.hpp"

void do_makeplanet( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo("Usage: makeplanet <planet name>\r\n");
      return;
    }

  if( Planets->FindByName(argument) != nullptr )
    {
      ch->Echo("&RThere's already another planet with that name.&d\r\n" );
      return;
    }

  Planet *planet = new Planet();
  planet->Name = argument;
  Planets->Add(planet);
}
