#include "character.h"
#include "mud.h"

void do_bamfin( Character *ch, char *argument )
{
  if ( !is_npc(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfin );
      ch->pcdata->bamfin = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
