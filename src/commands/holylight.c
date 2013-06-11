#include "character.h"
#include "mud.h"

void do_holylight( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IS_SET(ch->act, PLR_HOLYLIGHT) )
    {
      REMOVE_BIT(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode off.\r\n", ch );
    }
  else
    {
      SET_BIT(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode on.\r\n", ch );
    }
}
