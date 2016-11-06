#include "mud.h"
#include "shuttle.h"

void do_makeshuttle (Character * ch, char * argument)
{
  Shuttle * shuttle = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeshuttle <shuttle name>\r\n", ch );
      return;
    }

  if( GetShuttle( argument ) )
    {
      Echo( ch, "&RThere's already another shuttle with that name.\r\n" );
      return;
    }
  
  shuttle = MakeShuttle(argument);

  if (shuttle)
    Echo( ch, "&GShuttle created.&d\r\n" );
  else
    Echo( ch, "&GShuttle failed to create.&d\r\n" );
}
