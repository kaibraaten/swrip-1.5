#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protoobject.hpp"

void do_olist( Character *ch, char *argument )
{
  ProtoObject *obj = NULL;
  vnum_t vnum = INVALID_VNUM;
  Area *tarea = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange = 0;
  int trange = 0;

  /*
   * Greater+ can list out of assigned range - Tri (mlist/rlist as well)
   */
  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_CREATOR || !ch->PCData
       || ( !ch->PCData->Build.Area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      ch->Echo("You don't have an assigned area.\r\n");
      return;
    }
  tarea = ch->PCData->Build.Area;
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( IsNullOrEmpty( arg1 ) )
        lrange = tarea->VnumRanges.Object.First;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );

      if ( IsNullOrEmpty( arg2 ) )
        trange = tarea->VnumRanges.Object.Last;
      else
        trange = atoi(arg2);

      if ((lrange < tarea->VnumRanges.Object.First || trange > tarea->VnumRanges.Object.Last)
          &&   GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          ch->Echo("That is out of your vnum range.\r\n");
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
      ch->Echo("%5d) %-20s (%s)\r\n", vnum,
                    obj->Name,
                    obj->ShortDescr );
    }
}

