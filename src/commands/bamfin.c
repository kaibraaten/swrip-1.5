#include "mud.h"

void do_bamfin( CHAR_DATA *ch, char *argument )
{
  if ( !IS_NPC(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfin );
      ch->pcdata->bamfin = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
