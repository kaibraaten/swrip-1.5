#include "mud.hpp"
#include "spaceobject.hpp"

void do_makespaceobject( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Spaceobject *spaceobject;
  size_t n = 0;

  if ( IsNullOrEmpty( argument ))
    {
      SendToCharacter( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }

  if( GetSpaceobject( argument ) )
    {
      Echo( ch, "&RThere's already another spaceobject with that name.&d\r\n" );
      return;
    }
  
  AllocateMemory( spaceobject, Spaceobject, 1 );
  Spaceobjects->Add(spaceobject);

  spaceobject->Name      = CopyString( argument );

  for( n = 0; n < MAX_LANDINGSITE; ++n )
    {
      spaceobject->LandingSites[n].LocationName = CopyString( "" );
    }

  argument = OneArgument( argument, arg );
  Spaceobjects->Save(spaceobject);
}
