#include "character.hpp"
#include "mud.hpp"

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
  Room *targetRoom, *fromRoom;
  int targetRoomVnum, fromRoomVnum;
  DirectionType exit_num;
  Exit *pexit;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( arg3 ) )
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg1) )
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  fromRoomVnum = atoi(arg1);
  if(  (fromRoom = GetRoom( fromRoomVnum ) )  ==NULL)
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg2) )
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  targetRoomVnum = atoi(arg2);
  if(  (targetRoom = GetRoom( targetRoomVnum ) )  ==NULL)
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg3) )
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  exit_num = (DirectionType)atoi(arg3);

  if( exit_num < DIR_NORTH || exit_num > MAX_DIR )
    {
      ProgBug( "MpOpenPassage - Bad syntax", ch );
      return;
    }

  if( (pexit = GetExit( fromRoom, exit_num )) != NULL )
    {
      if( !IsBitSet( pexit->Flags, EX_PASSAGE) )
        return;
      ProgBug( "MpOpenPassage - Exit exists", ch );
      return;
    }

  pexit = MakeExit( fromRoom, targetRoom, exit_num );
  pexit->Keyword                = CopyString( "" );
  pexit->Description            = CopyString( "" );
  pexit->Key                    = -1;
  pexit->Flags              = EX_PASSAGE;
}

