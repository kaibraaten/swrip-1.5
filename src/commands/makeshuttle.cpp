#include "mud.hpp"
#include "shuttle.hpp"

void do_makeshuttle (Character * ch, char * argument)
{
  Shuttle *shuttle = nullptr;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeshuttle <shuttle name>\r\n", ch );
      return;
    }

  if( Shuttles->FindByName( argument ) )
    {
      Echo( ch, "&RThere's already another shuttle with that name.\r\n" );
      return;
    }
  
  shuttle = NewShuttle(argument);

  if (shuttle)
    Echo( ch, "&GShuttle created.&d\r\n" );
  else
    Echo( ch, "&GShuttle failed to create.&d\r\n" );
}
