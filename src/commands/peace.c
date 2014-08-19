#include "mud.h"
#include "character.h"

void do_peace( Character *ch, char *argument )
{
  Character *rch;

  act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( rch->fighting )
        {
          stop_fighting( rch, true );
          do_sit( rch, "" );
        }

      /* Added by Narn, Nov 28/95 */
      stop_hating( rch );
      stop_hunting( rch );
      stop_fearing( rch );
    }

  SendToCharacter( "Ok.\r\n", ch );
}
