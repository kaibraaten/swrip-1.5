#include "mud.h"

void do_rent( CHAR_DATA *ch, char *argument )
{
  set_char_color( AT_WHITE, ch );
  send_to_char( "There is no rent here. Just save and quit.\r\n", ch );
}
