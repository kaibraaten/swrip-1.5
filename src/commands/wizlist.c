#include "mud.h"

void do_wizlist( CHAR_DATA *ch, char *argument )
{
  set_pager_color( AT_IMMORT, ch );
  show_file( ch, WIZLIST_FILE );
}
