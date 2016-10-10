#include "mud.h"
#include "character.h"

/* Rpstat - Scryn 8/12 */
void do_rpstat( Character *ch, char *argument )
{
  MPROG_DATA *mprg;

  if ( !( ch->in_room->mprog.progtypes ) )
    {
      SendToCharacter( "This room has no programs set.\r\n", ch);
      return;
    }

  Echo( ch, "Name: %s.  Vnum: %d.\r\n",
             ch->in_room->Name, ch->in_room->Vnum );

  for ( mprg = ch->in_room->mprog.mudprogs; mprg; mprg = mprg->next )
    Echo( ch, ">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
