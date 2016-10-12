#include "character.h"
#include "mud.h"

void do_rlist( Character *ch, char *argument )
{
  Room       *room;
  int                    vnum;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Area             *tarea;
  int lrange;
  int trange;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
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
	lrange = tarea->VnumRanges.FirstRoom;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      
      if ( IsNullOrEmpty( arg2 ) )
        trange = tarea->VnumRanges.LastRoom;
      else
        trange = atoi(arg2);

      if ( ( lrange < tarea->VnumRanges.FirstRoom || trange > tarea->VnumRanges.LastRoom )
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
      if ( (room = GetRoom( vnum )) == NULL )
        continue;
      PagerPrintf( ch, "&w%5d) %s\r\n", vnum, room->Name );
    }
}
