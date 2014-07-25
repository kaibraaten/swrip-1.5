#include "mud.h"
#include "character.h"

/*
 * Syntax mp_close_passage x y
 *
 * closes a passage in room x leading in direction y
 *
 * the exit must have EX_PASSAGE set
 */
void do_mp_close_passage( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  char arg3[ MAX_INPUT_LENGTH ];
  ROOM_INDEX_DATA *fromRoom;
  int fromRoomVnum, exit_num;
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

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg2[0] == '\0' )
    {
      progbug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( !is_number(arg1) )
    {
      progbug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  fromRoomVnum = atoi(arg1);
  if(  (fromRoom = get_room_index( fromRoomVnum ) )  ==NULL)
    {
      progbug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( !is_number(arg2) )
    {
      progbug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  exit_num = atoi(arg2);
  if( (exit_num < 0) || (exit_num > MAX_DIR) )
    {
      progbug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( ( pexit = get_exit(fromRoom, exit_num) ) == NULL )
    {
      return;    /* already closed, ignore...  so rand_progs */
      /*                            can close without spam */
    }

  if( !IS_SET( pexit->exit_info, EX_PASSAGE) )
    {
      progbug( "MpClosePassage - Exit not a passage", ch );
      return;
    }

  extract_exit( fromRoom, pexit );
}
