#include "character.h"
#include "mud.h"

void do_gold(CHAR_DATA * ch, char *argument)
{
  set_char_color( AT_GOLD, ch );
  ch_printf( ch,  "You have %d credits", ch->gold );

  if( ch->pcdata )
    ch_printf( ch, ", and %d credits in the bank", ch->pcdata->bank );

  ch_printf( ch, ".\r\n" );
}
