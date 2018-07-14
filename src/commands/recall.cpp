#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_recall( Character *ch, char *argument )
{
  Room *location;
  Character *opponent;

  location = NULL;

  location = GetRoom( WhereHome(ch) );

  if ( GetTrustLevel( ch ) < LEVEL_IMMORTAL )
    {
      Area * pArea;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "Only builders can recall.\r\n", ch );
          return;
        }

      if  ( ch->InRoom->Vnum < pArea->VnumRanges.Room.First
            || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last )
        {
          SendToCharacter( "You can only recall from your assigned area.\r\n", ch );
          return;
	}
    }

  if ( !location )
    {
      SendToCharacter( "You are completely lost.\r\n", ch );
      return;
    }

  if ( ch->InRoom == location )
    return;

  /*    if ( IsBitSet(ch->InRoom->Flags, ROOM_NO_RECALL) )
        {
        SendToCharacter( "For some strange reason... nothing happens.\r\n", ch );
        return;
        }*/

  if ( IsBitSet(ch->AffectedBy, AFF_CURSE) )
    {
      SendToCharacter("You are cursed and cannot recall!\r\n", ch );
      return;
    }

  if ( ( opponent = GetFightingOpponent( ch ) ) != NULL )
    {

      if ( NumberBits( 1 ) == 0 || ( !IsNpc( opponent ) && NumberBits( 3 ) > 1 ) )
        {
          SetWaitState( ch, 4 );
          Echo( ch, "You failed!\r\n" );
          return;
        }

      Echo( ch, "You recall from combat!\r\n" );
      StopFighting( ch, true );
    }

  Act( AT_ACTION, "$n disappears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
  if ( ch->Mount )
    {
      CharacterFromRoom( ch->Mount );
      CharacterToRoom( ch->Mount, location );
    }
  Act( AT_ACTION, "$n appears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
  do_look( ch, "auto" );
}
