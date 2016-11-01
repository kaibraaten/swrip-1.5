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
  
  shuttle = MakeShuttle(argument);

  if (shuttle)
    Echo( ch, "&GShuttle Created.&d\r\n" );
  else
    Echo( ch, "&GShuttle Failed to create.&d\r\n" );
}
