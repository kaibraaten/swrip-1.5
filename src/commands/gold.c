#include "character.h"
#include "mud.h"

void do_gold(Character * ch, char *argument)
{
  SetCharacterColor( AT_GOLD, ch );
  ChPrintf( ch,  "You have %d credits", ch->gold );

  if( ch->pcdata )
    ChPrintf( ch, ", and %d credits in the bank", ch->pcdata->bank );

  ChPrintf( ch, ".\r\n" );
}
