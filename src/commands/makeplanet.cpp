#include "mud.hpp"
#include "planet.hpp"
#include "character.hpp"

void do_makeplanet( Character *ch, char *argument )
{
  Planet *planet = nullptr;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makeplanet <planet name>\r\n");
      return;
    }

  if(Planets->FindByName(argument) != nullptr)
    {
      ch->Echo("&RThere's already another planet with that name.&d\r\n" );
      return;
    }

  AllocateMemory( planet, Planet, 1 );
  Planets->Add(planet);
  planet->Name          = CopyString( argument );
}

