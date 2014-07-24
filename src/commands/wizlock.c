#include "mud.h"

void do_wizlock( Character *ch, char *argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    send_to_char( "Game wizlocked.\r\n", ch );
  else
    send_to_char( "Game un-wizlocked.\r\n", ch );
}
