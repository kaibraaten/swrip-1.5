#include "mud.h"
#include "spaceobject.h"

void do_makespaceobject( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char filename[256];
  Spaceobject *spaceobject;
  size_t n = 0;

  if ( IsNullOrEmpty( argument ))
    {
      SendToCharacter( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }


  AllocateMemory( spaceobject, Spaceobject, 1 );
  LINK( spaceobject, first_spaceobject, last_spaceobject, Next, Previous );

  spaceobject->Name      = CopyString( argument );

  for( n = 0; n < MAX_LANDINGSITE; ++n )
    {
      spaceobject->LandingSites[n].LocationName = CopyString( "" );
    }

  argument = OneArgument( argument, arg );
  sprintf( filename, "%s" , StringToLowercase(arg) );
  spaceobject->Filename = CopyString( filename );
  SaveSpaceobject( spaceobject );
}
