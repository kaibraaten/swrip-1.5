#include "character.h"
#include "mud.h"

void do_olist( Character *ch, char *argument )
{
  ProtoObject        *obj;
  int                    vnum;
  Area             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  /*
   * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
   */
  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_CREATOR || !ch->pcdata
       || ( !ch->pcdata->area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      SendToCharacter( "You don't have an assigned area.\r\n", ch );
      return;
    }
  tarea = ch->pcdata->area;
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1[0] == '\0' )            /* cleaned a big scary mess */
        lrange = tarea->VnumRanges.FirstObject;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->VnumRanges.LastObject;
      else
        trange = atoi(arg2);

      if ((lrange < tarea->VnumRanges.FirstObject || trange > tarea->VnumRanges.LastObject)
          &&   GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( IsNumber( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( IsNumber( arg2 ) ? atoi( arg2 ) : 3 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (obj = GetProtoObject( vnum )) == NULL )
        continue;
      PagerPrintf( ch, "%5d) %-20s (%s)\r\n", vnum,
                    obj->name,
                    obj->short_descr );
    }
}
