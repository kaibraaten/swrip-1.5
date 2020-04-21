#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

/* Rpstat - Scryn 8/12 */
void do_rpstat( Character *ch, std::string argument )
{
  if ( ch->InRoom->mprog.MudProgs().empty() )
    {
      ch->Echo("This room has no programs set.\r\n");
      return;
    }

  ch->Echo("Name: %s.  Vnum: %ld.\r\n",
           ch->InRoom->Name.c_str(), ch->InRoom->Vnum );

  for(auto mprg : ch->InRoom->mprog.MudProgs())
    {
      ch->Echo(">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist.c_str() );
    }
}
