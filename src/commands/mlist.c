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
	lrange = tarea->low_m_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_m_vnum;
      else
        trange = atoi( arg2 );

      if ( ( lrange < tarea->low_m_vnum || trange > tarea->hi_m_vnum )
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
      if ( (mob = get_mob_index( vnum )) == NULL )
        continue;
      PagerPrintf( ch, "%5d) %-20s '%s'\r\n", vnum,
                    mob->player_name,
                    mob->short_descr );
    }
}
