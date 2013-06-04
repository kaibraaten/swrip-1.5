#include "mud.h"
#include "character.h"

/* Rpstat - Scryn 8/12 */
void do_rpstat( Character *ch, char *argument )
{
  MPROG_DATA *mprg;

  if ( !( ch->in_room->mprog.progtypes ) )
    {
      send_to_char( "This room has no programs set.\r\n", ch);
      return;
    }

  ch_printf( ch, "Name: %s.  Vnum: %d.\r\n",
             ch->in_room->name, ch->in_room->vnum );

  for ( mprg = ch->in_room->mprog.mudprogs; mprg; mprg = mprg->next )
    ch_printf( ch, ">%s %s\r\n%s\r\n",
               mprog_type_to_name( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
