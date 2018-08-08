#include "mud.hpp"

void do_wizlist( Character *ch, char *argument )
{
  SetCharacterColor( AT_IMMORT, ch );
  ShowFile( ch, WIZLIST_FILE );
}

