#include "character.h"
#include "mud.h"

void do_gold(Character * ch, char *argument)
{
  SetCharacterColor( AT_GOLD, ch );
  Echo( ch,  "You have %d credits", ch->Gold );

  if( ch->PCData )
    Echo( ch, ", and %d credits in the bank", ch->PCData->bank );

  Echo( ch, ".\r\n" );
}
