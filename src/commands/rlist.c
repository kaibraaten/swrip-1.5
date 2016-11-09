#include "character.hpp"
#include "mud.h"
#include "area.h"

void do_rlist( Character *ch, char *argument )
{
  Room *room = NULL;
  vnum_t vnum = INVALID_VNUM;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Area *tarea = ch->PCData->Build.Area;
  vnum_t lrange = INVALID_VNUM;
  vnum_t trange = INVALID_VNUM;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
       || ( !ch->PCData->Build.Area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      SendToCharacter( "You don't have an assigned area.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( IsNullOrEmpty( arg1 ) )
	lrange = tarea->VnumRanges.Room.First;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      
      if ( IsNullOrEmpty( arg2 ) )
        trange = tarea->VnumRanges.Room.Last;
      else
        trange = atoi(arg2);

      if ( ( lrange < tarea->VnumRanges.Room.First || trange > tarea->VnumRanges.Room.Last )
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
