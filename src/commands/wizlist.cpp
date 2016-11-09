#include "mud.h"

void do_wizlist( Character *ch, char *argument )
{
  SetPagerColor( AT_IMMORT, ch );
  ShowFile( ch, WIZLIST_FILE );
}
