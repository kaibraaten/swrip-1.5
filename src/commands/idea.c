#include "mud.h"

void do_idea( CHAR_DATA *ch, char *argument )
{
  append_file( ch, IDEA_FILE, argument );
  send_to_char( "Ok.  Thanks.\r\n", ch );
}
