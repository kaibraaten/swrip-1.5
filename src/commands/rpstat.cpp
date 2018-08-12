#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

/* Rpstat - Scryn 8/12 */
void do_rpstat( Character *ch, char *argument )
{
  MPROG_DATA *mprg;

  if ( !( ch->InRoom->mprog.progtypes ) )
    {
      ch->Echo("This room has no programs set.\r\n");
      return;
    }

  ch->Echo("Name: %s.  Vnum: %d.\r\n",
             ch->InRoom->Name, ch->InRoom->Vnum );

  for ( mprg = ch->InRoom->mprog.mudprogs; mprg; mprg = mprg->Next )
    ch->Echo(">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}

