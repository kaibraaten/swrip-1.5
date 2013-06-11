#include "character.h"
#include "mud.h"

void do_olist( Character *ch, char *argument )
{
  OBJ_INDEX_DATA        *obj;
  int                    vnum;
  AREA_DATA             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  /*
   * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
   */
  if ( IsNpc(ch) || GetTrustedLevel( ch ) < LEVEL_CREATOR || !ch->pcdata
       || ( !ch->pcdata->area && GetTrustedLevel( ch ) < LEVEL_GREATER ) )
    {
      send_to_char( "You don't have an assigned area.\r\n", ch );
      return;
    }
  tarea = ch->pcdata->area;
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->low_o_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_o_vnum;
      else
        trange = atoi(arg2);

      if ((lrange < tarea->low_o_vnum || trange > tarea->hi_o_vnum)
          &&   GetTrustedLevel( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 3 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (obj = get_obj_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "%5d) %-20s (%s)\r\n", vnum,
                    obj->name,
                    obj->short_descr );
    }
}
