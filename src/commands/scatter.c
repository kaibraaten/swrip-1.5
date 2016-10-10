#include "character.h"
#include "mud.h"

void do_scatter( Character *ch, char *argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];
  Room *pRoomIndex;

  SetCharacterColor( AT_IMMORT, ch );
  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Scatter whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "It's called teleport. Try it.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "You haven't the power to succeed against them.\r\n", ch );
      return;
    }

  for ( ; ; )
    {
      pRoomIndex = GetRoom( GetRandomNumberFromRange( MIN_VNUM, MAX_VNUM ) );

      if ( pRoomIndex
	   && !IsBitSet(pRoomIndex->room_flags, ROOM_PRIVATE)
	   && !IsBitSet(pRoomIndex->room_flags, ROOM_PROTOTYPE)
	   && !IsBitSet(pRoomIndex->room_flags, ROOM_SPACECRAFT) )
	{
	  break;
	}
    }

  if ( victim->fighting )
    StopFighting( victim, true );

  Act( AT_MAGIC, "With the sweep of an arm, $n flings $N to the winds.",
       ch, NULL, victim, TO_NOTVICT );
  Act( AT_MAGIC, "With the sweep of an arm, $n flings you to the astral winds.", ch, NULL, victim, TO_VICT );
  Act( AT_MAGIC, "With the sweep of an arm, you fling $N to the astral winds.",
       ch, NULL, victim, TO_CHAR );
  CharacterFromRoom( victim );
  CharacterToRoom( victim, pRoomIndex );
  victim->position = POS_RESTING;
  Act( AT_MAGIC, "$n staggers forth from a sudden gust of wind, and collapses.", victim, NULL, NULL, TO_ROOM );
  do_look( victim, "auto" );
}
