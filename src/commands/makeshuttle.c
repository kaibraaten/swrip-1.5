#include "mud.h"
#include "shuttle.h"

void do_makeshuttle (CHAR_DATA * ch, char * argument)
{
  SHUTTLE_DATA * shuttle;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( !argument || arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeshuttle <filename> <shuttle name>\r\n", ch );
      return;
    }
  shuttle = make_shuttle(arg, argument);
  if (shuttle)
    send_to_char( "Shuttle Created", ch);
  else
    send_to_char( "Shuttle Failed to create", ch);
}
