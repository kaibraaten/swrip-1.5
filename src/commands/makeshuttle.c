#include "mud.h"
#include "shuttle.h"

void do_makeshuttle (Character * ch, char * argument)
{
  Shuttle * shuttle;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( !argument || arg[0] == '\0' || argument[0] == '\0' )
    {
      SendToCharacter( "Usage: makeshuttle <filename> <shuttle name>\r\n", ch );
      return;
    }
  shuttle = MakeShuttle(arg, argument);
  if (shuttle)
    SendToCharacter( "Shuttle Created", ch);
  else
    SendToCharacter( "Shuttle Failed to create", ch);
}
