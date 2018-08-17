#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protomob.hpp"

void do_mlist( Character *ch, char *argument )
{
  ProtoMobile *mob = NULL;
  vnum_t vnum = INVALID_VNUM;
  Area *tarea = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange = 0;
  int trange = 0;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_CREATOR || !ch->PCData
       ||  ( !ch->PCData->Build.Area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      ch->Echo("You don't have an assigned area.\r\n");
      return;
    }

  tarea = ch->PCData->Build.Area;
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( IsNullOrEmpty( arg1 ) )            /* cleaned a big scary mess */
	lrange = tarea->VnumRanges.Mob.First;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );

      if ( IsNullOrEmpty( arg2 ) )
        trange = tarea->VnumRanges.Mob.Last;
      else
        trange = atoi( arg2 );

      if ( ( lrange < tarea->VnumRanges.Mob.First || trange > tarea->VnumRanges.Mob.Last )
           && GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          ch->Echo("That is out of your vnum range.\r\n");
          return;
        }
    }
  else
    {
      lrange = ( IsNumber( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( IsNumber( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (mob = GetProtoMobile( vnum )) == NULL )
        continue;
      ch->Echo("%5d) %-20s '%s'\r\n", vnum,
                    mob->Name,
                    mob->ShortDescr );
    }
}

