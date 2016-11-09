#include "mud.hpp"

void do_wizlist( Character *ch, std::string argument )
{
  SetPagerColor( AT_IMMORT, ch );
  ShowFile( ch, WIZLIST_FILE );
}
