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
  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_CREATOR || !ch->PCData
       || ( !ch->PCData->area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      SendToCharacter( "You don't have an assigned area.\r\n", ch );
      return;
    }
  tarea = ch->PCData->area;
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( IsNullOrEmpty( arg1 ) )
        lrange = tarea->VnumRanges.FirstObject;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );

      if ( IsNullOrEmpty( arg2 ) )
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
                    obj->Name,
                    obj->ShortDescr );
    }
}
