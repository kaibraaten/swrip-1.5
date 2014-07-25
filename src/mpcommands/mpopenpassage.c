#include "character.h"
#include "mud.h"

/*
 * Syntax mp_open_passage x y z
 *
 * opens a 1-way passage from room x to room y in direction z
 *
 *  won't mess with existing exits
 */
void do_mp_open_passage( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  char arg3[ MAX_INPUT_LENGTH ];
  ROOM_INDEX_DATA *targetRoom, *fromRoom;
  int targetRoomVnum, fromRoomVnum, exit_num;
  Exit *pexit;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !is_npc( ch ) || ( ch->desc && get_trust( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' )
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !is_number(arg1) )
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  fromRoomVnum = atoi(arg1);
  if(  (fromRoom = get_room_index( fromRoomVnum ) )  ==NULL)
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !is_number(arg2) )
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  targetRoomVnum = atoi(arg2);
  if(  (targetRoom = get_room_index( targetRoomVnum ) )  ==NULL)
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !is_number(arg3) )
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  exit_num = atoi(arg3);
  if( (exit_num < 0) || (exit_num > MAX_DIR) )
    {
      progbug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( (pexit = get_exit( fromRoom, exit_num )) != NULL )
    {
      if( !IS_SET( pexit->exit_info, EX_PASSAGE) )
        return;
      progbug( "MpOpenPassage - Exit exists", ch );
      return;
    }

  pexit = make_exit( fromRoom, targetRoom, exit_num );
  pexit->keyword                = STRALLOC( "" );
  pexit->description            = STRALLOC( "" );
  pexit->key                    = -1;
  pexit->exit_info              = EX_PASSAGE;
}
