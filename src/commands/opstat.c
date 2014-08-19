#include "mud.h"

/* Opstat - Scryn 8/12*/
void do_opstat( Character *ch, char *argument )
{
  char        arg[MAX_INPUT_LENGTH];
  MPROG_DATA *mprg;
  Object   *obj;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "OProg stat what?\r\n", ch );
      return;
    }

  if ( ( obj = get_obj_world( ch, arg ) ) == NULL )
    {
      SendToCharacter( "You cannot find that.\r\n", ch );
      return;
    }

  if ( !( obj->Prototype->mprog.progtypes ) )
    {
      SendToCharacter( "That object has no programs set.\r\n", ch);
      return;
    }

  ChPrintf( ch, "Name: %s.  Vnum: %d.\r\n",
             obj->name, obj->Prototype->vnum );

  ChPrintf( ch, "Short description: %s.\r\n",
             obj->short_descr );

  for ( mprg = obj->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    ChPrintf( ch, ">%s %s\r\n%s\r\n",
               MudProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
