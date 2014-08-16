#include "character.h"
#include "mud.h"

void do_bamfout( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfout );
      ch->pcdata->bamfout = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
