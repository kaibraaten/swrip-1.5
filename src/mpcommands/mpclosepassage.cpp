#include "mud.hpp"
#include "character.hpp"

/*
 * Syntax mp_close_passage x y
 *
 * closes a passage in room x leading in direction y
 *
 * the exit must have EX_PASSAGE set
 */
void do_mp_close_passage( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Room *fromRoom = nullptr;
  vnum_t fromRoomVnum = INVALID_VNUM;
  DirectionType exit_num = DIR_INVALID;
  Exit *pexit = nullptr;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  if( !IsNumber(arg1) )
    {
      ProgBug( "MpClosePassage - Bad syntax", ch );
      return;
    }

  fromRoomVnum = std::stoi(arg1);

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

  exit_num = (DirectionType) std::stoi(arg2);

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
