#include "character.h"
#include "mud.h"

void do_bamfout( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      DISPOSE( ch->pcdata->bamfout );
      ch->pcdata->bamfout = CopyString( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
