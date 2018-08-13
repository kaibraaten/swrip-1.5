#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_peace( Character *ch, char *argument )
{
  Act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );

  for ( Character *rch : ch->InRoom->Characters())
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

  ch->Echo("Ok.\r\n");
}

