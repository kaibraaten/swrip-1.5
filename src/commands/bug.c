#include "mud.h"

void do_bug( CHAR_DATA *ch, char *argument )
{
  append_file( ch, BUG_FILE, argument );
  send_to_char( "Ok. Thanks.\r\n", ch );
}
