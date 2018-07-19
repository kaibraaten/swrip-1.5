#include "mud.hpp"
#include "planet.hpp"

void do_makeplanet( Character *ch, char *argument )
{
  Planet *planet = nullptr;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeplanet <planet name>\r\n", ch );
      return;
    }

  if(Planets->Find(std::string(argument)) != nullptr)
    {
      Echo( ch, "&RThere's already another planet with that name.&d\r\n" );
      return;
    }

  AllocateMemory( planet, Planet, 1 );
  Planets->Add(planet);
  planet->Name          = CopyString( argument );
}
