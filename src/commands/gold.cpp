#include "character.hpp"
#include "mud.hpp"

void do_gold(Character * ch, char *argument)
{
  SetCharacterColor( AT_GOLD, ch );
  Echo( ch,  "You have %d credits", ch->Gold );

  if( ch->PCData )
    Echo( ch, ", and %d credits in the bank", ch->PCData->Bank );

  Echo( ch, ".\r\n" );
}
