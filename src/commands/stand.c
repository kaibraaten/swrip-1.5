#include "mud.h"
#include "character.h"

void do_stand( CHAR_DATA *ch, char *argument )
{
  switch ( ch->position )
    {
    case POS_SLEEPING:
      if ( is_affected_by(ch, AFF_SLEEP) )
        { send_to_char( "You can't seem to wake up!\r\n", ch ); return; }

      send_to_char( "You wake and climb quickly to your feet.\r\n", ch );
      act( AT_ACTION, "$n arises from $s slumber.", ch, NULL, NULL, TO_ROOM );
      ch->position = POS_STANDING;
      break;

    case POS_RESTING:
      send_to_char( "You gather yourself and stand up.\r\n", ch );
      act( AT_ACTION, "$n rises from $s rest.", ch, NULL, NULL, TO_ROOM );
      ch->position = POS_STANDING;
      break;

    case POS_SITTING:
      send_to_char( "You move quickly to your feet.\r\n", ch );
      act( AT_ACTION, "$n rises up.", ch, NULL, NULL, TO_ROOM );
      ch->position = POS_STANDING;
      break;

    case POS_STANDING:
      send_to_char( "You are already standing.\r\n", ch );
      break;

    case POS_FIGHTING:
      send_to_char( "You are already fighting!\r\n", ch );
      break;
    }

  ch->on = NULL;
}
