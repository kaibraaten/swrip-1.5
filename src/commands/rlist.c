#include "character.h"
#include "mud.h"

void do_rlist( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA       *room;
  int                    vnum;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  AREA_DATA             *tarea;
  int lrange;
  int trange;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       || ( !ch->pcdata->area && get_trust( ch ) < LEVEL_GREATER ) )
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
	lrange = tarea->low_r_vnum;     /* here.            -Thoric */
      else
        lrange = atoi( arg1 );
      if ( arg2[0] == '\0' )
        trange = tarea->hi_r_vnum;
      else
        trange = atoi(arg2);

      if ( ( lrange < tarea->low_r_vnum || trange > tarea->hi_r_vnum )
           && get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char("That is out of your vnum range.\r\n", ch);
          return;
        }
    }
  else
    {
      lrange = ( is_number( arg1 ) ? atoi( arg1 ) : 1 );
      trange = ( is_number( arg2 ) ? atoi( arg2 ) : 1 );
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      pager_printf( ch, "&w%5d) %s\r\n", vnum, room->name );
    }
}
