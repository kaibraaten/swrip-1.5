#include "mud.h"

void do_bamfout( CHAR_DATA *ch, char *argument )
{
  if ( !IS_NPC(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfout );
      ch->pcdata->bamfout = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
