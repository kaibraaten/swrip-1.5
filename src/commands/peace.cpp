#include "mud.h"
#include "character.hpp"

void do_peace( Character *ch, char *argument )
{
  Character *rch;

  Act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  for ( rch = ch->InRoom->FirstPerson; rch; rch = rch->NextInRoom )
    {
      if ( rch->Fighting )
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
