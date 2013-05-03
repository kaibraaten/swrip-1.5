#include "mud.h"

void do_noresolve( CHAR_DATA *ch, char *argument )
{
  sysdata.NO_NAME_RESOLVING = !sysdata.NO_NAME_RESOLVING;

  if ( sysdata.NO_NAME_RESOLVING )
    send_to_char( "Name resolving disabled.\r\n", ch );
  else
    send_to_char( "Name resolving enabled.\r\n", ch );
}
