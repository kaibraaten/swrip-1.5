#include "mud.h"
#include "shuttle.h"

void do_makeshuttle (Character * ch, char * argument)
{
  Shuttle * shuttle;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( !argument || arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeshuttle <filename> <shuttle name>\r\n", ch );
      return;
    }
  shuttle = MakeShuttle(arg, argument);
  if (shuttle)
    send_to_char( "Shuttle Created", ch);
  else
    send_to_char( "Shuttle Failed to create", ch);
}
