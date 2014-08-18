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
      send_to_char( "OProg stat what?\r\n", ch );
      return;
    }

  if ( ( obj = get_obj_world( ch, arg ) ) == NULL )
    {
      send_to_char( "You cannot find that.\r\n", ch );
      return;
    }

  if ( !( obj->pIndexData->mprog.progtypes ) )
    {
      send_to_char( "That object has no programs set.\r\n", ch);
      return;
    }

  ch_printf( ch, "Name: %s.  Vnum: %d.\r\n",
             obj->name, obj->pIndexData->vnum );

  ch_printf( ch, "Short description: %s.\r\n",
             obj->short_descr );

  for ( mprg = obj->pIndexData->mprog.mudprogs; mprg; mprg = mprg->next )
    ch_printf( ch, ">%s %s\r\n%s\r\n",
               mprog_type_to_name( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
