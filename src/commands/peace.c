#include "mud.h"
#include "character.h"

void do_peace( Character *ch, char *argument )
{
  Character *rch;

  Act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  for ( rch = ch->in_room->FirstPerson; rch; rch = rch->next_in_room )
    {
      if ( rch->fighting )
        {
          StopFighting( rch, true );
          do_sit( rch, "" );
        }

      /* Added by Narn, Nov 28/95 */
      StopHating( rch );
      StopHunting( rch );
      StopFearing( rch );
    }

  SendToCharacter( "Ok.\r\n", ch );
}
