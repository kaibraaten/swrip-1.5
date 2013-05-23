#include "character.h"
#include "mud.h"

void do_hide( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC(ch) && is_affected_by( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  send_to_char( "You make an attempt at stealth.\r\n", ch );

  if ( is_affected_by(ch, AFF_HIDE) )
    REMOVE_BIT(ch->affected_by, AFF_HIDE);

  if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_hide] )
    {
      SET_BIT(ch->affected_by, AFF_HIDE);
      learn_from_success( ch, gsn_hide );
    }
  else
    {
      learn_from_failure( ch, gsn_hide );
    }
}
