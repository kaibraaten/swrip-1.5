#include "character.h"
#include "mud.h"

void do_bamfin( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->pcdata->bamfin );
      ch->pcdata->bamfin = CopyString( argument );
      send_to_char( "Ok.\r\n", ch );
    }
}
