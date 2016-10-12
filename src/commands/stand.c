#include "mud.h"
#include "character.h"

void do_stand( Character *ch, char *argument )
{
  switch ( ch->Position )
    {
    case POS_SLEEPING:
      if ( IsAffectedBy(ch, AFF_SLEEP) )
        { SendToCharacter( "You can't seem to wake up!\r\n", ch ); return; }

      SendToCharacter( "You wake and climb quickly to your feet.\r\n", ch );
      Act( AT_ACTION, "$n arises from $s slumber.", ch, NULL, NULL, TO_ROOM );
      ch->Position = POS_STANDING;
      break;

    case POS_RESTING:
      SendToCharacter( "You gather yourself and stand up.\r\n", ch );
      Act( AT_ACTION, "$n rises from $s rest.", ch, NULL, NULL, TO_ROOM );
      ch->Position = POS_STANDING;
      break;

    case POS_SITTING:
      SendToCharacter( "You move quickly to your feet.\r\n", ch );
      Act( AT_ACTION, "$n rises up.", ch, NULL, NULL, TO_ROOM );
      ch->Position = POS_STANDING;
      break;

    case POS_STANDING:
      SendToCharacter( "You are already standing.\r\n", ch );
      break;

    case POS_FIGHTING:
      SendToCharacter( "You are already fighting!\r\n", ch );
      break;
    }

  ch->on = NULL;
}
