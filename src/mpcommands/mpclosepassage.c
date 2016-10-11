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
  Room *fromRoom;
  int fromRoomVnum;
  DirectionType exit_num;
  Exit *pexit;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( arg2 ) )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg1) )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  fromRoomVnum = atoi(arg1);
  if(  (fromRoom = GetRoom( fromRoomVnum ) )  ==NULL)
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg2) )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  exit_num = (DirectionType) atoi(arg2);
  if( exit_num < DIR_NORTH || exit_num > MAX_DIR )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( ( pexit = GetExit(fromRoom, exit_num) ) == NULL )
    {
      return;    /* already closed, ignore...  so rand_progs */
      /*                            can close without spam */
    }

  if( !IsBitSet( pexit->Flags, EX_PASSAGE) )
    {
      ProgBug( "MpClosePassage - Exit not a passage", ch );
      return;
    }

  ExtractExit( fromRoom, pexit );
}
