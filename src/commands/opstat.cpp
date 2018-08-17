#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "protoobject.hpp"

/* Opstat - Scryn 8/12*/
void do_opstat( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("OProg stat what?\r\n");
      return;
    }

  Object *obj = GetObjectAnywhere(ch, arg );
  
  if ( obj == nullptr )
    {
      ch->Echo("You cannot find that.\r\n");
      return;
    }

  if ( obj->Prototype->mprog.MudProgs().empty() )
    {
      ch->Echo("That object has no programs set.\r\n");
      return;
    }

  ch->Echo("Name: %s.  Vnum: %d.\r\n",
             obj->Name, obj->Prototype->Vnum );

  ch->Echo("Short description: %s.\r\n",
             obj->ShortDescr );

  for(const MPROG_DATA *mprg : obj->Prototype->mprog.MudProgs())
    {
      ch->Echo(">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
    }
}

