#include "mud.h"

void do_peace( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *rch;

  act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( rch->fighting )
        {
          stop_fighting( rch, TRUE );
          do_sit( rch, "" );
        }

      /* Added by Narn, Nov 28/95 */
      stop_hating( rch );
      stop_hunting( rch );
      stop_fearing( rch );
    }

  send_to_char( "Ok.\r\n", ch );
}
