#include "character.h"
#include "mud.h"

void do_mlist( Character *ch, char *argument )
{
  ProtoMobile        *mob;
  int                    vnum;
  Area             *tarea;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int lrange;
  int trange;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_CREATOR || !ch->pcdata
       ||  ( !ch->pcdata->area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
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
	lrange = tarea->VnumRanges.FirstMob;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->VnumRanges.LastMob;
      else
        trange = atoi( arg2 );

      if ( ( lrange < tarea->VnumRanges.FirstMob || trange > tarea->VnumRanges.LastMob )
           && GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter("That is out of your vnum range.\r\n", ch);
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
      PagerPrintf( ch, "%5d) %-20s '%s'\r\n", vnum,
                    mob->name,
                    mob->short_descr );
    }
}
