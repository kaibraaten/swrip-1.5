#include "mud.h"

/* Opstat - Scryn 8/12*/
void do_opstat( Character *ch, char *argument )
{
  char        arg[MAX_INPUT_LENGTH];
  MPROG_DATA *mprg;
  Object   *obj;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "OProg stat what?\r\n", ch );
      return;
    }

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "You cannot find that.\r\n", ch );
      return;
    }

  if ( !( obj->Prototype->mprog.progtypes ) )
    {
      SendToCharacter( "That object has no programs set.\r\n", ch);
      return;
    }

  Echo( ch, "Name: %s.  Vnum: %d.\r\n",
             obj->Name, obj->Prototype->Vnum );

  Echo( ch, "Short description: %s.\r\n",
             obj->ShortDescr );

  for ( mprg = obj->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    Echo( ch, ">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
